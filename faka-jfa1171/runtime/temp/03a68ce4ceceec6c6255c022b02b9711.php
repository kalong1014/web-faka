<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:85:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/cross.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
                <option value="0" <?php if(plugconf('cross','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('cross','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">使用跨平台功能是否需要申请</label>
        <div class='col-sm-8'>
            <select name="crossauth" class="layui-input">
                <option value="0" <?php if(plugconf('cross','crossauth')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('cross','crossauth')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">开启之后未申请用户无法使用此功能。默认不需要审核</p>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">使用跨平台功能未申请提示</label>
        <div class='col-sm-8'>
            <input type="text"  name="crossauth_tip"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('cross','crossauth_tip'); ?>">
            <p class="help-block">使用跨平台功能未申请提示文字</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">默认赠送商品数量（单位：个）</label>
        <div class='col-sm-8'>
            <input type="text"  name="default_goods_count"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('cross','default_goods_count'); ?>">
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">默认赠送使用时长（单位：天）</label>
        <div class='col-sm-8'>
            <input type="text"  name="default_day_count"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('cross','default_day_count'); ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">加购一个商品价格（单位：元）</label>
        <div class='col-sm-8'>
            <input type="text"  name="default_goods_money"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('cross','default_goods_money'); ?>">
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">加购一天时长价格（单位：元）</label>
        <div class='col-sm-8'>
            <input type="text"  name="default_day_money"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('cross','default_day_money'); ?>">
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <label class="col-sm-2 control-label">平台提示信息</label>
        <div class='col-sm-8'>
            <textarea name="tip" id="" cols="30" rows="5" class="layui-textarea"><?php echo plugconf('cross','tip'); ?></textarea>
            <p class="help-block">商户使用此功能看到的提示信息</p>
        </div>
    </div>

    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
        </div>
    </div>

</form>

<div class="row">
    <div class="col-sm-12 text-center">
        <div class="hr-line-dashed"></div>
        <a class="layui-btn" data-title="申请管理" data-open="<?php echo url('crossAuth'); ?>" href="javascript:void(0)">申请管理</a>
        <a class="layui-btn" data-title="跨平台续费订单" data-open="<?php echo url('crossAuthOrder'); ?>" href="javascript:void(0)">跨平台续费订单</a>
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