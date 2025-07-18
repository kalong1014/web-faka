<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:87:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/airpayx.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-warning alert-dismissible" role="alert">
                <p style="font-size: 14px;">   
                    此功能需要配合商户自定义接口使用&nbsp;<a data-open="<?php echo url('plugin/custompay'); ?>" href="javascript:void(0)">去开启</a>
                </p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">功能是否开启</label>
        <div class='col-sm-8'>
            <select name="status" class="layui-input" >
                <option value="0" <?php if(plugconf('airpayx','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('airpayx','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">开启之后可使用该功能</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">使用功能是否需要申请</label>
        <div class='col-sm-8'>
            <select name="airpayxauth" class="layui-input">
                <option value="0" <?php if(plugconf('airpayx','airpayxauth')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('airpayx','airpayxauth')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">开启之后未申请用户无法使用此功能</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">使用功能未申请提示</label>
        <div class='col-sm-8'>
            <input type="text"  name="airpayxauth_tip"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('airpayx','airpayxauth_tip'); ?>">
            <p class="help-block">使用功能未申请提示文字</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">功能使用警示信息</label>
        <div class='col-sm-8'>
            <input type="text"  name="tip"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('airpayx','tip'); ?>">
            <p class="help-block">功能使用警示信息</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">支付系统AppKey：</label>
        <div class='col-sm-8'>
            <input type="text" name="app_key" autocomplete="off" class="layui-input" value="<?php echo plugconf('airpayx','app_key'); ?>">
            <p class="help-block">如果没有请前往支付系统新注册账号获取</p>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">支付系统AppSecret：</label>
        <div class='col-sm-8'>
            <input type="text" name="app_secret"  autocomplete="off" class="layui-input" value="<?php echo plugconf('airpayx','app_secret'); ?>">
            <p class="help-block">如果没有请前往支付系统新注册账号获取</p>
        </div>
    </div>

    <div class="hr-line-dashed"></div>
    <div class="form-group">
        <label class="col-sm-2 control-label">绑定的微信公众号APPID：</label>
        <div class='col-sm-8'>
            <input type="text" name="wx_appid" autocomplete="off" class="layui-input" value="<?php echo plugconf('airpayx','wx_appid'); ?>">
            <p class="help-block"></p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">绑定的微信公众号AppSecret：</label>
        <div class='col-sm-8'>
            <input type="text" name="wx_appsecret"  autocomplete="off" class="layui-input" value="<?php echo plugconf('airpayx','wx_appsecret'); ?>">
            <p class="help-block">如果没有请前往支付系统新注册账号获取</p>
        </div>
    </div>


    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
            <a class="layui-btn" data-title="申请管理" data-open="<?php echo url('airpayxAuth'); ?>" href="javascript:void(0)">申请管理</a>
            <a class="layui-btn"  href="https://itlanjing.feishu.cn/docs/doccnz1GgIk19o8d1F5ylG6cs9b#V35V3V">对接教程</a>
        </div>
    </div>

</form>

<div class="row">
    <div class="col-sm-12   text-center">
        <div class="hr-line-dashed"></div>
        <a target="_blank" class="layui-btn" href="http://airpayx.cloud123.cn/dashboard/analysis/index.html">登录系统</a>
        <a target="_blank" class="layui-btn" href="http://airpayx.cloud123.cn/dashboard/order/index.html?status=all">系统订单</a>
        <a target="_blank" class="layui-btn" href="http://airpayx.cloud123.cn/dashboard/merchant/index.html?status=pending">商户管理/审核</a>
    </div>
</div>

<div class="row" style="margin-top:20px">

    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-warning alert-dismissible" role="alert">
                <p style="font-size: 14px;">         
                    <b>闪电安全结算系统</b>：此系统是鲸发卡官方融合发卡、直付通、收付通方案的聚合系统，支持商家以<b>个人、个体、企业</b>身份进件申请支付权限，资金不通过平台账号，帮助平台通过合规的资金清算模式完成平台上各商户的交易资金处理。
                </p>
                <p style="font-size: 14px;">         
                    <b>功能</b>：商户自助急速进件、订单交易、平台分账、商户进件审核、买家黑名单功能。
                </p>
                <p style="font-size: 14px;">         
                    <b>提醒</b>：
                    <br>
                    1.首次使用需要登录系统注册新账号获取AppKey、AppSecret与发卡系统关联，并且在鲸发卡合规支付系统配置相关账号参数！
                    <br>
                    2.多个卡网建议注册多个AppKey与发卡系统关联账号，一对一关联！
                    <br>
                    3.进件商户一定要认真审核合规商户再通过，严谨黄、赌、诈、投诉过多等非法商户使用进而影响主体资质！
                </p>

            </div>

            <div class="alert alert-primary alert-dismissible" role="alert" style="background-color: #499df5;">
                <p style="font-size: 14px;color:#ffffff">         
                    <b>支付宝直付通</b>：直付通产品是支付宝面向电商、数娱等互联网平台专属打造的集支付、结算、分账等功能为一体的资金解决方案。
                </p>
                <p style="font-size: 14px;color:#ffffff">         
                    <b>申请条件</b>：拥有主体一致的 ICP 许可证。签约账号的主体必须与已上架网站等应用归属主体保持一致。
                </p>
                <p style="font-size: 14px;color:#ffffff">         
                    <b>介绍网址</b>：<a target="_blank" href="https://opendocs.alipay.com/open/00faww">https://opendocs.alipay.com/open/00faww</a>
                </p>
            </div>
            <div class="alert alert-primary alert-dismissible" role="alert" style="border-radius:0;background-color: #38A44E;">
                <p style="font-size: 14px;color:#ffffff">         
                    <b>微信电商收付通</b>：电商收付通是微信支付专为电商行业场景打造的支付、结算解决方案。
                </p>
                <p style="font-size: 14px;color:#ffffff">         
                    <b>申请条件</b>：电商平台需要具有主体一致的ICP许可证或EDI许可证。
                </p>
                <p style="font-size: 14px;color:#ffffff">         
                    <b>介绍网址</b>：<a target="_blank" href="https://pay.weixin.qq.com/wiki/doc/apiv3_partner/open/pay/chapter3_3_0.shtml">https://pay.weixin.qq.com/wiki/doc/apiv3_partner/open/pay/chapter3_3_0.shtml</a>
                </p>
            </div>
        </div>
    </div>

    <div class="col-sm-12   text-center">

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