<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:90:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/systemsafe.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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

    <input type="hidden" name="act" value="safe">

    <div class="form-group">
        <div class='col-sm-8 col-sm-offset-2'>
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center">系统安全增强</p>
            </div>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label"><span class="nowrap">后台管理路径</span></label>
        <div class='col-sm-8'>
            <input type="text" name="admin_login_path" required="required" title="请输入后台管理路径"
                   placeholder="请输入后台管理路径" value="<?php echo sysconf('admin_login_path'); ?>" class="layui-input">
            <p class="help-block">如果留空默认是admin，请不要与系统默认模块名(manage,demo,wechat,merchant,index,extra,common)重复</p>
        </div>
    </div>

    <div class="hr-line-dashed"></div>
    <div class="form-group">
        <label class="col-sm-2 control-label  label-required"><span class="nowrap">后台登录认证方式</span></label>
        <div class='col-sm-8'>
            <label class="think-radio">
                <input type="radio" name="admin_auth_type" value="" <?php if(sysconf('admin_auth_type')==''): ?>checked<?php endif; ?>  title="不开启">
                       不开启
            </label>
            <label class="think-radio">
                <input type="radio" name="admin_auth_type" value="safecode" <?php if(sysconf('admin_auth_type')=='safecode'): ?>checked<?php endif; ?> title="安全认证码">
                       安全认证码（推荐）
            </label>
            <label class="think-radio">
                <input type="radio" name="admin_auth_type" value="google" <?php if(sysconf('admin_auth_type')=='google'): ?>checked<?php endif; ?> title="谷歌令牌验证">
                       谷歌令牌验证
            </label>
            <label class="think-radio">
                <input type="radio" name="admin_auth_type" value="sms" <?php if(sysconf('admin_auth_type')=='sms'): ?>checked<?php endif; ?> title="短信验证">
                       短信验证
            </label>
            <label class="think-radio">
                <input type="radio" name="admin_auth_type" value="email" <?php if(sysconf('admin_auth_type')=='email'): ?>checked<?php endif; ?> title="邮箱验证">
                       邮箱验证
            </label>
        </div>
    </div>

    <div class="form-group old_safecode_box" style="display:none">
        <label class="col-sm-2 control-label">验证旧的认证码</label>
        <div class="col-sm-8">
            <input type="text" name="old_safecode" autocomplete="off" class="layui-input"  placeholder="请输入旧的认证码">
        </div>
    </div>

    <div class="form-group safecode_box" <?php if(sysconf('admin_auth_type')!='safecode'): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">设置安全认证码</label>
        <div class="col-sm-8">
            <?php if($safecode_status): ?>
            <input type="text" name="safecode" autocomplete="off" class="layui-input" disabled="disabled" style="background: #e9e9e9" placeholder="已设置">
            <a href="javascript:void(0)" onclick="$('.old_safecode_box').css('display', 'block');$('input[name=\'safecode\']').attr('disabled', false);$('input[name=\'safecode\']').attr('placeholder', '请输入新的安全认证码');$('input[name=\'safecode\']').css('background', '');$('input[name=\'safecode\']').val('')">重新设置</a>
            <?php else: ?>
            <input type="text" name="safecode" autocomplete="off" class="layui-input" placeholder="未设置，请输入安全认证码">
            <?php endif; ?>
            <p class="help-block" style='color: red'>安全认证码使用文件加密存储，操作方便无成本，安全防护中高。</p>
        </div>
    </div>



    <div class="form-group google_box" <?php if(sysconf('admin_auth_type')!='google'): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">绑定谷歌令牌</label>
        <div class="col-sm-8">
            <?php if($user['google_secret_key']!=""): ?>
            <input type="text" autocomplete="off" class="layui-input" disabled="disabled" style="background: #e9e9e9" placeholder="已设置">
            <?php else: ?>
            <input type="text" autocomplete="off" class="layui-input" disabled="disabled" style="background: #e9e9e9" value="未设置，开启之后重新登录后台进行绑定">
            <?php endif; ?>
            <p class="help-block" style='color: red'>谷歌令牌需使用手机APP操作，操作复杂无成本，安全防护高。</p>
        </div>
    </div>


    <div class="form-group sms_box" <?php if(sysconf('admin_auth_type')!='sms'): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">手机号</label>
        <div class="col-sm-8">
            <?php if($user['phone']!=""): ?>
            <input type="text" autocomplete="off" class="layui-input" disabled="disabled" style="background: #e9e9e9" placeholder="已设置">
            <?php else: ?>
            <input type="text" autocomplete="off" class="layui-input" disabled="disabled" style="background: #e9e9e9" value="未设置，请在系统用户设置联系手机设置 或 下次重新登录进行设置">
            <p class="help-block" style='color: red'>1.请提前配置好系统发送短信配置。</p>
            <?php endif; ?>
            <p class="help-block" style='color: red'>短信验证每次登录需接收验证码，操作复杂有成本，安全防护高。</p>
        </div>
    </div>



    <div class="form-group email_box" <?php if(sysconf('admin_auth_type')!='email'): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">邮箱</label>
        <div class="col-sm-8">
            <?php if($user['mail']!=""): ?>
            <input type="text" autocomplete="off" class="layui-input" disabled="disabled" style="background: #e9e9e9" placeholder="已设置">
            <?php else: ?>
            <input type="text" autocomplete="off" class="layui-input" disabled="disabled" style="background: #e9e9e9" value="未设置，请在系统用户设置邮箱设置 或 下次重新登录进行设置">
            <p class="help-block" style='color: red'>1.请提前配置好系统发送邮件配置。</p>
            <?php endif; ?>
            <p class="help-block" style='color: red'>邮箱验证每次登录需接收验证码，操作复杂无成本，安全防护高。</p>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <label class="col-sm-2 control-label">后台登录Email提醒</label>
        <div class="col-sm-8">
            <input type="text" autocomplete="off" class="layui-input" disabled="disabled" style="background: #e9e9e9" placeholder="已自动开启（需配置好邮箱参数）">
        </div>
    </div>

    <div class="hr-line-dashed"></div>


    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
        </div>
    </div>

