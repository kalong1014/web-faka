<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:89:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/tradetask.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">流水挑战是否开启</label>
        <div class='col-sm-8'>
            <select name="status" class="layui-input" >
                <option value="0" <?php if(plugconf('tradetask','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('tradetask','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">开启之后商户端将可使用该功能</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">是否允许用户重复参与</label>
        <div class='col-sm-8'>
            <select name="repeatapply" class="layui-input" >
                <option value="0" <?php if(plugconf('tradetask','repeatapply')=='0'): ?>selected<?php endif; ?>>不允许</option>
                <option value="1" <?php if(plugconf('tradetask','repeatapply')=='1'): ?>selected<?php endif; ?>>允许</option>
            </select>
        </div>
    </div>

    <div class="form-group waitday_box"  <?php if(plugconf('tradetask','repeatapply')=='0'||plugconf('tradetask','repeatapply')==""): ?>style="display:none"<?php endif; ?>>
        <label class="col-sm-2 control-label">领取任务需要间隔时间</label>
        <div class='col-sm-8'>
            <input type="text" name="waitday" autocomplete="off" class="layui-input"  value="<?php echo plugconf('tradetask','waitday'); ?>">
            <p class="help-block">单位：天</p>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <label class="col-sm-2 control-label">流水挑战展示页：</label>
        <div class='col-sm-8'>
            <input type="text"  autocomplete="off" class="layui-input" disabled="disabled" style="background: #e9e9e9" value="<?php echo url('index/plugin/tradetask'); ?>">
            <p class="help-block">可以添加在前台导航展示（系统管理->系统配置->前台导航）</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">活动名称</label>
        <div class='col-sm-8'>
            <input type="text"  name="activity_name"  autocomplete="off" class="layui-input" placeholder="请输入活动名称，展示页显示" value="<?php echo plugconf('tradetask','activity_name'); ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">活动描述及规则</label>
        <div class='col-sm-8'>
            <textarea name="activity_content"><?php echo plugconf('tradetask','activity_content'); ?></textarea>
        </div>
    </div>


    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
        </div>
    </div>

</form>

<div class="row">
    <div class="col-sm-12   text-center">
        <div class="hr-line-dashed"></div>
        <button type="button" class="layui-btn" data-open="<?php echo url('tradetaskList'); ?>" data-title="挑战任务管理">挑战任务管理</button>
        <a class="layui-btn" data-title="商户任务管理" data-open="<?php echo url('tradetaskOrder'); ?>" href="javascript:void(0)">商户任务管理</a>
    </div>

</div>


<script>
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });

    require(['ckeditor'], function () {
        var editor = window.createEditor('[name="activity_content"]');
        // 获取内容
        var content = editor.getData();
        console.log(content);
    });


    $('[name="repeatapply"]').change(function () {
        if ($(this).val() == 1) {
            $('.waitday_box').slideDown();
        } else {
            $('.waitday_box').slideUp();
        }
    });
</script>

    </div>
    
</div>