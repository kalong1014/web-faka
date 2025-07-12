<?php
/* Smarty version 3.1.46, created on 2025-04-08 17:05:11
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Index/Query.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f4e6c7cf02f2_13243881',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c0c7219ac044bbc5d2e18e20400d1ac208e2f813' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Index/Query.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:./Header.html' => 1,
    'file:./Footer.html' => 1,
  ),
),false)) {
function content_67f4e6c7cf02f2_13243881 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:./Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div class="content-wrapper">
    <div class="container">

        <div class="card">
            <div class="card-header">
                <p class="card-title">查询订单 </p>
            </div>
            <div class="card-block" style="padding-top: 10px;padding-bottom: 10px">
                <fieldset>
                    <div class="input-group">
                        <input type="text" class="form-control keywords" placeholder="请输入联系方式或订单号进行查询"
                               autocomplete="off"
                               value="<?php echo $_smarty_tpl->tpl_vars['tradeNo']->value;?>
">
                        <div class="input-group-append">
                            <button class="btn btn-success queryBtn">查询</button>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="card queryView" style="display: none;">
            <div class="card-header">
                <p class="card-title">查询结果</p>
            </div>
            <div class="card-block" style="margin-top: 10px;">
                <h1 class="text-center notfound" style="display: none;">未查询到相关订单</h1>
                <div class="order-success" style="display: none;">
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<?php echo '<script'; ?>
>
    let keywordsIns = $('.keywords');

    function query(keywords) {
        let orderSuccess = $('.order-success');
        $('.notfound').hide();
        orderSuccess.hide();
        orderSuccess.html('');
        $('.payDateView').hide();
        $('.queryView').show();
        let orderId = 0;
        Pay.getQuery(keywords, res => {
            res.forEach(order => {
                if (order.commodity && order.pay) {
                    let status = '<span style="color: red;">未支付</span>';
                    if (order.status === 1) {
                        status = '<span style="color: green;">已支付</span>';
                    }

                    let race = "";
                    if (order.race) {
                        race = " ( <b style='color: #20b033;'>" + order.race + "</b> )";
                    }

                    let html = '<div class="hr-top">\n' +
                        '                        <div style="font-size: 14px;">订单号：<b class="trade_no">' + order.trade_no + '</b>  <?php echo hook(\App\Consts\Hook::USER_VIEW_QUERY_TRADE_NO);?>
</div>\n' +
                        '                        <div style="font-size: 14px;">下单金额：<b style="color: red;" class="amount">' + order.amount + '</b></div>\n' +
                        '                        <div style="font-size: 14px;">购买数量：<b style="color: blue;" class="buyNum">' + order.card_num + '</b></div>\n' +
                        '                        <div style="font-size: 14px;">下单时间：<b class="create_time">' + order.create_time + '</b></div>\n' +
                        '                        <div style="font-size: 14px;">商品名称：<b class="commodity_name">' + order.commodity.name + race + '</b></div>\n' +
                        '                        <div style="font-size: 14px;">支付方式：<b class="icon"><img src="' + order.pay.icon + '" height="16px"> ' + order.pay.name + '</b></div>\n' +
                        '                        <div style="font-size: 14px;">订单状态：<b class="status">' + status + '</b></div>\n' +
                        '                        <div style="font-size: 14px;' + (order.status == 1 ? '' : 'display: none;') + '" class="payDateView">支付时间：<b class="pay_date"\n' +
                        '                                                                                                style="color: green;">' + order.pay_time + '</b>\n' +
                        '                        </div>\n' +
                        '                        <div style="font-size: 14px;">售后支持：<b style="color: #d78aeb;font-weight: bold;"><img src="' + order.business_avatar + '" style="height: 18px;border-radius: 100%;margin-top: -3px;"> ' + order.business_username + '</b> [ <a target="_blank" href="https://wpa.qq.com/msgrd?v=1&uin=' + order.service_qq + '" style="color: #2aa2e3;padding:0 4px 0 4px;font-size: 12px;margin:0 4px 0 0;border-radius: 5px;" class="button-click"><i class="fa fa-qq"></i> QQ客服</a><a target="_blank" href="' + order.service_url + '" class="button-click" style="color: #ff8484;padding:0 4px 0 4px;margin:0;font-size: 12px;border-radius: 5px;"><i class="fa fa-user-plus"></i> 网页客服</a> ]</div>\n' +
                        '                        <div style="font-size: 14px;' + (order.leave_message ? "" : " display: none;") + '">使用说明：<b>' + order.leave_message + '</b></div>\n' +
                        '                        <div style="font-size: 14px;">卡密信息：<input style="border: none;box-shadow: #f0d1d4 1px 1px 1px;height: 18px;width:130px;' + (order.commodity.password_status == 1 ? '<?php if ($_smarty_tpl->tpl_vars['user']->value) {?>display:none;<?php }?>' : 'display:none;') + '"  type="password" placeholder="请输入查询密码.." class="passId-' + order.id + '"> <b style="cursor:pointer;color: blue;" class="getCard" data-id="' + order.id + '" data-no="' + order.trade_no + '">查看</b></div>\n' +
                        '                        <div style="margin-top: 10px; display: none;" class="cardInfoView-' + order.id + '">\n' +
                        '                            <textarea class="form-control cardInfo-' + order.id + '" style="height: 420px;"></textarea>\n' +
                        '                        </div>\n' +
                        '                    </div>';
                    orderSuccess.append(html);
                }

            });
            orderSuccess.show();

            $('.getCard').click(function () {
                let orderId = $(this).attr('data-id');
                let no = $(this).attr('data-no');
                Pay.getSecret(no, $('.passId-' + orderId).val(), res => {
                    let secret = "";
                    if (res.widget) {
                        secret += "--------------您隐私内容---------------\n";
                        for (const widgetKey in res.widget) {
                            secret += res.widget[widgetKey].cn + "：" + res.widget[widgetKey].value + "\n";
                        }
                        secret += "--------------卡密信息---------------\n";
                    }
                    secret += res.secret;
                    $('.cardInfo-' + orderId).html(secret);
                    $('.cardInfoView-' + orderId).show(80);
                });
            });
        }, () => {
            $('.notfound').show();
        });
    }

    $('.queryBtn').click(function () {
        query(keywordsIns.val());
    });

    <?php if ($_smarty_tpl->tpl_vars['tradeNo']->value != '') {?>
    $('.queryBtn').click();
    <?php } elseif ($_smarty_tpl->tpl_vars['user']->value) {?>
    query("");
    <?php }
echo '</script'; ?>
>
<?php $_smarty_tpl->_subTemplateRender("file:./Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
