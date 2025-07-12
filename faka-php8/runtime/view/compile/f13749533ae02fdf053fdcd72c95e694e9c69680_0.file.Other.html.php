<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:33:43
  from '/www/wwwroot/webfaka/app/View/Admin/Config/Other.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e247ef5137_91315912',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f13749533ae02fdf053fdcd72c95e694e9c69680' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Config/Other.html',
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
function content_67f3e247ef5137_91315912 (Smarty_Internal_Template $_smarty_tpl) {
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
        <div id="kt_content_container" class="container-xxl">
            <!--begin::Basic info-->
            <div class="card mb-5 mb-xl-10">
                <!--begin::Card header-->
                <div class="card-header border-0 cursor-pointer">
                    <!--begin::Card title-->
                    <div class="card-title m-0">
                        <h3 class="fw-bolder m-0">其他设置</h3>
                    </div>
                    <!--end::Card title-->
                </div>
                <!--begin::Card header-->
                <!--begin::Content-->
                <div id="kt_account_profile_details" class="collapse show">
                    <!--begin::Form-->
                    <form id="data-form" class="form">
                        <!--begin::Card body-->
                        <div class="card-body border-top p-9">

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label fw-bold fs-6">自定义支付回调域名(<a
                                            href="https://faka.wiki/#/zh-cn/setting-other" target="_blank" style="color: red;">详细教程</a>)</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="callback_domain"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="自定义支付回调域名，需要带http://" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['callback_domain'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label  fw-bold fs-6 required">主站域名配置(支持多域名,使用逗号分割)</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <textarea name="domain"
                                              class="form-control form-control-lg form-control-solid"
                                              placeholder="多个域名使用逗号分割"><?php echo $_smarty_tpl->tpl_vars['config']->value['domain'];?>
</textarea>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">DNS-CNAME(域名解析)</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="cname"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="CNAME域名" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['cname'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label fw-bold fs-6 required">主站显示其他商家商品</label>
                                <!--begin::Label-->
                                <!--begin::Label-->
                                <div class="col-lg-8 d-flex align-items-center">
                                    <div class="form-check form-check-solid form-switch fv-row">
                                        <input class="form-check-input w-45px h-30px" type="checkbox"
                                               name="substation_display"
                                               value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['substation_display'] == 1) {?> checked <?php }?>/>
                                        <label class="form-check-label"></label>
                                    </div>
                                </div>
                                <!--begin::Label-->
                            </div>
                            <!--end::Input group-->


                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label fw-bold fs-6">你想要显示那些供货商到主站</label>
                                <!--begin::Label-->
                                <!--begin::Label-->
                                <div class="col-lg-8 d-flex align-items-center">
                                    <table id="substation_display_list"></table>
                                </div>
                                <!--begin::Label-->
                            </div>
                            <!--end::Input group-->


                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">推广1级返佣 (<a
                                            href="https://faka.wiki/#/zh-cn/rebate" target="_blank" style="color: red;">详细教程</a>)</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="promote_rebate_v1"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="推广1级返佣" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['promote_rebate_v1'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">推广2级返佣</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="promote_rebate_v2"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="推广2级返佣" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['promote_rebate_v2'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">推广3级返佣</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="promote_rebate_v3"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="推广3级返佣" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['promote_rebate_v3'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">单次最低充值金额</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="recharge_min"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="单次最低充值金额，0代表不限制，默认10元" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['recharge_min'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">单次最高充值金额</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="recharge_max"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="单次最高充值金额，0代表不限制" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['recharge_max'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label fw-bold fs-6">充值赠送</label>
                                <!--begin::Label-->
                                <!--begin::Label-->
                                <div class="col-lg-8 d-flex align-items-center">
                                    <div class="form-check form-check-solid form-switch fv-row">
                                        <input class="form-check-input w-45px h-30px" type="checkbox"
                                               name="recharge_welfare" value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['recharge_welfare'] == 1) {?>
                                        checked <?php }?>/>
                                        <label class="form-check-label"></label>
                                    </div>
                                </div>
                                <!--begin::Label-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label  fw-bold fs-6">充值赠送配置</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <textarea name="recharge_welfare_config" style="height: 100px;"
                                              class="form-control form-control-lg form-control-solid"
                                              placeholder="配置规则：假如充值100元赠送5元的情况下：
100-5
一行一个规则。"><?php echo $_smarty_tpl->tpl_vars['config']->value['recharge_welfare_config'];?>
</textarea>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label  fw-bold fs-6">客服QQ(主站)</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="service_qq"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="客服QQ" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['service_qq'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label  fw-bold fs-6">网页客服地址(主站)</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="service_url"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="网页客服地址" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['service_url'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">提现方式</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <!--begin::Options-->
                                    <div class="d-flex align-items-center mt-3">
                                        <!--begin::Option-->
                                        <label class="form-check form-check-inline form-check-solid me-5">
                                            <input class="form-check-input" name="cash_type_alipay" type="checkbox"
                                                   value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['cash_type_alipay'] == 1) {?> checked <?php }?>>
                                            <span class="fw-bold ps-2 fs-6">支付宝</span>
                                        </label>
                                        <!--end::Option-->
                                        <!--begin::Option-->
                                        <label class="form-check form-check-inline form-check-solid me-5">
                                            <input class="form-check-input" name="cash_type_wechat" type="checkbox"
                                                   value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['cash_type_wechat'] == 1) {?> checked <?php }?>>
                                            <span class="fw-bold ps-2 fs-6">微信</span>
                                        </label>
                                        <!--end::Option-->
                                        <!--begin::Option-->
                                        <label class="form-check form-check-inline form-check-solid me-5">
                                            <input class="form-check-input" name="cash_type_balance" type="checkbox"
                                                   value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['cash_type_balance'] == 1) {?> checked <?php }?>>
                                            <span class="fw-bold ps-2 fs-6">钱包余额</span>
                                        </label>
                                        <!--end::Option-->
                                    </div>
                                    <!--end::Options-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">提现手续费(单笔固定)</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="cash_cost"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="提现手续费" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['cash_cost'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required  fw-bold fs-6">最低提现金额</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="cash_min"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="最低提现金额" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['cash_min'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label fw-bold fs-6">默认展开分类</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <!--begin::Input-->
                                    <select name="default_category" class="form-select form-select-solid form-select-lg"
                                            data-control="select2" data-hide-search="true">
                                        <option value="0" <?php if ($_smarty_tpl->tpl_vars['config']->value['default_category'] == 0) {?> selected <?php }?>>不展开
                                        </option>
                                        <option value="-10" <?php if ($_smarty_tpl->tpl_vars['config']->value['default_category'] == -10) {?> selected <?php }?>>推荐
                                        </option>
                                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['category']->value, 'cate');
