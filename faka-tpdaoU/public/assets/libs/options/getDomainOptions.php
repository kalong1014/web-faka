<?php
header('Content-Type: application/json');
require_once '../../../../thinkphp/base.php';
use think\Db;
use think\Exception;

try {
    $config = include __DIR__ . '/../../../../application/database.php';
    Db::setConfig($config);
    
    // 从 options 表获取 domain 字段
    $domain = Db::name('options')
        ->where('name', 'domain')
        ->value('value');

    echo json_encode([
        'status' => 'success',
        'message' => '获取成功',
        'domain' => $domain ?: '' 
    ], JSON_UNESCAPED_UNICODE);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => '获取域名配置失败: ' . $e->getMessage(),
        'domain' => ''
    ], JSON_UNESCAPED_UNICODE);
}