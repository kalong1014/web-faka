<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:32:55
  from '/www/wwwroot/webfaka/app/View/Admin/Manage/Log.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e2176c0e37_98333514',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fa1ad3a41b08f4461f3b2ab82d012e1514327f92' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Manage/Log.html',
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
function content_67f3e2176c0e37_98333514 (Smarty_Internal_Template $_smarty_tpl) {
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
                        <button class="btn btn-sm btn-light-primary clear me-3"><i class="fab fa-edge"></i>
                            一键清空日志
                        </button>
                    </div>
                </div>
                <!--end::Header-->
                <div class="card-body py-3 mt-4">
                    <form class="search-query"></form>
                    <table id="manage-log" lay-filter="manage-log"></table>
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
            let table = $("#manage-log");
            let cao = layui.hex;
            let risk = ['<span class="badge badge-light-success">无风险</span>', '<span class="badge badge-light-danger">疑似被入侵</span>'];
            let queryParams = null;
            table.bootstrapTable({
                url: '/admin/api/log/data',//请求的url地址
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
                        field: 'manage', title: "管理员", formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.nickname + '(' + item.email + ')' + '</span>';
                        }
                    }
                    , {
                        field: 'content', title: '日志'
                    }
                    , {
                        field: 'create_time', title: '时间'
                    }
                    , {
                        field: 'create_ip', title: 'IP'
                    }
                    , {
                        field: 'ua', title: '浏览器'
                    }
                    , {
                        field: 'risk', title: '评估', formatter: function (val, item) {
                            return risk[item.risk];
                        }
                    }
                ]
            });


            $('.clear').click(function () {
                layer.confirm('是否要清空所有日志？', {
                    btn: ['确定', '取消']
                }, function () {
                    cao.$get('/admin/api/log/clear', res => {
                        layer.msg("清空完成");
                        table.bootstrapTable('refresh', {silent: true});
                    });
                });
            });

            cao.query('.search-query', table, [
                {title: "Email", name: "equal-email", type: "input"},
                {title: "呢称", name: "equal-nickname", type: "input"},
                {title: "IP地址", name: "equal-create_ip", type: "input"},
                {
                    title: "风险评估", name: "equal-risk", type: "select", dict: [
                        {id: 0, name: "无风险"},
                        {id: 1, name: "疑似被入侵"},
                    ]
                },
                {title: "搜索日志", name: "content-log", type: "input"},
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
