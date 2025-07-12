<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:49:05
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Common/Header.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5e1be4307_75885360',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4915d44dfe9ce0a81c96820dcf25fa9810ea9f4c' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Common/Header.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_67f3e5e1be4307_75885360 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
 - <?php echo $_smarty_tpl->tpl_vars['config']->value['title'];?>
</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/assets/static/layui/css/layui.css">
    <link rel="stylesheet" href="/assets/static/bootstrap-table/css/bootstrap-table.css">
    <?php if ($_smarty_tpl->tpl_vars['setting']->value['style'] == 0) {?>
        <link rel="stylesheet" href="/assets/user/css/global.css?v=<?php echo $_smarty_tpl->tpl_vars['app']->value['version'];?>
">
    <?php } elseif ($_smarty_tpl->tpl_vars['setting']->value['style'] == 1) {?>
        <link rel="stylesheet" href="/assets/user/css/global_1.css?v=<?php echo $_smarty_tpl->tpl_vars['app']->value['version'];?>
">
    <?php } elseif ($_smarty_tpl->tpl_vars['setting']->value['style'] == 2) {?>
        <link rel="stylesheet" href="/assets/user/css/global_2.css?v=<?php echo $_smarty_tpl->tpl_vars['app']->value['version'];?>
">
    <?php }?>
    <link rel="stylesheet" href="/assets/static/css/style.css?v=<?php echo $_smarty_tpl->tpl_vars['app']->value['version'];?>
">
    <link href="<?php echo $_smarty_tpl->tpl_vars['favicon']->value;?>
" rel="icon">

    <?php echo '<script'; ?>
 src="/assets/static/jquery.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/layui/layui.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/user/user.js?v=<?php echo $_smarty_tpl->tpl_vars['app']->value['version'];?>
"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/clipboard.js"><?php echo '</script'; ?>
>

    <link rel="stylesheet" href="/assets/static/codemirror/lib/codemirror.css">
    <link rel="stylesheet" href="/assets/static/codemirror/addon/fold/foldgutter.css">
    <link rel="stylesheet" href="/assets/static/jsoneditor/jsoneditor.min.css">
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/lib/codemirror.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/addon/fold/foldcode.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/addon/fold/foldgutter.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/addon/fold/brace-fold.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/addon/fold/xml-fold.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/addon/fold/indent-fold.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/addon/fold/markdown-fold.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/addon/fold/comment-fold.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/mode/javascript/javascript.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/mode/xml/xml.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/mode/css/css.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/mode/htmlmixed/htmlmixed.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/mode/python/python.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/codemirror/mode/markdown/markdown.js"><?php echo '</script'; ?>
>

    <?php echo '<script'; ?>
>
        layui.config({
            base: '/assets/static/modules/'
        });
    <?php echo '</script'; ?>
>

    <!--start::HOOK-->
    <?php echo hook(\App\Consts\Hook::USER_VIEW_HEADER);?>

    <!--end::HOOK-->
</head>
<body style="background: url('<?php echo $_smarty_tpl->tpl_vars['config']->value['background_url'];?>
') fixed no-repeat;background-size: cover;">
<div class="net-loading" style="display: none;">
    <div class="loading-view">
        <div class="loading-image"></div>
    </div>
</div>
<div style="background: rgba(255,255,255,0.77);overflow:auto;height:calc(100vh - 61px);" class="bg-content">
    <div class="fly-header">
        <div class="layui-container">
            <a class="fly-logo" href="/">
                <span class="user-logo"><img src="<?php echo $_smarty_tpl->tpl_vars['favicon']->value;?>
"></span>
                <span class="user-logo-title"><?php echo $_smarty_tpl->tpl_vars['config']->value['shop_name'];?>
</span>
            </a>
            <ul class="layui-nav fly-nav layui-hide-xs">
                <li class="layui-nav-item">
                    <a href="/user/personal/purchaseRecord"><i class="iconfont icon-jiaoliu"></i>我的订单</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/"><i class="iconfont icon-shichang"></i>购买商品</a>
                </li>
            </ul>

            <ul class="layui-nav fly-nav-user">
                <!-- 登入后的状态 -->
                <li class="layui-nav-item">
                    <div class="fly-nav-avatar" href="javascript:;">
                    <span class="user-level"><img src="<?php echo $_smarty_tpl->tpl_vars['user']->value['group']['icon'];?>
"
                                                  style="transform: scale(.8,.8);margin-left: 0;"><?php echo $_smarty_tpl->tpl_vars['user']->value['username'];?>
</span>
                        <span class="user-username"><img src="<?php echo $_smarty_tpl->tpl_vars['user']->value['avatar'];?>
" class="user-avatar"></span>

                    </div>
                    <dl class="layui-nav-child">
                        <dd><a href="/user/security/personal" style="text-align: center;"><i class="layui-icon"
                                                                                             style="font-size: 18px;">&#xe66f;</i>个人资料</a>
                        </dd>
                        <dd><a href="/user/security/password" style="text-align: center;"><i class="layui-icon"
                                                                                             style="font-size: 18px;">&#xe673;</i>修改密码</a>
                            <hr style="margin: 5px 0;">
                        <dd><a href="javascript:void(0);" class="logout" style="text-align: center;"><i
                                        class="layui-icon"
                                        style="font-size: 18px;">&#xe682;</i>安全注销</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
<?php }
}
