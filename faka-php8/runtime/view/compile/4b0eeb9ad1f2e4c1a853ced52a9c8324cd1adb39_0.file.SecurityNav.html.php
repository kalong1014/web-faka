<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:49:11
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Common/SecurityNav.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5e73f25c5_80734203',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4b0eeb9ad1f2e4c1a853ced52a9c8324cd1adb39' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Common/SecurityNav.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_67f3e5e73f25c5_80734203 (Smarty_Internal_Template $_smarty_tpl) {
?><ul class="layui-tab-title">
    <li <?php if ($_smarty_tpl->tpl_vars['title']->value == "个人资料") {?> class="layui-this" <?php }?>><a href="/user/security/personal"><i class="layui-icon">&#xe66f;</i> 个人资料</a></li>
    <li <?php if ($_smarty_tpl->tpl_vars['title']->value == "密码设置") {?> class="layui-this" <?php }?>><a href="/user/security/password"><i class="layui-icon">&#xe673;</i> 密码设置</a></li>
    <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_type'] == 2) {?>
    <li <?php if ($_smarty_tpl->tpl_vars['title']->value == "邮箱设置") {?> class="layui-this" <?php }?>><a href="/user/security/email"><i class="layui-icon">&#xe618;</i> 邮箱设置</a></li>
    <?php }?>
    <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_type'] == 1) {?>
    <li <?php if ($_smarty_tpl->tpl_vars['title']->value == "手机设置") {?> class="layui-this" <?php }?>><a href="/user/security/phone"><i class="layui-icon">&#xe678;</i> 手机设置</a></li>
    <?php }?>
    <!--start::HOOK-->
    <?php echo hook(\App\Consts\Hook::USER_VIEW_SECURITY_NAV);?>

    <!--end::HOOK-->
</ul><?php }
}
