<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:92:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/agentsetting.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">代理需最低加价（千分比）</label>
        <div class='col-sm-8'>
            <input type="text"  name="min_rate"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('agentsetting','min_rate'); ?>">
            <p class="help-block">防止下级加价过低出现负金额对平台造成损失，建议设置50，表示50‰，不要低于支付渠道设置的最高费率</p>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="form-group">
        <label class="col-sm-2 control-label">浏览全网通是否需要申请</label>
        <div class='col-sm-8'>
            <select name="poolauth" class="layui-input">
                <option value="0" <?php if(plugconf('agentsetting','poolauth')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('agentsetting','poolauth')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">开启之后未申请用户看不到全网通商品，但可以通过对接码对接。默认不需要审核</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">有交易流水无需审核</label>
        <div class='col-sm-8'>
            <select name="autocheck" class="layui-input">
                <option value="1" <?php if(plugconf('agentsetting','autocheck')=='1'): ?>selected<?php endif; ?>>开启</option>
                <option value="0" <?php if(plugconf('agentsetting','autocheck')=='0'): ?>selected<?php endif; ?>>关闭</option>
            </select>
            <p class="help-block">开启之后,如果有交易流水将会自动审核。</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">浏览全网通未申请提示</label>
        <div class='col-sm-8'>
            <input type="text"  name="poolauth_tip"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('agentsetting','poolauth_tip'); ?>">
            <p class="help-block">浏览全网通未申请用户提示文字</p>
        </div>
    </div>

    <div class="hr-line-dashed"></div>
    <div class="form-group">
        <label class="col-sm-2 control-label">单个商户限制创建商品池数量</label>
        <div class='col-sm-8'>
            <input type="number"  name="poolcount_limit"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('agentsetting','poolcount_limit'); ?>">
            <p class="help-block">单个商户限制创建商品池数量</p>
        </div>
    </div>



    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
        </div>
    </div>

</form>

<div class="row">
    <div class="col-sm-12 text-center">
        <div class="hr-line-dashed"></div>
        <a class="layui-btn" data-title="申请管理" data-open="<?php echo url('poolAuth'); ?>" href="javascript:void(0)">申请管理</a>
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