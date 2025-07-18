<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:23:29
  from '/www/wwwroot/webfaka/app/View/Admin/Manage/Set.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3dfe1187e06_70834923',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fd09fbcac461ac8bccec62163e025cfcc8de8525' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Manage/Set.html',
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
function content_67f3dfe1187e06_70834923 (Smarty_Internal_Template $_smarty_tpl) {
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
        <!--begin::Content-->
        <div id="kt_account_profile_details" class="collapse show">
          <!--begin::Form-->
          <form id="data-form" class="form">
            <!--begin::Card body-->
            <div class="card-body border-top p-9">
              <!--begin::Input group-->
              <div class="row mb-6">
                <!--begin::Label-->
                <label class="col-lg-4 col-form-label fw-bold fs-6">头像</label>
                <!--end::Label-->
                <!--begin::Col-->
                <div class="col-lg-8">
                  <!--begin::Image input-->
                  <div class="image-input image-input-outline" data-kt-image-input="true"
                       style="background-image: url(/assets/admin/images/setting/blank.png)">
                    <!--begin::Preview existing logo-->
                    <div class="image-input-wrapper w-125px h-125px"
                         style="background-image: url('<?php if ($_smarty_tpl->tpl_vars['user']->value['avatar']) {
echo $_smarty_tpl->tpl_vars['user']->value['avatar'];
} else { ?>/favicon.ico<?php }?>')"></div>
                    <!--end::Preview existing logo-->
                    <!--begin::Label-->
                    <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                           data-kt-image-input-action="change" data-bs-toggle="tooltip"
                           title="Change logo">
                      <i class="fas fa-pen"></i>
                      <!--begin::Inputs-->
                      <input type="file" class="upload-logo"
                             accept=".png, .jpg, .jpeg, .ico"/>
                      <input type="hidden" name="avatar" value="<?php echo $_smarty_tpl->tpl_vars['user']->value['avatar'];?>
"/>
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
                  <div class="form-text">支持文件格式: png, jpg, jpeg, ico.</div>
                  <!--end::Hint-->
                </div>
                <!--end::Col-->
              </div>
              <!--end::Input group-->

              <!--begin::Input group-->
              <div class="row mb-6">
                <!--begin::Label-->
                <label class="col-lg-4 col-form-label required fw-bold fs-6">呢称</label>
                <!--end::Label-->
                <!--begin::Col-->
                <div class="col-lg-8 fv-row">
                  <input type="text" name="nickname"
                         class="form-control form-control-lg form-control-solid"
                         placeholder="呢称" value="<?php echo $_smarty_tpl->tpl_vars['user']->value['nickname'];?>
"/>
                </div>
                <!--end::Col-->
              </div>
              <!--end::Input group-->

              <!--begin::Input group-->
              <div class="row mb-6">
                <!--begin::Label-->
                <label class="col-lg-4 col-form-label  fw-bold fs-6">旧密码</label>
                <!--end::Label-->
                <!--begin::Col-->
                <div class="col-lg-8 fv-row">
                  <input type="password" name="old_password"
                         class="form-control form-control-lg form-control-solid"
                         placeholder="不修改请留空" value=""/>
                </div>
                <!--end::Col-->
              </div>
              <!--end::Input group-->


              <!--begin::Input group-->
              <div class="row mb-6">
                <!--begin::Label-->
                <label class="col-lg-4 col-form-label  fw-bold fs-6">新密码</label>
                <!--end::Label-->
                <!--begin::Col-->
                <div class="col-lg-8 fv-row">
                  <input type="password" name="password"
                         class="form-control form-control-lg form-control-solid"
                         placeholder="不修改请留空" value=""/>
                </div>
                <!--end::Col-->
              </div>
              <!--end::Input group-->

              <!--begin::Input group-->
              <div class="row mb-6">
                <!--begin::Label-->
                <label class="col-lg-4 col-form-label  fw-bold fs-6">确认新密码</label>
                <!--end::Label-->
                <!--begin::Col-->
                <div class="col-lg-8 fv-row">
                  <input type="password" name="re_password"
                         class="form-control form-control-lg form-control-solid"
                         placeholder="不修改请留空" value=""/>
                </div>
                <!--end::Col-->
              </div>
              <!--end::Input group-->


            </div>
            <!--end::Card body-->
            <!--begin::Actions-->
            <div class="card-footer d-flex justify-content-center py-6 px-9">
              <button type="button" class="btn btn-light-primary save-data" style="margin-right: 20px;"><i class="fas fa-save"></i> 确认修改</button>
              <a href="/admin/authentication/logout" type="button" class="btn btn-light-danger logout"><i class="fas fa-sign-out-alt"></i> 注销登录</a>
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
              layer.msg('头像上传成功，但需要保存后才会生效哦~');
              $('input[name=avatar]').val(res.data.path);
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
      $('.save-data').click(function (){
        let loaderIndex = layer.load(0, {shade: ['0.3', '#fff']});
        $.post("/admin/api/manage/set",$("#data-form").serialize() , res => {
          layer.close(loaderIndex);
          layer.msg(res.msg);
        });
      });
    });
  });
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
