<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:82:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/site/info.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        
<form onsubmit="return false;" action="__SELF__" data-auto="true" method="post" class='form-horizontal' style='padding-top:20px'>

    <div class="form-group">
        <label class="col-sm-2 control-label">客服电话</label>
        <div class='col-sm-8'>
            <input type="text" name="site_info_tel" required="required" title="请输入客服电话" placeholder="请输入客服电话" value="<?php echo sysconf('site_info_tel'); ?>"
                class="layui-input">
            <p class="help-block">客服电话</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">客服电话描述</label>
        <div class='col-sm-8'>
            <textarea class="layui-textarea" cols="30" rows="2" name="site_info_tel_desc" placeholder="客服电话描述"
                autocomplete="off"><?php echo sysconf('site_info_tel_desc'); ?></textarea>
            <p class="help-block">客服电话</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">客服QQ</label>
        <div class='col-sm-8'>
            <input type="text" name="site_info_qq" required="required" title="请输入客服QQ" placeholder="请输入客服QQ" value="<?php echo sysconf('site_info_qq'); ?>"
                class="layui-input">
            <p class="help-block">客服QQ</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">客服QQ描述</label>
        <div class='col-sm-8'>
            <textarea class="layui-textarea" cols="30" rows="2" name="site_info_qq_desc" placeholder="客服QQ描述"
                autocomplete="off"><?php echo sysconf('site_info_qq_desc'); ?></textarea>
            <p class="help-block">客服QQ</p>
        </div>
    </div>




    <div class="form-group">
        <label class="col-sm-2 control-label">联系地址</label>
        <div class='col-sm-8'>
            <input type="text" name="site_info_address" required="required" title="请输入联系地址" placeholder="请输入联系地址" value="<?php echo sysconf('site_info_address'); ?>"
                class="layui-input">
            <p class="help-block">联系地址</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">客服邮箱</label>
        <div class='col-sm-8'>
            <input type="text" name="site_info_email" required="required" title="请输入客服邮箱" placeholder="请输入客服邮箱" value="<?php echo sysconf('site_info_email'); ?>"
                class="layui-input">
            <p class="help-block">客服邮箱</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">版权信息</label>
        <div class='col-sm-8'>
            <input type="text" name="site_info_copyright" required="required" title="请输入版权信息" placeholder="请输入版权信息"
                value="<?php echo sysconf('site_info_copyright'); ?>" class="layui-input">
            <p class="help-block">版权信息</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">备案号码</label>
        <div class='col-sm-8'>
            <input type="text" name="site_info_icp" required="required" title="请输入备案号码" placeholder="请输入备案号码" value="<?php echo sysconf('site_info_icp'); ?>"
                class="layui-input">
            <p class="help-block">备案号码</p>
        </div>
    </div>

 
    <div class="hr-line-dashed"></div>

    <div class="col-sm-4 col-sm-offset-2">
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