<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:36:12
  from '/www/wwwroot/webfaka/app/View/Admin/User/BusinessLevel.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e2dce34c25_74539928',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '616d103a0782462eb518778308e12e9b1a33a0a9' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/User/BusinessLevel.html',
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
function content_67f3e2dce34c25_74539928 (Smarty_Internal_Template $_smarty_tpl) {
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
                        <button class="btn btn-sm btn-light-primary btn-app-create me-3"><i
                                class="fas fa-plus"></i>
                            新增等级
                        </button>
                    </div>
                </div>
                <!--end::Header-->
                <div class="card-body py-3">
                    <table id="businessLevel" lay-filter="businessLevel"></table>
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
            let table = $('#businessLevel');
            let cao = layui.hex;
            let queryParams = null;
            table.bootstrapTable({
                url: '/admin/api/businessLevel/data',//请求的url地址
                method: "post",//请求方式
                // striped:true,//是否显示行间隔色
                pageSize: 17,//每页显示的数量
                pageList: [17, 25, 50, 100],
                showRefresh: false,//是否显示刷新按钮
                cache: false,//是否使用缓存
                showToggle: false,//是否显示详细视图和列表视图的切换按钮
                pagination: true,//是否显示分页
                hegiht: 20,//表格的高度
                pageNumber: 1,//初始化显示第几页，默认第1页
                singleSelect: true,//复选框只能选择一条记录
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
                        field: 'name', title: '等级名称', formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.name + '</span>'
                        }
                    },
                    {
                        field: 'icon', title: '图标', formatter: function (val, item) {
                            if (!item.icon) {
                                return "-";
                            }
                            return '<img src="' + item.icon + '"  style="height: 24px;"/>'
                        }
                    }
                    , {
                        field: 'price', title: '购买价格', formatter: function (val, item) {
                            return '<span class="badge badge-light-success">' + item.price + '</span>'
                        }
                    }
                    , {
                        field: 'cost', title: '供货商手续费', formatter: function (val, item) {
                            return '<span class="badge badge-light-primary">' + (item.cost * 100) + '%</span>'
                        }
                    }
                    , {
                        field: 'supplier', title: '供货权限', formatter: function (val, item) {
                            if (item.supplier == 1) {
                                return '<span class="badge badge-light-success">开启</span>'
                            }
                            return '<span class="badge badge-light-danger">关闭</span>'
                        }
                    }
                    , {
                        field: 'substation', title: '分站权限', formatter: function (val, item) {
                            if (item.substation == 1) {
                                return '<span class="badge badge-light-success">开启</span>'
                            }
                            return '<span class="badge badge-light-danger">关闭</span>'
                        }
                    }
                    , {
                        field: 'top_domain', title: '绑定独立域名', formatter: function (val, item) {
                            if (item.top_domain == 1) {
                                return '<span class="badge badge-light-success">开启</span>'
                            }
                            return '<span class="badge badge-light-danger">关闭</span>'
                        }
                    }
                    , {
                        field: 'operate',
                        title: '操作',
                        formatter: function (val, item) {
                            let html = '<button type="button"  class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 edit"><i class="fa fa-edit"></i></button> ';
                            html += '<button type="button"  class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 del"><i class="fas fa-trash"></i></button> ';
                            return html;
                        },
                        events: {               // 注册按钮组事件
                            'click .edit': function (event, value, row, index) {
                                modal(row);
                            },
                            'click .del': function (event, value, row, index) {
                                layer.confirm('您正在移除该等级，是否要继续？', {
                                    btn: ['确认移除', '取消']
                                }, function () {
                                    $.post('/admin/api/businessLevel/del', {list: [row.id]}, res => {
                                        layer.msg(res.msg);
                                        table.bootstrapTable('refresh', {silent: true});
                                    });
                                });
                            }
                        }
                    }
                ]
            });

            let modal = (values = {}) => {
                cao.popup('/admin/api/businessLevel/save', [
                    {title: "等级图标", name: "icon", type: "image", placeholder: "请选择图片", width: 50},
                    {title: "等级名称", name: "name", type: "input", placeholder: "请输入等级名称"},
                    {
                        title: "供货商手续费",
                        name: "cost",
                        type: "input",
                        placeholder: "请使用小数表达百分比",
                        tips: "商户可以发布自己的商品，那么卖出的商品，就会通过这个费率被系统扣除一定的费用，也就是手续费。"
                    },
                    {title: "供货权限", name: "supplier", type: "switch", text: "开启", tips: "开启后，该等级的商户拥有供货权限。"},
                    {title: "分站权限", name: "substation", type: "switch", text: "开启", tips: "开启后，商户则拥有子站权限，可以使用子站功能。"},
                    {
                        title: "绑定独立域名",
                        name: "top_domain",
                        type: "switch",
                        text: "开启",
                        tips: "开启后，商户的店铺可以绑定顶级域名，关闭后则只能使用子域名。"
                    },
                    {title: "购买价格", name: "price", type: "input", placeholder: "请输入该等级的购买价格"},
                ], res => {
                    table.bootstrapTable('refresh', {silent: true});
                }, values);
            }

            $('.btn-app-create').click(function () {
                modal();
            });
        });
    });
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
