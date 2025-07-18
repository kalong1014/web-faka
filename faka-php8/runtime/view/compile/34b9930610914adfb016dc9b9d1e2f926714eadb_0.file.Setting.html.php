<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:28:17
  from '/www/wwwroot/webfaka/app/View/Admin/Config/Setting.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e1017d3e56_50373024',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '34b9930610914adfb016dc9b9d1e2f926714eadb' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Config/Setting.html',
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
function content_67f3e1017d3e56_50373024 (Smarty_Internal_Template $_smarty_tpl) {
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
        <div id="kt_content_container" class="container-xxl">
            <!--begin::Basic info-->
            <div class="card mb-5 mb-xl-10">
                <!--begin::Card header-->
                <div class="card-header border-0 cursor-pointer">
                    <!--begin::Card title-->
                    <div class="card-title m-0">
                        <h3 class="fw-bolder m-0">基本设置</h3>
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
                                <label class="col-lg-4 col-form-label fw-bold fs-6">LOGO</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8">
                                    <!--begin::Image input-->
                                    <div class="image-input image-input-outline" data-kt-image-input="true"
                                         style="background-image: url(/assets/admin/images/setting/blank.png)">
                                        <!--begin::Preview existing logo-->
                                        <div class="image-input-wrapper w-125px h-125px"
                                             style="background-image: url(/favicon.ico)"></div>
                                        <!--end::Preview existing logo-->
                                        <!--begin::Label-->
                                        <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                               data-kt-image-input-action="change" data-bs-toggle="tooltip"
                                               title="Change logo">
                                            <i class="fas fa-pen"></i>
                                            <!--begin::Inputs-->
                                            <input type="file" class="upload-logo"
                                                   accept=".png, .jpg, .jpeg, .ico"/>
                                            <input type="hidden" name="logo" value="/favicon.ico"/>
                                            <!--end::Inputs-->
                                        </label>
                                        <!--end::Label-->
                                        <!--begin::Cancel-->
                                        <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                              data-kt-image-input-action="cancel" data-bs-toggle="tooltip"
                                              title="Cancel logo">
																<i class="bi bi-x fs-2"></i>
															</span>
                                        <!--end::Cancel-->
                                        <!--begin::Remove-->
                                        <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                              data-kt-image-input-action="remove" data-bs-toggle="tooltip"
                                              title="Remove logo">
																<i class="far fa-trash-alt"></i>
															</span>
                                        <!--end::Remove-->
                                    </div>
                                    <!--end::Image input-->
                                    <!--begin::Hint-->
                                    <div class="form-text">支持文件格式: png, jpg, jpeg, ico，更换后，记得强制刷新浏览器，否则你看到的还是缓存。</div>
                                    <!--end::Hint-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">PC模板</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-6 fv-row">
                                    <!--begin::Input-->
                                    <select name="user_theme" class="form-select form-select-solid form-select-lg"
                                            data-control="select2" data-hide-search="true">
                                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['themes']->value, 'theme');
$_smarty_tpl->tpl_vars['theme']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['theme']->value) {
$_smarty_tpl->tpl_vars['theme']->do_else = false;
?>
                                            <option value="<?php echo $_smarty_tpl->tpl_vars['theme']->value['info']['KEY'];?>
" <?php if ($_smarty_tpl->tpl_vars['theme']->value['info']['KEY'] == $_smarty_tpl->tpl_vars['config']->value['user_theme']) {?>
                                            selected <?php }?>><?php echo $_smarty_tpl->tpl_vars['theme']->value['info']['NAME'];?>
 (v<?php echo $_smarty_tpl->tpl_vars['theme']->value['info']['VERSION'];?>
)
                                            </option>
                                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                    </select>
                                    <!--end::Input-->
                                </div>
                                <div class="col-lg-2 fv-row">
                                    <!--begin::Input-->
                                    <button type="button" class="btn btn-light theme-setting"><i
                                                class="fas fa-cogs"></i> 模板设置
                                    </button>
                                    <!--end::Input-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">手机模板</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-6 fv-row">
                                    <!--begin::Input-->
                                    <select name="user_mobile_theme"
                                            class="form-select form-select-solid form-select-lg"
                                            data-control="select2" data-hide-search="true">
                                        <option value="0" <?php if ("0" == $_smarty_tpl->tpl_vars['config']->value['user_mobile_theme']) {?>selected <?php }?>>跟随PC模板
                                        </option>
                                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['themes']->value, 'theme');