$_smarty_tpl->tpl_vars['cate']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['cate']->value) {
$_smarty_tpl->tpl_vars['cate']->do_else = false;
?>
                                            <option value="<?php echo $_smarty_tpl->tpl_vars['cate']->value['id'];?>
" <?php if ($_smarty_tpl->tpl_vars['config']->value['default_category'] == $_smarty_tpl->tpl_vars['cate']->value['id']) {?> selected <?php }?>><?php echo $_smarty_tpl->tpl_vars['cate']->value['name'];?>
</option>
                                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                    </select>
                                    <!--end::Input-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label fw-bold fs-6">首页商品推荐</label>
                                <!--begin::Label-->
                                <!--begin::Label-->
                                <div class="col-lg-8 d-flex align-items-center">
                                    <div class="form-check form-check-solid form-switch fv-row">
                                        <input class="form-check-input w-45px h-30px" type="checkbox"
                                               name="commodity_recommend"
                                               value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['commodity_recommend'] == 1) {?> checked <?php }?>/>
                                        <label class="form-check-label"></label>
                                    </div>
                                </div>
                                <!--begin::Label-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label  fw-bold fs-6">推荐分类名称</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="commodity_name"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="首页推荐分类名称" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['commodity_name'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                        </div>
                        <!--end::Card body-->
                        <!--begin::Actions-->
                        <div class="card-footer d-flex justify-content-center py-6 px-9">
                            <button type="button" class="btn btn-primary save-data">保存设置 (Save Config)</button>
                        </div>
                        <!--end::Actions-->
                    </form>
                    <!--end::Form-->
                </div>
                <!--end::Content-->
            </div>
            <!--end::Basic info-->
        </div>
        <!--end::Container-->
    </div>
    <!--end::Post-->
