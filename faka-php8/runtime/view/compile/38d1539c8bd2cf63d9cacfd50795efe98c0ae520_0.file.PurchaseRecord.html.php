<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:49:16
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/User/PurchaseRecord.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5ecb01194_15662300',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '38d1539c8bd2cf63d9cacfd50795efe98c0ae520' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/User/PurchaseRecord.html',
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
function content_67f3e5ecb01194_15662300 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Common/Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<style>
    .card-view-title {
        color: #a26880;
        font-weight: bolder !important;
    }

    .card-views {
        border: 1px dashed #e5e5e5;
        padding: 20px 20px;
        border-radius: 20px;
        box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
    }

    .card-views .card-view {
        padding-top: 2px;
        padding-bottom: 2px;
    }

    .card-views .card-view .secret {
        border: none;
        width: 100%;
        height: 100px;
        padding: 10px;
        border-radius: 5px;
        box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        background: #ffccd52e;
        color: green;
    }

    .card-views .card-view .secret-download {
        color: #0d8ddc;
        border-bottom: 1px dashed #e5e5e5;
        border-left: 1px dashed #e5e5e5;
        border-right: 1px dashed #e5e5e5;
        padding: 5px;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        font-size: 13px;
    }


</style>

<div class="layui-container fly-marginTop fly-user-main">
    <?php $_smarty_tpl->_subTemplateRender("file:../Common/Nav.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <div class="content-header">
                <i class="layui-icon">&#xe638;</i> 宝贝记录
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

            let status = ['<span class="acg-badge acg-badge-light-red">未支付</span>', '<span class="acg-badge acg-badge-light-success">已支付</span>'];
            let delivery_status = ['<span class="acg-badge acg-badge-light-red">未发货</span>', '<span class="acg-badge acg-badge-light-success">已发货</span>'];
            let delivery_way = ['<span class="acg-badge acg-badge-light-primary">虚拟卡密</span>', '<span class="acg-badge acg-badge-light-dark">在线发货</span>'];

            let queryParams = null;
            table.bootstrapTable({
                url: '/user/api/purchaseRecord/data',//请求的url地址
                method: "post",//请求方式
                pageSize: 5,//每页显示的数量
                showRefresh: false,//是否显示刷新按钮
                cache: false,//是否使用缓存
                showToggle: false,//是否显示详细视图和列表视图的切换按钮
                cardView: true,
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
                        field: 'trade_no', title: '订单号', formatter: function (val, item) {
                            return '<span class="acg-badge acg-badge-light">' + item.trade_no + '</span>';
                        }
                    }
                    , {
                        field: 'commodity', title: '商品', formatter: function (val, item) {
                            if (!item.commodity) {
                                return "-";
                            }

                            let race = "";

                            if (item.race) {
                                race = " ( <b style='color: #20b033;'>" + item.race + "</b> )";
                            }

                            return '<span class="acg-badge acg-badge-light">' + item.commodity.name + race + '</span>';
                        }
                    }
                    , {
                        field: 'card_num', title: '数量', formatter: function (val, item) {
                            return '<span class="acg-badge acg-badge-light-primary">' + item.card_num + '</span>';
                        }
                    }
                    , {
                        field: 'amount', title: '金额', formatter: function (val, item) {
                            return '<span class="acg-badge acg-badge-light-success">￥' + item.amount + '</span>';
                        }
                    }
                    , {
                        field: 'delivery_way', title: '类型', formatter: function (val, item) {
                            if (!item.commodity) {
                                return "-";
                            }
                            return delivery_way[item.commodity.delivery_way];
                        }
                    }
                    , {
                        field: 'pay_id', title: '支付方式', formatter: function (val, item) {
                            if (!item.pay) {
                                return "-";
                            }
                            return '<span class="acg-badge acg-badge-light-primary"><img src="' + item.pay.icon + '"  style="width: 18px;border-radius: 100%;"/> ' + item.pay.name + '</span>';
                        }
                    }
                    , {
                        field: 'create_time', title: '下单时间', width: 150, formatter: function (val, item) {
                            return '<span class="acg-badge acg-badge-light">' + item.create_time + '</span>';
                        }
                    }
                    , {
                        field: 'status', title: '支付状态', formatter: function (val, item) {
                            return status[item.status];
                        }
                    }
                    , {
                        field: 'pay_time', title: '支付时间', width: 150, formatter: function (val, item) {
                            if (!item.pay_time) {
                                return '-';
                            }
                            return '<span class="acg-badge acg-badge-light">' + item.pay_time + '</span>';
                        }
                    }
                    , {
                        field: 'delivery_status', title: '发货状态', formatter: function (val, item) {
                            return delivery_status[item.delivery_status];
                        }
                    }
                    , {
                        field: 'leave_message', title: '商家留言', formatter: function (val, item) {
                            if (!item.commodity) {
                                return "-";
                            }

                            if (item.status != 1 || !item.commodity.leave_message) {
                                return "-";
                            }
                            return '<span style="padding: 5px;">' + item.commodity.leave_message + '</span>';
                        }
                    }
                    , {
                        field: 'secret', title: '宝贝信息', formatter: function (val, item) {
                            if (!item.secret) {
                                return "-";
                            }

                            if (item.status != 1) {
                                return '-';
                            }

                            return '<textarea class="secret">' + item.secret + '</textarea><div><a href="/user/personal/secretDownload?id=' + item.id + '" target="_blank" class="secret-download"><i class="layui-icon">&#xe601;</i> 下载宝贝到本地(TXT)</a></div>';
                        }
                    }

                ]
            });

            cao.query('.search-query', table, [
                {
                    title: "订单号", name: "equal-trade_no", type: "input"
                },
                {
                    title: "支付状态", name: "equal-status", type: "select", dict: [
                        {id: 0, name: "未支付"},
                        {id: 1, name: "已支付"},
                    ], width: 140
                },
                {title: "购买时间从", name: "betweenStart-create_time", type: "date"},
                {title: "到购买时间", name: "betweenEnd-create_time", type: "date"},
            ], true, false);

            <?php if ($_smarty_tpl->tpl_vars['tradeNo']->value != '') {?>
            $('input[name=equal-trade_no]').val("<?php echo $_smarty_tpl->tpl_vars['tradeNo']->value;?>
");
            $('.queryBtn').click();
            <?php }?>
        });
    });
<?php echo '</script'; ?>
>
<?php $_smarty_tpl->_subTemplateRender("file:../Common/Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
