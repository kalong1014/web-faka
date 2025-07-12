<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:86:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/oauth2.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center">微信登录</p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">商户开启</label>
        <div class='col-sm-8'>
            <select name="wechat_open_merchant" class="layui-input" >
                <option value="0" <?php if(plugconf('oauth2','wechat_open_merchant')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('oauth2','wechat_open_merchant')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">微信 appid</label>
        <div class="col-sm-8">
            <input type="text" name="wechat_open_appid"  title="请输入appid" placeholder="请输入appid"  class="layui-input" value="<?php echo plugconf('oauth2','wechat_open_appid'); ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">微信 secret</label>
        <div class="col-sm-8">
            <input type="text" name="wechat_open_secret"  title="请输入secret" placeholder="请输入secret"  class="layui-input" value="<?php echo plugconf('oauth2','wechat_open_secret'); ?>">
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">微信回调域</label>
        <div class="col-sm-8">
            <input type="text" name="wechat_open_callback" disabled="disabled" style="background: #e9e9e9" title="请输入微信回调域" placeholder="请输入微信回调域"  value="<?php echo input('server.SERVER_NAME'); ?>"  class="layui-input">
            <p class="help-block">微信回调域，申请时候使用，申请地址https://open.weixin.qq.com/</p>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center">QQ登录</p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">商户开启</label>
        <div class='col-sm-8'>
            <select name="qq_open_merchant" class="layui-input" >
                <option value="0" <?php if(plugconf('oauth2','qq_open_merchant')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('oauth2','qq_open_merchant')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">应用选择</label>
        <div class='col-sm-8'>
            <select name="qq_open_public" class="layui-input" >
                <option value="1" <?php if(plugconf('oauth2','qq_open_public')=='1'): ?>selected<?php endif; ?>>使用Uomg公用应用</option>
                <option value="0" <?php if(plugconf('oauth2','qq_open_public')=='0'): ?>selected<?php endif; ?>>使用自定义应用</option>
            </select>
        </div>
    </div>

    <div class="form-group qq_diy" <?php if(plugconf('oauth2','qq_open_public')=='1'||plugconf('oauth2','qq_open_public')==""): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">QQ appid</label>
        <div class="col-sm-8">
            <input type="text" name="qq_open_appid" title="请输入appid" placeholder="请输入appid" value="<?php echo plugconf('oauth2','qq_open_appid'); ?>" class="layui-input">
        </div>
    </div>

    <div class="form-group qq_diy" <?php if(plugconf('oauth2','qq_open_public')=='1'||plugconf('oauth2','qq_open_public')==""): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">QQ secret</label>
        <div class="col-sm-8">
            <input type="text" name="qq_open_secret" title="请输入secret" placeholder="请输入secret" value="<?php echo plugconf('oauth2','qq_open_secret'); ?>" class="layui-input">
        </div>
    </div>


    <div class="form-group ">
        <label class="col-sm-2 control-label">QQ回调地址</label>
        <div class="col-sm-8">
            <input type="text" name="qq_open_callback" disabled="disabled" style="background: #e9e9e9"  title="请输入QQ回调地址" value="<?php echo url('index/user/qqToken'); ?>"  class="layui-input">
            <p class="help-block">QQ回调地址，申请时候使用，申请地址https://connect.qq.com/</p>
        </div>
    </div>


    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
        </div>
    </div>

</form>



<script>

    $('[name="qq_open_public"]').change(function () {
        if ($(this).val() == 1) {
            $('.qq_diy').slideUp();
        } else {
            $('.qq_diy').slideDown();
        }
    });

    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });
</script>

    </div>
    
</div>