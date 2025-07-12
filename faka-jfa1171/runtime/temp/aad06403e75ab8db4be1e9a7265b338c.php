<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:86:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/user/loginlog.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        
<!-- 表单搜索 开始 -->
<form class="layui-form layui-form-pane form-search" action="__SELF__" onsubmit="return false" method="get">

    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">商户ID</label>
        <div class="layui-input-inline">
            <input name="user_id" value="<?php echo (\think\Request::instance()->get('user_id') ?: ''); ?>" placeholder="请输入商户ID" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">商户账号</label>
        <div class="layui-input-inline">
            <input name="username" value="<?php echo (\think\Request::instance()->get('username') ?: ''); ?>" placeholder="请输入商户账号" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">IP</label>
        <div class="layui-input-inline">
            <input name="ip" value="<?php echo (\think\Request::instance()->get('ip') ?: ''); ?>" placeholder="请输入IP" class="layui-input">
        </div>
    </div>

	<div class="layui-form-item layui-inline">
		<label class="layui-form-label">登录时间</label>
		<div class="layui-input-inline">
			<input name="date_range" id="date_range" value="<?php echo urldecode(\think\Request::instance()->get('date_range')); ?>" placeholder="请选择时间范围" class="layui-input">
		</div>
	</div>

    <div class="layui-form-item layui-inline">
        <button type="submit" class="layui-btn layui-btn-primary"><i class="fa fa-search"></i> 搜 索</button>
    </div>
</form>
<!-- 表单搜索 结束 -->
<div class="layui-form-item layui-inline">
    <label class="layui-form-label">记录数</label>
    <div class="layui-input-inline">
        <input type="text" class="layui-input" value="<?php echo $log_count; ?>" readonly>
    </div>
</div>

<form onsubmit="return false;" data-auto="true" method="post">
    <input type="hidden" value="resort" name="action"/>
    <table class="layui-table" lay-skin="line" lay-size="sm">
        <thead>
        <tr>
            <th>商户ID</th>
			<th>商户账号</th>
			<th>登录时间</th>
			<th>登录IP</th>
			<th>操作</th>
        </tr>
        </thead>
        <tbody>
			<?php foreach($logs as $v): ?>
	        <tr>
				<td><?php echo $v['user_id']; ?></td>
				<td><?php echo $v['user']['username']; ?></td>
				<td><?php echo date("Y-m-d H:i:s",$v['create_at']); ?></td>
				<td>
					<a href="//www.baidu.com/s?wd=<?php echo $v['ip']; ?>&amp;rsv_spt=1&amp;issp=1&amp;rsv_bp=0&amp;ie=utf-8&amp;tn=baiduhome_pg" title="点击查看IP来源" target="_blank"><?php echo $v['ip']; ?></a>
				</td>
				<td>
	                <a href="<?php echo url("login"); ?>?user_id=<?php echo $v['user_id']; ?>" target="_blank">登录</a>
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
        form.render();
    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //日期范围
        laydate.render({
            elem: '#date_range',
            range: true
        });
    });
</script>

    </div>
    
</div>