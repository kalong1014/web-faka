<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:42:17
  from '/www/wwwroot/webfaka/app/View/Admin/Manage/Manage.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e449c8d594_22229441',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b479844314ed1f8c2828a2e2e1e8a7aaeed0d9f7' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Manage/Manage.html',
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
function content_67f3e449c8d594_22229441 (Smarty_Internal_Template $_smarty_tpl) {
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
                            添加管理员
                        </button>
                    </div>
                </div>
                <!--end::Header-->

                <div class="card-body py-3">
                    <table id="manage" lay-filter="manage"></table>
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
        layui.use([ 'hex'], function () {
            let table = $("#manage");
            var cao = layui.hex;

            let type = [
                "",
                '<span class="badge badge-light-primary">超级管理员</span>',
                '<span class="badge badge-light">白班</span>',
                '<span class="badge badge-light">夜班</span>',
            ];

            let queryParams = null;
            table.bootstrapTable({
                url: '/admin/api/manage/data',//请求的url地址
                method: "post",//请求方式
                // striped:true,//是否显示行间隔色
                pageSize: 17,//每页显示的数量
                pageList: [17, 25, 50, 100],
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
                    {
                        field: 'avatar', title: '管理员', formatter: function (val, item) {
                            if (!item.avatar) {
                                item.avatar = "/favicon.ico";
                            }
                            return '<span class="badge badge-light-dark"><img src="' + item.avatar + '"  style="width: 18px;border-radius: 100%;"/> ' + item.nickname + '</span> '
                        }
                    }
                    , {field: 'email', title: '邮箱'}
                    , {
                        field: 'status', title: '状态', formatter: function (val, item) {
                            if (item.status == 1) {
                                return '<span class="badge badge-light-success">正常</span>';
                            }
                            return '<span class="badge badge-light-danger">禁用</span>';
                        }
                    }
                    , {
                        field: 'type', title: '类型', formatter: function (val, item) {
                            return type[item.type];
                        }
                    }
                    , {field: 'note', title: '备注'}
                    , {field: 'create_time', title: '创建时间'}
                    , {field: 'login_time', title: '登录时间'}
                    , {field: 'login_ip', title: '登录IP'}
                    , {field: 'last_login_time', title: '上次登录时间'}
                    , {field: 'last_login_ip', title: '上次登录IP'}
                    , {
                        field: 'operate',
                        title: '操作',
                        formatter: function (val, item) {
                            let html = '<button type="button"  class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 edit"><i class="fa fa-edit"></i></button> ';
                            html += '<button type="button"  class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 del"><i class="fas fa-trash"></i></button> ';
                            return html;
                        },
                        events: {
                            'click .edit': function (event, value, row, index) {
                                modal(row);
                            },
                            'click .del': function (event, value, row, index) {
                                layer.confirm('您正在移除该管理员，是否要继续？', {
                                    btn: ['确认移除', '取消']
                                }, function () {
                                    $.post('/admin/api/manage/del', {list: [row.id]}, res => {
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
                delete values.password;
                cao.popup('/admin/api/manage/save', [
                    {title: "头像", name: "avatar", type: "image", placeholder: "请选择图片", width: 100},
                    {title: "Email", name: "email", type: "input", placeholder: "请输入邮箱"},
                    {title: "呢称", name: "nickname", type: "input", placeholder: "请输入呢称"},
                    {title: "密码", name: "password", type: "input", placeholder: "请输入密码"},
                    {
                        title: "类型", name: "type", type: "radio", dict: [
                            {id: 1, name: "<b style='color: #d0b728;'>超级管理员</b>"},
                            {id: 2, name: "<b style='color: #3d84ef;'>白班</b>"},
                            {id: 3, name: "<b style='color: #3d84ef;'>夜班</b>"},
                        ], default: 1
                    },
                    {title: "备注", name: "note", type: "input", placeholder: "备注信息"},
                    {title: "状态", name: "status", type: "switch", text: "启用"},
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
