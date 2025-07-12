<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:49:14
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Agent/Member.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5ea937531_30253595',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6a3ad2e5724387eb4519faa28cc8c28de9c04bb1' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Agent/Member.html',
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
function content_67f3e5ea937531_30253595 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Common/Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<div class="layui-container fly-marginTop fly-user-main">
    <?php $_smarty_tpl->_subTemplateRender("file:../Common/Nav.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <div class="content-header">
                <i class="layui-icon">&#xe638;</i> 我的用户
            </div>

            <div class="content-body">
                <form class="search-query"></form>
                <table id="member" lay-filter="member"></table>
            </div>
        </div>
    </div>
</div>

<?php echo '<script'; ?>
>
    $(function () {
        layui.use(['hex', 'form'], function () {
            let table = $("#member");
            let cao = layui.hex;
            let queryParams = null;
            table.bootstrapTable({
                url: '/user/api/agentMember/data',//请求的url地址
                method: "post",//请求方式
                pageSize: 8,//每页显示的数量
                showRefresh: false,//是否显示刷新按钮
                cache: false,//是否使用缓存
                showToggle: false,//是否显示详细视图和列表视图的切换按钮
                cardView: false,
                pagination: true,//是否显示分页
                pageNumber: 1,//初始化显示第几页，默认第1页
                singleSelect: false,//复选框只能选择一条记录
                sidePagination: 'server',//分页显示方式，可以选择客户端和服务端（server|client）
                contentType: "application/x-www-form-urlencoded",//使用post请求时必须加上
                dataType: "json",//接收的数据类型
                queryParamsType: 'limit',//参数格式，发送标准的Restful类型的请求
                queryParams: function (params) {
                    params.page = (params.offset / params.limit) + 1;
                    if (queryParams) {
                        for (const key in params) {
                            queryParams[key] = params[key];
                        }
                    } else {
                        queryParams = params;
                    }
                    return queryParams;
                },
                //回调函数
                responseHandler: function (res) {
                    return {
                        "total": res.count,
                        "rows": res.data
                    }
                },
                columns: [
                    {field: 'id', title: 'ID', width: 80}
                    , {
                        field: 'avatar', title: '用户', formatter: function (val, item) {
                            if (!item.avatar) {
                                item.avatar = "/favicon.ico";
                            }
                            return '<span><img src="' + item.avatar + '"  style="width: 18px;border-radius: 100%;"/> ' + item.username + '</span> '
                        }
                    }
                    , {
                        field: 'group', title: '会员等级', formatter: function (val, item) {
                            return '<img style="height: 32px;" src="' + item.group.icon + '" title="' + item.group.name + ' (减免:' + (item.group.discount * 100) + '%)">'
                        }
                    }
                    , {
                        field: 'email', title: '邮箱', formatter: function (val, item) {
                            if (!item.email) {
                                return "-";
                            }
                            return item.email;
                        }
                    }
                    , {
                        field: 'phone', title: '手机号', formatter: function (val, item) {
                            if (!item.phone) {
                                return "-";
                            }
                            return item.phone;
                        }
                    }
                    , {
                        field: 'qq', title: 'QQ', formatter: function (val, item) {
                            if (!item.qq) {
                                return "-";
                            }
                            return item.qq;
                        }
                    }
                    , {
                        field: 'balance', title: '余额', formatter: function (val, item) {
                            return '<span class="acg-badge acg-badge-light-success">￥' + item.balance + '</span>'
                        }
                    }
                    , {
                        field: 'recharge', title: '总充值', formatter: function (val, item) {
                            return '<span class="acg-badge acg-badge-light-primary">' + item.recharge + '</span>'
                        }
                    }
                    , {
                        field: 'create_time', title: '注册时间'
                    }
                ]
            });

            cao.query('.search-query', table, [
                {
                    title: "查询会员ID", name: "equal-id", type: "input"
                }
            ], true, false);
        });
    });
<?php echo '</script'; ?>
>
<?php $_smarty_tpl->_subTemplateRender("file:../Common/Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
