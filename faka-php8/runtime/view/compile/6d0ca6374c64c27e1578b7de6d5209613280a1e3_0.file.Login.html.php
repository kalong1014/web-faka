<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:48:05
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Authentication/Login.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5a551ac08_57177521',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6d0ca6374c64c27e1578b7de6d5209613280a1e3' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Authentication/Login.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_67f3e5a551ac08_57177521 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html lang="en">
<!--begin::Head-->
<head>
    <title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
 - <?php echo $_smarty_tpl->tpl_vars['config']->value['title'];?>
</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="/favicon.ico"/>
    <!--begin::Global Stylesheets Bundle(used by all pages)-->
    <link href="/assets/admin/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/assets/admin/css/style.bundle.css" rel="stylesheet" type="text/css"/>
    <!--end::Global Stylesheets Bundle-->
    <style>
        .text-color {
            <?php if ($_smarty_tpl->tpl_vars['setting']->value['style'] == 0) {?>
            color: pink;
            <?php } else { ?>
            color: #70b5ff;
            <?php }?>
        }
    </style>
    <!--start::HOOK-->
    <?php echo hook(\App\Consts\Hook::USER_GLOBAL_VIEW_HEADER);?>

    <!--end::HOOK-->
</head>
<!--end::Head-->
<!--begin::Body-->
<body id="kt_body" class="bg-body">
<!--begin::Main-->
<div class="d-flex flex-column flex-root">
    <!--begin::Authentication - Sign-in -->
    <div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed"
         style="background: url('<?php echo $_smarty_tpl->tpl_vars['config']->value['background_url'];?>
') fixed no-repeat;background-size: cover;">
        <!--begin::Content-->
        <div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">
            <!--begin::Logo-->
            <!--end::Logo-->
            <!--begin::Wrapper-->
            <div class="w-lg-400px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto">
                <!--begin::Form-->
                <form class="form w-100 form-data" novalidate="novalidate">
                    <!--begin::Heading-->
                    <div class="text-center mb-10">
                        <!--begin::Title-->
                        <a href="/"><h1 class="mb-3 text-color"><?php echo $_smarty_tpl->tpl_vars['config']->value['shop_name'];?>
