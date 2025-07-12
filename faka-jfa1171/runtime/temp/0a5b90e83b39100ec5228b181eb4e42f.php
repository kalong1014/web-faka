<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:90:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/invite_code/index.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
<div class="ibox">
    
    <?php if(isset($title)): ?>
    <div class="ibox-title notselect">
        <h5><?php echo $title; ?></h5>
        
<div class="nowrap pull-right" style="margin-top:10px">
    <button data-modal='<?php echo url("add"); ?>' data-title="生成邀请码" class='layui-btn layui-btn-small'><i
            class='fa fa-plus'></i> 生成邀请码
    </button>
</div>

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
        
<!-- 表单搜索 开始 -->
<form class="layui-form layui-form-pane form-search" action="__SELF__" onsubmit="return false" method="get">
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">邀请码</label>
        <div class="layui-input-inline">
            <input name="code" value="<?php echo (\think\Request::instance()->get('code') ?: ''); ?>" placeholder="请输入邀请码" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">持有者ID</label>
        <div class="layui-input-inline">
            <input name="user_id" value="<?php echo (\think\Request::instance()->get('user_id') ?: ''); ?>" placeholder="请输入持有者ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">激活者ID</label>
        <div class="layui-input-inline">
            <input name="invite_uid" value="<?php echo (\think\Request::instance()->get('invite_uid') ?: ''); ?>" placeholder="请输入激活者ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-inline">
            <select name="status">
                <option value="">全部</option>
                <option value="2" <?php if(\think\Request::instance()->get('status') === '2'): ?>selected<?php endif; ?>>已过期</option>
                <option value="1" <?php if(\think\Request::instance()->get('status') === '1'): ?>selected<?php endif; ?>>已使用</option>
                <option value="0" <?php if(\think\Request::instance()->get('status') === '0'): ?>selected<?php endif; ?>>未使用</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">添加时间</label>
        <div class="layui-input-inline">
            <input name="create_at" id="create_at" value="<?php echo urldecode(\think\Request::instance()->get('create_at')); ?>" placeholder="请选择时间范围" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">过期时间</label>
        <div class="layui-input-inline">
            <input name="expire_at" id="expire_at" value="<?php echo urldecode(\think\Request::instance()->get('expire_at')); ?>" placeholder="请选择时间范围" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item layui-inline">
        <button type="submit" class="layui-btn layui-btn-primary"><i class="fa fa-search"></i> 搜 索</button>
    </div>
</form>
<!-- 表单搜索 结束 -->
<div class="layui-form-item layui-inline">
    <label class="layui-form-label">邀请码数</label>
    <div class="layui-input-inline">
        <input type="text" class="layui-input" value="<?php echo (isset($counts) && ($counts !== '')?$counts:"0"); ?> 个" readonly>
    </div>
</div>
<div class="layui-form-item layui-inline">
    <div class="layui-input-inline">
       <form onsubmit="return false;" data-auto="true" method="post">
        <?php if(sysconf('merchant_invitecode_open')==1): ?>
        <span style="color:green"><i class="glyphicon glyphicon-ok"></i> 允许商户生成邀请码</span>
        <a class="btn btn-danger btn-xs text-white" data-tips="确定允许商户生成邀请码？ "  data-update="0" data-field='status' data-value='0' data-action='<?php echo url("merchant_invitecode_open"); ?>'
           href="javascript:void(0)">关闭</a>
        <?php else: ?>
        <span style="color:red"><i class="glyphicon glyphicon-remove"></i> 不允许商户生成邀请码</span>
        <a class="btn btn-warning btn-xs" data-tips="确定不允许商户生成邀请码？" data-update="0" data-field='status' data-value='1' data-action='<?php echo url("merchant_invitecode_open"); ?>'
           href="javascript:void(0)">开启</a>
        <?php endif; ?>
       </form>
    </div>
</div>
<form onsubmit="return false;" data-auto="true" method="post">
    <input type="hidden" value="resort" name="action"/>
    <table class="layui-table" lay-skin="line" lay-size="sm">
        <thead>
            <tr>
                <th>邀请码ID</th>
                <th>持有者</th>
                <th>邀请码</th>
                <th>状态</th>
                <th>受邀者ID</th>
                <th>邀请时间</th>
                <th>添加时间</th>
                <th>有效期</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach($codes as $v): ?>
            <tr>
                <td><?php echo $v['id']; ?></td>
                <td><?php if($v['user_id']==0): ?>系统<?php else: ?><?php echo $v['user']['username']; endif; ?></td>
                <td><?php echo $v['code']; ?></td>
                <td>
                    <?php switch($v['status']): case "0": ?><font color="gray">未使用</font><?php break; case "1": ?><font color="green">已使用</font><?php break; case "2": ?><font color="red">已过期</font><?php break; endswitch; ?>
                </td>
                <td>
                    <?php if($v['status']==1): ?>
                    <?php echo $v['invite_uid']; else: ?>
                    -
                    <?php endif; ?>
                </td>
                <td>
                    <?php if($v['status']==1): ?>
                    <?php echo date("Y-m-d H:i:s",$v['invite_at']); else: ?>
                    -
                    <?php endif; ?>
                </td>
                <td>
                    <?php echo date("Y-m-d H:i:s",$v['create_at']); ?>
                </td>
                <td>
                    <?php if($v['status']==1): ?>
                        已使用
                    <?php else: ?>
                        <?php echo $v['expire_day']; if($v['expire_at']!=0): if($v['create_at']>=$v['expire_at']): ?>
                                [ 已过期 ]
                            <?php else: ?>
                                [ <?php echo $v['expire_days']; ?>天 ]
                            <?php endif; endif; endif; ?>
                </td>
                <td>
                    <?php if($v['status']!=1): ?>
                    <a href="javascript:void(0);" onclick="delCode(<?php echo $v['user_id']; ?>,<?php echo $v['id']; ?>)">删除</a>
                    <?php endif; ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

</form>
<?php echo $page; ?>
<script>
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        layer = layui.layer;
        form.render();
    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //日期范围
        laydate.render({
            elem: '#create_at',
            range: true
        });
        //日期范围
        laydate.render({
            elem: '#expire_at',
            range: true
        });
    });
    function delCode(user_id,id)
    {
        layer.confirm('确认删除该邀请码？', {icon: 3, title:'提示'}, function(index){
            $.get("<?php echo url('del'); ?>",{
                user_id:user_id,
                id:id
            },function(res){
                console.log(res);
                if(res.code==1){
                    $.form.reload();
                }else{
                    alert(res.msg);
                }
            },'json');
            layer.close(index);
        });
    }
</script>

    </div>
    
</div>