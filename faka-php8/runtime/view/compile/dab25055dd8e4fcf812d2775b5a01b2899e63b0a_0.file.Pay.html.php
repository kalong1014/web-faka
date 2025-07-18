<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:35:45
  from '/www/wwwroot/webfaka/app/View/Admin/Config/Pay.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e2c142aa85_71184689',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'dab25055dd8e4fcf812d2775b5a01b2899e63b0a' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Config/Pay.html',
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
function content_67f3e2c142aa85_71184689 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<style>
    .layui-popup .layui-layer-content {
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
                            添加支付
                        </button>
                        <button class="btn btn-sm btn-light-danger btn-app-del me-3"><i class="fas fa-trash"></i> 移除选中支付
                        </button>
                    </div>
                </div>
                <!--end::Header-->

                <div class="card-body py-3">
                    <form class="search-query"></form>
                    <table id="pay" lay-filter="pay"></table>
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
            let table = $("#pay");
            let form = layui.form;
            var cao = layui.hex;

            let plugins = [];
            let pluginMaps = [];

            let layIndex = layer.load(1, {
                shade: [0.3, '#fff']
            });
            $.ajaxSettings.async = false;
            //加载支付
            $.post('/admin/api/pay/getPlugins', res => {
                layer.close(layIndex);
                res.data.forEach(item => {
                    plugins[item.id] = item;
                });
                pluginMaps = res.data;
            });
            $.ajaxSettings.async = true;

            let getType = function (handle, code) {
                if (handle == null) {
                    return '-';
                }

                if (!plugins[handle]) {
                    return '-';
                }

                return plugins[handle].info.options[code];
            }

            let getPluginName = function (handle) {
                if (handle == null) {
                    return '-';
                }

                if (!plugins[handle]) {
                    return '-';
                }

                return plugins[handle].info.name;
            }

            let equipment = [
                '<span class="badge badge-light-success"><i class="fas fa-globe-europe text-success"></i> 通用</span>',
                '<span class="badge badge-light-info"><i class="fas fa-tablet-alt text-info"></i> 移动端</span>',
                '<span class="badge badge-light-primary"><i class="fab fa-windows text-primary"></i> PC端</span>',
                '<span class="badge badge-light-primary"><i class="fab fa-weixin text-primary"></i> 微信</span>',
            ];

            let queryParams = null;
            table.bootstrapTable({
                url: '/admin/api/pay/data',//请求的url地址
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
                        console.log(queryParams)
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
                    {checkbox: true},
                    {
                        field: 'icon', title: '图标', formatter: function (val, item) {
                            if (!item.icon) {
                                return "-";
                            }
                            return '<img src="' + item.icon + '"  style="height: 32px;"/>'
                        }
                    }
                    , {
                        field: 'name', title: '支付名称', formatter: function (val, item) {
                            return '<span class="badge badge-light-primary">' + item.name + '</span>';
                        }
                    }
                    , {
                        field: 'commodity', title: '商品下单', formatter: function (val, item) {
                            if (item.commodity == 1) {
                                return '<span class="badge badge-light-success">Open</span>';
                            }
                            return '<span class="badge badge-light-danger" >Disabled</span>';
                        }
                    }
                    , {
                        field: 'recharge', title: '余额充值', formatter: function (val, item) {
                            if (item.id == 1) {
                                return '<span class="badge badge-light" >Not support</span>';
                            }
                            if (item.recharge == 1) {
                                return '<span class="badge badge-light-success">Open</span>';
                            }
                            return '<span class="badge badge-light-danger" >Disabled</span>';
                        }
                    }
                    , {field: 'sort', title: '排序(越小越前)'}
                    , {
                        field: 'cost', title: '手续费', formatter: function (val, item) {
                            if (item.cost == 0) {
                                return '<span class="badge badge-light-danger" >未启用</span>';
                            }

                            if (item.cost_type == 0) {
                                return '<span class="badge badge-light-success" >￥' + item.cost + '</span>';
                            } else {
                                return '<span class="badge badge-light-primary" >' + (item.cost * 100) + '%</span>';
                            }
                        }
                    }
                    , {
                        field: 'create_time', title: '创建时间', formatter: function (val, item) {
                            if (item.id == 1) {
                                return '<span class="badge badge-light" >-</span>';
                            }
                            return item.create_time;
                        }
                    }
                    , {
                        field: 'type', title: '支付方式', formatter: function (val, item) {
                            if (item.id == 1) {
                                return '<span class="badge badge-light" >余额支付</span>';
                            }
                            return '<span class="badge badge-light-success">' + getType(item.handle, item.code) + '</span>';
                        }
                    }
                    , {
                        field: 'plugin', title: '所属插件', formatter: function (val, item) {
                            if (item.id == 1) {
                                return '<span class="badge badge-light" >内置</span>';
                            }
                            return '<span class="badge badge-light-success">' + getPluginName(item.handle) + '</span>';
                        }
                    },
                    {
                        field: 'equipment', title: '终端控制', formatter: function (val, item) {
                            console.log(item.equipment);
                            return equipment[item.equipment];
                        }
                    },
                    {
                        field: 'operate',
                        title: '操作',
                        formatter: function (val, item) {
                            if (item.id == 1) {
                                return '<span class="badge badge-light" >Unable</span>';
                            }
                            return '<button type="button"  class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 edit"><i class="fa fa-edit"></i></button> <button type="button"  class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 del"><i class="fas fa-trash"></i></button> ';
                        },
                        events: {
                            'click .edit': function (event, value, row, index) {
                                modal(row);
                            },
                            'click .del': function (event, value, row, index) {
                                layer.confirm('您正在移除该支付方式，是否要继续？', {
                                    btn: ['确认移除', '取消']
                                }, function () {
                                    $.post('/admin/api/pay/del', {list: [row.id]}, res => {
                                        layer.msg(res.msg);
                                        table.bootstrapTable('refresh', {silent: true});
                                    });
                                });
                            }
                        }
                    }
                ]
            });

            let payModal = function (values = {}, id) {
                layer.closeAll();
                if (!plugins[id]) {
                    layer.msg("插件异常");
                    return;
                }
                let listDict = [];
                let list = plugins[id].info.options;
                for (let index in list) {
                    listDict.push({id: index, name: list[index]})
                }
                cao.popup('/admin/api/pay/save', [
                    {name: "handle", type: "hidden", default: id},
                    {title: "图标", name: "icon", type: "image", placeholder: "请选择64*64的图标", width: 64},
                    {title: "支付名称", name: "name", type: "input", placeholder: "请输入支付方式名称"},
                    {
                        title: "显示终端",
                        name: "equipment",
                        type: "select",
                        dict: [
                            {id: 0, name: "通用"},
                            {id: 1, name: "手机"},
                            {id: 2, name: "PC"},
                            {id: 3, name: "微信"},
                        ],
                        placeholder: "请选择终端",
                        default: 0
                    },
                    {
                        title: "支付类型",
                        name: "code",
                        type: "select",
                        dict: listDict,
                        placeholder: "请选择支付类型"
                    },
                    {
                        title: "下单手续费",
                        name: "cost",
                        type: "input",
                        placeholder: "不设置手续费请留空",
                        tips: "单笔固定：每笔订单固定手续费<br>百分比：使用小数代替，比如0.01"
                    },
                    {
                        title: "手续费模式",
                        name: "cost_type",
                        type: "select",
                        dict: [
                            {id: 0, name: "单笔固定"},
                            {id: 1, name: "百分比(使用小数代替)"}
                        ],
                        placeholder: "请选择手续费模式",
                        default: 0
                    },
                    {title: "商品下单", name: "commodity", type: "switch", text: "启用"},
                    {title: "会员充值", name: "recharge", type: "switch", text: "启用"},
                    {title: "显示排序", name: "sort", type: "input", placeholder: "越小显示靠前"},
                ], res => {
                    table.bootstrapTable('refresh', {silent: true});
                }, values);
            }


            let modal = (values = {}) => {
                let dict = [];
                pluginMaps.forEach(item => {
                    dict.push('<option value="' + item.id + '">' + item.info.name + '(v' + item.info.version + ')</option>');
                });

                if (values.hasOwnProperty('handle') && values.handle !== "" && values.handle != null) {
                    payModal(values, values.handle);
                    return;
                }
                layer.open({
                    type: 1,
                    shade: 0.3,
                    content: '<form class="layui-form">\n' +
                        '    <div style="margin-top: 10px;margin-left: 20px;margin-right: 20px;"><select class="plugin-select">' + dict.join("") + '</select>\n' +
                        '    </div>\n' +
                        '</form>',
                    title: "你想使用那个插件？（・ω・）",
                    btn: ['确认', '取消'],
                    shadeClose: true,
                    yes: (index, layero) => {
                        layer.close(index);
                        let plugin = $(".plugin-select").val();
                        values.handle = plugin;
                        payModal(values, plugin);
                    },
                    success: (layero, index) => {
                        form.render();
                    }
                });
            }

            $('.btn-app-create').click(function () {
                modal();
            });

            $('.btn-app-del').click(() => {
                let data = cao.listObjectToArray(table.bootstrapTable('getSelections'));
                if (data.length == 0) {
                    layer.msg("请至少勾选1个支付方式进行操作！");
                    return;
                }

                layer.confirm('您确定要删除已经选中的支付方式吗？这是不可恢复的操作！', {
                    btn: ['确定', '取消']
                }, function () {
                    $.post("/admin/api/pay/del", {list: data}, res => {
                        layer.msg(res.msg);
                        table.bootstrapTable('refresh', {silent: true});
                    });
                });
            });

            let handles = [];
            pluginMaps.forEach(item => {
                handles.push({id: item.id, name: item.info.name});
            });

            cao.query('.search-query', table, [
                {title: "支付名称", name: "search-name", type: "input"},
                {
                    title: "商品下单-状态", name: "equal-commodity", type: "select", dict: [
                        {id: 0, name: "停用"},
                        {id: 1, name: "启用"}
                    ]
                }, {
                    title: "余额充值-状态", name: "equal-recharge", type: "select", dict: [
                        {id: 0, name: "停用"},
                        {id: 1, name: "启用"}
                    ]
                }, {
                    title: "插件", name: "equal-handle", type: "select", dict: handles
                }
            ], true, false);
        })
        ;
    })
    ;
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
