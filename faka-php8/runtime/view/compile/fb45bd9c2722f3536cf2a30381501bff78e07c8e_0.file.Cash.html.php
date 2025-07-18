<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:50:24
  from '/www/wwwroot/webfaka/app/View/Admin/User/Cash.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e630925443_88610735',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fb45bd9c2722f3536cf2a30381501bff78e07c8e' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/User/Cash.html',
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
function content_67f3e630925443_88610735 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

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
            <!--begin::Tables Widget 9-->
            <div class="card mb-5 mb-xl-8">
                <!--begin::Header-->
                <div class="card-header border-0 pt-5">
                    <div class="card-toolbar">
                        <button class="btn btn-sm btn-light-primary settlement me-3"><i class="fa fa-money-bill"></i>
                            一键自动结算
                        </button>
                    </div>
                </div>
                <!--end::Header-->
                <div class="card-body py-3">
                    <form class="search-query"></form>
                    <table id="cash" lay-filter="cash"></table>
                </div>
            </div>

            <!--end::Tables Widget 9-->
        </div>
        <!--end::Container-->
    </div>
    <!--end::Post-->
</div>
<!--end::Content-->


<div style="display: none" class="more-modal">
    <div style="padding: 10px;" class="more-table">
        <table class="layui-table">
            <tbody>
            <tr>
                <td colspan="2" style="text-align: center;"><img src="[avatar]"
                                                                 style="height: 80px;width:80px;border-radius: 100%;box-shadow: 1px 1px 10px 1px #ed9b9bb3;">
                </td>
            </tr>
            <tr>
                <td>提现用户</td>
                <td>[username]</td>
            </tr>
            <tr>
                <td>提现金额</td>
                <td>[amount]</td>
            </tr>
            <tr>
                <td>收款方式</td>
                <td>[card]</td>
            </tr>
            <tr>
                <td>收款人</td>
                <td>[nicename]</td>
            </tr>
            <tr>
                <td>收款账号</td>
                <td>[account]</td>
            </tr>
            </tbody>
        </table>
    </div>

</div>

