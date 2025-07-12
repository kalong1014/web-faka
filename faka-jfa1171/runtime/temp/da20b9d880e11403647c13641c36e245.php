<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:84:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/user/detail.html";i:1646323578;}*/ ?>
<form class="layui-form layui-box" style='padding:25px 30px 20px 0' action="__SELF__" data-auto="true" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">上级商户</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['parent']['username']; ?>" class="layui-input" readonly>
        </div>
        <label class="layui-form-label">ID</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['id']; ?>" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['username']; ?>" class="layui-input" readonly>
        </div>
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['email']; ?>" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">手机</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['mobile']; ?>" class="layui-input" readonly>
        </div>
        <label class="layui-form-label">QQ</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['qq']; ?>" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">子域名</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['subdomain']; ?>" class="layui-input" readonly>
        </div>
        <label class="layui-form-label">统计代码</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['statis_code']; ?>" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">店铺名称</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['shop_name']; ?>" class="layui-input" readonly>
        </div>
        <label class="layui-form-label">店铺公告</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['shop_notice']; ?>" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">审核状态</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php if($user['status']==1): ?>正常<?php else: ?>禁用<?php endif; ?>" class="layui-input" readonly>
        </div>
        <label class="layui-form-label">冻结状态</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php if($user['is_freeze']==1): ?>已冻结<?php else: ?>未冻结<?php endif; ?>" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">被投诉次数</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['complaint_count']; ?>" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">余额</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['money']; ?>" class="layui-input" readonly>
        </div>
        <label class="layui-form-label">佣金</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['rebate']; ?>" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">下级商户数</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['sub_user_count']; ?>" class="layui-input" readonly>
        </div>
        <label class="layui-form-label">注册时间</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo date('Y-m-d H:i:s',$user['create_at']); ?>" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">微信通知openid</label>
        <div class="layui-input-inline">
            <input type="text" value="<?php echo $user['openid']; ?>" class="layui-input" readonly>
        </div>
    </div>

</form>
