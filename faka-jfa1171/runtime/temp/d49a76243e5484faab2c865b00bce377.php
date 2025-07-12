<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:82:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/user/rate.html";i:1646323578;}*/ ?>
<form class="layui-form layui-box" style='padding:25px 30px 20px 0' action="__SELF__" data-auto="true" method="post">

    <div class="layui-form-item">
        <label class="layui-form-label">费率模式</label>
        <div class="layui-input-block">
            <label class="think-radio">
                <?php if($user['rate_type']==0): ?>
                <input checked type="radio" name="rate_type" value="0" title="使用费率分组" lay-ignore>
                <?php else: ?>
                <input type="radio" name="rate_type" value="0" title="使用费率分组" lay-ignore>
                <?php endif; ?>
                使用费率分组
            </label>
            <label class="think-radio">
                <?php if($user['rate_type']==1): ?>
                <input checked type="radio" name="rate_type" value="1" title="单独自定义" lay-ignore>
                <?php else: ?>
                <input type="radio" name="rate_type" value="1" title="单独自定义" lay-ignore>
                <?php endif; ?>
                单独自定义
            </label>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="layui-form-item"  data-rate-type="0">
        <label class="layui-form-label">费率分组</label>
        <div class="layui-input-block">
            <select id="group" name="group">
                <?php foreach($rate_group as $v): ?>
                <option value="<?php echo $v['id']; ?>" <?php if($v['id'] == $userGroup): ?>selected<?php endif; ?>><?php echo $v['title']; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>


    <div data-rate-type="1" style="max-height: 320px;overflow-x: hidden; overflow-y: scroll;">
        <?php foreach($channels as $v): ?>
        <div class="layui-form-item" >
            <label class="layui-form-label">
                <?php if($v['is_custom']==1): ?>
                <font color="green">【自定义】</font>
                <?php endif; ?>
                <?php echo $v['title']; ?>
            </label>
            <div class="layui-input-inline" style="width: 60%">
                <input id="channel_ids<?php echo $v['id']; ?>" type="number" name="channel_ids[<?php echo $v['id']; ?>]" value="<?php echo (isset($userRate[$v['id']]) && ($userRate[$v['id']] !== '')?$userRate[$v['id']]:''); ?>" title="请输入<?php echo $v['title']; ?>" placeholder="请输入<?php echo $v['title']; ?>" class="layui-input">
                <span>单位：千分率，如千分之三，设置为 3 即可。充值费率：<?php echo $v['lowrate']*1000; ?>‰</span>
            </div>
            <div class="layui-input-inline" style="width: 20%">
                <div class="layui-btn-group">
                    <button type="button" id="btn-open-<?php echo $v['id']; ?>" class="layui-btn <?php if($userChannel[$v['id']]==1): ?>layui-btn-normal<?php else: ?>layui-btn-primary<?php endif; ?> layui-btn-small btn-status-open" onclick="changeStatus('<?php echo $v['id']; ?>', 1)">开启</button>
                    <button type="button" id="btn-close-<?php echo $v['id']; ?>" class="layui-btn <?php if($userChannel[$v['id']]==0): ?>layui-btn-normal<?php else: ?>layui-btn-primary<?php endif; ?> layui-btn-small btn-status-close" onclick="changeStatus('<?php echo $v['id']; ?>', 0)">关闭</button>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
        <div class="layui-form-item text-center">
        <p><font color="green">【自定义】通道为商户端可以自定义的通道，您可以在这里设置费率（从预存款扣除）</font></p>
        </div>
    </div>
    
    <div class="hr-line-dashed"></div>

    <div class="layui-form-item text-center">
        <input type="hidden" name="user_id" value="<?php echo $user_id; ?>">
        <button class="layui-btn" type='submit'>保存</button>
        <button class="layui-btn layui-btn-danger" type='button' data-confirm="确定要取消吗？" data-close>取消</button>
    </div>

</form>

<script>
    group = {};
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();

        form.on('select', function () {
            var id = $('#group').val();
            var groupInfo = group['g' + id];
            if (groupInfo) {
                //已经请求过分组数据
                setRate(groupInfo);
            } else {
                //没有请求过分组数据
                $.get("<?php echo url('manage/user/getRateRouteInfo'); ?>", {id: id}, function (res) {
                    if (res.code == 200) {
                        group['g' + id] = res.data
                        setRate(res.data);
                    } else {
                        layer.msg('费率分组数据请求错误，请刷新重试', {icon: 2})
                    }
                }, 'json')
            }
        });
    });

    function setRate(data) {
        for (i in data.rules) {
            $('#channel_ids' + data.rules[i].channel_id).val(data.rules[i].rate * 1000);
        }
    }



    (function () {
        window.form.render();
        buildForm('<?php echo $user['rate_type']; ?>');
        $('[name=rate_type]').on('click', function () {
            buildForm($('[name=rate_type]:checked').val())
        });

        // 表单显示编译
        function buildForm(value) {
            var $tips = $("[data-rate-type='" + value + "']");
            $("[data-rate-type]").not($tips.show()).hide();
        }
    })();


    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });
    //更新接口状态
    function changeStatus(channel_id, status) {
        $.ajax({
            url: '<?php echo url("change_channel_status"); ?>',
            type: 'post',
            data: {user_id: '<?php echo $user_id; ?>', channel_id: channel_id, status: status},
            success: function (res) {
                if (res.code == 1) {
                    layer.msg(res.msg);
                    if (status == 1) {
                        $('#btn-open-' + channel_id).removeClass('layui-btn-primary');
                        $('#btn-open-' + channel_id).addClass('layui-btn-normal');
                        $('#btn-close-' + channel_id).removeClass('layui-btn-normal');
                        $('#btn-close-' + channel_id).addClass('layui-btn-primary');
                    } else {
                        $('#btn-open-' + channel_id).removeClass('layui-btn-normal');
                        $('#btn-open-' + channel_id).addClass('layui-btn-primary');
                        $('#btn-close-' + channel_id).removeClass('layui-btn-primary');
                        $('#btn-close-' + channel_id).addClass('layui-btn-normal');
                    }
                } else {
                    layer.alert(res.msg);
                }
            }
        });
    }
</script>
