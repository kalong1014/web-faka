<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:49:15
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/User/Cash.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5eb90d520_61856413',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '60fb123074d430dea236543e5eb439f87a3a7a21' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/User/Cash.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:../Common/Header.html' => 1,
    'file:../Common/Nav.html' => 1,
    'file:../Common/Footer.html' => 1,
  ),
),false)) {
function content_67f3e5eb90d520_61856413 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Common/Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<div class="layui-container fly-marginTop fly-user-main">
    <?php $_smarty_tpl->_subTemplateRender("file:../Common/Nav.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief">

            <ul class="layui-tab-title">
                <li class="layui-this"><a href="/user/cash/index"><i class="layui-icon">&#xe659;</i> 硬币兑现</a></li>
                <li><a href="/user/cash/record"><i class="layui-icon">&#xe63c;</i> 兑现记录<span
                        class="layui-badge layui-bg-cash"><?php echo $_smarty_tpl->tpl_vars['processing']->value;?>
</span></a></li>
            </ul>

            <div class="content-body">
                <blockquote class="elem-quote">
                    最低兑现金额：<b><?php echo $_smarty_tpl->tpl_vars['config']->value['cash_min'];?>
元</b>，手动提现费用：<b><?php echo $_smarty_tpl->tpl_vars['config']->value['cash_cost'];?>
元</b> (每天12点自动结算免费)
                </blockquote>
                <form class="layui-form" action="">
                    <div class="form-block">
                        <div>
                            <div class="form-header">兑现硬币 <span style="color: #63b584;font-size: 14px;">当前拥有硬币:<?php echo $_smarty_tpl->tpl_vars['user']->value['coin'];?>
</span>
                            </div>
                            <div class="form-body"><input type="text" name="amount" required lay-verify="required"
                                                          value="<?php echo $_smarty_tpl->tpl_vars['config']->value['cash_min'];?>
" autocomplete="off"
                                                          class="layui-input"
                                                          style="width: 150px;color: #ff9191;"></div>
                        </div>
                        <div>
                            <div class="form-header">兑现方式</div>
                            <div class="form-body pay-list">
                                <?php if ($_smarty_tpl->tpl_vars['config']->value['cash_type_alipay'] == 1) {?> <a class="button-click checked"
                                                                       onclick="payClick(this,0)"
                                                                       style="line-height: 22px;color: #db66ac;"><img
                                    src="/assets/user/images/cash/alipay.png" class="pay-icon"> 支付宝</a> <?php }?>
                                <?php if ($_smarty_tpl->tpl_vars['config']->value['cash_type_wechat'] == 1) {?> <a class="button-click" onclick="payClick(this,1)"
                                                                       style="line-height: 22px;color: #db66ac;"><img
                                    src="/assets/user/images/cash/wechat.png" class="pay-icon"> 微信</a> <?php }?>
                                <?php if ($_smarty_tpl->tpl_vars['config']->value['cash_type_balance'] == 1) {?> <a class="button-click" onclick="payClick(this,2)"
                                                                       style="line-height: 22px;color: #db66ac;"><img
                                    src="/assets/static/images/wallet.png" class="pay-icon"> 钱包余额(可直接消费)</a> <?php }?>
                            </div>
                        </div>

                        <div style="margin-top: 25px;">
                            <button type="button" class="layui-btn layui-btn-pink payButton">立即兑现</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php echo '<script'; ?>
>
    let payId = 0;

    function payClick(obj, id) {
        User.switchElement(obj);
        payId = id;
    }

    $(function () {
        layui.use('layer', function () {
            $('.payButton').click(function () {
                layer.confirm('兑现' + $('input[name=amount]').val() + "硬币需要<?php echo $_smarty_tpl->tpl_vars['config']->value['cash_cost'];?>
元手续费，您确定吗？", {
                    btn: ['确认', '取消']
                }, function () {
                    User.$post("/user/api/cash/submit", {
                        type: payId,
                        amount: $('input[name=amount]').val()
                    }, res => {
                        layer.msg("兑现成功，请耐心等待到账。")
                        setTimeout(() => {
                            window.location.href = "/user/cash/record";
                        }, 1500);
                    });
                });

            });
        });
    });

<?php echo '</script'; ?>
>
<?php $_smarty_tpl->_subTemplateRender("file:../Common/Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