$_smarty_tpl->tpl_vars['theme']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['theme']->value) {
$_smarty_tpl->tpl_vars['theme']->do_else = false;
?>
                                            <option value="<?php echo $_smarty_tpl->tpl_vars['theme']->value['info']['KEY'];?>
" <?php if ($_smarty_tpl->tpl_vars['theme']->value['info']['KEY'] == $_smarty_tpl->tpl_vars['config']->value['user_mobile_theme']) {?>
                                            selected <?php }?>><?php echo $_smarty_tpl->tpl_vars['theme']->value['info']['NAME'];?>
 (v<?php echo $_smarty_tpl->tpl_vars['theme']->value['info']['VERSION'];?>
)
                                            </option>
                                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                    </select>
                                    <!--end::Input-->
                                </div>
                                <div class="col-lg-2 fv-row">
                                    <!--begin::Input-->
                                    <button type="button" class="btn btn-light theme-mobile-setting"><i
                                                class="fas fa-cogs"></i> 模板设置
                                    </button>
                                    <!--end::Input-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">PC背景图片(支持http地址或者图床api)</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-6 fv-row">
                                    <input type="text" name="background_url"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入背景图床地址，可以是url" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['background_url'];?>
"/>
                                </div>
                                <div class="col-lg-2 fv-row">
                                    <!--begin::Input-->
                                    <input type="file" class="background-upload" style="display: none;"
                                           accept=".png, .jpg, .jpeg, .gif"/>
                                    <button type="button" class="btn btn-light background-upload"
                                            onclick="document.getElementsByClassName('background-upload')[0].click();">
                                        <i class="fas fa-cloud-upload-alt"></i> 上传图片
                                    </button>
                                    <!--end::Input-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">手机背景图片</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-6 fv-row">
                                    <input type="text" name="background_mobile_url"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="不设置则使用PC版配置" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['background_mobile_url'];?>
