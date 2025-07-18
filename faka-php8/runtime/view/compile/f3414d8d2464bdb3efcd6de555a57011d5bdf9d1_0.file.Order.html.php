<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:36:16
  from '/www/wwwroot/webfaka/app/View/Admin/User/Order.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e2e0ee2525_99892292',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f3414d8d2464bdb3efcd6de555a57011d5bdf9d1' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/User/Order.html',
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
function content_67f3e2e0ee2525_99892292 (Smarty_Internal_Template $_smarty_tpl) {
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
            <!--begin::Row-->
            <div class="row g-5 g-xl-10">
                <div class="col-xl-3">
                    <!--begin::Statistics Widget 1-->
                    <div class="card bgi-no-repeat card-xl-stretch mb-xl-8"
                         style="background-position: right top; background-size: 30% auto; background-image: url(/assets/admin/images/svg/shapes/abstract-4.svg)">
                        <!--begin::Body-->
                        <div class="card-body">
                            <span class="card-title fw-bolder text-muted text-hover-primary fs-4">订单数量</span>
                            <div class="fw-bolder fs-1 text-primary my-6 order_count">...</div>
                        </div>
                        <!--end::Body-->
                    </div>
                    <!--end::Statistics Widget 1-->
                </div>
                <div class="col-xl-3">
                    <!--begin::Statistics Widget 1-->
                    <div class="card bgi-no-repeat card-xl-stretch mb-xl-8"
                         style="background-position: right top; background-size: 30% auto; background-image: url(/assets/admin/images/svg/shapes/abstract-4.svg)">
                        <!--begin::Body-->
                        <div class="card-body">
                            <span class="card-title fw-bolder text-muted text-hover-primary fs-4">订单金额</span>
                            <div class="fw-bolder fs-1 text-success my-6 order_amount">...</div>
                        </div>
                        <!--end::Body-->
                    </div>
                    <!--end::Statistics Widget 1-->
                </div>
            </div>
            <!--end::Row-->

            <!--begin::Tables Widget 9-->
            <div class="card mb-5 mb-xl-8">
                <!--begin::Header-->
                <div class="card-header border-0 pt-5">
                    <div class="card-toolbar">
                        <button class="btn btn-sm btn-light-primary clear me-3"><i class="fab fa-edge"></i>
                            一键清理无用订单
                        </button>
                        <span class="badge badge-light-primary fs-8">Tips：上方订单数据显示会根据下方的查询条件进行筛选显示。</span>
                    </div>
                </div>
                <!--end::Header-->

                <div class="card-body py-3">
                    <form class="search-query"></form>
                    <table id="order" lay-filter="order"></table>
                </div>
            </div>

            <!--end::Tables Widget 9-->
        </div>
        <!--end::Container-->
    </div>
    <!--end::Post-->
</div>
<!--end::Content-->

<?php echo '<script'; ?>
>

    $(function () {
        layui.use(['hex', 'form'], function () {
            let table = $("#order");
            let cao = layui.hex;
            let status = ['<span class="badge badge-light-danger">未支付</span>', '<span class="badge badge-light-success">已支付</span>'];
            let queryParams = null;
            table.bootstrapTable({
                url: '/admin/api/rechargeOrder/data',//请求的url地址
                method: "post",//请求方式
                // striped:true,//是否显示行间隔色
                pageSize: 13,//每页显示的数量
                pageList: [13, 25, 50, 100],
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
                    $('.order_count').html(res.order_count);
                    $('.order_amount').html(res.order_amount);
                    $('.order_cost').html(res.order_cost);

                    return {
                        "total": res.count,
                        "rows": res.data
                    }
                },
                columns: [
                    {checkbox: true}
                    , {
                        field: 'trade_no', title: '订单号', formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.trade_no + '</span>';
                        }
                    }
                    , {
                        field: 'user', title: '会员', formatter: function (val, item) {
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
                        field: 'amount', title: '充值金额', formatter: function (val, item) {
                            return '<span class="badge badge-light-success"><i class="fas fa-yen-sign text-success fs-10"></i> ' + item.amount + '</span>';
                        }
                    }
                    , {
                        field: 'pay_id', title: '支付方式', formatter: function (val, item) {
                            if (!item.pay) {
                                return "-";
                            }
                            return '<span class="badge badge-light-primary"><img src="' + item.pay.icon + '"  style="width: 18px;border-radius: 100%;"/> ' + item.pay.name + '</span>';
                        }
                    }
                    , {
                        field: 'create_time', title: '下单时间', width: 150, formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.create_time + '</span>';
                        }
                    }
                    , {
                        field: 'create_ip', title: '客户IP', width: 115, formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.create_ip + '</span>';
                        }
                    }
                    , {
                        field: 'status', title: '支付状态', formatter: function (val, item) {
                            return status[item.status];
                        }
                    }
                    , {
                        field: 'create_time', title: '支付时间', width: 150, formatter: function (val, item) {
                            if (!item.pay_time) {
                                return "-";
                            }
                            return '<span class="badge badge-light">' + item.pay_time + '</span>';
                        }
                    }
                    , {
                        field: 'budan', title: '补单', width: 150, formatter: function (val, item) {
                            if (item.status == 1) {
                                return "-";
                            }
                            return '<span class="badge badge-light-primary success-bd" style="cursor: pointer;"><i class="fas fa-check-circle text-primary"></i> 补单</span>';
                        },
                        events: {
                            'click .success-bd': function (event, value, row, index) {
                                layer.confirm('您正在进行补单操作，是否继续？', {
                                    btn: ['确认补单', '取消']
                                }, function () {
                                    let loaderIndex = layer.load(2, {shade: ['0.3', '#fff']});
                                    $.post("/admin/api/rechargeOrder/success", {id: row.id}, res => {
                                        layer.close(loaderIndex);
                                        layer.msg(res.msg);
                                        table.bootstrapTable('refresh', {silent: true});
                                    });
                                });
                            }
                        }
                    }
                ]
            });

            cao.query('.search-query', table, [
                {title: "订单号", name: "equal-trade_no", type: "input"},
                {
                    title: "支付状态", name: "equal-status", type: "select", dict: [
                        {id: 0, name: "未支付"},
                        {id: 1, name: "已支付"},
                    ]
                },
                {
                    title: "支付方式", name: "equal-pay_id", type: "select", dict: "pay->id!=1,id,name"
                },
                {title: "IP地址", name: "equal-create_ip", type: "input"},
                {title: "会员ID", name: "equal-user_id", type: "input"},
                {title: "开始时间", name: "betweenStart-create_time", type: "date"},
                {title: "结束时间", name: "betweenEnd-create_time", type: "date"}
            ], true, false);

            $('.clear').click(() => {
                let loaderIndex = layer.load(2, {shade: ['0.3', '#fff']});
                $.post("/admin/api/rechargeOrder/clear", res => {
                    layer.close(loaderIndex);
                    layer.msg(res.msg);
                    table.bootstrapTable('refresh', {silent: false});
                });
            });

            <?php if ($_smarty_tpl->tpl_vars['userId']->value) {?>
            $("input[name='equal-user_id']").val(<?php echo $_smarty_tpl->tpl_vars['userId']->value;?>
);
            $('.queryBtn').click();
            <?php }?>
        });
    });
<?php echo '</script'; ?>
>
<!--start::HOOK-->
<?php echo hook(\App\Consts\Hook::ADMIN_VIEW_ORDER_FOOTER);?>

<!--end::HOOK-->
<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
