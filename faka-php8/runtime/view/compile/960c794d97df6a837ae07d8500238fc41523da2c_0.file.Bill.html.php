<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:49:13
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/User/Bill.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5e9a39e96_38716740',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '960c794d97df6a837ae07d8500238fc41523da2c' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/User/Bill.html',
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
function content_67f3e5e9a39e96_38716740 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Common/Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<div class="layui-container fly-marginTop fly-user-main">
    <?php $_smarty_tpl->_subTemplateRender("file:../Common/Nav.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <div class="content-header">
                <i class="layui-icon">&#xe638;</i> 我的账单
            </div>

            <div class="content-body">
                <form class="search-query"></form>
                <table id="bill" lay-filter="bill"></table>
            </div>
        </div>
    </div>
</div>

<?php echo '<script'; ?>
>
    $(function () {
        layui.use(['hex', 'form'], function () {
            let table = $("#bill");
            let cao = layui.hex;
            let status = ['<span class="acg-badge-light-red acg-badge">支出</span>', '<span class="acg-badge acg-badge-light-success">收入</span>'];
            let currency = ['<span style="color: #0C84D1;">余额</span>', '<span style="color: #13b413;">硬币</span>'];
            let queryParams = null;
            table.bootstrapTable({
                url:'/user/api/bill/data',//请求的url地址
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
                    {
                        field: 'amount', title: '数量', formatter: function (val, item) {
                            if (item.type == 0) {
                                return '<span class="acg-badge acg-badge-light-red">‐' + item.amount + '</span>';
                            }
                            return '<span class="acg-badge acg-badge-light-success">+' + item.amount + '</span>';
                        }
                    }

                    , {
                        field: 'balance', title: '余额', formatter: function (val, item) {
                            return '<span style="color: #0C84D1;">' + item.balance + '</span>';
                        }
                    }
                    , {
                        field: 'currency', title: '货币', formatter: function (val, item) {
                            return currency[item.currency];
                        }
                    }
                    , {
                        field: 'type', title: '支出/收入', formatter: function (val, item) {
                            return status[item.type];
                        }
                    }
                    , {
                        field: 'log', title: '交易内容', formatter: function (val, item) {
                            return '<span class="acg-badge acg-badge-light">' + item.log + '</span>';
                        }
                    }
                    , {
                        field: 'create_time', title: '交易时间', formatter: function (val, item) {
                            return '<span class="acg-badge acg-badge-light">' + item.create_time + '</span>';
                        }, width: 160
                    }
                ]
            });

            cao.query('.search-query', table, [
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
                {title: "开始时间", name: "betweenStart-create_time", type: "date"},
                {title: "结束时间", name: "betweenEnd-create_time", type: "date"},
            ], true, false);
        });
    });
<?php echo '</script'; ?>
>
<?php $_smarty_tpl->_subTemplateRender("file:../Common/Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
