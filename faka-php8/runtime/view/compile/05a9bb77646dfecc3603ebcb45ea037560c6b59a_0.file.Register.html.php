<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:48:15
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Authentication/Register.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5afcdb7d2_27587425',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '05a9bb77646dfecc3603ebcb45ea037560c6b59a' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Authentication/Register.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_67f3e5afcdb7d2_27587425 (Smarty_Internal_Template $_smarty_tpl) {
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
    <link rel="stylesheet" href="/assets/static/layui/css/layui.css">
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
                        <a href="/"><h1 class="mb-3 text-color" style="font-weight: bold;"><?php echo $_smarty_tpl->tpl_vars['config']->value['shop_name'];?>
</h1></a>
                        <!--end::Title-->
                        <div class="text-gray-400 fw-bold fs-5">已有账号? <a href="/user/authentication/login"
                                                                         class="link-primary fw-bolder">现在登录!</a></div>
                    </div>
                    <!--begin::Heading-->
                    <!--begin::Input group-->
                    <div class="fv-row mb-10">
                        <!--begin::Label-->
                        <label class="form-label fs-6 fw-bolder text-color">用户名</label>
                        <!--end::Label-->
                        <!--begin::Input-->
                        <input class="form-control form-control-lg form-control-solid" type="text" name="username" placeholder="请输入用户名，支持中文"
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
                        </div>
                        <!--end::Wrapper-->
                        <!--begin::Input-->
                        <input class="form-control form-control-lg form-control-solid" type="text" name="password" placeholder="请设置登录密码"
                               autocomplete="off"/>
                        <!--end::Input-->
                    </div>
                    <!--end::Input group-->

                    <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_verification'] == 1) {?>
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
                            <img src="/user/captcha/image?action=register"
                                 onclick="this.src='/user/captcha/image?action=register'" alt=""
                                 style="height: 40px;border: 3px solid #f9bff773;border-radius: 10px;margin-left: -15px;opacity: 0.6;cursor: pointer;">
                        </div>
                        <!--end::Col-->
                    </div>
                    <?php }?>

                    <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_type'] == 2) {?>
                    <!--begin::Input group-->
                    <div class="fv-row mb-10">
                        <!--begin::Wrapper-->
                        <div class="d-flex flex-stack mb-2">
                            <!--begin::Label-->
                            <label class="form-label fw-bolder fs-6 mb-0 text-color">邮箱</label>
                            <!--end::Label-->
                        </div>
                        <!--end::Wrapper-->
                        <!--begin::Input-->
                        <input class="form-control form-control-lg form-control-solid" type="email" name="email" placeholder="请输入邮箱"
                               autocomplete="off"/>
                        <!--end::Input-->
                    </div>
                    <!--end::Input group-->
                    <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_email_verification'] == 1) {?>
                    <div class="row fv-row mb-7 fv-plugins-icon-container">
                        <!--begin::Col-->
                        <div class="col-xl-8">
                            <label class="form-label fw-bolder fs-6 text-color">邮箱验证码</label>
                            <input class="form-control form-control-lg form-control-solid" type="text" placeholder="邮箱验证码"
                                   name="email_captcha"
                                   autocomplete="off"/>
                            <div class="fv-plugins-message-container invalid-feedback"></div>
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-xl-4 pt-8">
                            <button type="button" class="btn btn-lg <?php if ($_smarty_tpl->tpl_vars['setting']->value['style'] == 0) {?>btn-light-danger<?php } else { ?> btn-light-primary <?php }?> w-100 email-captcha">
                                <span class="indicator-label">获取</span>
                            </button>
                        </div>
                        <!--end::Col-->
                    </div>
                    <?php }?>
                    <?php }?>

                    <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_type'] == 1) {?>
                    <!--begin::Input group-->
                    <div class="fv-row mb-10">
                        <!--begin::Wrapper-->
                        <div class="d-flex flex-stack mb-2">
                            <!--begin::Label-->
                            <label class="form-label fw-bolder fs-6 mb-0 text-color">手机号</label>
                            <!--end::Label-->
                        </div>
                        <!--end::Wrapper-->
                        <!--begin::Input-->
                        <input class="form-control form-control-lg form-control-solid" type="number" name="phone" placeholder="请输入手机号"
                               autocomplete="off"/>
                        <!--end::Input-->
                    </div>
                    <!--end::Input group-->
                    <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_phone_verification'] == 1) {?>
                    <div class="row fv-row mb-7 fv-plugins-icon-container">
                        <!--begin::Col-->
                        <div class="col-xl-8">
                            <label class="form-label fw-bolder fs-6 text-color">手机验证码</label>
                            <input class="form-control form-control-lg form-control-solid" type="text" placeholder="手机验证码"
                                   name="phone_captcha"
                                   autocomplete="off"/>
                            <div class="fv-plugins-message-container invalid-feedback"></div>
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-xl-4 pt-8">
                            <button type="button" class="btn btn-lg <?php if ($_smarty_tpl->tpl_vars['setting']->value['style'] == 0) {?>btn-light-danger<?php } else { ?> btn-light-primary <?php }?> w-100 phone-captcha">
                                <span class="indicator-label">获取</span>
                            </button>
                        </div>
                        <!--end::Col-->
                    </div>
                    <?php }?>
                    <?php }?>

                    <!--begin::Actions-->
                    <div class="text-center">
                        <!--begin::Submit button-->
                        <button type="button" class="btn btn-lg <?php if ($_smarty_tpl->tpl_vars['setting']->value['style'] == 0) {?>btn-light-danger<?php } else { ?> btn-light-primary <?php }?> w-100 mb-5 data-submit">
                            <span class="indicator-label">注册 (Register)</span>
                        </button>
                        <!--end::Submit button-->
                        <?php if (getHookNum(\App\Consts\Hook::USER_VIEW_AUTH_REGISTER_BUTTON) > 0) {?>
                        <!--begin::Separator-->
                        <div class="text-center text-muted text-uppercase fw-bolder mb-5">or</div>
                        <!--end::Separator-->
                        <?php }?>
                        <!--start::HOOK-->
                        <?php echo hook(\App\Consts\Hook::USER_VIEW_AUTH_REGISTER_BUTTON);?>

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
<!--end::Global Javascript Bundle-->
<?php echo '<script'; ?>
>
    $(function () {
        layui.use(['layer'], function () {
            $('.data-submit').click(function () {
                let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                let data = $('.form-data').serialize();
                let fromId = localStorage.getItem("from_id");
                if (fromId) {
                    data += "&pid=" + fromId;
                }
                $.post("/user/api/authentication/register", data, res => {
                    layer.close(loaderIndex);
                    if (res.code == 200) {
                        window.location.href = "/";
                    }
                    layer.msg(res.msg);
                });
            });

            $('.email-captcha').click(function () {
                layer.prompt({
                    title: '请输入验证码：<img src="/user/captcha/image?action=emailRegisterCaptcha" style="margin-top: -5px;">',
                    formType: 0
                }, function (captcha, index) {
                    let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                    $.post("/user/api/authentication/emailRegisterCaptcha", {
                        captcha: captcha,
                        email: $('form input[name=email]').val()
                    }, res => {
                        layer.close(loaderIndex);
                        if (res.code == 200) {
                            layer.close(index);
                            let second = 60;
                            $('.email-captcha').attr('disabled', true);
                            $(".email-captcha").html((second) + "秒")
                            let interval = setInterval(function () {
                                second--
                                $(".email-captcha").html((second) + "秒")
                                if (second === -1) {
                                    $(".email-captcha").text("获取")
                                    $('.email-captcha').attr('disabled', false);
                                    clearInterval(interval)
                                }
                            }, 1000);
                        }
                        layer.msg(res.msg);
                    });
                });
            });

            $('.phone-captcha').click(function () {
                layer.prompt({
                    title: '请输入验证码：<img src="/user/captcha/image?action=phoneRegisterCaptcha" style="margin-top: -5px;">',
                    formType: 0
                }, function (captcha, index) {
                    let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                    $.post("/user/api/authentication/phoneRegisterCaptcha", {
                        captcha: captcha,
                        phone: $('form input[name=phone]').val()
                    }, res => {
                        layer.close(loaderIndex);
                        if (res.code == 200) {
                            layer.close(index);
                            let second = 60;
                            $('.phone-captcha').attr('disabled', true);
                            $(".phone-captcha").html((second) + "秒")
                            let interval = setInterval(function () {
                                second--
                                $(".phone-captcha").html((second) + "秒")
                                if (second === -1) {
                                    $(".phone-captcha").text("获取")
                                    $('.phone-captcha').attr('disabled', false);
                                    clearInterval(interval)
                                }
                            }, 1000);
                        }
                        layer.msg(res.msg);
                    });
                });
            });

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
