<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:92:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/merchantauth.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">实名认证是否开启</label>
        <div class='col-sm-8'>
            <select name="status" class="layui-input" >
                <option value="0" <?php if(plugconf('merchantauth','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('merchantauth','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">认证方式</label>
        <div class='col-sm-8'>
            <select name="auth_type" class="layui-input" >
                <option value="1" <?php if(plugconf('merchantauth','auth_type')=='1'): ?>selected<?php endif; ?>>手机三要素（姓名+身份证号码+手机号）</option>
                <option value="2" <?php if(plugconf('merchantauth','auth_type')=='2'): ?>selected<?php endif; ?>>身份证认证（上传身份证照片）</option>
                <option value="3" <?php if(plugconf('merchantauth','auth_type')=='3'): ?>selected<?php endif; ?>>支付宝刷脸认证</option>
            </select>
        </div>
    </div>



    <div class="form-group">
        <label class="col-sm-2 control-label">认证对象</label>
        <div class="col-sm-8">
            <select name="auth_people" class="layui-input" >
                <option value="1" <?php if(plugconf('merchantauth','auth_people')=='1'): ?>selected<?php endif; ?>>所有用户</option>
                <option value="2" <?php if(plugconf('merchantauth','auth_people')=='2'): ?>selected<?php endif; ?>>仅限新注册用户</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">认证价格</label>
        <div class="col-sm-8">
            <input type="text" name="auth_money"  title="认证价格（单位：元）" placeholder="认证价格（单位：元）"  class="layui-input" value="<?php echo plugconf('merchantauth','auth_money'); ?>">
            <p class="help-block">支持0元免费</p>
        </div>
    </div>


    <div class="hr-line-dashed"></div>


    <div class="form-group auth_type1" <?php if(plugconf('merchantauth','auth_type')!='1'||plugconf('merchantauth','auth_type')==''): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">手机三要素认证APPCODE</label>
        <div class="col-sm-8">
            <input type="text" name="auth_type1_appcode"  title="手机三要素认证APPCODE" placeholder="手机三要素认证APPCODE"  class="layui-input" value="<?php echo plugconf('merchantauth','auth_type1_appcode'); ?>">
            <p class="help-block">申请地址：https://market.aliyun.com/products/57000002/cmapi032783.html，务必购买当前产品！</p>
        </div>
    </div>


    <div class="form-group auth_type2" <?php if(plugconf('merchantauth','auth_type')!=''&&plugconf('merchantauth','auth_type')!='2'): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">身份证认证APPCODE</label>
        <div class="col-sm-8">
            <input type="text" name="auth_type2_appcode"  title="身份证认证APPCODE" placeholder="身份证认证APPCODE"  class="layui-input" value="<?php echo plugconf('merchantauth','auth_type2_appcode'); ?>">
            <p class="help-block">申请地址：https://market.aliyun.com/products/57124001/cmapi028676.html，务必购买当前产品！</p>
        </div>
    </div>

    <div class="form-group auth_type3" <?php if(plugconf('merchantauth','auth_type')!=''&&plugconf('merchantauth','auth_type')!='3'): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">刷脸支付宝APPID</label>
        <div class="col-sm-8">
            <input type="text" name="auth_type3_appid"  title="支付宝APPID" placeholder="支付宝APPID"  class="layui-input" value="<?php echo plugconf('merchantauth','auth_type3_appid'); ?>">
        </div>
    </div>
    <div class="form-group auth_type3" <?php if(plugconf('merchantauth','auth_type')!=''&&plugconf('merchantauth','auth_type')!='3'): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">刷脸支付宝应用私钥</label>
        <div class="col-sm-8">
            <input type="text" name="auth_type3_privatekey"  title="支付宝应用私钥" placeholder="支付宝应用私钥"  class="layui-input" value="<?php echo plugconf('merchantauth','auth_type3_privatekey'); ?>">
        </div>
    </div>
    <div class="form-group auth_type3" <?php if(plugconf('merchantauth','auth_type')!=''&&plugconf('merchantauth','auth_type')!='3'): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">刷脸支付宝公钥</label>
        <div class="col-sm-8">
            <input type="text" name="auth_type3_publickey"  title="支付宝公钥" placeholder="支付宝公钥"  class="layui-input" value="<?php echo plugconf('merchantauth','auth_type3_publickey'); ?>">
            <p class="help-block">需支付宝申请“支付宝身份验证”能力，详情参考：https://opendocs.alipay.com/open/20181012100420932508</p>
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
        <button type="button" class="layui-btn" data-open="<?php echo url('merchantauthList'); ?>" data-title="认证用户管理">认证用户管理</button>
        <a class="layui-btn" data-title="认证订单" data-open="<?php echo url('merchantauthOrder'); ?>" href="javascript:void(0)">认证订单</a>
    </div>
</div>


<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });

    $('[name="auth_type"]').change(function () {
        if ($(this).val() == 1) {
            $('.auth_type1').slideDown();
            $('.auth_type2').slideUp();
            $('.auth_type3').slideUp();
        } else if ($(this).val() == 2) {
            $('.auth_type1').slideUp();
            $('.auth_type2').slideDown();
            $('.auth_type3').slideUp();
        } else if ($(this).val() == 3) {
            $('.auth_type1').slideUp();
            $('.auth_type2').slideUp();
            $('.auth_type3').slideDown();
        }
    });


</script>

    </div>
    
</div>