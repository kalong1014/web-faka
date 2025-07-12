<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:90:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/ambassador.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        
<div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
    <p style="font-size:14px;">推广大使功能可单独设置商户为推广大使，推广总开关开启关闭不印象推广大使。<a href='/admin.html#/manage/site/spread.html'>总开关管理</a></p>
</div>

<!-- 表单搜索 开始 -->
<form class="layui-form layui-form-pane form-search" action="__SELF__" onsubmit="return false" method="get">
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">商户账号</label>
        <div class="layui-input-inline">
            <input name="username" value="<?php echo htmlentities((\think\Request::instance()->get('username') ?: '')); ?>" placeholder="请输入商户账号" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-inline">
            <select name="status">
                <option value="">全部状态</option>
                <option value="0" <?php if(\think\Request::instance()->get('status') === '0'): ?>selected<?php endif; ?>>待审核</option>
                <option value="1" <?php if(\think\Request::instance()->get('status') === '1'): ?>selected<?php endif; ?>>已审核</option>
                <option value="-1" <?php if(\think\Request::instance()->get('status') === '-1'): ?>selected<?php endif; ?>>已拒绝</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <button type="submit" class="layui-btn layui-btn-primary"><i class="fa fa-search"></i> 搜 索</button>
        <button type="button" class="layui-btn layui-btn-normal" data-modal="<?php echo url('ambassadorEdit'); ?>" data-title="添加大使">添加大使</button>
    </div>
</form>


<form onsubmit="return false;" data-auto="true" method="post">
    <input type="hidden" value="resort" name="action">
    <table class="table table-hover">
        <thead>
            <tr>
                <th class="text-center">用户ID</th>
                <th class="text-center">用户名</th>
                <th class="text-center">邀请注册奖励</th>
                <th class="text-center">推广返佣比例</th>
                <th class="text-center">添加时间</th>
                <th class="text-center">操作</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach($list as $v): ?>
            <tr>
                <td class="text-center"><?php echo $v['user_id']; ?></td>
                <td class="text-center"><?php echo $v['user']['username']; ?></td>
                <td class="text-center"><?php echo $v['spread_reward_money']; ?>元</td>
                <td class="text-center"><?php echo $v['spread_rebate_rate']; ?>%</td>
                <td class='text-center'><?php echo date("Y-m-d H:i:s",$v['create_at']); ?></td>
                <td class='text-center'>
                    <a href="javascript:;" data-modal="<?php echo url('ambassadorEdit',['id'=>$v['id']]); ?>" data-title="编辑大使">编辑</a>
                    <a href="javascript:;" onclick="del(this, '<?php echo $v['id']; ?>')">删除</a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</form>
<?php echo $page; ?>
<script>
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#date_range',
            range: true
        });
    });

    function del(obj, id) {
        layer.confirm('确认要删除此项吗？', function (index) {
            $.ajax({
                url: "<?php echo url('ambassador'); ?>",
                type: 'post',
                data: 'act=del&id=' + id,
                success: function (res) {
                    if (res.code == 1) {
                        layer.msg("操作成功");
                        setTimeout(function () {
                            location.reload();
                        }, 200);
                    } else {
                        layer.alert(res.msg);
                    }
                }
            });
        });
    }
</script>

    </div>
    
</div>