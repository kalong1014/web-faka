<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:95:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3//user/forget_password.html";i:1646323578;}*/ ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
        <link href="images/favicon.png" rel="icon" />
        <title><?php echo sysconf('site_name'); ?><?php echo sysconf('site_subtitle'); ?></title>
        <meta name="keywords" content="<?php echo sysconf('site_keywords'); ?>" />
        <meta name="description" content="<?php echo sysconf('site_desc'); ?>" />
        <link rel="shortcut icon" href="<?php echo sysconf('browser_icon'); ?>" />

        <!-- Stylesheet
        ========================= -->
        <link rel="stylesheet" href="/static/merchant/login/bootstrap.min.css"/>
        <link rel="stylesheet" href="/static/merchant/login/login_new.css"/>
        <!-- Colors Css -->
        <link id="color-switcher" type="text/css" rel="stylesheet" href="#" />
    </head>
    <body>

        <!-- Preloader -->
        <div class="preloader">
            <div class="lds-ellipsis">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        <!-- Preloader End -->

        <div id="main-wrapper" class="oxyy-login-register h-100 d-flex flex-column bg-transparent">
            <div class="container my-auto">
                <div class="row">
                    <div class="col-md-9 col-lg-7 col-xl-5 mx-auto">
                        <div class="bg-white shadow-md rounded p-4 px-sm-5 mt-4">
                            <div class="logo"> <a class="d-flex justify-content-center" href="index.html" title="Oxyy">  <h3>找回密码</h3></a> </div>
                            <hr class="mx-n4 mx-sm-n5">
                            <p class="lead text-center">修改密码后将重新登录</p>
                            <form id="auth-form" method="post">

                                <div class="form-group">
                                    <label for="mobile">手机号</label>
                                    <input type="text" class="form-control" name="mobile" autofocus="autofocus" autocomplete="off" id="mobile" required placeholder="请输入手机号">
                                </div>

                                <div class="form-group">
                                    <label for="password">新密码</label>
                                    <input type="password" class="form-control" name="password" autofocus="autofocus" autocomplete="off" id="password" required placeholder="请输入密码">
                                </div>

                                <div class="form-group">
                                    <label for="password_confirm">确认新密码</label>
                                    <input type="password" class="form-control" name="password_confirm" autofocus="autofocus" autocomplete="off" id="password_confirm" required placeholder="确认新密码">
                                </div>

                                <div class="form-group">
                                    <label for="code">短信验证码</label>
                                    <div class="input-group">
                                        <input  name="code" id="code" class="form-control col-lg-8" required type="text" placeholder="请输入短信验证码" autocomplete="off">
                                        <input class="form-control col-lg-4 ver_btn"  type="button" value="获取验证码"  id="send" style="float:left">
                                    </div>
                                </div>
                                <button class="btn btn-primary btn-block my-4" type="button">提交</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid py-3">
                <p class="text-center text-2 text-muted mb-0"><?php echo sysconf('site_info_copyright'); ?></p>
            </div>
        </div>


        <!-- Script --> 
        <script src="/static/merchant/login/jquery.min.js"></script> 
        <script src="/static/merchant/login/bootstrap.bundle.min.js"></script> 
        <!-- Style Switcher --> 
        <script src="/static/merchant/login/switcher.min.js"></script> 
        <script src="/static/merchant/login/theme.js"></script>
        <script src="/static/plugs/layui/layui.js"></script>
        <script>

            layui.use('layer', function () {
                var $ = layui.jquery, layer = layui.layer;
            });

            $(function () {
                $("#send").click(function () {
                    if (validCode) {
                        send_sms();
                    }
                })
            })

            var validCode = true;
            var token = "<?php echo $sms_token; ?>";
            function send_sms() {
                var phone = $('#mobile').val();
                var reg = /\d{11}/;
                if (phone == '' || !reg.test(phone)) {
                    layer.msg('请填写正确的手机号码！');
                    $('#mobile').focus();
                    return false;
                }
                layer.prompt({
                    title: '请输入验证码',
                    formType: 3
                }, function (chkcode) {
                    $('.getcode .code').off('click');
                    $.post('/forget/sms', {chkcode: chkcode, token: token, phone: phone, t: new Date().getTime()}, function (data) {

                        if (data.code === 1) {
                            layer.closeAll();
                            layer.msg(data.msg);
                            token = data.data.token;
                            var time = 60;
                            validCode = false;
                            $("#send").val("已发送(60)");
                            var t = setInterval(function () {
                                time--;
                                $("#send").val('已发送(' + time + ')');
                                if (time == 0) {
                                    clearInterval(t);
                                    $("#send").val("重新获取");
                                    validCode = true;
                                }
                            }, 1000);
                        } else {
                            layer.msg(data.msg);
                        }

                    }, 'json');
                });
                $('.layui-layer-prompt .layui-layer-content').prepend($('<img style="cursor:pointer;height: 60px;" id="chkcode_img" src="<?php echo url('index/user/verifycode',['t'=>time()]); ?>" onclick="javascript:this.src=\'/index/user/verifycode\'+\'?time=\'+Math.random()">'))
            }

            $('button').click(function () {
                if (checker()) {
                    var data = $('#auth-form').serialize()
                    $.post("<?php echo url('index/user/doForgetPassword'); ?>", data, function (res) {
                        if (res.code == 1) {
                            layer.msg(res.msg, {icon: 1}, function () {
                                location.href = res.url
                            })
                        } else {
                            layer.msg(res.msg, {icon: 2})
                        }
                    }, 'json')
                }
                return false;
            })

            function checker() {
                if (!/\d{4}/.test($('[name=code]').val())) {
                    layer.msg('请输入验证码，验证码至少4位');
                    return false;
                }
                return true;
            }


        </script>
    </body>
</html>