</h1></a>
                        <!--end::Title-->
                        <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_state'] == 1) {?>
                        <div class="text-gray-400 fw-bold fs-5">没有账号? <a href="/user/authentication/register"
                                                                         class="link-primary fw-bolder">免费创建!</a></div>
                        <?php }?>
                    </div>
                    <!--begin::Heading-->
                    <!--begin::Input group-->
                    <div class="fv-row mb-10">
                        <!--begin::Label-->
                        <label class="form-label fs-6 fw-bolder text-color">账号</label>
                        <!--end::Label-->
                        <!--begin::Input-->
                        <input class="form-control form-control-lg form-control-solid" type="text" name="username"
                               placeholder="用户名/手机号/邮箱"
                               autocomplete="off"/>
                        <!--end::Input-->
                    </div>
                    <!--end::Input group-->
                    <!--begin::Input group-->
                    <div class="fv-row mb-10">
                        <!--begin::Wrapper-->
                        <div class="d-flex flex-stack mb-2">
                            <!--begin::Label-->
                            <label class="form-label fw-bolder fs-6 mb-0 text-color">密码</label>
                            <!--end::Label-->
                            <!--begin::Link-->
                            <a href="<?php if ($_smarty_tpl->tpl_vars['config']->value['forget_type'] == 0) {?>/user/authentication/emailForget<?php } else { ?>/user/authentication/phoneForget<?php }?>" class="link-primary fs-8 fw-bolder">忘记密码?</a>
                            <!--end::Link-->
                        </div>
                        <!--end::Wrapper-->
                        <!--begin::Input-->
                        <input class="form-control form-control-lg form-control-solid" type="password" name="password"
                               placeholder="请输入密码"
                               autocomplete="off"/>
                        <!--end::Input-->
                    </div>
                    <!--end::Input group-->

                    <?php if ($_smarty_tpl->tpl_vars['config']->value['login_verification'] == 1) {?>
                    <div class="row fv-row mb-7 fv-plugins-icon-container">
                        <!--begin::Col-->
                        <div class="col-9">
                            <label class="form-label fw-bolder fs-6 text-color">验证码</label>
                            <input class="form-control form-control-lg form-control-solid" type="text"
                                   name="captcha"
                                   autocomplete="off" placeholder="验证码"/>
                            <div class="fv-plugins-message-container invalid-feedback"></div>
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-3 pt-9">
                            <img src="/user/captcha/image?action=login" onclick="this.src='/user/captcha/image?action=login'" alt="" style="height: 40px;border: 3px solid #f9bff773;border-radius: 10px;margin-left: -15px;opacity: 0.6;cursor: pointer;">
                        </div>
                        <!--end::Col-->
                    </div>
                    <?php }?>


                    <!--begin::Actions-->
                    <div class="text-center">
                        <!--begin::Submit button-->
                        <button type="button" class="btn btn-lg <?php if ($_smarty_tpl->tpl_vars['setting']->value['style'] == 0) {?>btn-light-danger<?php } else { ?> btn-light-primary <?php }?> w-100 mb-5 data-submit">
                            <span class="indicator-label">LOGIN</span>
                        </button>
                        <!--end::Submit button-->

                        <?php if (getHookNum(\App\Consts\Hook::USER_VIEW_AUTH_LOGIN_BUTTON) > 0) {?>
                        <!--begin::Separator-->
                        <div class="text-center text-muted text-uppercase fw-bolder mb-5">or</div>
                        <!--end::Separator-->
                        <?php }?>
                        <!--start::HOOK-->
                        <?php echo hook(\App\Consts\Hook::USER_VIEW_AUTH_LOGIN_BUTTON);?>

                        <!--end::HOOK-->
                    </div>
                    <!--end::Actions-->
                </form>
                <!--end::Form-->
            </div>
            <!--end::Wrapper-->
        </div>
        <!--end::Content-->
        <!--begin::Footer-->
        <div class="d-flex flex-center flex-column-auto p-10">
            <!--begin::Links-->
            <div class="d-flex align-items-center fw-bold fs-8">
                <span style="color: pink;">@<?php echo $_smarty_tpl->tpl_vars['config']->value['shop_name'];?>
</span>
            </div>
            <!--end::Links-->
        </div>
        <!--end::Footer-->
    </div>
    <!--end::Authentication - Sign-in-->
</div>
<!--end::Main-->
<!--begin::Javascript-->
<!--begin::Global Javascript Bundle(used by all pages)-->
<?php echo '<script'; ?>
 src="/assets/admin/js/util.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/static/jquery.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/static/layui/layui.js"><?php echo '</script'; ?>
>

<?php echo '<script'; ?>
>
    var goto = decodeURIComponent(Util.getQueryVariable("goto"));

    if (goto == 0) {
        goto = "/";
    }

    $(function () {
        layui.use(['layer'], function () {
            $('.data-submit').click(function () {
                let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                let data = $('.form-data').serialize();

                $.post("/user/api/authentication/login", data, res => {
                    layer.close(loaderIndex);
                    if (res.code == 200) {
                        window.location.href = goto;
                    }
                    layer.msg(res.msg);
                });
            });
        });

        $("body").keypress(function (even) {
            if (even.which == 13) {
                $('.data-submit').click();
            }
        });
    });

<?php echo '</script'; ?>
>
<!--end::Javascript-->
<!--start::HOOK-->
<?php echo hook(\App\Consts\Hook::USER_GLOBAL_VIEW_BODY);?>

<!--end::HOOK-->
</body>
<!--end::Body-->
<!--start::HOOK-->
<?php echo hook(\App\Consts\Hook::USER_GLOBAL_VIEW_FOOTER);?>

<!--end::HOOK-->
</html><?php }
}
