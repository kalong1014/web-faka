<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:36:18
  from '/www/wwwroot/webfaka/app/View/Admin/User/User.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e2e2187d02_04042603',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ba39ffb5c77c86e718a88ebaff58953d46f0e7d1' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/User/User.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:../Header.html' => 1,
    'file:../Toolbar.html' => 1,
    'file:../Footer.html' => 1,
  ),
),false)) {
function content_67f3e2e2187d02_04042603 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<style>
    .layui-popup .layui-layer-content {
        position: relative !important;
        overflow: auto !important;
    }
</style>
<!--start::HOOK-->
<?php echo hook(\App\Consts\Hook::ADMIN_VIEW_USER_HEADER);?>

<!--end::HOOK-->
<!--begin::Content-->
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!--begin::Toolbar-->
    <?php $_smarty_tpl->_subTemplateRender("file:../Toolbar.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <!--end::Toolbar-->
    <!--begin::Post-->
    <div class="post d-flex flex-column-fluid" id="kt_post">
        <!--begin::Container-->
        <div id="kt_content_container" class="container-fluid">
            <!--begin::Row-->
            <div class="row g-5 g-xl-10">
                <div class="col-xl-2">
                    <!--begin::Statistics Widget 1-->
                    <div class="card bgi-no-repeat card-xl-stretch mb-xl-8"
                         style="background-position: right top; background-size: 30% auto; background-image: url(/assets/admin/images/svg/shapes/abstract-4.svg)">
                        <!--begin::Body-->
                        <div class="card-body">
                            <span class="card-title fw-bolder text-muted text-hover-primary fs-4">总用户</span>
                            <div class="fw-bolder fs-1 text-primary my-6"><?php echo $_smarty_tpl->tpl_vars['userCount']->value;?>
</div>
                        </div>
                        <!--end::Body-->
                    </div>
                    <!--end::Statistics Widget 1-->
                </div>
                <div class="col-xl-2">
                    <!--begin::Statistics Widget 1-->
                    <div class="card bgi-no-repeat card-xl-stretch mb-xl-8"
                         style="background-position: right top; background-size: 30% auto; background-image: url(/assets/admin/images/svg/shapes/abstract-4.svg)">
                        <!--begin::Body-->
                        <div class="card-body">
                            <span class="card-title fw-bolder text-muted text-hover-primary fs-4">商家</span>
                            <div class="fw-bolder fs-1 text-success my-6"><?php echo $_smarty_tpl->tpl_vars['businessCount']->value;?>
</div>
                        </div>
                        <!--end::Body-->
                    </div>
                    <!--end::Statistics Widget 1-->
                </div>
                <div class="col-xl-2">
                    <!--begin::Statistics Widget 1-->
                    <div class="card bgi-no-repeat card-xl-stretch mb-xl-8"
                         style="background-position: right top; background-size: 30% auto; background-image: url(/assets/admin/images/svg/shapes/abstract-4.svg)">
                        <!--begin::Body-->
                        <div class="card-body">
                            <span class="card-title fw-bolder text-muted text-hover-primary fs-4">当前余额</span>
                            <div class="fw-bolder fs-1 text-primary my-6">￥<?php echo $_smarty_tpl->tpl_vars['balance']->value;?>
</div>
                        </div>
                        <!--end::Body-->
                    </div>
                    <!--end::Statistics Widget 1-->
                </div>
                <div class="col-xl-2">
                    <!--begin::Statistics Widget 1-->
                    <div class="card bgi-no-repeat card-xl-stretch mb-xl-8"
                         style="background-position: right top; background-size: 30% auto; background-image: url(/assets/admin/images/svg/shapes/abstract-4.svg)">
                        <!--begin::Body-->
                        <div class="card-body">
                            <span class="card-title fw-bolder text-muted text-hover-primary fs-4">总充值</span>
                            <div class="fw-bolder fs-1 text-success my-6"><?php echo $_smarty_tpl->tpl_vars['recharge']->value;?>
</div>
                        </div>
                        <!--end::Body-->
                    </div>
                    <!--end::Statistics Widget 1-->
                </div>
                <div class="col-xl-2">
                    <!--begin::Statistics Widget 1-->
                    <div class="card bgi-no-repeat card-xl-stretch mb-xl-8"
                         style="background-position: right top; background-size: 30% auto; background-image: url(/assets/admin/images/svg/shapes/abstract-4.svg)">
                        <!--begin::Body-->
                        <div class="card-body">
                            <span class="card-title fw-bolder text-muted text-hover-primary fs-4">当前硬币</span>
                            <div class="fw-bolder fs-1 text-primary my-6">￥<?php echo $_smarty_tpl->tpl_vars['coin']->value;?>
</div>
                        </div>
                        <!--end::Body-->
                    </div>
                    <!--end::Statistics Widget 1-->
                </div>
                <div class="col-xl-2">
                    <!--begin::Statistics Widget 1-->
                    <div class="card bgi-no-repeat card-xl-stretch mb-xl-8"
                         style="background-position: right top; background-size: 30% auto; background-image: url(/assets/admin/images/svg/shapes/abstract-4.svg)">
                        <!--begin::Body-->
                        <div class="card-body">
                            <span class="card-title fw-bolder text-muted text-hover-primary fs-4">总获得硬币</span>
                            <div class="fw-bolder fs-1 text-success my-6"><?php echo $_smarty_tpl->tpl_vars['totalCoin']->value;?>
</div>
                        </div>
                        <!--end::Body-->
                    </div>
                    <!--end::Statistics Widget 1-->
                </div>
            </div>
            <!--end::Row-->

            <!--begin::Tables Widget 9-->
            <div class="card mb-5 mb-xl-8">
                <div class="card-body py-3 mt-3">
                    <form class="search-query"></form>
                    <div class="table-toolbar">
                        <button class="btn btn-sm btn-light-primary handle me-3"><i class="fas fa-hand-paper"></i>
                            修改会员等级
                        </button>
                        <button class="btn btn-sm btn-light-danger btn-app-del me-3"><i class="fas fa-trash"></i> 移除选中用户
                        </button>
                        <!--start::HOOK-->
                        <?php echo hook(\App\Consts\Hook::ADMIN_VIEW_USER_TOOLBAR);?>

                        <!--end::HOOK-->
                    </div>
                    <table id="user" lay-filter="user"></table>
                </div>
            </div>

            <!--end::Tables Widget 9-->
        </div>
        <!--end::Container-->
    </div>
    <!--end::Post-->
</div>
<!--end::Content-->

<div style="display: none" class="business-modal">
    <div style="padding: 10px;" class="more-table">
        <table class="layui-table">
            <tbody>
            <tr>
                <td colspan="2" style="text-align: center;"><img src="[avatar]"
                                                                 style="height: 80px;width:80px;border-radius: 100%;box-shadow: 1px 1px 10px 1px #ed9b9bb3;">
                </td>
            </tr>

            <tr>
                <td>店铺名称</td>
                <td>[shop_name]</td>
            </tr>
            <tr>
                <td>浏览器标题</td>
                <td>[title]</td>
            </tr>
            <tr>
                <td>店铺公告</td>
                <td>[notice]</td>
            </tr>
            <tr>
                <td>客服QQ</td>
                <td>[service_qq]</td>
            </tr>
            <tr>
                <td>客服链接</td>
                <td><a href="[service_url]" target="_blank">[service_url]</a></td>
            </tr>
            <tr>
                <td>子域名</td>
                <td><a href="//[subdomain]" target="_blank">[subdomain]</a></td>
            </tr>
            <tr>
                <td>绑定域名</td>
                <td><a href="//[topdomain]" target="_blank">[topdomain]</a></td>
            </tr>
            <tr>
                <td>主站商品</td>
                <td>[master_display]</td>
            </tr>
            <tr>
                <td>创建时间</td>
                <td>[create_time]</td>
            </tr>

            <tr>
                <td>今日交易</td>
                <td>[today_order_amount]</td>
            </tr>
            <tr>
                <td>昨日交易</td>
                <td>[yesterday_order_amount]</td>
            </tr>
            <tr>
                <td>本周交易</td>
                <td>[week_order_amount]</td>
            </tr>
            <tr>
                <td>本月交易</td>
                <td>[month_order_amount]</td>
            </tr>
            <tr>
                <td>总交易</td>
                <td>[total_order_amount]</td>
            </tr>
            </tbody>
        </table>
    </div>

</div>

<?php echo '<script'; ?>
>

    $(function () {
        layui.use(['hex'], function () {
            let table = $("#user");
            var cao = layui.hex;

            let queryParams = null;
            let settlement = [
                '<span class="badge badge-light-primary"><i class="fab fa-alipay text-primary"></i> 支付宝</span>',
                '<span class="badge badge-light-success"><i class="fab fa-weixin text-success"></i> 微信</span>'
            ];

            table.bootstrapTable({
                url: '/admin/api/user/data',//请求的url地址
                method: "post",//请求方式
                //striped:true,//是否显示行间隔色
                pageSize: 13,//每页显示的数量
                pageList: [13, 25, 50, 100],
                showRefresh: false,//是否显示刷新按钮
                cache: false,//是否使用缓存
                showToggle: false,//是否显示详细视图和列表视图的切换按钮
                showColumns: true,
                toolbar: ".table-toolbar",
                onColumnSwitch: function (field, checked) {
                    cao.setColumnVisible('user', field, checked);
                },
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
                    {checkbox: true}
                    , {field: 'id', title: 'ID', width: 80}
                    , {
                        field: 'avatar',
                        visible: cao.getColumnVisible('user', 'avatar'),
                        title: '用户名',
                        formatter: function (val, item) {
                            if (!item.avatar) {
                                item.avatar = "/favicon.ico";
                            }
                            return '<span class="badge badge-light-dark"><img src="' + item.avatar + '"  style="width: 18px;border-radius: 100%;"/> ' + item.username + '</span> '
                        }
                    }
                    , {
                        field: 'nicename',
                        visible: cao.getColumnVisible('user', 'nicename', false),
                        title: '真实姓名',
                        formatter: function (val, item) {
                            if (!item.nicename) {
                                return '-';
                            }
                            return '<span class="badge badge-light">' + item.nicename + '</span> '
                        }
                    }
                    , {
                        field: 'business_level',
                        visible: cao.getColumnVisible('user', 'business_level'),
                        title: '他的店铺',
                        formatter: function (val, item) {
                            if (!item.business_level) {
                                return '-';
                            }
                            return '<span  class="badge badge-light business" style="cursor: pointer;"><img src="' + item.business_level.icon + '"  style="width: 16px;padding-bottom: 3px;"/> ' + item.business_level.name + '</span> <span class="badge badge-light-danger business-close" style="cursor:pointer;">关闭</span>'
                        },
                        events: {
                            'click .business': function (event, value, row, index) {
                                let map = row;
                                let loaderIndex = layer.load(2, {shade: ['0.3', '#fff']});
                                $.get("/admin/api/user/statistics?id=" + map.id, res => {
                                    layer.close(loaderIndex);
                                    if (res.code != 200) {
                                        return;
                                    }
                                    layer.open({
                                        type: 1,
                                        shadeClose: true,
                                        title: '<i class="layui-icon">&#xe600;</i> 店铺信息',
                                        content: $('.business-modal').html()
                                            .replace("[avatar]", map.avatar ? map.avatar : '/favicon.ico')
                                            .replace("[shop_name]", map.business.shop_name ? map.business.shop_name : "-")
                                            .replace("[title]", map.business.title ? map.business.title : "-")
                                            .replace("[notice]", map.business.notice ? map.business.notice : "-")
                                            .replace("[service_qq]", map.business.service_qq ? map.business.service_qq : "-")
                                            .replaceAll("[service_url]", map.business.service_url ? map.business.service_url : "-")
                                            .replaceAll("[subdomain]", map.business.subdomain ? map.business.subdomain : "-")
                                            .replaceAll("[topdomain]", map.business.topdomain ? map.business.topdomain : "-")
                                            .replace("[create_time]", map.business.create_time)
                                            .replace("[master_display]", map.business.master_display == 1 ? "<span style='color: green;'>显示</span>" : "<span style='color: green;'>隐藏</span>")
                                            .replace("[today_order_amount]", res.data.today_order_amount)
                                            .replace("[yesterday_order_amount]", res.data.yesterday_order_amount)
                                            .replace("[week_order_amount]", res.data.week_order_amount)
                                            .replace("[month_order_amount]", res.data.month_order_amount)
                                            .replace("[total_order_amount]", res.data.total_order_amount)
                                        , area: cao.isPc() ? "420px" : ["100%", "100%"]
                                    });
                                });
                            },
                            'click .business-close': function (event, value, row, index) {
                                layer.confirm('您确认要永久关闭该用户的店铺吗，这个操作无法恢复。', {
                                    btn: ['确认', '取消']
                                }, function () {
                                    $.post('/admin/api/user/shopClosed', {id: row.id}, res => {
                                        layer.msg(res.msg);
                                        table.bootstrapTable('refresh', {silent: true});
                                    });
                                });
                            }
                        }
                    }
                    , {
                        field: 'group',
                        title: '会员等级',
                        visible: cao.getColumnVisible('user', 'group'),
                        formatter: function (val, item) {
                            return '<img style="height: 32px;" src="' + item.group.icon + '" title="' + item.group.name + ' (减免:' + (item.group.discount * 100) + '%)">'
                        }
                    }
                    , {
                        field: 'email',
                        visible: cao.getColumnVisible('user', 'email'),
                        title: '邮箱',
                        formatter: function (val, item) {
                            if (!item.email) {
                                return "-";
                            }
                            return item.email;
                        }
                    }
                    , {
                        field: 'phone',
                        visible: cao.getColumnVisible('user', 'phone'),
                        title: '手机号',
                        formatter: function (val, item) {
                            if (!item.phone) {
                                return "-";
                            }
                            return item.phone;
                        }
                    }
                    , {
                        field: 'qq',
                        visible: cao.getColumnVisible('user', 'qq'),
                        title: 'QQ',
                        formatter: function (val, item) {
                            if (!item.qq) {
                                return "-";
                            }
                            return item.qq;
                        }
                    }
                    , {
                        field: 'balance',
                        visible: cao.getColumnVisible('user', 'balance'),
                        title: '余额',
                        formatter: function (val, item) {
                            return '<span class="badge badge-light-primary recharge" style="cursor: pointer;" ><i class="fas fa-yen-sign text-primary fs-10"></i> ' + item.balance + '</span>'
                        },
                        events: {
                            'click .recharge': function (event, value, row, index) {
                                recharge(row);
                            }
                        }
                    }

                    , {
                        field: 'recharge',
                        visible: cao.getColumnVisible('user', 'recharge'),
                        title: '元气',
                        formatter: function (val, item) {
                            return '<a class="badge badge-light-primary" href="/admin/recharge/order?userId=' + item.id + '" target="_blank">' + item.recharge + '</a>'
                        }
                    }
                    , {
                        field: 'coin',
                        visible: cao.getColumnVisible('user', 'coin'),
                        title: '硬币',
                        formatter: function (val, item) {
                            return '<span class="badge badge-light-success coin" style="cursor: pointer;" ><i class="fas fa-yen-sign text-success fs-10"></i> ' + item.coin + '</span>'
                        },
                        events: {
                            'click .coin': function (event, value, row, index) {
                                coin(row);
                            }
                        }
                    }
                    , {
                        field: 'total_coin',
                        visible: cao.getColumnVisible('user', 'total_coin'),
                        title: '总硬币',
                        formatter: function (val, item) {
                            return '<span class="badge badge-light-success">' + item.total_coin + '</span>'
                        }
                    }

                    , {
                        field: 'parent',
                        title: '上级',
                        visible: cao.getColumnVisible('user', 'parent'),
                        formatter: function (val, item) {
                            if (!item.parent) {
                                return '-';
                            }

                            if (!item.parent.avatar) {
                                item.parent.avatar = "/favicon.ico";
                            }
                            return '<span class="badge badge-light-dark parent" style="cursor: pointer;" ><img src="' + item.parent.avatar + '"  style="width: 18px;border-radius: 100%;"/> ' + item.parent.username + '(' + item.parent.id + ')</span>'
                        },
                        events: {
                            'click .parent': function (event, value, row, index) {
                                $("input[name='equal-pid']").val(row.parent.id);
                                table.bootstrapTable('refresh', {
                                    silent: true,
                                    pageNumber: 1,
                                    query: {"equal-pid": row.parent.id}
                                });
                            }
                        }
                    }
                    , {
                        field: 'create_time',
                        visible: cao.getColumnVisible('user', 'create_time', false),
                        title: '注册时间',
                        formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.create_time + '</span>';
                        }
                    }
                    , {
                        field: 'login_time', visible: cao.getColumnVisible('user', 'login_time', false), title: '登录时间',
                        formatter: function (val, item) {
                            if (!item.login_time) {
                                return '-';
                            }
                            return '<span class="badge badge-light">' + item.login_time + '</span>';
                        }
                    }
                    , {
                        field: 'login_ip', visible: cao.getColumnVisible('user', 'login_ip', false), title: '登录IP',
                        formatter: function (val, item) {
                            if (!item.login_ip) {
                                return '-';
                            }
                            return '<span class="badge badge-light">' + item.login_ip + '</span>';
                        }
                    }
                    , {
                        field: 'last_login_time',
                        visible: cao.getColumnVisible('user', 'last_login_time', false),
                        title: '上次登录时间',
                        formatter: function (val, item) {
                            if (!item.last_login_time) {
                                return '-';
                            }
                            return '<span class="badge badge-light">' + item.last_login_time + '</span>';
                        }
                    }
                    , {
                        field: 'last_login_ip',
                        visible: cao.getColumnVisible('user', 'last_login_ip', false),
                        title: '上次登录IP',
                        formatter: function (val, item) {
                            if (!item.last_login_ip) {
                                return '-';
                            }
                            return '<span class="badge badge-light">' + item.last_login_ip + '</span>';
                        }
                    }
                    , {
                        field: 'alipay',
                        visible: cao.getColumnVisible('user', 'alipay', false),
                        title: '支付宝',
                        formatter: function (val, item) {
                            if (!item.alipay) {
                                return '-';
                            }
                            return '<span class="badge badge-light-primary">' + item.alipay + '</span>';
                        }
                    }
                    , {
                        field: 'wechat',
                        visible: cao.getColumnVisible('user', 'wechat', false),
                        title: '微信收款码',
                        formatter: function (val, item) {
                            if (!item.wechat) {
                                return '-';
                            }
                            return '<span class="badge badge-light-success wxqrcode" style="cursor: pointer;">查看</span>';
                        },
                        events: {
                            'click .wxqrcode': function (event, value, row, index) {
                                let size = 200;
                                layer.open({
                                    type: 1,
                                    title: false,
                                    closeBtn: 0, //不显示关闭按钮
                                    anim: 5,
                                    area: [size + 'px', size + 'px'],
                                    shadeClose: true, //开启遮罩关闭
                                    content: '<div class="wxqrcode-' + row.id + '"></div>',
                                    success: () => {
                                        $('.wxqrcode-' + row.id).qrcode({
                                            render: "canvas",
                                            width: 200,
                                            height: 200,
                                            text: row.wechat
                                        });
                                    }
                                });
                            }
                        }
                    }
                    , {
                        field: 'settlement',
                        title: '自动结算方式',
                        visible: cao.getColumnVisible('user', 'settlement', false),
                        formatter: function (val, item) {
                            return settlement[item.settlement];
                        }
                    }
                    , {
                        field: 'status',
                        title: '状态',
                        visible: cao.getColumnVisible('user', 'status'),
                        formatter: function (val, item) {
                            if (item.status == 1) {
                                return '<span class="badge badge-light-success">正常</span>';
                            }
                            return '<span class="badge badge-light-danger" >封禁</span>';
                        }
                    },
                    <!--start::HOOK-->
                    <?php echo hook(\App\Consts\Hook::ADMIN_VIEW_USER_TABLE);?>

                    <!--end::HOOK-->
                    {
                        field: 'operate',
                        visible: cao.getColumnVisible('user', 'operate'),
                        title: '操作',
                        formatter: function (val, item) {
                            let html = '<button type="button"  class="btn btn-icon btn-bg-light btn-active-color-success btn-sm me-1 recharge"><i class="fas fa-comment-dollar text-success"></i></button> <button type="button"  class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 edit"><i class="fas fa-user-edit text-primary"></i></button> ';
                            if (item.status == 0) {
                                html += '<button type="button"  class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 start"><i class="far fa-dot-circle" style="color: #17d917;"></i></button> ';
                            } else {
                                html += '<button type="button"  class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 stop"><i style="color: #ff6c6c;" class="fas fa-ban"></i></button> ';
                            }
                            html += '<button type="button"  class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 del"><i class="fas fa-trash"></i></button> ';
                            return html;
                        },
                        events: {
                            'click .recharge': function (event, value, row, index) {
                                recharge(row);
                            },
                            'click .edit': function (event, value, row, index) {
                                row.group_id = row.group.id;
                                modal(row);
                            },
                            'click .del': function (event, value, row, index) {
                                layer.confirm('您正在删除会员，该操作极度危险，是否还要继续？', {
                                    btn: ['确认删除', '取消']
                                }, function () {
                                    $.post('/admin/api/user/del', {list: [row.id]}, res => {
                                        layer.msg(res.msg);
                                        table.bootstrapTable('refresh', {silent: true});
                                    });
                                });
                            },
                            'click .start': function (event, value, row, index) {
                                $.post('/admin/api/user/save', {id: row.id, status: 1}, res => {
                                    layer.msg(res.msg);
                                    table.bootstrapTable('refresh', {silent: true});
                                });
                            },
                            'click .stop': function (event, value, row, index) {
                                $.post('/admin/api/user/save', {id: row.id, status: 0}, res => {
                                    layer.msg(res.msg);
                                    table.bootstrapTable('refresh', {silent: true});
                                });
                            }
                        }
                    }
                ]
            });

            let modal = (values = {}) => {
                delete values.password;

                if (typeof values.business_level == "object" && values.business_level != null) {
                    values.business_level = values.business_level.id;
                }
                cao.popup('/admin/api/user/save', [
                    {title: "头像", name: "avatar", type: "image", placeholder: "请选择图片", width: 100},
                    {title: "用户名", name: "username", type: "input", placeholder: "请输入用户名"},
                    {
                        title: "会员等级",
                        name: "group_id",
                        type: "select",
                        dict: "user_group,id,name",
                        placeholder: "请选择"
                    },
                    {title: "邮箱", name: "email", type: "input", placeholder: "请输入邮箱"},
                    {title: "手机", name: "phone", type: "input", placeholder: "请输入手机号"},
                    {title: "QQ", name: "qq", type: "input", placeholder: "请输入QQ号"},
                    {title: "登录密码", name: "password", type: "input", placeholder: "不修改请留空"},
                    {title: "上级ID", name: "pid", type: "input", placeholder: "请输入上级ID"},
                    {
                        title: "商户等级",
                        name: "business_level",
                        type: "select",
                        dict: "business_level,id,name",
                        placeholder: "暂未开通"
                    },
                    {title: "状态", name: "status", type: "switch", text: "正常"},
                ], res => {
                    table.bootstrapTable('refresh', {silent: true});
                }, values);
            }

            let recharge = (values = {}) => {
                cao.popup('/admin/api/user/recharge', [
                    {
                        title: "类型", name: "action", type: "radio", placeholder: "请选择", default: 1, dict: [
                            {id: 1, name: "<b style='color: green;'>充值</b>"},
                            {id: 0, name: "<b style='color: red;'>扣费</b>"},
                        ]
                    },
                    {title: "金额", name: "amount", type: "input", placeholder: "请输入金额"},
                    {title: "原因", name: "log", type: "input", placeholder: "请输入原因"},
                    {title: "元气累计", name: "total", type: "switch", text: "是", default: 1},

                ], res => {
                    table.bootstrapTable('refresh', {silent: true});
                }, values, "460px", false, "充值/扣费");
            }

            let coin = (values = {}) => {
                cao.popup('/admin/api/user/coin', [
                    {
                        title: "类型", name: "action", type: "radio", placeholder: "请选择", default: 1, dict: [
                            {id: 1, name: "<b style='color: green;'>充值</b>"},
                            {id: 0, name: "<b style='color: red;'>扣费</b>"},
                        ]
                    },
                    {title: "金额", name: "amount", type: "input", placeholder: "请输入硬币数量"},
                    {title: "原因", name: "log", type: "input", placeholder: "请输入原因"},
                    {title: "元气累计", name: "total", type: "switch", text: "是", default: 1},

                ], res => {
                    table.bootstrapTable('refresh', {silent: true});
                }, values, "460px", false, "硬币[充值/扣费]");
            }

            $('.btn-app-create').click(function () {
                modal();
            });

            $('.btn-app-del').click(() => {
                let data = cao.listObjectToArray(table.bootstrapTable('getSelections'));
                if (data.length == 0) {
                    layer.msg("请至少勾选1个用户进行操作！");
                    return;
                }

                layer.confirm('您确定要删除已经选中的用户吗？这是不可恢复的操作！', {
                    btn: ['确定', '取消']
                }, function () {
                    $.post("/admin/api/user/del", {list: data}, res => {
                        layer.msg(res.msg);
                        table.bootstrapTable('refresh', {silent: true});
                    });
                });
            });


            $('.handle').click(() => {
                let data = cao.listObjectToArray(table.bootstrapTable('getSelections'));
                if (data.length == 0) {
                    layer.msg("请至少勾选1个会员进行操作！");
                    return;
                }

                let join = data.join(",");

                cao.popup('/admin/api/user/fastUpdateUserGroup', [
                    {
                        title: "",
                        name: "list",
                        type: "hidden",
                        default: join
                    },
                    {
                        title: "会员等级",
                        name: "group_id",
                        type: "select",
                        dict: "user_group,id,name",
                        placeholder: "请选择"
                    },
                    {
                        title: "修改说明",
                        name: "explain",
                        type: "explain",
                        placeholder: "修改会员等级的原理就是自动修改他对应等级的元气值，这个功能可以达到批量修改的效果。"
                    }
                ], res => {
                    table.bootstrapTable('refresh', {silent: true});
                }, {}, ['420px', '420px'], false, "一键操作选中商品");
            });


            cao.query('.search-query', table, [
                {title: "用户名", name: "search-username", type: "input"},
                {title: "邮箱", name: "equal-email", type: "input"},
                {title: "手机号", name: "equal-phone", type: "input"},
                {title: "QQ号", name: "equal-qq", type: "input"},
                {title: "IP地址", name: "equal-login_ip", type: "input"},
                {
                    title: "状态", name: "equal-status", type: "select", dict: [
                        {id: 0, name: "封禁"},
                        {id: 1, name: "正常"}
                    ]
                },
                {title: "上级ID", name: "equal-pid", type: "input"}
            ], true, false);
        });
    });
<?php echo '</script'; ?>
>
<!--start::HOOK-->
<?php echo hook(\App\Consts\Hook::ADMIN_VIEW_USER_FOOTER);?>

<!--end::HOOK-->
<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
