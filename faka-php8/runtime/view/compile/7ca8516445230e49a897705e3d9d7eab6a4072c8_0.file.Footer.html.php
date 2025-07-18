<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:23:19
  from '/www/wwwroot/webfaka/app/View/Admin/Footer.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3dfd7959728_09042447',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7ca8516445230e49a897705e3d9d7eab6a4072c8' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Footer.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_67f3dfd7959728_09042447 (Smarty_Internal_Template $_smarty_tpl) {
?></div>
<?php echo '<script'; ?>
 src="../../../assets/admin/js/scripts.bundle.js"><?php echo '</script'; ?>
></div>
<!--end::Wrapper-->
</div>
<!--end::Page-->
</div>
<!--end::Root-->

<!--begin::Scrolltop-->
<div id="kt_scrolltop" class="scrolltop" data-kt-scrolltop="true">
    <!--begin::Svg Icon | path: icons/duotune/arrows/arr066.svg-->
    <span class="svg-icon">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
					<rect opacity="0.5" x="13" y="6" width="13" height="2" rx="1" transform="rotate(90 13 6)"
                          fill="black"/>
					<path d="M12.5657 8.56569L16.75 12.75C17.1642 13.1642 17.8358 13.1642 18.25 12.75C18.6642 12.3358 18.6642 11.6642 18.25 11.25L12.7071 5.70711C12.3166 5.31658 11.6834 5.31658 11.2929 5.70711L5.75 11.25C5.33579 11.6642 5.33579 12.3358 5.75 12.75C6.16421 13.1642 6.83579 13.1642 7.25 12.75L11.4343 8.56569C11.7467 8.25327 12.2533 8.25327 12.5657 8.56569Z"
                          fill="black"/>
				</svg>
			</span>
    <!--end::Svg Icon-->
</div>
<!--end::Scrolltop-->
<!--end::Main-->
<?php echo '<script'; ?>
>var hostUrl = "/assets/admin/";<?php echo '</script'; ?>
>
<!--begin::Javascript-->
<!--begin::Global Javascript Bundle(used by all pages)-->
<?php echo '<script'; ?>
 src="/assets/admin/plugins/global/plugins.bundle.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/admin/js/scripts.bundle.js"><?php echo '</script'; ?>
>
<!--end::Global Javascript Bundle-->
<?php echo '<script'; ?>
 src="/assets/static/layui/layui.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/static/modules/xm-select.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/static/clipboard.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/static/wangEditor.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/static/jquery.qrcode.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/static/jquery.pjax.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/static/bootstrap-table/js/bootstrap-table.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/static/bootstrap-table/js/bootstrap-table-zh-CN.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="/assets/static/jsoneditor/jsoneditor.min.js"><?php echo '</script'; ?>
>

<div style="display: none" class="update-modal">
    <div style="padding: 20px;" class="more-table">
        <ul class="layui-timeline version-list">
        </ul>
    </div>
</div>


<style>
    .update-open .layui-layer-content {
        position: relative !important;
        overflow: auto !important;
    }
