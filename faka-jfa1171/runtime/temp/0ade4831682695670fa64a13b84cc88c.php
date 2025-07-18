<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:83:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/app.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
<div class="ibox">
    
    <?php if(isset($title)): ?>
    <div class="ibox-title notselect">
        <h5><?php echo $title; ?></h5>
        
    </div>
    <?php endif; ?>
    <div class="ibox-content">
        <?php if(isset($alert)): ?>
        <div class="alert alert-<?php echo $alert['type']; ?> alert-dismissible" role="alert" style="border-radius:0">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <?php if(isset($alert['title'])): ?><p style="font-size:18px;padding-bottom:10px"><?php echo $alert['title']; ?></p><?php endif; if(isset($alert['content'])): ?><p style="font-size:14px"><?php echo $alert['content']; ?></p><?php endif; ?>
        </div>
        <?php endif; ?>
        




<form onsubmit="return false;" action="__SELF__" data-auto="true" method="post" class='form-horizontal' >
    <div class="form-group">
        <div class='col-sm-8 col-sm-offset-2'>
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:18px;" class="text-center">APP打包</p>
                <p style="font-size:14px;" class="text-center">第一步：前往 系统管理->网站参数 移动端首页主题设置为"app"</p>
                <p style="font-size:14px;" class="text-center">第二步：进行APP打包，打包教程<a target="_blank" href="http://docs.jingfaka.com/">http://docs.jingfaka.com/</a></p>
                <p style="font-size:14px;" class="text-center">第三步：在下方上传打包好的安装包</p>

            </div>
        </div>
    </div>


    <div class="form-group">
        <div class='col-sm-8 col-sm-offset-2'>
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center">展示下载页</p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">APP下载页：</label>
        <div class="col-sm-8">
            <input type="text" autocomplete="off" class="layui-input" disabled="disabled" style="background: #e9e9e9" value="<?php echo url('index/plugin/appdown'); ?>">
            <p class="help-block">可以添加在前台导航展示（系统管理->系统配置->前台导航）</p>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">Android安装包APK </label>
        <div class='col-sm-8'>
            <input type="text" name="android"  value="<?php echo plugconf('app','android'); ?>" class="layui-input">
            <a class="btn btn-link" data-file="one" data-type="apk,ipa" data-field="android">上传安装包</a>
            <span>请上传apk格式安装包</span>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">IOS安装包IPA </label>
        <div class='col-sm-8'>
            <input type="text" name="ios"  value="<?php echo plugconf('app','ios'); ?>" class="layui-input">
            <a class="btn btn-link" data-file="one" data-type="apk,ipa" data-field="ios">上传安装包</a>
            <span>请上传ipa格式安装包</span>
        </div>
    </div>


    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
        </div>
    </div>

</form>


<script>
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });
</script>

    </div>
    
</div>