</form>

<div class="form-group">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
            <p style="font-size:18px;" class="text-center">系统急救箱（适用于特殊下无法登录系统情况）</p>
            <p style="font-size:14px;" class="text-center">系统命令：cd /www/wwwroot/xxx.com;<br>php think Tools;</p>
            <p style="font-size:14px;" class="text-center">使用教程：<a target="_blank" href="http://docs.jingfaka.com">http://docs.jingfaka.com</a></p>
            <p style="font-size:14px;" class="text-center">①：重置超级管理员密码。②：取消后台登录认证。③：修改后台管理路径。④：清除登录锁定。⑤：解绑Google令牌。⑥：清除安全认证码。⑦：关闭网关锁。</p>
        </div>
    </div>
</div>
<form onsubmit="return false;" action="__SELF__" data-auto="true" method="post" class='form-horizontal' >
    <input type="hidden" name="act" value="order">
    <div class="form-group">
        <div class='col-sm-8 col-sm-offset-2'>
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center">防扫卡策略</p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">查单是否需要验证码</label>
        <div class='col-sm-8'>
            <select name="order_query_chkcode" class="layui-input" >
                <?php if(sysconf('order_query_chkcode')==0): ?>
                <option value="0" selected>否</option>
                <?php else: ?>
                <option value="0">否</option>
                <?php endif; if(sysconf('order_query_chkcode')==1): ?>
                <option value="1" selected>是</option>
                <?php else: ?>
                <option value="1">是</option>
                <?php endif; ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">查单验证码类型</label>
        <div class='col-sm-8'>
            <select name="order_query_captcha_type" class="layui-input" >
                <?php if(sysconf('order_query_captcha_type')==0): ?>
                <option value="0" selected>普通输入型</option>
                <?php else: ?>
                <option value="0">普通输入型</option>
                <?php endif; if(sysconf('order_query_captcha_type')==1): ?>
                <option value="1" selected>点触式验证码（推荐）</option>
                <?php else: ?>
                <option value="1">点触式验证码（推荐）</option>
                <?php endif; ?>
            </select>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">通过联系方式仅可查询N天内订单</label>
        <div class='col-sm-8'>
            <input type="text" name="order_query_limitday" value="<?php echo sysconf('order_query_limitday'); ?>" autocomplete="off" class="layui-input"   placeholder="请输入天数">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">是否只允许下单IP查订单</label>
        <div class='col-sm-8'>
            <select name="order_query_limitip" class="layui-input" >
                <option value="0" <?php if(sysconf('order_query_limitip')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(sysconf('order_query_limitip')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">下单禁用简单联系方式</label>
        <div class="col-sm-8">
            <textarea name="order_query_blackcontact"  cols="30" rows="5" class="layui-textarea"><?php echo sysconf('order_query_blackcontact'); ?></textarea>
            <p class="help-block">防止出现简单联系方式，使用“|”分隔</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">单号查订单限制多长时间查询一次（秒）</label>
        <div class="col-sm-8">
            <input type="text" name="order_query_tradeno_limit" value="<?php echo sysconf('order_query_tradeno_limit'); ?>" autocomplete="off" class="layui-input"  placeholder="请输入秒">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">联系方式查询限制多长时间查询一次（秒）</label>
        <div class="col-sm-8">
            <input type="text" name="order_query_contact_limit" value="<?php echo sysconf('order_query_contact_limit'); ?>" autocomplete="off" class="layui-input"  placeholder="请输入秒">
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">取卡后再次查询限制只能订单号查询（强烈建议开启）</label>
        <div class='col-sm-8'>
            <select name="order_query_second_limit_orderid" class="layui-input" >
                <option value="0" <?php if(sysconf('order_query_second_limit_orderid')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(sysconf('order_query_second_limit_orderid')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
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
        var form = layui.form;
        form.render();
    });

    $('[name="admin_auth_type"]').change(function () {
        if ($(this).val() == 'safecode') {
            $('.safecode_box').slideDown();
        } else {
            $('.safecode_box').slideUp();
        }
        if ($(this).val() == 'google') {
            $('.google_box').slideDown();
        } else {
            $('.google_box').slideUp();
        }
        if ($(this).val() == 'sms') {
            $('.sms_box').slideDown();
        } else {
            $('.sms_box').slideUp();
        }
        if ($(this).val() == 'email') {
            $('.email_box').slideDown();
        } else {
            $('.email_box').slideUp();
        }
    });

</script>

    </div>
    
</div>