<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:84:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/site/spread.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">邀请码模式</label>
        <div class='col-sm-8'>
            <select name="spread_invite_code" class="layui-input" required>
                <option value="1" <?php if(sysconf('spread_invite_code')==1): ?>selected<?php endif; ?>>开启</option>
                <option value="0" <?php if(sysconf('spread_invite_code')==0): ?>selected<?php endif; ?>>关闭</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">邀请码必填</label>
        <div class='col-sm-8'>
            <select name="is_need_invite_code" class="layui-input" required>
                <option value="1" <?php if(sysconf('is_need_invite_code')==1): ?>selected<?php endif; ?>>是</option>
                <option value="0" <?php if(sysconf('is_need_invite_code')==0): ?>selected<?php endif; ?>>否</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">邀请码获取（购买）链接</label>
        <div class='col-sm-8'>
            <input type="text" name="invite_code_get_url" title="请输入链接" placeholder="请输入链接" value="<?php echo sysconf('invite_code_get_url'); ?>" class="layui-input">
            <p class="help-block">邀请码模式开启且不为空，注册的时候会显示</p>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">邀请注册奖励</label>
        <div class='col-sm-8'>
            <select name="spread_reward" class="layui-input" required>
                <option value="1" <?php if(sysconf('spread_reward')==1): ?>selected<?php endif; ?>>开启</option>
                <option value="0" <?php if(sysconf('spread_reward')==0): ?>selected<?php endif; ?>>关闭</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">邀请注册奖励金额</label>
        <div class='col-sm-8'>
            <input type="text" name="spread_reward_money" required="required" title="请输入奖励金额" placeholder="请输入奖励金额" value="<?php echo sysconf('spread_reward_money'); ?>" class="layui-input">
            <p class="help-block">单位：元</p>
        </div>
    </div>


    <div class="hr-line-dashed"></div>


    <div class="form-group">
        <label class="col-sm-2 control-label">推广返佣比例</label>
        <div class='col-sm-8'>
            <input type="number" onkeyup="gt0(this)" name="spread_rebate_rate" required="required"
                   title="请输入推广返佣比例" placeholder="请输入推广返佣比例" value="<?php echo sysconf('spread_rebate_rate'); ?>"
                   class="layui-input">
            <p class="help-block">单位（%），推广返佣比例</p>
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
    function gt0(ob) {
        if (!/^[\d]+\.?[\d]*$/.test(ob.value) && ob.value != '') {
            console.log('s');
            ob.value = 0;
        }
    }

</script>

    </div>
    
</div>