<?php echo '<script'; ?>
>

    $(function () {
        layui.use([ 'hex', 'form'], function () {
            let table = $('#cash');
            let cao = layui.hex;
            let status = ['<span class="badge badge-light-danger">等待处理</span>', '<span class="badge badge-light-success">成功</span>', '<span class="badge badge-light">失败:[msg]</span>'];
            let type = ['<span class="badge badge-light-success">自动结算</span>', '<span class="badge badge-light-primary">手动提交</span>'];
            let card = ['<span class="badge badge-light-primary">支付宝</span>', '<span class="badge badge-light-success">微信</span>', '<span class="badge badge-light-warning">钱包余额</span>'];

            let queryParams = null;
            table.bootstrapTable({
                url: '/admin/api/cash/data',//请求的url地址
                method: "post",//请求方式
                // striped:true,//是否显示行间隔色
                pageSize: 15,//每页显示的数量
                pageList: [15, 25, 50, 100],
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
                   {
                        field: 'user', title: '会员',   formatter: function (val, item) {
                            if (!item.user) {
                                return '-';
                            }
                            return '<span class="badge badge-light-dark user" style="cursor: pointer;" ><img src="' + item.user.avatar + '"  style="width: 18px;border-radius: 100%;"/> ' + item.user.username + '(' + item.user.id + ')</span>'
                        },
                       events: {
                           'click .user': function (event, value, row, index) {
                               $("input[name='equal-user_id']").val(row.user.id);
                               table.bootstrapTable('refresh', {
                                   silent: true,
                                   pageNumber: 1,
                                   query: {"equal-user_id": row.user.id}
                               });
                           }
                       }
                    }
                    , {
                        field: 'amount', title: '提现金额',   formatter: function (val, item) {
                            return '<span class="badge badge-light-success">' + item.amount + '</span>';
                        }
                    }
                    , {
                        field: 'type', title: '提现类型',   formatter: function (val, item) {
                            return type[item.type];
                        }
                    }
                    , {
                        field: 'card', title: '收款方式',  formatter: function (val, item) {
                            return card[item.card];
                        }
                    }
                    , {
                        field: 'cost', title: '手续费',   formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.cost + '</span>';
                        }
                    }
                    , {
                        field: 'status', title: '状态',  formatter: function (val, item) {
                            return status[item.status].replace("[msg]", item.message);
                        }
                    }
                    , {
                        field: 'create_time', title: '提现时间',  formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.create_time + '</span>';
                        }
                    }
                    , {
                        field: 'arrive_time', title: '处理时间',  formatter: function (val, item) {
                            if (!item.arrive_time) {
                                return '-';
                            }
                            return '<span class="badge badge-light">' + item.arrive_time + '</span>';
                        }
                    },
                    {
                        field: 'operate',
                        title: '操作',
                        formatter: function (val, item) {
                            if (item.status != 0) {
                                return '-';
                            }
                            let html = '<button type="button"  class="btn btn-icon btn-light-success btn-sm me-1 success"><i class="fas fa-check"></i></button> ';
                            html += '<button type="button"  class="btn btn-icon btn-light-danger btn-sm me-1 error"><i class="fas fa-times"></i></button> ';
                            return html;
                        },
                        events: {
                            'click .success': function (event, value, map, index) { 
                                layer.open({
                                    type: 1,
                                    title: '<i class="layui-icon">&#xe600;</i> CASH',
                                    content: $('.more-modal').html()
                                        .replace("[amount]", '<b style="color: green;">¥ ' + map.amount + '</b>')
                                        .replace("[card]", map.card == 0 ? "支付宝" : "微信")
                                        .replace("[create_time]", map.create_time)
                                        .replace("[avatar]", map.user.avatar ? map.user.avatar : '/favicon.ico')
                                        .replace("[username]", map.user.username)
                                        .replace("[nicename]", map.user.nicename)
                                        .replace("[account]", map.card == 0 ? map.user.alipay : "<div class='wx_qrcode'></div>")
                                    ,
                                    area: cao.isPc() ? "420px" : ["100%", "100%"],
                                    btn: ['已打款', '取消'],
                                    success: () => {
                                        if (map.card == 1 && map.user.wechat) {
                                            $('.wx_qrcode').qrcode({
                                                render: "canvas",
                                                width: 100,
                                                height: 100,
                                                text: map.user.wechat
                                            });
                                        }
                                    },
                                    yes: () => {
                                        let loaderIndex = layer.load(2, {shade: ['0.3', '#fff']});
                                        $.post("/admin/api/cash/decide", {
                                            id: map.id,
                                            status: 0
                                        }, res => {
                                            table.bootstrapTable('refresh', {silent: true});
                                            layer.closeAll();
                                        });
                                    }
                                });
                            },
                            'click .error': function (event, value, map, index) {
                                layer.prompt({
                                    title: '拒绝理由呢？总得需要个理由吧？',
                                    formType: 0
                                }, function (message, index) {
                                    let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                                    $.post("/admin/api/cash/decide", {
                                        id: map.id,
                                        status: 1,
                                        message: message
                                    }, res => {
                                        table.bootstrapTable('refresh', {silent: true});
                                        layer.closeAll();
                                    });
                                });
                            }
                        }
                    }
                ]
            });
            
            cao.query('.search-query', table, [
                {title: "会员ID", name: "equal-user_id", type: "input"},
                {
                    title: "类型", name: "equal-type", type: "select", dict: [
                        {id: 0, name: "自动结算"},
                        {id: 1, name: "手动提现"},
                    ]
                }, {
                    title: "收款方式", name: "equal-card", type: "select", dict: [
                        {id: 0, name: "支付宝"},
                        {id: 1, name: "微信"},
                    ]
                }, {
                    title: "状态", name: "equal-status", type: "select", dict: [
                        {id: 0, name: "等待处理"},
                        {id: 1, name: "成功"},
                        {id: 2, name: "失败"},
                    ]
                },
                {title: "开始时间", name: "betweenStart-create_time", type: "date"},
                {title: "结束时间", name: "betweenEnd-create_time", type: "date"},
            ], true, false);

            $('.settlement').click(() => {
                layer.prompt({
                    title: '请输入最低结算账户余额',
                    formType: 0
                }, function (amount, index) {
                    let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                    $.post("/admin/api/cash/settlement", {
                        amount: amount
                    }, res => {
                        table.bootstrapTable('refresh', {silent: true});
                        layer.close(loaderIndex);
                        layer.close(index);
                        layer.msg("结算完成");
                    });
                });
            });
        });

    });
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