</div>
<!--end::Content-->


<?php echo '<script'; ?>
>
    $(function () {

        layui.use(['layer', 'form', 'hex'], function () {
            //substation_display_list
            let hex = layui.hex;
            let table = $("#substation_display_list");
            let substationDisplayList = <?php echo $_smarty_tpl->tpl_vars['config']->value['substation_display_list'];?>
;

            //data-form
            $('.save-data').click(function () {
                let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                $.post("/admin/api/config/other", $("#data-form").serialize(), res => {
                    layer.close(loaderIndex);
                    layer.msg(res.msg);
                });
            });

            //table
            let queryParams = null;
            table.bootstrapTable({
                url: '/admin/api/config/getBusiness',//请求的url地址
                method: "post",//请求方式
                // striped:true,//是否显示行间隔色
                pageSize: 5,//每页显示的数量
                pageList: [5, 25, 50, 100],
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
                        field: 'avatar', title: '商家', formatter: function (val, item) {
                            if (!item.user.avatar) {
                                item.user.avatar = "/favicon.ico";
                            }
                            return '<span class="badge badge-light-dark"><img src="' + item.user.avatar + '"  style="width: 18px;border-radius: 100%;"/> ' + item.user.username + '</span> '
                        }
                    },
                    {
                        field: 'shop_name', title: '店铺名称'
                    },
                    {
                        field: 'subdomain', title: '子域名'
                    },
                    {
                        field: 'topdomain', title: '独立域名'
                    },
                    {
                        field: 'business_level', title: '店铺等级', formatter: function (val, item) {
                            return '<span class="badge badge-light">' + item.user.business_level.name + '</span>';
                        }
                    },
                    {
                        field: 'status', title: '主站显示', formatter: function (val, item) {
                            let html = '';
                            if (substationDisplayList.indexOf(item.user.id) != -1) {
                                html += '<span class="badge badge-light-success">已显示</span>';
                            } else {
                                html += '<span class="badge badge-light-danger">已隐藏</span>';
                            }
                            return html;
                        }
                    },
                    {
                        field: 'operate',
                        title: '操作',
                        formatter: function (val, item) {
                            let html = '';
                            if (substationDisplayList.indexOf(item.user.id) != -1) {
                                html += '<span class="del_substation_display_list" style="cursor: pointer"><i class="fas fa-eye-slash text-danger"></i></span>';
                            } else {
                                html += '<span class="add_substation_display_list"  style="cursor: pointer"><i class="fas fa-eye text-primary"></i></span>';
                            }
                            return html;
                        },
                        events: {
                            'click .add_substation_display_list': function (event, value, row, index) {
                                $.post("/admin/api/config/setSubstationDisplayList", {
                                    id: row.user.id,
                                    type: 0
                                }, res => {
                                    substationDisplayList = res.data;
                                    layer.msg(res.msg);
                                    table.bootstrapTable('refresh', {silent: true});
                                });
                            },
                            'click .del_substation_display_list': function (event, value, row, index) {
                                $.post("/admin/api/config/setSubstationDisplayList", {
                                    id: row.user.id,
                                    type: 1
                                }, res => {
                                    substationDisplayList = res.data;
                                    layer.msg(res.msg);
                                    table.bootstrapTable('refresh', {silent: true});
                                });
                            }
                        }
                    }
                ]
            });
        });
    });
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
