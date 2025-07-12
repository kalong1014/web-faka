<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:49:11
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/User/Personal.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5e73b5389_02938368',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '73b49fce9be2ad9e760f294a50d4ec5ba4756b5b' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/User/Personal.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:../Common/Header.html' => 1,
    'file:../Common/Nav.html' => 1,
    'file:../Common/SecurityNav.html' => 1,
    'file:../Common/Footer.html' => 1,
  ),
),false)) {
function content_67f3e5e73b5389_02938368 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Common/Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<div class="layui-container fly-marginTop fly-user-main">
    <?php $_smarty_tpl->_subTemplateRender("file:../Common/Nav.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief">
            <?php $_smarty_tpl->_subTemplateRender("file:../Common/SecurityNav.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            <div class="content-body">
                <form class="layui-form form-data">
                    <div class="form-block">
                        <div>
                            <div class="form-body">
                                <input type="file" class="avatar-input" style="display: none;">
                                <input type="text" name="avatar" style="display: none;" value="<?php echo $_smarty_tpl->tpl_vars['user']->value['avatar'];?>
">
                                <img class="avatar-img"
                                     onclick="document.getElementsByClassName('avatar-input')[0].click()"
                                     src="<?php echo $_smarty_tpl->tpl_vars['user']->value['avatar'];?>
" alt="点击修改"
                                     style="height: 100px;width: 100px;border-radius: 100%;border: 1px solid #fba9da8c;box-shadow: 1px 1px 10px 1px #ed9b9bb3;cursor: pointer;">
                            </div>
                        </div>
                        <div>
                            <div class="form-header">QQ号</div>
                            <div class="form-body"><input type="number" value="<?php echo $_smarty_tpl->tpl_vars['user']->value['qq'];?>
" name="qq" autocomplete="off"
                                                          placeholder="请输入QQ号" class="layui-input"
                                                          style="color: #ff9191;width: 320px;"></div>
                        </div>
                        <div>
                            <div class="form-header">真实姓名(提现)</div>
                            <div class="form-body"><input type="text" value="<?php echo $_smarty_tpl->tpl_vars['user']->value['nicename'];?>
" name="nicename"
                                                          autocomplete="off"
                                                          placeholder="请输入您的真实姓名" class="layui-input"
                                                          style="color: #ff9191;width: 320px;"></div>
                        </div>
                        <div>
                            <div class="form-header">自动结算方式</div>
                            <div class="form-body" style="color: #ff9191;width: 320px;">
                                <select name="settlement">
                                    <option value="0" <?php if ($_smarty_tpl->tpl_vars['user']->value['settlement'] == 0) {?> selected <?php }?>>支付宝</option>
                                    <option value="1" <?php if ($_smarty_tpl->tpl_vars['user']->value['settlement'] == 1) {?> selected <?php }?>>微信</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <div class="form-header">支付宝账号(提现)</div>
                            <div class="form-body"><input type="text" value="<?php echo $_smarty_tpl->tpl_vars['user']->value['alipay'];?>
" name="alipay"
                                                          autocomplete="off"
                                                          placeholder="兑现使用的支付宝账号" class="layui-input"
                                                          style="color: #ff9191;width: 320px;"></div>
                        </div>
                        <div>
                            <div class="form-header">微信收款二维码(提现)</div>
                            <div class="form-body">
                                <input type="file" class="wechat-input" style="display: none;">
                                <input type="text" name="wechat" style="display: none;" value="">
                                <?php if ($_smarty_tpl->tpl_vars['user']->value['wechat'] == '') {?>
                                    <i class="layui-icon wx_qrcode_temp"
                                       onclick="document.getElementsByClassName('wechat-input')[0].click()"
                                       style="font-size: 32px;color: #0C84D1;cursor: pointer;">&#xe681;</i>
                                <?php } else { ?>
                                    <!--  <img class="wechat-img" src="<?php echo $_smarty_tpl->tpl_vars['user']->value['wechat'];?>
" style="width: 100px;cursor: pointer;"   onclick="document.getElementsByClassName('wechat-input')[0].click()">-->
                                    <div class="wx_qrcode"
                                         onclick="document.getElementsByClassName('wechat-input')[0].click()"></div>
                                <?php }?>
                            </div>
                        </div>

                        <!--start::HOOK-->
                        <?php echo hook(\App\Consts\Hook::USER_VIEW_PERSONAL_FORM);?>

                        <!--end::HOOK-->

                        <div style="margin-top: 25px;">
                            <button type="button" class="layui-btn layui-btn-pink save-data">保存修改</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php echo '<script'; ?>
>
    $(function () {
        layui.use('form', function () {

            $('.wx_qrcode').qrcode({
                render: "canvas",
                width: 150,
                height: 150,
                text: "<?php echo $_smarty_tpl->tpl_vars['user']->value['wechat'];?>
"
            });

            User.upload(".avatar-input", res => {
                $('input[name=avatar]').val(res.path);
                $('.avatar-img').attr("src", res.path);
            });

            User.upload(".wechat-input", res => {
                $('input[name=wechat]').val(res.path);
                $('.wx_qrcode').html('<img class="wechat-img" src="' + res.path + '" style="width: 100px;cursor: pointer;"   onclick="document.getElementsByClassName(\'wechat-input\')[0].click()">');
                $('.wx_qrcode_temp').html('<img class="wechat-img" src="' + res.path + '" style="width: 100px;cursor: pointer;"   onclick="document.getElementsByClassName(\'wechat-input\')[0].click()">');
                layer.msg("上传完成，需要保存才会生效哦");
            });

            $('.save-data').click(function () {
                User.$post("/user/api/security/personal", $('.form-data').serialize(), res => {
                    layer.msg("保存成功");
                })
            });
        });
    });

<?php echo '</script'; ?>
>
<?php $_smarty_tpl->_subTemplateRender("file:../Common/Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
