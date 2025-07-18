<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:35:01
  from '/www/wwwroot/webfaka/app/View/Admin/Shared/Store.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e295298341_26442333',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c6ef0498384bb83ba28dbf25485ec178cc77aece' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Shared/Store.html',
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
function content_67f3e295298341_26442333 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<style>
    .layui-layer-page .layui-layer-content {
        position: relative !important;
        overflow: auto !important;
    }
</style>
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
                        <button class="btn btn-sm btn-light-primary btn-app-create me-3"><i class="fas fa-plus"></i>
                            新增店铺
                        </button>
                        <button class="btn btn-sm btn-light-danger btn-app-del me-3"><i class="fas fa-trash"></i>
                            移除选中的店铺
                        </button>
                    </div>
                </div>
                <!--end::Header-->

                <div class="card-body py-3">
                    <form class="search-query"></form>
                    <table id="store" lay-filter="store"></table>
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
        layui.use(['hex'], function () {
            let table = $('#store');
            var cao = layui.hex;

            let queryParams = null;
            table.bootstrapTable({
                url: '/admin/api/store/data',//请求的url地址
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
                    res.data.forEach(item => {
                        $.post("/admin/api/store/connect", {id: item.id}, run => {
                            let ins = $(".connect-" + item.id);
                            if (run.code == 200) {
                                //success
                                ins.html('<span class="badge badge-light-success">正常</span>');
                                $(".items-" + item.id).show();
                            } else {
                                ins.html('<span class="badge badge-light-danger">' + run.msg + '</span>');
                            }
                        });
                    });

                    return {
                        "total": res.count,
                        "rows": res.data
                    }
                },
                columns: [
                    {checkbox: true}
                    , {
                        field: 'logo', title: 'LOGO', formatter: function (val, item) {
                            return '<span class="badge badge-light-dark"><img src="' + item.domain + '/favicon.ico"  style="width: 30px;border-radius: 100%;"/></span>'
                        }
                    }, {
                        field: 'name', title: '店铺名称', formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.name + '</span>'
                        }
                    }, {
                        field: 'domain', title: '店铺地址', formatter: function (val, item) {
                            return '<a class="badge badge-light" href="' + item.domain + '" target="_blank">' + item.domain + '</a>'
                        }
                    }, {
                        field: 'balance', title: '余额(缓存)', formatter: function (val, item) {
                            return '<span class="badge badge-light-primary">' + item.balance + '</>'
                        }
                    }, {
                        field: 'status', title: '状态', formatter: function (val, item) {
                            return '<span class="connect-' + item.id + '"><span class="badge badge-light-primary">连接中..</span></span>'
                        }
                    }, {
                        field: 'type', title: '协议', formatter: function (val, item) {
                            if (val == 1) {
                                return '萌次元(V4.0)';
                            }
                            return '异次元(V3.0)';
                        }
                    },
                    {
                        field: 'operate',
                        title: '操作',
                        formatter: function (val, item) {
                            let html = '';
                            html += '<button style="display: none;" type="button" data-id="' + item.id + '" class="btn btn-icon btn-bg-light btn-active-color-success btn-sm me-1 items items-' + item.id + '"><i class="fas fa-plug"></i></button> ';
                            html += '<button type="button" data-id="' + item.id + '" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 edit"><i class="fa fa-edit"></i></button> ';
                            html += '<button type="button" data-id="' + item.id + '" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 del"><i class="fas fa-trash"></i></button> ';
                            return html;
                        },
                        events: {
                            'click .edit': function (event, value, row, index) {
                                modal(row);
                            },
                            'click .del': function (event, value, row, index) {
                                layer.confirm('您正在移除该店铺，是否要继续？', {
                                    btn: ['确认移除', '取消']
                                }, function () {
                                    $.post('/admin/api/store/del', {list: [row.id]}, res => {
                                        layer.msg(res.msg);
                                        table.bootstrapTable('refresh', {silent: true});
                                    });
                                });
                            },
                            'click .items': function (event, value, mapItem, index) {
                                let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                                $.post('/admin/api/store/items', {id: mapItem.id}, res => {
                                    layer.close(loaderIndex);
                                    let items = {};

                                    res.data.forEach(value => {
                                        value.children.forEach(item => {
                                            items[item.id] = item;
                                        });
                                    });

                                    cao.popup(result => {
                                        if (result.category_id == "") {
                                            layer.msg("请选择要导入本地的分类");
                                            return;
                                        }
                                        if (result.auth.length == 0) {
                                            layer.msg("请选择至少1个该店铺的商品");
                                            return;
                                        }
                                        result.items = [];

                                        result.auth.forEach(itemId => {
                                            if (parseInt(itemId) == 0) {
                                                return;
                                            }
                                            let item = items[itemId];
                                            result.items.push(item);
                                        });

                                        delete result.auth;

                                        result.store_id = mapItem.id;

                                        let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                                        $.post('/admin/api/store/addItem?storeId=' + mapItem.id, result, run => {
                                            layer.close(loaderIndex);
                                            layer.closeAll();
                                            layer.msg(run.msg);
                                        });
                                    }, [
                                        {
                                            title: "本地分类",
                                            name: "category_id",
                                            type: "select",
                                            dict: "category,id,name",
                                            placeholder: "请选择分类"
                                        },
                                        {
                                            title: "价格主从同步",
                                            name: "shared_sync",
                                            type: "switch",
                                            text: "启用",
                                            tips: "开启后，会实时同步价格"
                                        },
                                        {
                                            title: "商品数量同步",
                                            name: "inventory_sync",
                                            type: "switch",
                                            text: "启用",
                                            tips: "开启后，会进行缓存价格300秒"
                                        },
                                        {
                                            title: "立即上架",
                                            name: "shelves",
                                            type: "switch",
                                            text: "立即上架",
                                            tips: "开启后，入库完毕后会立即上架"
                                        },
                                        {
                                            title: "加价模式",
                                            name: "premium_type",
                                            type: "radio",
                                            dict: [
                                                {id: 0, name: "普通金额加价"},
                                                {id: 1, name: "百分比加价"}
                                            ],
                                            default: 0
                                        },
                                        {
                                            title: "加价数额",
                                            name: "premium",
                                            type: "input",
                                            placeholder: "加价金额/百分比(小数代替)"
                                        },
                                        {title: "远程商品", name: "auth", type: "treeCheckbox", dict: res.data}
                                    ], res => {
                                        tableInstance.instance.reload();
                                    }, [], ['660px', '768px'], false, mapItem.name + "-拉取商品到本地分类");
                                });
                            }
                        }
                    }
                ]
            });

            let modal = (values = {}) => {
                cao.popup('/admin/api/store/save', [
                    {
                        title: "协议", name: "type", type: "select", placeholder: "请选择协议", dict: [
                            {id: 0, name: "异次元(3.0)"},
                            {id: 1, name: "萌次元(4.0)"}
                        ], default: 0
                    },
                    {
                        title: "店铺地址",
                        name: "domain",
                        type: "input",
                        placeholder: "需要带http://或者https://(推荐,如果支持)"
                    },
                    {title: "商户ID", name: "app_id", type: "input", placeholder: "请输入商户ID"},
                    {title: "商户密钥", name: "app_key", type: "input", placeholder: "请输入商户密钥"},
                ], res => {
                    table.bootstrapTable('refresh', {silent: true});
                }, values);
            }

            $('.btn-app-create').click(function () {
                modal();
            });

            $('.btn-app-del').click(() => {
                let data = cao.listObjectToArray(table.bootstrapTable('getSelections'));
                if (data.length == 0) {
                    layer.msg("请至少勾选1个店铺进行操作！");
                    return;
                }

                layer.confirm('您确定要删除已经选中的店铺吗？这是不可恢复的操作！', {
                    btn: ['确定', '取消']
                }, function () {
                    $.post("/admin/api/store/del", {list: data}, res => {
                        layer.msg(res.msg);
                        table.bootstrapTable('refresh', {silent: true});
                    });
                });
            });

            cao.query('.search-query', table, [
                {title: "店铺名称", name: "search-name", type: "input"},
                {title: "店铺地址", name: "equal-domain", type: "input"}
            ], true, false);
        });
    });
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
