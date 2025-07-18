<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:36:15
  from '/www/wwwroot/webfaka/app/View/Admin/User/Bill.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e2df442709_37174050',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'dc96b911008ff7b48178db05e8825f23423d6dae' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/User/Bill.html',
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
function content_67f3e2df442709_37174050 (Smarty_Internal_Template $_smarty_tpl) {
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

                <div class="card-body py-3 mt-4">
                    <form class="search-query"></form>
                    <table id="bill" lay-filter="bill"></table>
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
            let table = $("#bill");
            let cao = layui.hex;
            let status = ['<span class="badge badge-light-danger">支出</span>', '<span class="badge badge-light-success">收入</span>'];
            let currency = ['<span class="badge badge-light-primary">余额</span>', '<span class="badge badge-light-success">硬币</span>'];
            let queryParams = null;
            table.bootstrapTable({
                url: '/admin/api/bill/data',//请求的url地址
                method: "post",//请求方式
                // striped:true,//是否显示行间隔色
                pageSize: 19,//每页显示的数量
                pageList: [19, 25, 50, 100],
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
                        field: 'owner', title: "会员", formatter: function (val, item) {
                            if (!item.owner) {
                                return '-';
                            }
                            return '<span class="badge badge-light-dark owner" style="cursor: pointer;" ><img src="' + item.owner.avatar + '"  style="width: 18px;bbill-radius: 100%;"/> ' + item.owner.username + '(' + item.owner.id + ')</span>'
                        },
                        events: {
                            'click .owner': function (event, value, row, index) {
                                let id = row.owner ? row.owner.id : 0;
                                $("input[name='equal-owner']").val(id);
                                table.bootstrapTable('refresh', {
                                    silent: true,
                                    pageNumber: 1,
                                    query: {"equal-owner": id}
                                });
                            }
                        }
                    }
                    , {
                        field: 'amount', title: '数量', formatter: function (val, item) {
                            if (item.type == 0) {
                                return '<span class="badge badge-light-danger">‐ ' + item.amount + '</span>';
                            }
                            return '<span class="badge badge-light-success">+' + item.amount + '</span>';
                        }
                    }
                    , {
                        field: 'balance', title: '余额', formatter: function (val, item) {
                            return '<span class="badge badge-light-primary"><i class="fas fa-yen-sign text-primary fs-10"></i> ' + item.balance + '</span>';
                        }
                    }
                    , {
                        field: 'type', title: '支出/收入', formatter: function (val, item) {
                            return status[item.type];
                        }
                    }
                    , {
                        field: 'currency', title: '货币', formatter: function (val, item) {
                            return currency[item.currency];
                        }
                    }
                    , {
                        field: 'log', title: '交易内容', formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.log + '</span>';
                        }
                    }
                    , {
                        field: 'create_time', title: '交易时间', formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.create_time + '</span>';
                        }
                    }
                ]
            });

            cao.query('.search-query', table, [
                {title: "会员ID", name: "equal-owner", type: "input"},
                {
                    title: "支出/收入", name: "equal-type", type: "select", dict: [
                        {id: 0, name: "支出"},
                        {id: 1, name: "收入"},
                    ]
                }, {
                    title: "钱包类型", name: "equal-currency", type: "select", dict: [
                        {id: 0, name: "余额"},
                        {id: 1, name: "硬币"},
                    ]
                },
                {title: "交易详情", name: "search-log", type: "input"},
                {title: "开始时间", name: "betweenStart-create_time", type: "date"},
                {title: "结束时间", name: "betweenEnd-create_time", type: "date"},
            ], true, false);
        });
    });
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
