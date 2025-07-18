<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:86:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/payapi.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">功能是否开启</label>
        <div class='col-sm-8'>
            <select name="status" class="layui-input" >
                <option value="0" <?php if(plugconf('payapi','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('payapi','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>

    <div class="hr-line-dashed"></div>


    <div class="form-group">
        <label class="col-sm-2 control-label">商户端未开启此功能提示文字</label>
        <div class="col-sm-8">
            <input type="text"  name="tip"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('payapi','tip'); ?>">
            <p class="help-block">未开启此功能商户提示文字</p>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:14px;" class="text-center">电脑端网关关联</p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">支付宝（alipay）</label>
        <div class='col-sm-8'>
            <select name="channel_alipay_pc" class="layui-input" >
                <option value="0" <?php if(plugconf('payapi','channel_alipay_pc')==""): ?>selected<?php endif; ?>>请选择网关</option>
                <?php foreach($channel_alipay as $k=> $v): ?>
                <option value="<?php echo $v['id']; ?>" <?php if(plugconf('payapi','channel_alipay_pc')==$v['id']): ?>selected<?php endif; ?>><?php echo $v['title']; ?>（<?php echo $v['show_name']; ?>）</option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">微信（wxpay）</label>
        <div class='col-sm-8'>
            <select name="channel_wxpay_pc" class="layui-input" >
                <option value="0" <?php if(plugconf('payapi','channel_wxpay_pc')==""): ?>selected<?php endif; ?>>请选择网关</option>
                <?php foreach($channel_wxpay as $k=> $v): ?>
                <option value="<?php echo $v['id']; ?>" <?php if(plugconf('payapi','channel_wxpay_pc')==$v['id']): ?>selected<?php endif; ?>><?php echo $v['title']; ?>（<?php echo $v['show_name']; ?>）</option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">QQ（qqpay）</label>
        <div class='col-sm-8'>
            <select name="channel_qq_pc" class="layui-input" >
                <option value="0" <?php if(plugconf('payapi','channel_qq_pc')==""): ?>selected<?php endif; ?>>请选择网关</option>
                <?php foreach($channel_qq as $k=> $v): ?>
                <option value="<?php echo $v['id']; ?>" <?php if(plugconf('payapi','channel_qq_pc')==$v['id']): ?>selected<?php endif; ?>><?php echo $v['title']; ?>（<?php echo $v['show_name']; ?>）</option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:14px;" class="text-center">移动端网关关联</p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">支付宝（alipay）</label>
        <div class='col-sm-8'>
            <select name="channel_alipay_wap" class="layui-input" >
                <option value="0" <?php if(plugconf('payapi','channel_alipay_wap')==""): ?>selected<?php endif; ?>>请选择网关</option>
                <?php foreach($channel_alipay as $k=> $v): ?>
                <option value="<?php echo $v['id']; ?>" <?php if(plugconf('payapi','channel_alipay_wap')==$v['id']): ?>selected<?php endif; ?>><?php echo $v['title']; ?>（<?php echo $v['show_name']; ?>）</option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">微信（wxpay）</label>
        <div class='col-sm-8'>
            <select name="channel_wxpay_wap" class="layui-input" >
                <option value="0" <?php if(plugconf('payapi','channel_wxpay_wap')==""): ?>selected<?php endif; ?>>请选择网关</option>
                <?php foreach($channel_wxpay as $k=> $v): ?>
                <option value="<?php echo $v['id']; ?>" <?php if(plugconf('payapi','channel_wxpay_wap')==$v['id']): ?>selected<?php endif; ?>><?php echo $v['title']; ?>（<?php echo $v['show_name']; ?>）</option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">QQ（qqpay）</label>
        <div class='col-sm-8'>
            <select name="channel_qq_wap" class="layui-input" >
                <option value="0" <?php if(plugconf('payapi','channel_qq_wap')==""): ?>selected<?php endif; ?>>请选择网关</option>
                <?php foreach($channel_qq as $k=> $v): ?>
                <option value="<?php echo $v['id']; ?>" <?php if(plugconf('payapi','channel_qq_wap')==$v['id']): ?>selected<?php endif; ?>><?php echo $v['title']; ?>（<?php echo $v['show_name']; ?>）</option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-12">
            <div class="layui-form-item text-center">
                <button class="layui-btn" type="submit">保存配置</button>
                <a class="layui-btn" data-title="API订单管理" data-open="<?php echo url('payapiOrder'); ?>" href="javascript:void(0)">API订单管理</a>
            </div>
        </div>
    </div>


    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:18px;color: red" class="text-center">宝塔添加任务计划（设置每1分钟执行一次）</p>
                <p style="font-size:14px;" class="text-center">命令：cd /www/wwwroot/xxx.com; php think RePost;</p>
                <p style="font-size:14px;" class="text-center">提示1：用于API订单补发</p>
                <p style="font-size:14px;" class="text-center">提示2：xxx.com 请替换为您的网站路径</p>
            </div>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:14px;" class="text-center">今日API订单：<b><?php echo $today['count']; ?></b>笔&nbsp;&nbsp;&nbsp;&nbsp;今日API交易额：<b><?php echo $today['money']; ?></b>元&nbsp;&nbsp;&nbsp;&nbsp;今日API利润：<b><?php echo $today['profit']; ?></b>元</p>
                <p style="font-size:14px;" class="text-center">昨日API订单：<b><?php echo $yesterday['count']; ?></b>笔&nbsp;&nbsp;&nbsp;&nbsp;昨日API交易额：<b><?php echo $yesterday['money']; ?></b>元&nbsp;&nbsp;&nbsp;&nbsp;昨日API利润：<b><?php echo $yesterday['profit']; ?></b>元</p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:14px;" class="text-center">总计API订单：<b><?php echo $all['count']; ?></b>笔&nbsp;&nbsp;&nbsp;&nbsp;总计API交易额：<b><?php echo $all['money']; ?></b>元&nbsp;&nbsp;&nbsp;&nbsp;总计API利润：<b><?php echo $all['profit']; ?></b>元</p>
            </div>
        </div>
    </div>
</form>

<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
</script>

    </div>
    
</div>