"/>
                                </div>
                                <div class="col-lg-2 fv-row">
                                    <!--begin::Input-->
                                    <input type="file" class="background-mobile-upload" style="display: none;"
                                           accept=".png, .jpg, .jpeg, .gif"/>
                                    <button type="button" class="btn btn-light background-mb-upload"
                                            onclick="document.getElementsByClassName('background-mobile-upload')[0].click();">
                                        <i class="fas fa-cloud-upload-alt"></i> 上传图片
                                    </button>
                                    <!--end::Input-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">店铺名称</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="shop_name"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入店铺名称" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['shop_name'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">网站标题</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="title"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入网站标题" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['title'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label  fw-bold fs-6">关键词</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="text" name="keywords"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入网站关键词" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['keywords'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label  fw-bold fs-6">网站描述</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <textarea name="description"
                                              class="form-control form-control-lg form-control-solid"
                                              placeholder="请输入网站描述"><?php echo $_smarty_tpl->tpl_vars['config']->value['description'];?>
</textarea>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label  fw-bold fs-6">店铺公告</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <textarea style="display: none;" name="notice" class="notice-textarea"></textarea>
                                    <div style="">
                                        <button data-type="0" class="button-switch-html" type="button"
                                                style="width: 100%;border: none;background: white;border-radius: 5px 5px 0 0;color: #c9b8b8;">
                                            <i class="fas fa-code" style="color: #c9b8b8;"></i> HTML
                                        </button>
                                    </div>
                                    <div class="notice-div"><?php echo $_smarty_tpl->tpl_vars['config']->value['notice'];?>
</div>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">注册方式</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <!--begin::Input-->
                                    <select name="registered_type" class="form-select form-select-solid form-select-lg"
                                            data-control="select2" data-hide-search="true">
                                        <option value="0" <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_type'] == 0) {?> selected <?php }?>>用户名</option>
                                        <option value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_type'] == 1) {?> selected <?php }?>>用户名+手机
                                        </option>
                                        <option value="2" <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_type'] == 2) {?> selected <?php }?>>用户名+邮箱
                                        </option>
                                    </select>
                                    <!--end::Input-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label fw-bold fs-6">注册验证码</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <!--begin::Options-->
                                    <div class="d-flex align-items-center mt-3">
                                        <!--begin::Option-->
                                        <label class="form-check form-check-inline form-check-solid me-5">
                                            <input class="form-check-input" name="registered_verification"
                                                   type="checkbox"
                                                   value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_verification'] == 1) {?> checked <?php }?>>
                                            <span class="fw-bold ps-2 fs-6">人机验证</span>
                                        </label>
                                        <!--end::Option-->
                                        <!--begin::Option-->
                                        <label class="form-check form-check-inline form-check-solid">
                                            <input class="form-check-input" name="registered_phone_verification"
                                                   type="checkbox"
                                                   value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_phone_verification'] == 1) {?> checked <?php }?>>
                                            <span class="fw-bold ps-2 fs-6">手机验证码</span>
                                        </label>
                                        <!--end::Option-->
                                        <!--begin::Option-->
                                        <label class="form-check form-check-inline form-check-solid">
                                            <input class="form-check-input" name="registered_email_verification"
                                                   type="checkbox"
                                                   value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_email_verification'] == 1) {?> checked <?php }?>>
                                            <span class="fw-bold ps-2 fs-6">邮箱验证码</span>
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
                                <label class="col-lg-4 col-form-label fw-bold fs-6">其他验证码</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <!--begin::Options-->
                                    <div class="d-flex align-items-center mt-3">
                                        <!--begin::Option-->
                                        <label class="form-check form-check-inline form-check-solid me-5">
                                            <input class="form-check-input" name="login_verification" type="checkbox"
                                                   value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['login_verification'] == 1) {?> checked <?php }?>>
                                            <span class="fw-bold ps-2 fs-6">登录验证码</span>
                                        </label>
                                        <!--end::Option-->
                                        <!--begin::Option-->
                                        <label class="form-check form-check-inline form-check-solid me-5">
                                            <input class="form-check-input" name="trade_verification" type="checkbox"
                                                   value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['trade_verification'] == 1) {?> checked <?php }?>>
                                            <span class="fw-bold ps-2 fs-6">下单验证码</span>
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
                                <label class="col-lg-4 col-form-label fw-bold fs-6">注册开关</label>
                                <!--begin::Label-->
                                <!--begin::Label-->
                                <div class="col-lg-8 d-flex align-items-center">
                                    <div class="form-check form-check-solid form-switch fv-row">
                                        <input class="form-check-input w-45px h-30px" type="checkbox"
                                               name="registered_state"
                                               value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['registered_state'] == 1) {?> checked <?php }?>/>
                                        <label class="form-check-label"></label>
                                    </div>
                                </div>
                                <!--begin::Label-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label  fw-bold fs-6">注册用户名长度</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <input type="number" name="username_len"
                                           class="form-control form-control-lg form-control-solid"
                                           placeholder="请输入限制注册用户名长度" value="<?php echo $_smarty_tpl->tpl_vars['config']->value['username_len'];?>
