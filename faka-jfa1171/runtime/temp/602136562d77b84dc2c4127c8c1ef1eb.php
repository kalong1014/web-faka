<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:90:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/selectcard.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">功能是否开启</label>
        <div class='col-sm-8'>
            <select name="status" class="layui-input" disabled="disabled" style="background: #e9e9e9">
                <option value="0" <?php if(plugconf('selectcard','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('selectcard','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <label class="col-sm-2 control-label">限制最低选号费（元）</label>
        <div class="col-sm-8">
            <input type="text"  name="selectcard_fee_min"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('selectcard','selectcard_fee_min'); ?>">
            <p class="help-block">限制商家设置的最低选号费</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">选号费平台分成（%）</label>
        <div class="col-sm-8">
            <input type="text"  name="selectcard_fee_platform_rate"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('selectcard','selectcard_fee_platform_rate'); ?>">
            <p class="help-block">与商家分成相加必须等于100</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">选号费商家分成（%）</label>
        <div class="col-sm-8">
            <input type="text"  name="selectcard_fee_merchant_rate"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('selectcard','selectcard_fee_merchant_rate'); ?>">
            <p class="help-block">与平台分成相加必须等于100</p>
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