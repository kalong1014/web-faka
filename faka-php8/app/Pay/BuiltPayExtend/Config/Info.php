<?php
declare (strict_types=1);

return [
    'version' => '1.0.8',
    'name' => '内置-码支付',
    'author' => '荔枝',
    'website' => '#',
    'description' => '这个支付扩展需要依赖通用扩展：内置-码支付，使用前请先安装通用扩展',
    'options' => [
        0 => '微信个人码',
        1 => '微信转账',
        2 => '支付宝个码',
        3 => '支付宝商家码',
        4 => '支付宝转账',
        5 => '微信赞赏码',
        6 => 'QQ钱包',
        7 => 'TRC20-USDT'
    ],
    'callback' => [
        \App\Consts\Pay::IS_SIGN => true,
        \App\Consts\Pay::IS_STATUS => true,
        \App\Consts\Pay::FIELD_STATUS_KEY => 'status',
        \App\Consts\Pay::FIELD_STATUS_VALUE => 1,
        \App\Consts\Pay::FIELD_ORDER_KEY => 'trade_no',
        \App\Consts\Pay::FIELD_AMOUNT_KEY => 'amount',
        \App\Consts\Pay::FIELD_RESPONSE => 'success'
    ]
];