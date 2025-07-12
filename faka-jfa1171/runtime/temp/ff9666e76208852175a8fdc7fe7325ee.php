<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:85:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/tools.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        

<div class="form-group">
    <div class='col-sm-8 col-sm-offset-2'>
        <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
            <p style="font-size:16px;" class="text-center"><b>站长工具箱（陆续新增中....）</b></p>
        </div>
    </div>
</div>

<div class="col-sm-12">
    <div class="layui-form-item text-center">
        <a class="layui-btn layui-btn-normal" data-title="数据删除" data-open="<?php echo url('toolsDataclear'); ?>" href="javascript:void(0)">数据删除</a>
    </div>
</div>

<div class="col-sm-12">
    <div class="layui-form-item text-center">
        <a class="layui-btn layui-btn-normal" data-title="用户清理" data-open="<?php echo url('toolsUserclear'); ?>" href="javascript:void(0)">用户清理</a>
    </div>
</div>


<div class="col-sm-12">
    <div class="layui-form-item text-center">
        <a class="layui-btn layui-btn-normal" data-title="用户清理" data-open="<?php echo url('toolsSystemclear'); ?>" href="javascript:void(0)">系统数据库垃圾清理(提高运行速度)</a>
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