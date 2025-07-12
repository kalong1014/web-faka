<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:49:05
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Dashboard/Index.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5e1bd5a67_98100901',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'dc32fe5bfba308f2c2e86be9d9f5e59dccddc2ed' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Dashboard/Index.html',
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
function content_67f3e5e1bd5a67_98100901 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Common/Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<style>
    .layui-layer-page .layui-layer-content {
        overflow-wrap: break-word;
    }

    .more-table td {
        border-width: 1px !important;
        border-color: rgba(241, 195, 195, 0.27) !important;
        font-size: 14px;
        color: #fbaea7;
    }

    .card-data {
        padding: 10px;
    }

    .card-data .layui-card {
        border-radius: 10px;
        background-color: #ebb9b926;
    }

    .card-data .layui-card-header {
        color: #997cf3;
    }

    .card-data .layui-card-body {
        color: #ff90f6;
        font-weight: bold;
    }

</style>

<div class="layui-container fly-marginTop fly-user-main">
    <?php $_smarty_tpl->_subTemplateRender("file:../Common/Nav.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <div class="content-header">
                <i class="layui-icon">&#xe638;</i> 我的主页
            </div>

            <div class="content-body">
                <blockquote class="elem-quote">
                    欢迎回来，<?php echo $_smarty_tpl->tpl_vars['user']->value['username'];?>

                </blockquote>
                <div style="padding: 10px;" class="more-table">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <td class="layui-col-md2">登录IP地址：</td>
                            <td class="layui-col-md10" style="color: #00A3FF"><?php echo $_smarty_tpl->tpl_vars['user']->value['login_ip'];?>
</td>
                        </tr>
                        <tr>
                            <td class="layui-col-md2">登录时间：</td>
                            <td class="layui-col-md10"><?php echo $_smarty_tpl->tpl_vars['user']->value['login_time'];?>
</td>
                        </tr>
                        <tr>
                            <td class="layui-col-md2">上次登录IP：</td>
                            <td class="layui-col-md10" style="color: #00A3FF;"><?php if ($_smarty_tpl->tpl_vars['user']->value['last_login_ip']) {
echo $_smarty_tpl->tpl_vars['user']->value['last_login_ip'];?>
 <?php if ($_smarty_tpl->tpl_vars['user']->value['login_ip'] != $_smarty_tpl->tpl_vars['user']->value['last_login_ip']) {?> <span style="color: red;">(异地登录)</span><?php }
} else { ?>-<?php }?>
                            </td>
                        </tr>
                        <tr>
                            <td class="layui-col-md2">上次登录时间：</td>
                            <td class="layui-col-md10"><?php if ($_smarty_tpl->tpl_vars['user']->value['last_login_time']) {
echo $_smarty_tpl->tpl_vars['user']->value['last_login_time'];
} else { ?>-<?php }?></td>
                        </tr>
                        <tr>
                            <td class="layui-col-md2">商户ID：</td>
                            <td class="layui-col-md10"><span class="layui-badge layui-btn-pink"><?php echo $_smarty_tpl->tpl_vars['user']->value['id'];?>
</span></td>
                        </tr>
                        <tr>
                            <td class="layui-col-md2">商户密钥：</td>
                            <td class="layui-col-md10"><span
                                    class="layui-badge layui-btn-pink app-key"><?php echo $_smarty_tpl->tpl_vars['user']->value['app_key'];?>
</span>
                                <span class="layui-badge layui-bg-green reset-key" style="cursor: pointer;">重置</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="layui-col-md2">推广链接：</td>
                            <td class="layui-col-md10"><a style="cursor: pointer;color: #0C84D1;" class="clipboard"
                                                          data-clipboard-text="<?php echo $_smarty_tpl->tpl_vars['share_url']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['share_url']->value;?>
</a> (<span
                                    style="color: #0f6674;">通过该链接消费的人会给您丰厚的佣金</span>)
                            </td>
                        </tr>
                        <tr>
                            <td class="layui-col-md2">推广人数：</td>
                            <td class="layui-col-md10"><?php echo $_smarty_tpl->tpl_vars['children']->value;?>
</td>
                        </tr>
                        </tbody>
                    </table>
                </div>


                <div class="layui-row">

                    <div class="layui-col-md3 card-data">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="layui-icon">&#xe65e;</i> 余额</div>
                            <div class="layui-card-body">
                                ￥<?php echo $_smarty_tpl->tpl_vars['user']->value['balance'];?>

                            </div>
                        </div>
                    </div>

                    <div class="layui-col-md3 card-data">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="layui-icon">&#xe735;</i> 硬币</div>
                            <div class="layui-card-body">
                                ￥<?php echo $_smarty_tpl->tpl_vars['user']->value['coin'];?>

                            </div>
                        </div>
                    </div>

                    <div class="layui-col-md3 card-data">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="layui-icon">&#xe65e;</i> 总充值</div>
                            <div class="layui-card-body">
                                ￥<?php echo $_smarty_tpl->tpl_vars['user']->value['recharge'];?>

                            </div>
                        </div>
                    </div>

                    <div class="layui-col-md3 card-data">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="layui-icon">&#xe735;</i> 总收入(硬币)</div>
                            <div class="layui-card-body">
                                ￥<?php echo $_smarty_tpl->tpl_vars['user']->value['total_coin'];?>

                            </div>
                        </div>
                    </div>
                    <?php if ($_smarty_tpl->tpl_vars['user']->value['businessLevel']) {?>
                    <div class="layui-col-md3 card-data">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="layui-icon">&#xe748;</i> 今日收入</div>
                            <div class="layui-card-body">
                                ￥<?php echo $_smarty_tpl->tpl_vars['today_income']->value;?>

                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md3 card-data">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="layui-icon">&#xe6b1;</i> 昨日收入</div>
                            <div class="layui-card-body">
                                ￥<?php echo $_smarty_tpl->tpl_vars['yesterday_income']->value;?>

                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md3 card-data">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="layui-icon">&#xe67b;</i> 本周收入</div>
                            <div class="layui-card-body">
                                ￥<?php echo $_smarty_tpl->tpl_vars['week_income']->value;?>

                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md3 card-data">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="layui-icon">&#xe659;</i> 总交易</div>
                            <div class="layui-card-body">
                                ￥<?php echo $_smarty_tpl->tpl_vars['trade']->value;?>

                            </div>
                        </div>
                    </div>

                    <?php }?>

                </div>
            </div>
        </div>
    </div>

    <?php echo '<script'; ?>
>
        $('.clipboard').click(function () {
            var clipboard = new ClipboardJS(".clipboard");
            clipboard.on('success', function (e) {
                layer.msg("推广链接已经复制成功了，赶快发给好友吧！")
            });
        });

        $('.reset-key').click(function () {
            layer.confirm('您真的要重置您的商户密钥吗？这是无法恢复的操作。', {
                btn: ['立即重置', '取消'],
                title: "重置密钥"
            }, function () {
                $.post('/user/api/security/resetKey', res => {
                    layer.msg(res.msg);
                    if (res.code == 200) {
                        $('.app-key').html(res.data.app_key);
                    }
                });
            });
        });
    <?php echo '</script'; ?>
>
    <?php $_smarty_tpl->_subTemplateRender("file:../Common/Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
