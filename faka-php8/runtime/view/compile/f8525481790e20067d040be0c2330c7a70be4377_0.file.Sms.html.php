<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:33:32
  from '/www/wwwroot/webfaka/app/View/Admin/Config/Sms.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e23ce06525_39983384',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f8525481790e20067d040be0c2330c7a70be4377' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Config/Sms.html',
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
function content_67f3e23ce06525_39983384 (Smarty_Internal_Template $_smarty_tpl) {
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
                        <h3 class="fw-bolder m-0"><a href="https://dysms.console.aliyun.com/dysms.htm" target="_blank">短信配置</a>
                        </h3>
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
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">短信平台</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <!--begin::Input-->
                                    <select name="platform" class="form-select form-select-solid form-select-lg"
                                            data-control="select2" data-hide-search="true">
                                        <option value="0" <?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] == 0) {?> selected <?php }?>>阿里云</option>
                                        <option value="1" <?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] == 1) {?> selected <?php }?>>腾讯云</option>
                                        <option value="2" <?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] == 2) {?> selected <?php }?>>短信宝</option>
                                    </select>
                                    <!--end::Input-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->


                            <!--begin::Input group-->
                            <div class="row mb-6 aliyun" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 0) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">AccessKeyId</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="accessKeyId"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入accessKeyId" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['accessKeyId'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6 aliyun" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 0) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">AccessKeySecret</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="accessKeySecret"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入accessKeySecret" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['accessKeySecret'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6 aliyun" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 0) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">签名名称</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="signName"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入签名名称" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['signName'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6 aliyun" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 0) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">模版CODE</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="templateCode"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入模板CODE" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['templateCode'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->


                            <!--begin::Input group-->
                            <div class="row mb-6 tencent" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 1) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">secretId</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="tencentSecretId"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入secretId" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['tencentSecretId'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6 tencent" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 1) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">secretKey</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="tencentSecretKey"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入secretKey" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['tencentSecretKey'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6 tencent" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 1) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">sdkAppId</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="tencentSdkAppId"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入sdkAppId" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['tencentSdkAppId'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6 tencent" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 1) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">签名名称</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="tencentSignName"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入签名名称" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['tencentSignName'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6 tencent" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 1) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">模板ID</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="tencentTemplateId"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入模板ID" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['tencentTemplateId'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->


                            <!--begin::Input group-->
                            <div class="row mb-6 dxbao" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 2) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">账号</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="dxbao_username"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入短信宝账号" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['dxbao_username'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6 dxbao" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 2) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">密码</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="dxbao_password"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入短信宝密码" value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['dxbao_password'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6 dxbao" style="<?php if ($_smarty_tpl->tpl_vars['sms']->value['platform'] != 2) {?> display: none; <?php }?>">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">短信模板</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="dxbao_template"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="模板，如：【XXX】您的验证码为{code}，在5分钟内有效。"
                                           value="<?php echo $_smarty_tpl->tpl_vars['sms']->value['dxbao_template'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                        </div>
                        <!--end::Card body-->
                        <!--begin::Actions-->
                        <div class="card-footer d-flex justify-content-center py-6 px-9">
                            <button type="button" class="btn btn-success send-test-message m-1">发送测试短信 (Send Test
                                Message)
                            </button>
                            <button type="button" class="btn btn-primary save-data m-1">保存设置 (Save Config)</button>
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
        layui.use(['layer', 'form'], function () {

            $('select[name=platform]').change(function () {
                let val = $(this).val();
                if (val == 0) {
                    $(".aliyun").show();
                    $(".tencent").hide();
                    $(".dxbao").hide();
                } else if (val == 1) {
                    $(".aliyun").hide();
                    $(".dxbao").hide();
                    $(".tencent").show();
                } else if (val == 2) {
                    $(".aliyun").hide();
                    $(".dxbao").show();
                    $(".tencent").hide();
                }
            });

            //data-form
            $('.save-data').click(function () {
                let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                $.post("/admin/api/config/sms", $("#data-form").serialize(), res => {
                    layer.close(loaderIndex);
                    layer.msg("保存成功");
                });
            });

            $('.send-test-message').click(function () {
                layer.prompt({title: '(国内)手机号', formType: 0}, function (phone, index) {
                    let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                    $.post("/admin/api/config/smsTest", {phone: phone}, res => {
                        layer.close(loaderIndex);
                        if (res.code == 200) {
                            layer.close(index);
                        }
                        layer.msg(res.msg);
                    });
                });

            });
        });
    });
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
