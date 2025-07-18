<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:35:10
  from '/www/wwwroot/webfaka/app/View/Admin/Config/PayPlugin.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e29e6e36c5_12076711',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '855498414d9d66e4331de16a6055b71bb6c4415d' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Config/PayPlugin.html',
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
function content_67f3e29e6e36c5_12076711 (Smarty_Internal_Template $_smarty_tpl) {
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
                        <a href="/admin/store/home" class="btn btn-sm btn-light-primary btn-app-create me-3"><i
                                    class="fab fa-instalod"></i>
                            获取更多插件
                        </a>
                    </div>
                </div>
                <!--end::Header-->
                <div class="card-body py-3">
                    <table id="pay-plugin" lay-filter="pay-plugin"></table>
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
            let table = $("#pay-plugin");
            var cao = layui.hex;

            let pluginUpdate = {
                items: null,
                updateNum: 0,
                init() {
                    if (!this.items) {
                        let items = localStorage.getItem("pluginVersions");
                        if (items) {
                            this.items = JSON.parse(items);
                        } else {
                            this.items = {};
                        }
                    }
                },
                getPlugin(key) {
                    this.init();
                    if (!this.items || !this.items.hasOwnProperty(key)) {
                        return null;
                    }
                    return this.items[key];
                },
                renderButton(key, version) {
                    let plugin = this.getPlugin(key);
                    if (!plugin) {
                        return "";
                    }
                    if (version != plugin.version) {
                        this.updateNum++;

                        $('#updateNum').html('<b style="color:red;">[' + this.updateNum + ']个插件需要更新</b>');

                        return ' <span style="cursor: pointer;" class="badge badge-light-success updatePlugin">更新->' + plugin.version + '</span>';
                    }
                    return "";
                }
            }

            let queryParams = null;
            table.bootstrapTable({
                url: '/admin/api/pay/getPlugins',//请求的url地址
                method: "post",//请求方式
                showRefresh: false,//是否显示刷新按钮
                cache: false,//是否使用缓存
                showToggle: false,//是否显示详细视图和列表视图的切换按钮
                cardView: false,
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
                    pluginUpdate.updateNum = 0;
                    return {
                        "total": res.count,
                        "rows": res.data
                    }
                },
                columns: [
                    {
                        field: 'name', title: '插件名称', formatter: function (val, item) {
                            return '<span class="badge badge-light-dark"><img src="' + item.icon + '"  style="width: 18px;border-radius: 5px;margin-top: -2px"/> ' + item.info.name + '</span>';
                        }
                    }
                    , {
                        field: 'website', title: '官方网站', formatter: function (val, item) {
                            return '<span class="badge badge-light-primary">' + item.info.website + '</span>';
                        }
                    }
                    , {
                        field: 'description', title: '简介', formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.info.description + '</span>';
                        }
                    }
                    , {
                        field: 'version', title: '<span id="updateNum">版本号</span>', formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.info.version + '</span>' + pluginUpdate.renderButton(item.id, item.info.version);
                        }
                        ,
                        events: {
                            'click .updatePlugin': function (event, value, row, index) {
                                let plugin = pluginUpdate.getPlugin(row.id);

                                if (!plugin) {
                                    layer.msg("初始化更新失败，请刷新页面重试");
                                    return;
                                }

                                layer.confirm(plugin.update_content.replace(/\n/, "<br>"), {
                                    btn: ['立即更新', '取消'],
                                    title: "更新插件 -> " + '<span style="color: red;">' + row.info.name + '</span>'
                                }, function () {
                                    let layIndex = layer.load(1, {shade: [0.3, '#fff']});
                                    $.post('/admin/api/app/upgrade', {
                                        plugin_key: row.id,
                                        type: plugin.type,
                                        plugin_id: plugin.id
                                    }, res => {
                                        layer.close(layIndex);
                                        layer.msg(res.msg);
                                        if (res.code == 200) {
                                            window.location.reload();
                                        }
                                    });
                                });
                            }
                        }
                    }
                    , {
                        field: 'author', title: '作者', formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.info.author + '</span>';
                        }
                    }
                    , {
                        field: 'options', title: '功能', formatter: function (val, item) {
                            let list = [];
                            for (const key in item.info.options) {
                                list.push('<span class="badge badge-success me-1">' + item.info.options[key] + '</span>');
                            }
                            return list.join("");
                        }
                    }
                    , {
                        field: 'operate',
                        title: '操作',
                        formatter: function (val, item) {
                            let html = '<a  class="badge badge-light text-success log" style="cursor: pointer;"><i class="far fa-clipboard text-success"></i> 日志</a>';

                            if (item.hasOwnProperty('submit') && item.submit.length > 0) {
                                html += ' <a style="cursor: pointer;"  class="badge badge-light text-success edit"><i class="fa fa-cog text-success"></i> 配置</a>';
                            }

                            html += '<a style="cursor: pointer;"  class="badge badge-light uninstall"><i class="fas fa-trash-alt"></i> 卸载</a>';

                            return html;
                        },
                        events: {
                            'click .edit': function (event, value, row, index) {
                                modal(row);
                            },
                            'click .uninstall': function (event, value, row, index) {
                                layer.confirm('你想要卸载 <span style="color: red;"> ' + row.info.name + " </span>吗，这将清空该插件的所有数据，并且无法恢复？", {
                                    btn: ['卸载', '取消'],
                                    title: "卸载插件"
                                }, function () {
                                    let layIndex = layer.load(1, {shade: [0.3, '#fff']});
                                    $.post('/admin/api/app/uninstall', {
                                        plugin_key: row.id,
                                        type: 1
                                    }, res => {
                                        layer.close(layIndex);
                                        layer.msg(res.msg);
                                        if (res.code == 200) {
                                            table.bootstrapTable('refresh', {silent: true});
                                        }
                                    });
                                });
                            },
                            'click .log': function (event, value, row, index) {
                                let mapItem = row;
                                $.post('/admin/api/pay/getPluginLog', {handle: mapItem.handle}, res => {
                                    if (res.code != 200) {
                                        layer.msg(res.msg);
                                        return;
                                    }
                                    layer.open({
                                        type: 1,
                                        shade: 0.4,
                                        shadeClose: true, //开启遮罩关闭
                                        title: '<i class="fas fa-robot" style="color: #f16a8b;"></i> 日志', //不显示标题
                                        btn: ["清空日志", "关闭"],
                                        content: '<textarea class="log-textarea" style="width: 100%;height: 100%;border: none;color: grey;padding: 5px;">' + res.data.log + '</textarea>',
                                        area: cao.isPc() ? ["860px", "660px"] : ["100%", "100%"],
                                        maxmin: true,
                                        yes: (index, layero) => {
                                            $.post('/admin/api/pay/ClearPluginLog', {handle: mapItem.handle}, res => {
                                                layer.msg("日志已清空");
                                            });
                                        },
                                        success: (layero, index) => {
                                            this.timer = setInterval(() => {
                                                $.post('/admin/api/pay/getPluginLog', {handle: mapItem.handle}, res => {
                                                    if (res.data.log != $('.log-textarea').html()) {
                                                        $('.log-textarea').html(res.data.log);
                                                    }
                                                });
                                            }, 1500);
                                        },
                                        end: () => {
                                            clearInterval(this.timer);
                                        }
                                    });
                                });
                            }
                        }
                    }
                ]
            });

            let modal = (values = {}) => {
                cao.popup('/admin/api/pay/setPluginConfig', values.submit, res => {
                    table.bootstrapTable('refresh', {silent: true});
                }, values, "660px", false, "插件配置");
            }
        });
    });
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
