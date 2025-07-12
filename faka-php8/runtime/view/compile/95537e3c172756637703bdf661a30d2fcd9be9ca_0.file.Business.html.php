<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:49:18
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/User/Business.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e5eec0b5a9_79047958',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '95537e3c172756637703bdf661a30d2fcd9be9ca' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/User/Business.html',
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
function content_67f3e5eec0b5a9_79047958 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Common/Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<div class="layui-container fly-marginTop fly-user-main">
    <?php $_smarty_tpl->_subTemplateRender("file:../Common/Nav.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <div class="content-header">
                <i class="layui-icon">&#xe638;</i> 我的店铺
            </div>

            <div class="content-body">
                <?php if (!$_smarty_tpl->tpl_vars['business']->value) {?>
                    <blockquote class="elem-quote">
                        您还没有开通店铺
                    </blockquote>
                <?php }?>
                <?php if ($_smarty_tpl->tpl_vars['purchase']->value == 1) {?>
                    <blockquote class="elem-quote">
                        升级您的店铺，享受更多权益
                    </blockquote>
                <?php }?>
                <?php if (!$_smarty_tpl->tpl_vars['business']->value || $_smarty_tpl->tpl_vars['purchase']->value == 1 && $_smarty_tpl->tpl_vars['business']->value) {?>
                    <form class="layui-form" action="">
                        <div class="form-block">
                            <div>
                                <div class="form-header">请选择</div>
                                <div class="form-body">
                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['level']->value, 'le');
$_smarty_tpl->tpl_vars['le']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['le']->value) {
$_smarty_tpl->tpl_vars['le']->do_else = false;
?>
                                        <a class="button-click" onclick="openLevel(this,<?php echo $_smarty_tpl->tpl_vars['le']->value['id'];?>
)"
                                           style="line-height: 22px;color: #db66ac;"> <img
                                                    src="<?php echo $_smarty_tpl->tpl_vars['le']->value['icon'];?>
" class="pay-icon" style="margin-top: -5px;"> <span
                                                    style="font-weight: bold;"><?php echo $_smarty_tpl->tpl_vars['le']->value['name'];?>
</span> <span
                                                    style="font-weight: bold;">¥<?php echo $_smarty_tpl->tpl_vars['le']->value['price'];?>
