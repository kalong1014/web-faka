<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:20:22
  from '/www/wwwroot/webfaka/app/View/Install.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3df26bebec3_00561030',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0c3227fe2600ce62c004865f81c9eceb1e4ba816' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Install.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_67f3df26bebec3_00561030 (Smarty_Internal_Template $_smarty_tpl) {
?><!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>安装程序</title>
    <?php echo '<script'; ?>
 src="/assets/static/jquery.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="/assets/static/layer/layer.js"><?php echo '</script'; ?>
>

    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 微软雅黑, serif;
            background: url("/assets/admin/images/login/bg.jpg") fixed no-repeat;
            background-size: cover;
        }

        h1, h2, h3, h4, h5, h6 {
            font-weight: 200;
        }

        a {
            text-decoration: none;
        }

        p, li, a {
            font-size: 14px;
        }

        fieldset {
            margin: 0;
            padding: 0;
            border: none;
        }

        .container {
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
            position: relative;
            top: 50%; /*偏移*/
            margin-top: -300px;
            background-color: #ffffffd6;
            -webkit-box-shadow: 0 6px 0 0 rgba(0, 0, 0, .01), 0 15px 32px 0 rgba(0, 0, 0, .06);
            box-shadow: 0 6px 0 0 rgba(0, 0, 0, .01), 0 15px 32px 0 rgba(0, 0, 0, .06);
            border-radius: 10px 10px 0 0;
        }


        .wrapper {
            width: 100%;
            margin: 30px 0;
        }

        /* STEPS */

        .steps {
            list-style-type: none;
            margin: 0;
            padding: 0;
            text-align: center;
        }


        .steps li {
            display: inline-block;
            margin: 20px;
            color: #ccc;
            padding-bottom: 5px;
        }

        .steps li.is-active {
            border-bottom: 1px solid pink;
            color: pink;
        }

        /* FORM */

        .form-wrapper .section {
            padding: 0px 20px 30px 20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            background-color: #ffffffd6;
            opacity: 0;
            -webkit-transform: scale(1, 0);
            -ms-transform: scale(1, 0);
            -o-transform: scale(1, 0);
            transform: scale(1, 0);
            -webkit-transform-origin: top center;
            -moz-transform-origin: top center;
            -ms-transform-origin: top center;
            -o-transform-origin: top center;
            transform-origin: top center;
            -webkit-transition: all 0.5s ease-in-out;
            -o-transition: all 0.5s ease-in-out;
            transition: all 0.5s ease-in-out;
            text-align: center;
            position: absolute;
            width: 100%;
            min-height: 300px
        }

        .form-wrapper .section h3 {
            margin-bottom: 30px;
        }

        .form-wrapper .section.is-active {
            opacity: 1;
            -webkit-transform: scale(1, 1);
            -ms-transform: scale(1, 1);
            -o-transform: scale(1, 1);
            transform: scale(1, 1);
            border-radius: 0 0 10px 10px;
            -webkit-box-shadow: 0 6px 0 0 rgba(0, 0, 0, .01), 0 15px 32px 0 rgba(0, 0, 0, .06);
            box-shadow: 0 6px 0 0 rgba(0, 0, 0, .01), 0 15px 32px 0 rgba(0, 0, 0, .06);
        }

        .form-wrapper .button, .form-wrapper .submit {
            background-color: pink;
            display: inline-block;
            padding: 8px 30px;
            color: #fff;
            cursor: pointer;
            font-size: 14px !important;
            font-family: 'Open Sans', sans-serif !important;
            margin-top: 30px;
            /*  position: absolute;
              right: 20px;
              bottom: -20px;*/
        }

        .form-wrapper .submit {
            border: none;
            outline: none;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }

        .form-wrapper input[type="text"], .form-wrapper input[type="password"] {
            display: block;
            padding: 10px;
            margin: 10px auto;
            background-color: #f1f1f1;
            border: none;
            width: 70%;
            outline: none;
            font-size: 14px !important;
            font-family: 'Open Sans', sans-serif !important;
        }

        .form-wrapper input[type="radio"] {
            display: none;
        }

        .form-wrapper input[type="radio"] + label {
            display: block;
            border: 1px solid #ccc;
            width: 100%;
            max-width: 100%;
            padding: 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            cursor: pointer;
            position: relative;
        }

        .form-wrapper input[type="radio"] + label:before {
            content: "?";
            position: absolute;
            right: -10px;
            top: -10px;
            width: 30px;
            height: 30px;
            line-height: 30px;
            border-radius: 100%;
            background-color: #3498db;
            color: #fff;
            display: none;
        }

        .form-wrapper input[type="radio"]:checked + label:before {
            display: block;
        }

        .form-wrapper input[type="radio"] + label h4 {
            margin: 15px;
            color: #ccc;
        }

        .form-wrapper input[type="radio"]:checked + label {
            border: 1px solid #3498db;
        }

        .form-wrapper input[type="radio"]:checked + label h4 {
            color: #3498db;
        }

        .gridtable {
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #f3a5a5;
            border-collapse: collapse;
            margin: 0 auto 20px auto;
            width: 80%;
        }

        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #fbc8c880;
            background-color: #ffd6d652;
        }

        .gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #fbc8c880;
            background-color: #ffffff;
        }

        .disabled {
            background-color: rgba(128, 128, 128, 0.49) !important;
            display: inline-block;
            padding: 8px 30px;
            color: #fff;
            cursor: pointer;
            font-size: 14px !important;
            font-family: 'Open Sans', sans-serif !important;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="wrapper">
        <ul class="steps">
            <li class="is-active">🚜 环境检查</li>
            <li>📀 数据库配置</li>
            <li>🔐 管理员设置</li>
        </ul>
        <form class="form-wrapper install-info">
            <fieldset class="section is-active">
                <h3 style="color: pink;font-weight: bold;">程序版本：<b style="color: #ff98d6;">v<?php echo $_smarty_tpl->tpl_vars['version']->value;?>
</b></h3>
                <table class="gridtable">
                    <tr>
                        <th>依赖模块</th>
                        <th>是否支持</th>
                    </tr>
                    <tr>
                        <td>php-8.0</td>
                        <td><?php if ($_smarty_tpl->tpl_vars['php_version']->value >= 8) {?><b style="color: green;">✔</b> <?php } else { ?><b style="color: red;">8.0+</b><?php }?>
                        </td>
                    </tr>
                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['ext']->value, 'val', false, 'key');
