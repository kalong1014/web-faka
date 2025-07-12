<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:85:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/glock.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
                <p style="font-size:16px;" class="text-center"><b>网关锁</b></p>
            </div>
        </div>
    </div>

    <?php if($glock): ?>
    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <span style="color:green"><i class="glyphicon glyphicon-ok"></i> 当前已开启网关锁</span>
        </div>
        <div class="layui-form-item text-center">
            <button class="layui-btn layui-btn-danger" type="submit">立即关闭</button>
        </div>
    </div>
    <?php else: ?>
    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <span style="color:red"><i class="glyphicon glyphicon-remove"></i> 当前未开启网关锁</span>
        </div>
        <div class="layui-form-item text-center">
            <button class="layui-btn layui-btn-normal" type="submit">立即开启</button>
        </div>
    </div>
    <?php endif; ?>
</form>

<div class="form-group">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
            <p style="font-size:14px;" class="text-center">独家多层加密保护，后台、数据库篡改网关接口、收款参数将会中断下单并发送提醒到管理员邮箱。</p>
            <p style="font-size:14px;" class="text-center"><b>如何关闭网关锁？请使用鲸发卡工具箱进行关闭，文档地址：</b><a href="http://docs.jingfaka.com" target="_blank">http://docs.jingfaka.com</a></p>
            <p style="font-size:14px;" class="text-center">温馨提示：开发接口、后台添加网关、添加网关账号请先关闭网关锁</p>
        </div>
    </div>
</div>

<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
</script>

    </div>
    
</div>