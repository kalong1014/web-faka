<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:87:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/shopdiy.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">购卡页DIY功能是否开启</label>
        <div class='col-sm-8'>
            <select name="status" class="layui-input" disabled="disabled" style="background: #e9e9e9">
                <option value="0" <?php if(plugconf('shopdiy','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('shopdiy','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">开启之后商户端将可使用该功能（商户店铺设置->PC支付页面风格会显示“★动态DIY★”）</p>
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
        <a class="layui-btn" data-title="素材管理" data-open="<?php echo url('shopdiyTheme'); ?>" href="javascript:void(0)">素材管理</a>
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