$_smarty_tpl->tpl_vars['val']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['key']->value => $_smarty_tpl->tpl_vars['val']->value) {
$_smarty_tpl->tpl_vars['val']->do_else = false;
?>
                    <tr>
                        <td><?php echo $_smarty_tpl->tpl_vars['key']->value;?>
</td>
                        <td><?php if ($_smarty_tpl->tpl_vars['val']->value) {?><b style="color: green;">✔</b> <?php } else { ?><b style="color: red;">不支持</b><?php }?>
                        </td>
                    </tr>
                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

                </table>
                <div class="<?php if ($_smarty_tpl->tpl_vars['install']->value) {?> button <?php } else { ?> disabled <?php }?>"><?php if ($_smarty_tpl->tpl_vars['install']->value) {?> 下一步 <?php } else { ?> 👿 请检查环境 <?php }?>
                </div>
            </fieldset>
            <fieldset class="section">
                <h3 style="color: pink;font-weight: bold;">配置您的数据库信息</h3>
                <input type="text" name="host" placeholder="数据库地址" , value="127.0.0.1">
                <input type="text" name="database" placeholder="数据库名称">
                <input type="text" name="username" placeholder="数据库账号">
                <input type="text" name="password" placeholder="数据库密码">
                <input type="text" name="prefix" placeholder="数据库前缀" value="acg_">
                <div class="button">下一步</div>
            </fieldset>
            <fieldset class="section">
                <h3 style="color: pink;font-weight: bold;">请设置管理员邮箱和密码</h3>
                <input type="text" name="email" placeholder="管理员邮箱">
                <input type="text" name="nickname" placeholder="呢称">
                <input type="password" name="login_password" placeholder="登录密码">
                <input type="password" name="login_re_password" placeholder="确认登录密码">
                <input class="submit prevButton" type="button" value="上一步">
                <input class="submit button installButton" type="button" value="立即安装">
            </fieldset>
            <fieldset class="section">
                <h3 style="color: pink;font-weight: bold;margin-top: 100px;">恭喜，安装成功！<a
                        href="/admin/authentication/login" style="font-size: 17px;color: #0C84D1;">登录</a></h3>
            </fieldset>
        </form>
    </div>
</div>

<?php echo '<script'; ?>
>
    $(document).ready(function () {
        let getValue = function (name) {
            return $('input[name=' + name + ']').val();
        }

        $('.prevButton').click(function () {
            var button = $(this);
            var currentSection = button.parents(".section");
            var currentSectionIndex = currentSection.index();
            var headerSection = $('.steps li').eq(currentSectionIndex);
            currentSection.removeClass("is-active").prev().addClass("is-active");
            headerSection.removeClass("is-active").prev().addClass("is-active");
        });

        $(".form-wrapper .button").click(function () {
            var button = $(this);
            var currentSection = button.parents(".section");
            var currentSectionIndex = currentSection.index();
            var headerSection = $('.steps li').eq(currentSectionIndex);

            let host = getValue('host');
            let database = getValue('database');
            let username = getValue('username');
            let password = getValue('password');
            let prefix = getValue('prefix');
            let email = getValue('email');
            let nickname = getValue('nickname');
            let login_password = getValue('login_password');
            let login_re_password = getValue('login_re_password');

            if (currentSectionIndex == 0) {
                currentSection.removeClass("is-active").next().addClass("is-active");
                headerSection.removeClass("is-active").next().addClass("is-active");
            }

            if (currentSectionIndex == 1) {
                //验证主机
                if (database == '') {
                    layer.msg("请填写数据库名称");
                    return;
                }
                if (username == '') {
                    layer.msg("请填写数据库账号");
                    return;
                }
                if (password == '') {
                    layer.msg("请填写数据库密码");
                    return;
                }
                currentSection.removeClass("is-active").next().addClass("is-active");
                headerSection.removeClass("is-active").next().addClass("is-active");
            }

            if (currentSectionIndex == 2) {

                if (email == '') {
                    layer.msg("请设设置管理员邮箱");
                    return;
                }

                if (nickname == '') {
                    layer.msg("呢称不能为空");
                    return;
                }

                if (login_password == '') {
                    layer.msg("请设置登录密码");
                    return;
                }
                if (login_re_password == '') {
                    layer.msg("请再次输入登录密码");
                    return;
                }

                if (login_password != login_re_password) {
                    layer.msg("两次密码输入不一致");
                    return;
                }

                let installButton = $('.installButton');

                installButton.attr('disabled', true);
                installButton.css('background-color', 'rgba(0, 0, 0, 0.2)');
                installButton.val('正在安装..');

                $.post('/install/submit', $('.install-info').serialize(), res => {
                    if (res.code == 200) {
                        currentSection.removeClass("is-active").next().addClass("is-active");
                        headerSection.removeClass("is-active").next().addClass("is-active");
                        $(".form-wrapper").submit(function (e) {
                            e.preventDefault();
                        });
                    } else {
                        layer.msg(res.msg);
                        installButton.attr('disabled', false);
                        installButton.css('background-color', 'pink');
                        installButton.val('重新安装');
                    }
                });
            }
        });
    });
<?php echo '</script'; ?>
>

</body>
</html>
<?php }
}