</span>
                                            <hr>
                                            <div style="font-size: 12px;">
                                                <p>分站功能：<?php if ($_smarty_tpl->tpl_vars['le']->value['substation'] == 1) {?><i class="layui-icon"
                                                                                    style="color: green;">&#xe605;</i>
                                                    <?php } else { ?><i class="layui-icon" style="color: red;">&#x1006;</i><?php }?>
                                                </p>
                                                <p>分站返佣：<i class="layui-icon" style="color: green;">&#xe605;</i></p>
                                                <p>独立域名：<?php if ($_smarty_tpl->tpl_vars['le']->value['top_domain'] == 1) {?><i class="layui-icon"
                                                                                    style="color: green;">&#xe605;</i>
                                                    <?php } else { ?><i class="layui-icon" style="color: red;">&#x1006;</i><?php }?>
                                                </p>
                                                <p>供货权限：<?php if ($_smarty_tpl->tpl_vars['le']->value['supplier'] == 1) {?><i class="layui-icon"
                                                                                  style="color: green;">&#xe605;</i>
                                                    <?php } else { ?><i class="layui-icon" style="color: red;">&#x1006;</i><?php }?>
                                                </p>
                                                <p>供货手续费：<?php if ($_smarty_tpl->tpl_vars['le']->value['supplier'] == 1) {
echo $_smarty_tpl->tpl_vars['le']->value['cost']*100;?>
%<?php } else { ?>-<?php }?></p>
                                            </div>
                                        </a>
                                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                </div>
                            </div>
                            <div style="margin-top: 10px;">
                                <blockquote class="elem-tips" style="font-size: 12px;">
                                    <p>• 分站返佣：当您开通分站店铺后，您在分站卖出去的主站商品，将会给您一定的佣金</p>
                                    <p>• 顶级域名：当您开通分站后，可以绑定属于您自己的顶级域名，而不是使用分配的子域名</p>
                                    <p>• 供货权限：可以建立自己的商品分类，以及添加自己的商品来进行售卖，主站也会帮你售卖。</p>
                                    <p>• 供货手续费：用作与您自主上架的商品，当成功出售时，系统将收取一定的手续费</p>
                                </blockquote>

                            </div>
                            <div style="margin-top: 25px;">
                                <button type="button" class="layui-btn layui-btn-pink payButton"><?php if (!$_smarty_tpl->tpl_vars['business']->value) {?>立即开通
                                    <?php }
if ($_smarty_tpl->tpl_vars['purchase']->value == 1) {?>立即升级<?php }?>
                                </button>
                                <?php if ($_smarty_tpl->tpl_vars['purchase']->value == 1) {?>
                                    <a href="/user/business/index" class="layui-btn layui-btn-pink">返回店铺</a>
                                <?php }?>
                            </div>
                        </div>
                    </form>
                <?php } else { ?>
                    <?php if ($_smarty_tpl->tpl_vars['user']->value['businessLevel']['substation'] == 1) {?>
                        <blockquote class="elem-quote">
                            当前商户等级：<img src="<?php echo $_smarty_tpl->tpl_vars['user']->value['businessLevel']['icon'];?>
"
                                        style="height: 16px;margin-top: -4px;"><?php echo $_smarty_tpl->tpl_vars['user']->value['businessLevel']['name'];?>
，绑定独立域名：<?php if ($_smarty_tpl->tpl_vars['user']->value['businessLevel']['top_domain'] == 1) {?><b style="color: green;">✔</b><?php } else { ?><b
                                style="color: red;">✖</b><?php }?>，供货权限：<?php if ($_smarty_tpl->tpl_vars['user']->value['businessLevel']['supplier'] == 1) {?><b
                                style="color: green;">✔</b>，供货手续费：<?php echo $_smarty_tpl->tpl_vars['user']->value['businessLevel']['cost']*100;?>
%<?php } else { ?><b
                                style="color: red;">✖</b><?php }?> <?php if (count($_smarty_tpl->tpl_vars['level']->value) > 0) {?>
                                <a href="/user/business/index?purchase=1"
                                   style="color: #a372d7;font-weight: bold;margin-left: 10px;">我要升级，变得更强！</a>
                            <?php }?>
                        </blockquote>
                        <form class="layui-form form-data">
                            <div>
                                <div class="form-header">店铺名称</div>
                                <div class="form-body"><input type="text" value="<?php echo $_smarty_tpl->tpl_vars['business']->value['shop_name'];?>
"
                                                              name="shop_name"
                                                              required autocomplete="off" placeholder="请输入店铺名称"
                                                              class="layui-input" style="color: #ff9191;"></div>
                            </div>
                            <div>
                                <div class="form-header">网站标题</div>
                                <div class="form-body"><input type="text" value="<?php echo $_smarty_tpl->tpl_vars['business']->value['title'];?>
" name="title"
                                                              required
                                                              autocomplete="off" placeholder="用于显示浏览器标题"
                                                              class="layui-input"
                                                              style="color: #ff9191;"></div>
                            </div>
                            <div>
                                <div class="form-header">店铺公告</div>
                                <div class="form-body">
                                    <textarea type="text" name="notice" required autocomplete="off"
                                                                 placeholder="店铺公告，支持HTML" class="layui-textarea"
                                                                 style="color: #ff9191;"><?php echo $_smarty_tpl->tpl_vars['business']->value['notice'];?>
</textarea>
                                </div>
                            </div>
                            <div>
                                <div class="form-header">显示主站商品[全局]</div>
                                <div class="form-body"><input type="checkbox" name="master_display" title="开启" value="1"
                                                              <?php if ($_smarty_tpl->tpl_vars['business']->value['master_display'] == 1) {?>checked<?php }?>>
                                </div>
                            </div>

                            <div>
                                <div class="form-header">主站分类
                                    <span class="acg-badge acg-badge-light-success category-show" data-state="1"
                                          style="cursor:pointer;">全部显示</span>
                                    <span class="acg-badge acg-badge-light-red category-show" data-state="0"
                                          style="cursor:pointer;">全部隐藏</span>
                                </div>
                                <div class="form-body">
                                    <table id="master_category" lay-filter="master_category"></table>
                                </div>
                            </div>

                            <div>
                                <div class="form-header">主站商品
                                    <a id="commodity"></a>
                                    <span class="acg-badge acg-badge-light-success commodity-show" data-state="1"
                                          style="cursor:pointer;">全部显示</span>
                                    <span class="acg-badge acg-badge-light-red commodity-show" data-state="0"
                                          style="cursor:pointer;">全部隐藏</span>

                                    <span class="acg-badge acg-badge-light-primary commodity-premium"
                                          style="cursor:pointer;">加价</span>
                                </div>
                                <div class="form-body">
                                    <table id="master_commodity" lay-filter="master_commodity"></table>
                                </div>
                            </div>

                            <div>
                                <div class="form-header">客服QQ</div>
                                <div class="form-body"><input type="text" value="<?php echo $_smarty_tpl->tpl_vars['business']->value['service_qq'];?>
"
                                                              name="service_qq"
                                                              required autocomplete="off" placeholder="售后客服QQ"
                                                              class="layui-input" style="color: #ff9191;"></div>
                            </div>
                            <div>
                                <div class="form-header">客服地址</div>
                                <div class="form-body"><input type="text" value="<?php echo $_smarty_tpl->tpl_vars['business']->value['service_url'];?>
"
                                                              name="service_url"
                                                              required autocomplete="off" placeholder="网页客服地址"
                                                              class="layui-input" style="color: #ff9191;"></div>
                            </div>
                            <div>
                                <div class="form-header">子域名 <?php if ($_smarty_tpl->tpl_vars['business']->value['subdomain']) {?>
                                        <b style="color: green;">✔</b>
                                        <a style="color: #239c87;"
                                           href="javascript:void(0);" class="unbind-subdomain">解绑</a>
                                    <?php }?>
                                </div>
                                <div class="form-body">
                                    <div class="layui-row" style="width: 400px;">
                                        <div class="layui-col-md5">
                                            <input type="text" value="<?php echo $_smarty_tpl->tpl_vars['business']->value['subdomain'];?>
" name="subdomain" required
                                                   autocomplete="off" placeholder="前缀" class="layui-input"
                                                   style="color: #ff9191;" <?php if ($_smarty_tpl->tpl_vars['business']->value['subdomain']) {?> disabled <?php }?>>
                                        </div>
                                        <div class="layui-col-md7">
                                            <select class="layui-select "
                                                    name="suffix" <?php if ($_smarty_tpl->tpl_vars['business']->value['subdomain']) {?> disabled <?php }?>>
                                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['domain']->value, 'd');
$_smarty_tpl->tpl_vars['d']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['d']->value) {
$_smarty_tpl->tpl_vars['d']->do_else = false;
?>
                                                    <option value="<?php echo $_smarty_tpl->tpl_vars['d']->value;?>
">.<?php echo $_smarty_tpl->tpl_vars['d']->value;?>
</option>
                                                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <?php if ($_smarty_tpl->tpl_vars['user']->value['businessLevel']['top_domain'] == 1) {?>
                                    <div>
                                        <div class="form-header">独立域名 <?php if ($_smarty_tpl->tpl_vars['business']->value['topdomain']) {?>
                                                <a style="color: #239c87;"
                                                   href="javascript:void(0);" class="unbind-topdomain">解绑</a>
                                                [<?php if (gethostbyname($_smarty_tpl->tpl_vars['config']->value['cname']) == gethostbyname($_smarty_tpl->tpl_vars['business']->value['topdomain'])) {?>
                                                    <b style="color: green;">正常</b>
                                                <?php } else { ?>
                                                    <b
                                                            style="color: mediumvioletred;">未检测到解析</b>
                                                <?php }?>] <?php }?> <span
                                                    style="color: red;">CNAME解析地址：<b
                                                        style="color: green;"><?php echo $_smarty_tpl->tpl_vars['config']->value['cname'];?>
</b></span></div>
                                        <div class="form-body"><input type="text" value="<?php echo $_smarty_tpl->tpl_vars['business']->value['topdomain'];?>
"
                                                                      name="topdomain"
                                                                      required autocomplete="off" placeholder="绑定独立域名"
                                                                      class="layui-input"
                                                                      style="width:260px;color: #ff9191;" <?php if ($_smarty_tpl->tpl_vars['business']->value['topdomain']) {?> disabled <?php }?>>
                                        </div>
                                    </div>
                                <?php }?>
                                <div style="margin-top: 25px;">
                                    <button type="button" class="layui-btn layui-btn-pink save-config">保存设置</button>
                                </div>
                        </form>
                    <?php } else { ?>
                        <blockquote class="elem-quote">
                            您当前商户等级暂不支持店铺功能，<a href="/user/business/index?purchase=1">立即升级</a>
                        </blockquote>
                    <?php }?>
                <?php }?>
            </div>
        </div>
    </div>
</div>

<?php echo '<script'; ?>
>
    let levelId = 0;

    function openLevel(obj, id) {
        User.switchElement(obj);
        levelId = id;
    }

    $('.payButton').click(() => {
        User.$post("/user/api/business/purchase", {
            levelId: levelId
        }, res => {
            layer.msg("开通成功");
            window.location.href = "/user/business/index";
        })
    });

    $('.save-config').click(() => {
        User.$post("/user/api/business/saveConfig", $('.form-data').serialize(), res => {
            layer.msg("保存成功");
        })
    });


    $(function () {
        layui.use(['form', 'hex'], function () {
            var form = layui.form;
            let table = $("#master_category");
            let table2 = $("#master_commodity");
            let cao = layui.hex;
            let queryParams = null;
            let globalCategoryId = 0;
            let globalCategoryName = null;


            $('.unbind-subdomain').click(function () {
                layer.confirm('您正在解绑子域名，解绑后，用户将无法再通过旧子域名访问您的店铺。', {
                    btn: ['解绑', '取消'],
                    title: "解绑子域名"
                }, function () {
                    User.$post("/user/api/business/unbind", {type: 0}, res => {
                        layer.msg("解绑成功");
                        setTimeout(() => {
                            window.location.reload()
                        }, 500);
                    })
                });
            });
            $('.unbind-topdomain').click(function () {
                layer.confirm('您正在解绑独立域名，解绑后，用户将无法再通过独立域名访问您的店铺。', {
                    btn: ['解绑', '取消'],
                    title: "解绑独立域名"
                }, function () {
                    User.$post("/user/api/business/unbind", {type: 1}, res => {
                        layer.msg("解绑成功");
                        setTimeout(() => {
                            window.location.reload()
                        }, 500);
                    })
                });
            });


            //####主站
            let setCategory = (values = {}) => {
                cao.popup('/user/api/master/setCategory', [
                    {title: "cid", name: "category_id", type: "hidden"},
                    {title: "自定义名称", name: "name", type: "input", placeholder: "自定义分类名称，不填写代表使用主站的"},
                    {title: "状态", name: "status", type: "switch", text: "显示"}
                ], res => {
                    table.bootstrapTable('refresh', {silent: true});
                }, values, "480px");
            }
            let setCommodity = (values = {}) => {
                cao.popup('/user/api/master/setCommodity', [
                    {title: "cid", name: "commodity_id", type: "hidden"},
                    {title: "自定义名称", name: "name", type: "input", placeholder: "自定义商品名称，不填写代表使用主站的"},
                    {title: "加价", name: "premium", type: "input", placeholder: "商品加价"},
                    {title: "状态", name: "status", type: "switch", text: "显示"}
                ], res => {
                    table2.bootstrapTable('refresh', {silent: true});
                }, values, "480px");
            }

            $('.commodity-show').click(function () {
                let status = $(this).attr("data-state");
                User.$post("/user/api/master/setCommodityAllStatus", {
                    status: status,
                    category_id: globalCategoryId
                }, res => {
                    layer.msg("已生效");
                    table2.bootstrapTable('refresh', {silent: true});
                });
            });

            $('.category-show').click(function () {
                let status = $(this).attr("data-state");
                User.$post("/user/api/master/setCategoryAllStatus", {status: status}, res => {
                    layer.msg("已生效");
                    table.bootstrapTable('refresh', {silent: true});
                });
            });

            $('.commodity-premium').click(function () {
                cao.popup('/user/api/master/setCommodityAllPremium', [
                    {
                        title: "加价模式", name: "mode", type: "radio", dict: [
                            {id: 0, name: "普通金额加价"},
                            {id: 1, name: "百分比加价"}
                        ], default: 0
                    },
                    {title: "加价数量", name: "premium", type: "input", placeholder: "金额/百分比(小数代替)"},
                    {title: "cid", name: "category_id", type: "hidden"}
                ], res => {
                    table2.bootstrapTable('refresh', {silent: true});
                }, {category_id: globalCategoryId}, "480px", false, "加价" + (globalCategoryName ? " - <b style='color:red;'>仅分类：" + globalCategoryName + "</b>" : " - 全部"));
            });

            table.bootstrapTable({
                url: '/user/api/master/category',//请求的url地址
                method: "post",//请求方式
                pageSize: 10,
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
                    {field: 'name', title: '主站名称'}
                    , {
                        field: 'status', title: '状态', formatter: function (val, item) {
                            if (!item.user_category || item.user_category.status == 1) {
                                return '<span class="acg-badge acg-badge-light-success status" style="cursor:pointer;">显示</span>';
                            }
                            return '<span class="acg-badge acg-badge-light-red status" style="cursor:pointer;">隐藏</span>';
                        }, events: {
                            'click .status': function (event, value, row, index) {
                                let values = row.user_category;

                                if (!values) {
                                    values = {id: 0, category_id: row.id};
                                }

                                User.$post("/user/api/master/setCategoryStatus", values, res => {
                                    layer.msg("已生效");
                                    table.bootstrapTable('refresh', {silent: true});
                                });
                            }
                        }
                    }

                    , {
                        field: 'user_name', title: '自定义名称', formatter: function (val, item) {
                            if (!item.user_category || !item.user_category.name) {
                                return '-';
                            }
                            return item.user_category.name;
                        }
                    }
                    , {
                        field: 'operate',
                        title: '',
                        formatter: function (val, item) {
                            return '<a  class="acg-badge acg-badge-light-success acg-badge-button view-commodity" href="#commodity"><i class="layui-icon">&#xe656;</i> 查看商品</a> ' +
                                '<span  class="acg-badge acg-badge-light-primary acg-badge-button setting"><i class="layui-icon">&#xe614;</i> 设置</span> ';
                        },
                        events: {
                            'click .setting': function (event, value, row, index) {
                                let values = row.user_category;

                                if (!values) {
                                    values = {category_id: row.id};
                                }

                                setCategory(values);
                            },
                            'click .view-commodity': function (event, value, row, index) {
                                globalCategoryId = row.id;
                                globalCategoryName = row.name;
                                table2.bootstrapTable('refresh', {
                                    silent: false,
                                    pageNumber: 1,
                                    query: {category_id: row.id}
                                });
                            }
                        }
                    }
                ]
            });
            table2.bootstrapTable({
                url: '/user/api/master/commodity',//请求的url地址
                method: "post",//请求方式
                pageSize: 10,
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
                    {field: 'name', title: '名称'}
                    , {field: 'user_price', title: '进货价'}
                    , {field: 'price', title: '单价'}
                    , {
                        field: 'status', title: '状态', formatter: function (val, item) {
                            if (!item.user_commodity || item.user_commodity.status == 1) {
                                return '<span class="acg-badge acg-badge-light-success commodity-status" style="cursor:pointer;">显示</span>';
                            }
                            return '<span class="acg-badge acg-badge-light-red commodity-status" style="cursor:pointer;">隐藏</span>';
                        }, events: {
                            'click .commodity-status': function (event, value, row, index) {
                                let values = row.user_commodity;

                                if (!values) {
                                    values = {id: 0, commodity_id: row.id};
                                }

                                User.$post("/user/api/master/setCommodityStatus", values, res => {
                                    layer.msg("已生效");
                                    table2.bootstrapTable('refresh', {silent: true});
                                });
                            }
                        }
                    }
                    , {
                        field: 'user_name', title: '自定义名称', formatter: function (val, item) {
                            if (!item.user_commodity || !item.user_commodity.name) {
                                return '-';
                            }
                            return item.user_commodity.name;
                        }
                    }
                    , {
                        field: 'premium', title: '加价', formatter: function (val, item) {
                            if (!item.user_commodity || item.user_commodity.premium == 0) {
                                return '-';
                            }
                            return item.user_commodity.premium;
                        }
                    }
                    , {
                        field: 'operate',
                        title: '',
                        formatter: function (val, item) {
                            return '<span  class="acg-badge acg-badge-light-primary acg-badge-button c-setting"><i class="layui-icon">&#xe614;</i> 设置</span> ';
                        },
                        events: {
                            'click .c-setting': function (event, value, row, index) {
                                let values = row.user_commodity;

                                if (!values) {
                                    values = {commodity_id: row.id};
                                }

                                setCommodity(values);
                            }
                        }
                    }
                ]
            });


        });
    });
<?php echo '</script'; ?>
>
<?php $_smarty_tpl->_subTemplateRender("file:../Common/Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
