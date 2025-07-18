<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:87:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/codepay.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">商户端码支付是否开启</label>
        <div class='col-sm-8'>
            <select name="merchant_status" class="layui-input" >
                <option value="0" <?php if(plugconf('codepay','merchant_status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('codepay','merchant_status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">开启之后商户端将可使用该功能</p>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">使用此功能是否需要申请</label>
        <div class='col-sm-8'>
            <select name="need_apply" class="layui-input" >
                <option value="0" <?php if(plugconf('codepay','need_apply')=='0'): ?>selected<?php endif; ?>>否</option>
                <option value="1" <?php if(plugconf('codepay','need_apply')=='1'): ?>selected<?php endif; ?>>是</option>
            </select>
            <a <?php if(plugconf('codepay','need_apply')==''||plugconf('codepay','need_apply')=='0'): ?>style="display:none;margin-top: 5px"<?php endif; ?> class="btn btn-xs btn-warning need_box"  data-open="<?php echo url('codepayAuth'); ?>" href="javascript:void(0)">申请管理</a>
        </div>
    </div>

    <div class="form-group need_box"  <?php if(plugconf('codepay','need_apply')==''||plugconf('codepay','need_apply')=='0'): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">需申请使用时提示文字</label>
        <div class='col-sm-8'>
            <input type="text"  name="codepay_tip"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('codepay','codepay_tip'); ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">码支付付款页提示语音</label>
        <div class='col-sm-8'>
            <select name="audio" class="layui-input" >
                <option value="0" <?php if(plugconf('codepay','audio')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('codepay','audio')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <label class="col-sm-2 control-label">平台通讯ID</label>
        <div class='col-sm-8'>
            <input type="text"  name="uid"  autocomplete="off" class="layui-input" placeholder="码支付主UID" value="<?php echo plugconf('codepay','uid'); ?>">
            <p class="help-block">请前往内部码支付平台获取</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">平台通讯秘钥</label>
        <div class='col-sm-8'>
            <input type="text"  name="apikey"  autocomplete="off" class="layui-input" placeholder="码支付主秘钥" value="<?php echo plugconf('codepay','apikey'); ?>">
            <p class="help-block">请前往内部码支付平台获取</p>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">云端支付宝监听间隔(秒)</label>
        <div class='col-sm-8'>
            <input type="text"  name="alipay_time"  autocomplete="off" class="layui-input" placeholder="云端支付宝监听间隔" value="<?php echo plugconf('codepay','alipay_time'); ?>">
            <p class="help-block">云端监听有效（最低12，不能低于12！不能低于12！过低会触发频繁，如要加快监听请使用APP方式）</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">云端微信监听间隔(秒)</label>
        <div class='col-sm-8'>
            <input type="text"  name="weixin_time"  autocomplete="off" class="layui-input" placeholder="云端微信监听间隔" value="<?php echo plugconf('codepay','weixin_time'); ?>">
            <p class="help-block">云端监听有效</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">云端QQ监听间隔(秒)</label>
        <div class='col-sm-8'>
            <input type="text"  name="qq_time"  autocomplete="off" class="layui-input" placeholder="云端QQ监听间隔" value="<?php echo plugconf('codepay','qq_time'); ?>">
            <p class="help-block">云端监听有效</p>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-12">
            <div class="layui-form-item text-center">
                <button class="layui-btn" type="submit">保存配置</button>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="layui-form-item text-center">
                <a class="layui-btn" data-title="平台专用商户号" data-open="<?php echo url('codepayApplist'); ?>" href="javascript:void(0)">平台专用子商户号</a>
                <p class="help-block">“平台专用子商户号”用于后台网关通道对接</p>
            </div>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center"><b>内部码支付平台（自研平台）</b></p>
                <p style="font-size:16px;color: red" class="text-center"><b>V8.75宝塔监听任务计划更新，务必使用最新的宝塔任务计划命令！</b></p>
                <p style="font-size:14px;" class="text-center">
                    <a target="_blank" class="btn btn-primary btn-xs text-white" href="<?php echo $gateway; ?>/index/user/index">登录平台</a>
                    <a target="_blank" class="btn btn-primary btn-xs text-white" href="<?php echo $gateway; ?>/index/User/payments">充值余额</a>
                </p>
                <p style="font-size:14px;color: red" class="text-center">提示1：使用码支付平台需要提前充值预存款</p>
                <p style="font-size:14px;color: red" class="text-center">提示2：商家也可以使用码支付功能，配合自定义接口功能，平台赚取费率差。D0到账，首发无敌创新模式</p>
                <p style="font-size:14px;color: red" class="text-center">防风控提醒：请勿频繁更换手机登录支付宝、微信</p>
                <p style="font-size:16px;" class="text-center"><b>平台支持三网免挂，请前往官方文档查看“免签云端监听配置”教程</b>   <a target="_blank" class="btn btn-primary btn-xs text-white" href="https://itlanjing.feishu.cn/docs/doccnz1GgIk19o8d1F5ylG6cs9b#l45jMQ">查看文档</a></p>
            </div>
        </div>
    </div>

</form>

<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
    $('[name="need_apply"]').change(function () {
        if ($(this).val() == 0) {
            $('.need_box').slideUp();
        } else if ($(this).val() == 1) {
            $('.need_box').slideDown();
        }
    });

</script>

    </div>
    
</div>