"/>
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->


                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label required fw-bold fs-6">找回密码方式</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <!--begin::Input-->
                                    <select name="forget_type" class="form-select form-select-solid form-select-lg"
                                            data-control="select2" data-hide-search="true">
                                        <option value="0" <?php if ($_smarty_tpl->tpl_vars['config']->value['forget_type'] == 0) {?> selected <?php }?>>邮箱验证码</option>
                                        <option value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['forget_type'] == 1) {?> selected <?php }?>>手机验证码</option>
                                    </select>
                                    <!--end::Input-->
                                </div>
                                <!--end::Col-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label fw-bold fs-6">店铺维护</label>
                                <!--begin::Label-->
                                <!--begin::Label-->
                                <div class="col-lg-8 d-flex align-items-center">
                                    <div class="form-check form-check-solid form-switch fv-row">
                                        <input class="form-check-input w-45px h-30px" type="checkbox"
                                               name="closed" value="1" <?php if ($_smarty_tpl->tpl_vars['config']->value['closed'] == 1) {?> checked <?php }?>/>
                                        <label class="form-check-label"></label>
                                    </div>
                                </div>
                                <!--begin::Label-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Input group-->
                            <div class="row mb-6">
                                <!--begin::Label-->
                                <label class="col-lg-4 col-form-label  fw-bold fs-6">店铺维护公告</label>
                                <!--end::Label-->
                                <!--begin::Col-->
                                <div class="col-lg-8 fv-row">
                                    <textarea name="closed_message"
                                              class="form-control form-control-lg form-control-solid"
                                              placeholder="请输入店铺维护公告"><?php echo $_smarty_tpl->tpl_vars['config']->value['closed_message'];?>
</textarea>
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
        let themesRef = <?php echo json_encode($_smarty_tpl->tpl_vars['themes']->value);?>
