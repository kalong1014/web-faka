<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:82:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/user/edit.html";i:1646323578;}*/ ?>
<form class="layui-form layui-box" style='padding:25px 30px 20px 0' action="__SELF__" data-auto="true" method="post">

    <div class="layui-form-item">
        <label class="layui-form-label">上级商户</label>
        <div class="layui-input-block">
            <select class="layui-input" style="display:block;" name="parent_id" required>
                <option value="">不选择</option>
                <?php foreach($users as $v): ?>
                <option value="<?php echo $v['id']; ?>" <?php if(isset($user) && $v['id']==$user['parent_id']): ?>selected<?php endif; ?>><?php echo $v['username']; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">结算周期</label>
        <div class="layui-input-block">
            <select class="layui-input" style="display:block;" name="settlement_type" required>
                <!--<?php if(isset($user) && $user['settlement_type']=='-1'): ?>-->
                <option value="-1" selected>跟随系统</option>
                <!--<?php else: ?>-->
                <option value="-1">跟随系统</option>
                <!--<?php endif; ?>-->
                <!--<?php if(isset($user) && $user['settlement_type']=='1'): ?>-->
                <option value="1" selected>T1结算</option>
                <!--<?php else: ?>-->
                <option value="1">T1结算</option>
                <!--<?php endif; ?>-->
                <!--<?php if(isset($user) && $user['settlement_type']=='0'): ?>-->
                <option value="0" selected>T0结算</option>
                <!--<?php else: ?>-->
                <option value="0">T0结算</option>
                <!--<?php endif; ?>-->
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="username" value="<?php echo (isset($user['username']) && ($user['username'] !== '')?$user['username']:''); ?>" required="required" title="请输入用户名" placeholder="请输入用户名" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" value="<?php echo (isset($user['email']) && ($user['email'] !== '')?$user['email']:''); ?>" required="required" title="请输入邮箱" placeholder="请输入邮箱" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="text" name="mobile" value="<?php echo (isset($user['mobile']) && ($user['mobile'] !== '')?$user['mobile']:''); ?>" required="required" title="请输入紧急联系手机号" placeholder="请输入紧急联系手机号" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">QQ</label>
        <div class="layui-input-block">
            <input type="text" name="qq" value="<?php echo (isset($user['qq']) && ($user['qq'] !== '')?$user['qq']:''); ?>" required="required" title="请输入QQ" placeholder="请输入QQ" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">子域名</label>
        <div class="layui-input-block">
            <input type="text" name="subdomain" value="<?php echo (isset($user['subdomain']) && ($user['subdomain'] !== '')?$user['subdomain']:''); ?>" title="请输入子域名" placeholder="请输入子域名" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">店铺名</label>
        <div class="layui-input-block">
            <input type="text" name="shop_name" value="<?php echo (isset($user['shop_name']) && ($user['shop_name'] !== '')?$user['shop_name']:''); ?>" title="请输入店铺名" placeholder="请输入店铺名" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">统计代码</label>
        <div class="layui-input-block">
            <textarea name="statis_code" id="" cols="30" rows="5" class="layui-textarea" title="请输入统计代码" placeholder="请输入统计代码" ><?php echo (isset($user['statis_code']) && ($user['statis_code'] !== '')?$user['statis_code']:''); ?></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">支付页风格</label>
        <div class="layui-input-block">
            <select class="layui-input" style="display:block;" name="pay_theme" required>
                <?php foreach(config('pay_themes') as $v): ?>
                <option value="<?php echo $v['alias']; ?>" <?php if(isset($user) && $v['alias']==$user['pay_theme']): ?>selected<?php endif; ?>><?php echo $v['name']; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">支付API功能</label>
        <div class="layui-input-block">
            <select class="layui-input" style="display:block;" name="payapi" required>
                <option value="0" <?php if(!isset($user) || 0==$user['payapi']): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(isset($user) && 1==$user['payapi']): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>

    <?php if(isset($user)): ?>
    <div class="layui-form-item">
        <label class="layui-form-label">支付商户号</label>
        <div class="layui-input-block">
            <input type="text" readonly="readonly" name="payid" value="<?php echo $user['id']+10000; ?>" style="background: #e9e9e9" title="支付商户号" placeholder="支付商户号" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">支付API秘钥</label>
        <div class="layui-input-block">
            <input type="text"  readonly="readonly" name="paykey"  style="background: #e9e9e9" value="<?php echo (isset($user['paykey']) && ($user['paykey'] !== '')?$user['paykey']:''); ?>" title="支付秘钥" placeholder="支付秘钥" class="layui-input">
        </div>
    </div>
    <?php endif; ?>


    <div class="layui-form-item">
        <label class="layui-form-label">登录密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" value="" title="请输入密码" placeholder="请输入密码" class="layui-input">
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="layui-form-item text-center">
        <input type="hidden" name="user_id" value="<?php echo (isset($user['id']) && ($user['id'] !== '')?$user['id']:'0'); ?>">
        <button class="layui-btn" type='submit'>保存</button>
        <button class="layui-btn layui-btn-danger" type='button' data-confirm="确定要取消吗？" data-close>取消</button>
    </div>

</form>

<script>
    // layui.use('form', function(){
    //     var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
    //     form.render();
    // });
</script>
