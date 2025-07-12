<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:88:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/pay_safe.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">支付风控策略总开关</label>
        <div class='col-sm-8'>
            <select name="status" class="layui-input" >
                <option value="0" <?php if(plugconf('paysafe','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('paysafe','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <label class="col-sm-2 control-label">下单防CC风控</label>
        <div class='col-sm-8'>
            <input type="number" name="order_count_risk"  autocomplete="off" class="layui-input" value="<?php echo plugconf('paysafe','order_count_risk'); ?>">
            <p class="help-block">一分钟内单个IP下单多少次会被拉黑名单（建议10次），开启风控策略总开关才会生效</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">下单风控拉黑时间（秒）</label>
        <div class='col-sm-8'>
            <input type="number" name="order_black_minute"  autocomplete="off" class="layui-input" value="<?php echo plugconf('paysafe','order_black_minute'); ?>">
            <p class="help-block">风控IP拉黑时间，建议1800秒（30分钟），超过时间自动解除</p>
            <a class="btn btn-xs btn-warning" data-open="<?php echo url('paySafeIpblack'); ?>" href="javascript:void(0)">黑名单管理</a>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <label class="col-sm-2 control-label">网关风控下线提醒开关</label>
        <div class='col-sm-8'>
            <select name="warning_switch" class="layui-input" >
                <option value="0" <?php if(plugconf('paysafe','warning_switch')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('paysafe','warning_switch')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">开启风控策略总开关才会生效</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">同一网关渠道连续多少单未支付触发提醒</label>
        <div class='col-sm-8'>
            <input type="number" name="warning_count"  autocomplete="off" class="layui-input" value="<?php echo plugconf('paysafe','warning_count'); ?>">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-12">
            <div class="layui-form-item text-center">
                <button class="layui-btn" type="submit">保存配置</button>
            </div>
        </div>

    </div>
    <div class="hr-line-dashed"></div>

</form>

<form  onsubmit="return false;" data-auto="" method="POST" data-listen="true" novalidate="novalidate">
    <input type="hidden" value="resort" name="action">
    <table class="table table-hover">
        <thead>
            <tr>
                <th class="text-center">接口编号</th>
                <th class="text-center">接口名称</th>
                <th class="text-center">接口代码</th>
                <th class="text-center">最低支付金额</th>
                <th class="text-center">最高支付金额</th>
                <th class="text-center">开启随机金额</th>
                <th class="text-center">随机加或减金额</th>
                <th class="text-center">风控状态</th>
                <th class="text-center">操作</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach($channelList as $v): ?>
            <tr>
                <td class="text-center"><?php echo $v['id']; ?></td>
                <td class="text-center"><?php echo $v['title']; ?></td>
                <td class="text-center"><?php echo $v['code']; ?></td>
                <td class="text-center"><?php if($v['paySafe']['min_money']==0): ?>不限制<?php else: ?><?php echo $v['paySafe']['min_money']; ?>元<?php endif; ?></td>
                <td class="text-center"><?php if($v['paySafe']['max_money']==0): ?>不限制<?php else: ?><?php echo $v['paySafe']['max_money']; ?>元<?php endif; ?></td>

                <td  class="text-center">
                    <?php if($v['paySafe']['open_random']==1): ?>
                    <span style="color:green"> 是</span>
                    <?php else: ?>
                    <span style="color:red">否</span>
                    <?php endif; ?>
                </td>

                <td class="text-center"><?php if($v['paySafe']['random_money']==0): ?>未设置<?php else: ?><?php echo $v['paySafe']['random_money']; ?>元<?php endif; ?></td>

                <td  class="text-center">
                    <?php if($v['paySafe']['status']==1): ?>
                    <span style="color:green"><i class="glyphicon glyphicon-ok"></i> 开启</span>
                    <?php else: ?>
                    <span style="color:red"><i class="glyphicon glyphicon-remove"></i> 关闭</span>
                    <?php endif; ?>
                </td>

                <td class="text-center">
                    <div class="layui-btn-group">
                        <button type="button" class="layui-btn layui-btn-small" data-modal="<?php echo url('paySafeSetting',['channel_id'=>$v['id']]); ?>" data-title="风控设置">设置</button>
                    </div>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</form>

<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
</script>

    </div>
    
</div>