;
        let themes = {};
        themesRef.forEach(item => {
            themes[item.info.KEY] = item;
        });

        layui.use(['layer', 'form', 'hex'], function () {
            let cao = layui.hex;
            let uploadUrl = "/admin/api/upload/handle";
            let editorInstance = window.wangEditor;
            const editor = new editorInstance('.notice-div');
            const $textarea = $(".notice-textarea");
            editor.config.onchange = function (html) {
                console.log(html);
                $textarea.val(html);
            }
            editor.config.uploadFileName = 'file';
            editor.config.uploadImgServer = uploadUrl;
            editor.config.uploadImgMaxLength = 1;
            editor.config.uploadImgHooks = {
                customInsert: function (insertImgFn, result) {
                    insertImgFn(result.data.path);
                }
            }
            editor.config.uploadVideoServer = uploadUrl;
            editor.config.uploadVideoName = 'file'
            editor.config.uploadVideoHooks = {
                customInsert: function (insertVideoFn, result) {
                    insertVideoFn(result.data.path)
                }
            }

            editor.create();
            $textarea.val(editor.txt.html());

            //----------------
            let noticeDiv = $('.notice-div');
            noticeDiv.find(".w-e-toolbar").css("border", "none");
            noticeDiv.find(".w-e-text-container").css("border", "none");

            $('.button-switch-html').click(function () {
                let type = $(this).attr("data-type");
                if (type == 0) {
                    noticeDiv.hide();
                    $(this).attr("data-type", 1);
                    $(this).html('<i class="fas fa-feather" style="color: #c9b8b8;"></i> ' + "写作");
                    //创建临时HTML编辑器
                    noticeDiv.parent().append('<textarea class="textarea-temp"></textarea>');
                    let optd = {
                        mode: "text/html",
                        lineNumbers: true,
                        lineWrapping: true,
                        extraKeys: {
                            "Ctrl-Q": function (cm) {
                                cm.foldCode(cm.getCursor());
                            }
                        },
                        foldGutter: true,
                        gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
                    };
                    tmp = CodeMirror.fromTextArea($('.textarea-temp').get(0), optd);
                    tmp.setValue(editor.txt.html());
                    tmp.on("change", function () {
                        let html = tmp.getValue();
                        $textarea.val(html);
                    });
                } else {
                    let html = tmp.getValue();
                    editor.txt.html(html);
                    noticeDiv.show();
                    noticeDiv.parent().find(".CodeMirror").remove();
                    $('.textarea-temp').remove();
                    $(this).attr("data-type", 0);
                    $(this).html('<i class="fas fa-code" style="color: #c9b8b8;"></i> ' + "HTML");
                }
            });
            //----------------------

            let hex = layui.hex;
            $('.upload-logo').change(function () {
                let formdata = new FormData();
                formdata.append("file", $('.upload-logo')[0].files[0]);
                let index = layer.load(1, {
                    shade: [0.3, '#fff']
                });
                $.ajax({
                    type: "POST",
                    url: "/admin/api/upload/handle",
                    data: formdata,
                    contentType: false, // 不设置内容类型
                    processData: false, // 不处理数据
                    dataType: "json",
                    success: function (res) {
                        layer.close(index);
                        if (res.code == 200) {
                            layer.msg('图标上传成功，但需要保存后才会生效哦~');
                            $('input[name=logo]').val(res.data.path);
                        } else {
                            layer.msg(res.msg);
                        }
                    },
                    error: function (data) {
                        layer.close(index);
                        layer.msg('上传失败');
                    }
                });
            });

            $('.background-upload').change(function () {
                let formdata = new FormData();
                formdata.append("file", $(this)[0].files[0]);
                let index = layer.load(1, {
                    shade: [0.3, '#fff']
                });
                $.ajax({
                    type: "POST",
                    url: "/admin/api/upload/handle",
                    data: formdata,
                    contentType: false, // 不设置内容类型
                    processData: false, // 不处理数据
                    dataType: "json",
                    success: function (res) {
                        layer.close(index);
                        if (res.code == 200) {
                            layer.msg('背景图片上传成功，需要保存才会生效哦。');
                            $('input[name=background_url]').val(res.data.path);
                        } else {
                            layer.msg(res.msg);
                        }
                    },
                    error: function (data) {
                        layer.close(index);
                        layer.msg('上传失败');
                    }
                });
            });

            $('.background-mobile-upload').change(function () {
                let formdata = new FormData();
                formdata.append("file", $(this)[0].files[0]);
                let index = layer.load(1, {
                    shade: [0.3, '#fff']
                });
                $.ajax({
                    type: "POST",
                    url: "/admin/api/upload/handle",
                    data: formdata,
                    contentType: false, // 不设置内容类型
                    processData: false, // 不处理数据
                    dataType: "json",
                    success: function (res) {
                        layer.close(index);
                        if (res.code == 200) {
                            layer.msg('手机背景图片上传成功，需要保存才会生效哦。');
                            $('input[name=background_mobile_url]').val(res.data.path);
                        } else {
                            layer.msg(res.msg);
                        }
                    },
                    error: function (data) {
                        layer.close(index);
                        layer.msg('上传失败');
                    }
                });
            });

            //data-form
            $('.save-data').click(function () {
                let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
                $.post("/admin/api/config/setting", $("#data-form").serialize(), res => {
                    layer.close(loaderIndex);
                    layer.msg(res.msg);
                });
            });

            let modal = (values = {}) => {
                if (values.submit.length == 0) {
                    layer.msg("该模板暂时没有可设置的选项");
                    return;
                }

                values.setting.id = values.info.KEY;

                cao.popup('/admin/api/plugin/setThemeConfig', values.submit, res => {
                    window.location.reload();
                }, values.setting, "660px", false, "模板设置");
            }

            $('.theme-setting').click(function () {
                let userTheme = $('select[name=user_theme]').val();
                modal(themes[userTheme]);
            });

            $('.theme-mobile-setting').click(function () {
                let userTheme = $('select[name=user_mobile_theme]').val();
                if (userTheme == 0) {
                    layer.msg("没有模板可以设置哦，请不要瞎点(>_<)");
                    return;
                }
                modal(themes[userTheme]);
            });
        });
    });
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
