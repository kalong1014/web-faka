<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:86:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/punish.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">功能是否开启(总开关)</label>
        <div class='col-sm-8'>
            <select name="status" class="layui-input" >
                <option value="0" <?php if(plugconf('punish','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('punish','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center"><b>投诉惩罚方式①之后订单惩罚</b></p>
                <p class="text-center"><b>提示1：产生投诉就触发，无论商家是否胜诉或买家撤诉</b></p>
                <p class="text-center"><b>提示2：如果商家设置为买家支付手续费，则买家支付金额提高相应费率</b></p>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">惩罚方式①是否开启</label>
        <div class='col-sm-8'>
            <select name="order_status" class="layui-input" >
                <option value="0" <?php if(plugconf('punish','order_status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('punish','order_status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">功能总开关开启此开关才会生效</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">每投诉N单触发惩罚</label>
        <div class='col-sm-8'>
            <input type="number"  name="complaint_point"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('punish','complaint_point'); ?>">
            <p class="help-block">建议设置为2，即每投诉2单触发惩罚</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">惩罚接下来N笔订单</label>
        <div class='col-sm-8'>
            <input type="number"  name="order_count"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('punish','order_count'); ?>">
            <p class="help-block">建议设置为10，即惩罚接下来10笔订单</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">惩罚订单手续费增加百分之N</label>
        <div class='col-sm-8'>
            <input type="text"  name="add_rate"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('punish','add_rate'); ?>">
            <p class="help-block">建议设置为4，即惩罚订单手续费增加百分之4</p>
        </div>
    </div>
    <div class="col-sm-12 text-center">
        <a class="layui-btn" data-title="惩罚方式①惩罚历史" data-open="<?php echo url('punishLog'); ?>" href="javascript:void(0)">惩罚方式①惩罚历史</a>
        <div class="hr-line-dashed"></div>
    </div>

    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center"><b>投诉惩罚方式②当前投诉订单惩罚</b></p>
                <p class="text-center"><b>提示1：商家胜诉扣除交易手续费，加扣本策略手续费</b></p>
                <p class="text-center"><b>提示2：买家胜诉不扣交易手续费，扣除本策略手续费（T0余额中扣除，T1冻结余额中扣除）</b></p>
                <p class="text-center"><b>提示3：买家撤诉扣除交易手续费，不加扣本策略手续费</b></p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">惩罚方式②是否开启</label>
        <div class='col-sm-8'>
            <select name="complaint_status" class="layui-input" >
                <option value="0" <?php if(plugconf('punish','complaint_status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('punish','complaint_status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">功能总开关开启此开关才会生效</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">惩罚当前投诉的订单手续费增加百分之N</label>
        <div class='col-sm-8'>
            <input type="text"  name="complaint_add_rate"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('punish','complaint_add_rate'); ?>">
            <p class="help-block">建议设置为4，即惩罚订单手续费增加百分之4</p>
        </div>
    </div>


    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center"><b>投诉惩罚方式③自动下架商品</b></p>
                <p class="text-center"><b>提示1：如是自营商品会下架当前自营商品</b></p>
                <p class="text-center"><b>提示2：如是代理商品会下架上级商品</b></p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">惩罚方式③是否开启</label>
        <div class='col-sm-8'>
            <select name="goodsoff_status" class="layui-input" >
                <option value="0" <?php if(plugconf('punish','goodsoff_status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('punish','goodsoff_status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">功能总开关开启此开关才会生效</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">评判单位时长（小时）</label>
        <div class='col-sm-8'>
            <input type="number"  name="goodsoff_hour"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('punish','goodsoff_hour'); ?>">
            <p class="help-block">建议设置为1，评判单位时长1小时</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">单位时长内N单触发惩罚</label>
        <div class='col-sm-8'>
            <input type="number"  name="goodsoff_count"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('punish','goodsoff_count'); ?>">
            <p class="help-block">建议设置为5，单位时长内5单触发惩罚</p>
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
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });

</script>

    </div>
    
</div>