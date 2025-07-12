<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:36:27
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Index/Footer.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e2eb5a2768_57770913',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '397c6196a8116da27b5f2c3c97fec476c38700e9' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Index/Footer.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_67f3e2eb5a2768_57770913 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="content-icp"><?php echo $_smarty_tpl->tpl_vars['setting']->value['icp'];?>
</div>
<!--start::HOOK-->
<?php echo hook(\App\Consts\Hook::USER_GLOBAL_VIEW_BODY);?>

<?php echo hook(\App\Consts\Hook::USER_VIEW_INDEX_BODY);?>

<!--end::HOOK-->
</body>
<!--start::HOOK-->
<?php echo hook(\App\Consts\Hook::USER_GLOBAL_VIEW_FOOTER);?>

<?php echo hook(\App\Consts\Hook::USER_VIEW_INDEX_FOOTER);?>

<!--end::HOOK-->
</html><?php }
}