</style>
<?php echo '<script'; ?>
>
    $(document).pjax('a[target!=_blank]', '#pjax-container', {fragment: '#pjax-container', timeout: 8000}); //#wrap为刷新的id
    $(document).on('pjax:send', function () {
        $(".loading").css("display", "block");
    });

    $(document).on('pjax:complete', function () {
        $(".loading").css("display", "none");
    });

    $("a[target!=_blank]").click(function () {
        $('a[target!=_blank]').removeClass("active");
        $(this).addClass("active");
    });

    layui.config({
        base: '/assets/static/modules/',
        version: "<?php echo $_smarty_tpl->tpl_vars['app']->value['version'];?>
"
    }); //加载入口


    $(function () {
        layui.use(['hex'], function () {
            let cao = layui.hex;

            function latestOpen(res) {
                let loaderIndex = layer.load(2, {shade: ['0.3', '#fff']});
                $.get("/admin/api/app/versions", versions => {
                    layer.close(loaderIndex);
                    if (versions.code != 200) {
                        return;
                    }
                    $('.version-list').html("");
                    versions.data.forEach(item => {
                        let html = '<li class="layui-timeline-item">\n' +
                            '                <i class="layui-icon layui-timeline-axis">&#xe63f;</i>\n' +
                            '                <div class="layui-timeline-content layui-text">\n' +
                            '                    <h3 class="layui-timeline-title" style="color: ' + (item.version == res.data.local ? '#2fcf94' : '#f98ee7') + ';font-weight: bold;">v' + item.version + (item.version == res.data.local ? '◂' : '') + '</h3>\n' +
                            '                    <p>' + item.content + '</p>\n' +
                            '                <p style="margin-top: 10px;color: #867d00;font-size: 12px;">更新朔源：<a href="' + item.update_url + '" target="_blank">update.zip</a></p>\n' +
                            '                <p style="color: #79b39b;font-size: 12px;">' + item.update_date + '</p></div>\n' +
                            '            </li>';

                        $('.version-list').append(html);
                    });

                    layer.open({
                        type: 1,
                        title: '版本更新',
                        content: $('.update-modal').html(),
                        skin: "update-open",
                        area: cao.isPc() ? ["520px", "620px"] : ["100%", "100%"],
                        btn: [res.data.latest ? '你已经是最新版本' : "安全更新至 v" + res.data.version, '取消'],
                        success: () => {
                        },
                        yes: () => {
                            if (res.data.latest) {
                                return;
                            }
                            let loaderIndex = layer.load(2, {shade: ['0.3', '#fff']});
                            $.post("/admin/api/app/update", res => {
                                layer.close(loaderIndex);
                                layer.msg(res.msg);
                                if (res.code == 200) {
                                    setTimeout(() => {
                                        window.location.reload();
                                    }, 1500);
                                }
                            });
                        }
                    });

                });
            }

            $.get("/admin/api/app/latest", res => {
                if (res.code != 200) {
                    $('.latest-update').css("color", "red").html("应用商店连接失败");
                    return;
                }
                $('.local-version').html(res.data.local);
                if (res.data.latest) {
                    $('.latest-version').css("color", "green").html("[ 最新 ]");
                } else {
                    $('.latest-version').css("color", "red").html("[ 更新 v" + res.data.version + " ]");
                    let cache = localStorage.getItem(res.data.version);
                    //第一次检测到版本，主动打开更新窗口
                    if (!cache) {
                        latestOpen(res);
                        localStorage.setItem(res.data.version, true);
                    }
                }

                $('.latest-update').click(function () {
                    latestOpen(res);
                });
            });


            $.get("/admin/api/app/getUpdates", res => {
                if (res.code != 200) {
                    return;
                }

                localStorage.setItem("pluginVersions", JSON.stringify(res.data));
            }); //无感请求插件更新列表

            $('.app-server-select').change(function () {
                let loaderIndex = layer.load(2, {shade: ['0.3', '#fff']});
                $.post("/admin/api/app/setServer", {server: $(this).val()}, res => {
                    layer.close(loaderIndex);
                    layer.msg(res.msg);
                    window.location.reload();
                })
            });
        });
    });


<?php echo '</script'; ?>
>
<!--end::Javascript-->

<div class="loading"
     style="background: #00000033;width: 100%;height: 100%;position: fixed;z-index: 9999999;overflow: hidden;display: none;">
    <div class="loader">
        <div class="dot dot1"></div><!--
  -->
        <div class="dot dot2"></div><!--
  -->
        <div class="dot dot3"></div><!--
  -->
        <div class="dot dot4"></div>
    </div>
</div>
<!--start::HOOK-->
<?php echo hook(\App\Consts\Hook::ADMIN_VIEW_BODY);?>

<!--end::HOOK-->
</body>
<!--end::Body-->
<!--start::HOOK-->
<?php echo hook(\App\Consts\Hook::ADMIN_VIEW_FOOTER);?>

<!--end::HOOK-->
</html><?php }
}
