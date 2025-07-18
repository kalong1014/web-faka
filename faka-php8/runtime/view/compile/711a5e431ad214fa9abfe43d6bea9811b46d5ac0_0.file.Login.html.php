<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:21:46
  from '/www/wwwroot/webfaka/app/View/Admin/Authentication/Login.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3df7a361977_69874928',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '711a5e431ad214fa9abfe43d6bea9811b46d5ac0' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Authentication/Login.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_67f3df7a361977_69874928 (Smarty_Internal_Template $_smarty_tpl) {
?><!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录 - <?php echo $_smarty_tpl->tpl_vars['config']->value['title'];?>
</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <?php echo '<script'; ?>
 src="/assets/static/jquery.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/layer/layer.js"><?php echo '</script'; ?>
>
    <style>
        @media screen and (max-width: 768px) {
            .login-box {
                height: 100%;
                width: 100%;
            }
        }

        * {
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            font-family: "微软雅黑", serif;
        }

        html {
            height: 100%;
            margin: 0;
        }

        body {
            margin: 0;
            padding: 0;
            background: url('<?php echo $_smarty_tpl->tpl_vars['config']->value['background_url'];?>
') fixed no-repeat;
            background-size: cover;
            width: 100%;
            height: 100%;
        }

        #app {
            background: #000000de;
            height: 100vh;
            margin: 0;
            padding: 0;
            width: 100%;
            overflow: hidden;
        }

        @keyframes login {
            from {
                box-shadow: rgba(253, 173, 204, 0.35) 0px 7px 29px 0px;
            }
            to {
                box-shadow: rgb(253 173 204) 0px 7px 29px 0px;
            }
        }

        @-webkit-keyframes login /* Safari 与 Chrome */
        {
            from {
                box-shadow: rgba(253, 173, 204, 0.35) 0px 7px 29px 0px;
            }
            to {
                box-shadow: rgb(253 173 204) 0px 7px 29px 0px;
            }
        }

        .login-animation {
            animation: login 2s;
            animation-direction: alternate;
            animation-iteration-count: infinite;
            -webkit-animation: login 2s; /* Safari 与 Chrome */
            -webkit-animation-direction: alternate;
            -webkit-animation-iteration-count: infinite;
        }

        .login-box {
            position: relative;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 380px;
            padding: 40px;
            background: linear-gradient(to bottom right, #2d3e5594, #7d617cbd);
            box-sizing: border-box;
            /*   box-shadow: 0 15px 25px rgba(253, 173, 204, 0.28);*/
            box-shadow: rgba(253, 173, 204, 0.35) 0px 7px 29px 0px;
            border-radius: 10px;
            border-top: 5px solid rgb(240 74 133 / 45%);
        }

        .login-box h2 {
            margin: 0 0 70px;
            padding: 0;
            text-align: center;
            font-weight: bolder !important;
        }

        .login-box h2 span {
            padding: 5px 20px;
            padding-bottom: 10px;
            opacity: 0.8;
            font-size: 18px;
            border: 1px dashed rgba(234, 136, 171, 0.45);
            border-top: none;
            position: absolute;
            top: 0;
            left: 50%;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            transform: translate(-50%, 0);
            color: rgba(253, 173, 204, 0.62);
        }

        .login-box .user-box {
            position: relative;
        }

        .login-box .user-box input {
            margin-top: 10px;
            width: 100%;
            padding: 10px 0;
            font-size: 14px;
            color: #4acb5b;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px dashed #ea88ab;
            outline: none;
            background: transparent;
        }

        .login-box .user-box select {
            margin-top: 10px;
            width: 100%;
            padding: 10px 0;
            font-size: 14px;
            color: #12b109;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px dashed #ea88ab;
            outline: none;
            background: transparent;
        }

        .login-box .user-box label {
            position: absolute;
            padding: 10px 0;
            pointer-events: none;
            transition: .5s;
            top: -20px;
            left: 0;
            color: #ea88ab;
            font-size: 12px;
            font-weight: bolder;
        }


        .login-box form a {
            position: relative;
            display: inline-block;
            padding: 10px 20px;
            color: #ea88ab;
            font-size: 14px;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            transition: .5s;
            margin-top: 40px;
            letter-spacing: 4px;
        }

        .login-box a:hover {
            background: rgba(243, 193, 210, 0.38);
            color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 5px #ea88ab,
            0 0 25px #ea88ab,
            0 0 50px #ea88ab,
            0 0 100px #ea88ab;
        }

        .login-box a span {
            position: absolute;
            display: block;
        }

        .login-box a span:nth-child(1) {
            top: 0;
            left: -100%;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, #ea88ab);
            animation: btn-anim1 1s linear infinite;
        }

        @keyframes btn-anim1 {
            0% {
                left: -100%;
            }
            50%, 100% {
                left: 100%;
            }
        }

        .login-box a span:nth-child(2) {
            top: -100%;
            right: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(180deg, transparent, #ea88ab);
            animation: btn-anim2 1s linear infinite;
            animation-delay: .25s
        }

        @keyframes btn-anim2 {
            0% {
                top: -100%;
            }
            50%, 100% {
                top: 100%;
            }
        }

        .login-box a span:nth-child(3) {
            bottom: 0;
            right: -100%;
            width: 100%;
            height: 2px;
            background: linear-gradient(270deg, transparent, #ea88ab);
            animation: btn-anim3 1s linear infinite;
            animation-delay: .5s
        }

        @keyframes btn-anim3 {
            0% {
                right: -100%;
            }
            50%, 100% {
                right: 100%;
            }
        }

        .login-box a span:nth-child(4) {
            bottom: -100%;
            left: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(360deg, transparent, #ea88ab);
            animation: btn-anim4 1s linear infinite;
            animation-delay: .75s
        }

        @keyframes btn-anim4 {
            0% {
                bottom: -100%;
            }
            50%, 100% {
                bottom: 100%;
            }
        }

        input:-webkit-autofill {
            -webkit-text-fill-color: #a8b72b !important; /*浏览器记住密码的字的颜色*/
            transition: background-color 5000s ease-in-out 0s; /*通过延时渲染背景色变相去除背景颜色*/
            caret-color: #ffffff; /*光标颜色*/
        }

        /*外边框线去除*/
        input:focus {
            outline: none;
        }

        input::-webkit-input-placeholder {
            /* placeholder颜色  */
            color: #aab2bd;
            /* placeholder字体大小  */
            font-size: 12px;
            /* placeholder位置  */
        }

        input ::-webkit-input-placeholder {
            /* WebKit, Blink, Edge */
            /* placeholder颜色  */
            color: #aab2bd;
            /* placeholder字体大小  */
            font-size: 12px;
            /* placeholder位置  */
        }

        input:-moz-placeholder {
            /* Mozilla Firefox 4 to 18 */
            /* placeholder颜色  */
            color: #aab2bd;
            /* placeholder字体大小  */
            font-size: 12px;
            /* placeholder位置  */
        }

        input::-moz-placeholder {
            /* Mozilla Firefox 19+ */
            color: #aab2bd;
            /* placeholder字体大小  */
            font-size: 12px;
            /* placeholder位置  */
        }

        input:-ms-input-placeholder {
            /* Internet Explorer 10-11 */
            /* placeholder颜色  */
            color: #aab2bd;
            /* placeholder字体大小  */
            font-size: 12px;
            /* placeholder位置  */
        }
    </style>
</head>
<body>
<div id="app">
    <div class="login-box">
        <h2><span><?php echo $_smarty_tpl->tpl_vars['config']->value['shop_name'];?>
</span></h2>
        <form>
            <div class="user-box">
                <input type="email" name="email" required="" placeholder="请输入你的邮箱..">
                <label>Email</label>
            </div>
            <div class="user-box">
                <input type="password" name="password" required="" placeholder="请输入密码..">
                <label>密码</label>
            </div>
            <div class="user-box">
                <select name="tunnel">
                    <option>正在进行安全检查..</option>
                </select>
                <label>安全隧道 (<b style="color: #04f33a;">请确定自己的电脑IP地址再选择</b>)</label>
            </div>
            <a href="javascript:void(0);" class="login-button">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                登录
            </a>
        </form>
    </div>
</div>

<?php echo '<script'; ?>
>
    function get(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) {
                return pair[1];
            }
        }
        return 0;
    }

    let goto = decodeURIComponent(get("goto"));

    if (goto == 0) {
        goto = "/admin/dashboard/index";
    }


    function DisableHandle(obj, text = "正在登录..") {
        $(obj).text(text);
        $('.login-box').addClass("login-animation");
        $("input").attr("disabled", true);
    }

    function EnableHandle(obj) {
        $(obj).text("登录");
        $('.login-box').removeClass("login-animation");
        $("input").attr("disabled", false);
    }

    let loginStatus = false;
    $(".login-button").click(function () {
        if (loginStatus) {
            return;
        }
        loginStatus = true;
        DisableHandle(this);
        $.post("/admin/api/authentication/login", {
            username: $('input[name=email]').val(),
            password: $('input[name=password]').val(),
            mode: $("select[name=tunnel]").val()
        }, res => {
            loginStatus = false;
            if (res.code != 200) {
                EnableHandle(this);
                layer.msg(res.msg);
                return;
            }
            window.location.href = goto;
        }).fail(error => {
            loginStatus = false;
            layer.msg("网络错误，请重试");
            EnableHandle(this);
        });

    });

    $("body").keypress(function (even) {
        if (even.which == 13) {
            $(".login-button").click();
        }
    });


    let $select = $("select[name=tunnel]");

    let loaderIndex = layer.load(2, {shade: ['0.3', '#fff']});
    let test = "127.0.0.1";
    let mode = "<?php echo \App\Util\Client::getClientMode();?>
"
    let have = "<?php echo \App\Util\Client::haveMode();?>
"
    let ips = {};
    $.ajax({
        url: "/admin/api/authentication/getIp", // 目标URL
        type: "GET",
        headers: {
            "Client-Ip": test,
            "X-Forwarded-For": test,
            "X-Forwarded": test,
            "X-Cluster-Client-Ip": test,
            "Forwarded-For": test,
            "Forwarded": test,
            "X-Real-Ip": test,
            "Remote-Addr": test
        },
        success: function (res) {
            layer.close(loaderIndex);
            $select.html("<option value='-1'>请选择安全隧道模式</option>");
            res.data.forEach(data => {
                let risk = " (安全/可信)";
                let css = "";
                if (data.risk) {
                    risk = " (该模式有伪造IP风险)";
                    css = 'style="color:red;"'
                }
                ips[data.type] = data.ip;
                $select.append('<option ' + ((mode == data.type && have == "1") ? "selected" : "") + ' ' + css + ' value="' + data.type + '">模式(' + data.type + ") - " + data.ip + ' ' + risk + '</option>');
            });

            if (have != "1") {
                layer.alert('安全隧道是CDN获取真实IP的终极解决方案，客户将无法伪造客户IP地址<br><br>请务必选择<b style="color:red;">【安全隧道】模式为你正确的电脑IP地址</b>（<a href="https://ip.skk.moe/" target="_blank">查看我的电脑IP</a>），否则系统无法获取客户真实的电脑IP地址。<br><br><b style="color: #12a711;">注意：如果您的网站使用了CDN，那么以后请使用CDN域名登录后台，这将会让您的网站得到最大化的安全保障。</b>', {title: "<b style='color: red;'>安全隧道确认</b>"});
            }
        }
    });

    $select.on("change", function () {
        let type = this.value;
        if (type != "-1") {
            layer.alert('请务必确认您的电脑IP地址是否和模式上显示的一致<br><br>查看你的电脑IP地址：<a style="color: red;" href="https://ip.skk.moe/" target="_blank">查看我的电脑IP</a>', {title: "<b style='color: #1dcb0a;'>请确认你的电脑IP是：</b><b style='color: red'>" + ips[type] + "</b>"});
        }
    });


<?php echo '</script'; ?>
>

</body>
</html>
<?php }
}
