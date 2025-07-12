<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:89:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/custompay.html";i:1682344990;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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

    <!--<div class="form-group">-->
    <!--    <label class="col-sm-2 control-label">功能是否开启</label>-->
    <!--    <div class='col-sm-8'>-->
    <!--        <select name="status" class="layui-input" >-->
    <!--            <option value="0" <?php if(plugconf('custompay','status')=='0'): ?>selected<?php endif; ?>>关闭</option>-->
    <!--            <option value="1" <?php if(plugconf('custompay','status')=='1'): ?>selected<?php endif; ?>>开启</option>-->
    <!--        </select>-->
    <!--    </div>-->
    <!--</div>-->

    <!--<div class="hr-line-dashed"></div>-->

    <!--<div class="form-group">-->
    <!--    <label class="col-sm-2 control-label">使用此功能是否需要申请</label>-->
    <!--    <div class='col-sm-8'>-->
    <!--        <select name="need_apply" class="layui-input" >-->
    <!--            <option value="0" <?php if(plugconf('custompay','need_apply')=='0'): ?>selected<?php endif; ?>>否</option>-->
    <!--            <option value="1" <?php if(plugconf('custompay','need_apply')=='1'): ?>selected<?php endif; ?>>是</option>-->
    <!--        </select>-->
    <!--        <a <?php if(plugconf('custompay','need_apply')==''||plugconf('custompay','need_apply')=='0'): ?>style="display:none;margin-top: 5px"<?php endif; ?> class="btn btn-xs btn-warning need_box"  data-open="<?php echo url('custompayAuth'); ?>" href="javascript:void(0)">申请管理</a>-->
    <!--    </div>-->
    <!--</div>-->

    <div class="form-group need_box"  <?php if(plugconf('custompay','need_apply')==''||plugconf('custompay','need_apply')=='0'): ?>style="display:none"<?php endif; ?>>
         <label class="col-sm-2 control-label">需申请使用时提示文字</label>
        <div class='col-sm-8'>
            <input type="text"  name="custompay_tip"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('custompay','custompay_tip'); ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">投诉保证金最低额度</label>
        <div class='col-sm-8'>
            <input type="text"  name="deposit_limit"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('custompay','deposit_limit'); ?>">
            <p class="help-block">保证金用于投诉订单退款，如果保证金低于相应额度之后订单将会中断交易</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">手续费最低充值金额</label>
        <div class='col-sm-8'>
            <input type="text"  name="fee_limit"  autocomplete="off" class="layui-input"  value="<?php echo plugconf('custompay','fee_limit'); ?>">
            <p class="help-block">手续费每次最低充值的金额</p>
        </div>
    </div>


    <div class="col-sm-12 text-center">
        <div class="hr-line-dashed"></div>
    </div>



    <div class="form-group">
        <div class="col-sm-12">
            <div class="layui-form-item text-center">
                <button class="layui-btn" type="submit">保存配置</button>
                <a class="layui-btn" data-title="充值订单管理" data-open="<?php echo url('custompayOrder'); ?>" href="javascript:void(0)">充值订单管理</a>
            </div>
        </div>
    </div>


</form>


<div class="form-group">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
            <p style="font-size:16px;" class="text-center">自配接口列表</p>
        </div>
    </div>
</div>

<div class="form-group">
    <div class="col-sm-8 col-sm-offset-2">
        <form  onsubmit="return false;" data-auto="" method="POST" data-listen="true" novalidate="novalidate">
            <input type="hidden" value="resort" name="action">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="text-center">接口名称</th>
                        <th class='text-center'>接口代码</th>
                        <th class='text-center'>显示名称</th>
                        <th class='text-center'>费率</th>
                        <th class='text-center'>开关</th>
                        <th class="text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($channelList as $v): ?>
                    <tr>

                        <td class="text-center"><font color="green">【自定义】</font><?php echo $v['title']; ?></td>
                        <td class='text-center'><?php echo $v['code']; ?></td>
                        <td class='text-center'><?php echo $v['show_name']; ?></td>
                        <td class='text-center'>
                            <?php echo $v['lowrate']*1000; ?>‰
                        </td>
                        <td class='text-center'>
                            <div class="layui-btn-group">
                                <button type="button" class='layui-btn <?php if($v['status']==1): ?>layui-btn-normal<?php else: ?>layui-btn-primary<?php endif; ?> layui-btn-small btn-status-open' onclick="changeStatus(<?php echo $v['id']; ?>, 1)">开启</button>
                                <button type="button" class='layui-btn <?php if($v['status']==0): ?>layui-btn-normal<?php else: ?>layui-btn-primary<?php endif; ?> layui-btn-small btn-status-close' onclick="changeStatus(<?php echo $v['id']; ?>, 0)">关闭</button>
                            </div>
                        </td>
                        <td class='text-center'>
                            <div class="layui-btn-group">
                                <button type="button" class="layui-btn layui-btn-small" data-modal="<?php echo url('plugin/custompayChannelEdit',['channel_id'=>$v['id']]); ?>" data-title="编辑支付接口">编辑</button>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </form>
    </div>
</div>





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
    function changeStatus(id, status){
    $.ajax({
    url:'<?php echo url("channel/change_status"); ?>',
            type:'post',
            data:{channel_id:id, status:status},
            success:function(res){
            if (res.code == 1){
            location.reload();
            } else{
            alert(res.msg);
            }
            }
    });
    }
</script>

    </div>
    
</div>