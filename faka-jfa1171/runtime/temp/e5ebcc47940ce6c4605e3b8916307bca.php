<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:88:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/lockcard.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
            <select name="status" class="layui-input" >
                <option value="0" <?php if(plugconf('lockcard','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('lockcard','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>

    <div class="hr-line-dashed"></div>


    <div class="form-group">
        <label class="col-sm-2 control-label">锁卡时间（单位秒）</label>
        <div class="col-sm-8">
            <input type="number"  name="lock_time"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('lockcard','lock_time'); ?>">
            <p class="help-block">锁卡时间,至少10分钟，即600秒</p>
        </div>
    </div>

    
    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
        </div>
    </div>

</form>



<div class="form-group" style="margin-top:20px">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
            <p style="font-size:14px;" class="text-center">锁卡机制可以防止卡密超售，但其缺点如有买家恶意下单会锁定大量卡造成其他用户无卡可买！可与支付风控策略下单防CC配合使用。</p>
        </div>
    </div>
</div>



<script>
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });


</script>

    </div>
    
</div>