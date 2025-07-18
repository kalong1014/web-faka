<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:84:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/goods/index.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
            <input name="user_id" value="<?php echo htmlentities((\think\Request::instance()->get('user_id') ?: '')); ?>" placeholder="请输入商户ID" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">商户账号</label>
        <div class="layui-input-inline">
            <input name="username" value="<?php echo htmlentities((\think\Request::instance()->get('username') ?: '')); ?>" placeholder="请输入商户账号" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">商品名</label>
        <div class="layui-input-inline">
            <input name="name" value="<?php echo htmlentities((\think\Request::instance()->get('name') ?: '')); ?>" placeholder="请输入商品名" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-inline">
            <select name="status">
                <option value="">全部状态</option>
                <option value="1" <?php if(\think\Request::instance()->get('status') === '1'): ?>selected<?php endif; ?>>已上架</option>
                <option value="0" <?php if(\think\Request::instance()->get('status') === '0'): ?>selected<?php endif; ?>>已下架</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">代理类型</label>
        <div class="layui-input-inline">
            <select name="is_proxy">
                <option value="">全部商品</option>
                <option value="0" <?php if(\think\Request::instance()->get('is_proxy') === '1'): ?>selected<?php endif; ?>>普通商品</option>
                <option value="1" <?php if(\think\Request::instance()->get('is_proxy') === '2'): ?>selected<?php endif; ?>>代理商品</option>
              
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">时间范围</label>
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
    <label class="layui-form-label">统计金额</label>
    <div class="layui-input-inline">
        <input type="text" class="layui-input" value="<?php echo (isset($sum_money) && ($sum_money !== '')?$sum_money:"0"); ?> 元" readonly>
    </div>
</div>
<div class="layui-form-item layui-inline">
    <label class="layui-form-label">商品数</label>
    <div class="layui-input-inline">
        <input type="text" class="layui-input" value="<?php echo (isset($sum_order) && ($sum_order !== '')?$sum_order:'0'); ?> 个" readonly>
    </div>
</div>
<div class="layui-form-item layui-inline">
    <button id="heand_del_batch" type="button" class="layui-btn layui-btn-small layui-btn-danger"><i class="fa fa-remove"></i>批量删除</button>
</div>
<form onsubmit="return false;" data-auto="true" method="post">
    <input type="hidden" value="resort" name="action"/>
    <table class="layui-table" lay-skin="line" lay-size="sm">
        <thead>
        <tr>
               <th class='list-table-check-td'>
                    <input data-none-auto="" data-check-target='.list-check-box' type='checkbox' />
                </th>
            <th>商户ID</th>
            <th>商户账号</th>
            <th>商品名称</th>
            <th>商品价格</th>
            <th>状态</th>
            <th>冻结状态</th>
            <th>是否代理商品</th>
            <th>添加时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach($goodsList as $v): ?>
        <tr>
             <td class='list-table-check-td'>
                    <input class="list-check-box" value='<?php echo $v['id']; ?>' type='checkbox' />
                </td>
            <td><?php echo $v['user_id']; ?></td>
            <td><?php echo $v['user']['username']; ?></td>
            <td style="width: 13%;" ><a href="<?php echo $v['link']; ?>" target="_blank"><?php echo $v['name']; ?></a></td>
            <td><?php echo $v['price']; ?></td>
            <td>
                <?php if($v['status']==1): ?>
                <span style="color:green"><i class="glyphicon glyphicon-ok"></i> 已上架</span>
                <a class="btn btn-danger btn-xs text-white" data-tips="确定取消冻结吗？ " data-update="<?php echo $v['id']; ?>" data-field='status' data-value='0' data-action='<?php echo url("change_status"); ?>'
                   href="javascript:void(0)">下架</a>
                <?php else: ?>
                <span style="color:red"><i class="glyphicon glyphicon-remove"></i> 已下架</span>
                <a class="btn btn-warning btn-xs" data-tips="确定冻结吗？" data-update="<?php echo $v['id']; ?>" data-field='status' data-value='1' data-action='<?php echo url("change_status"); ?>'
                   href="javascript:void(0)">上架</a>
                <?php endif; ?>
            </td>
            <td>
                <?php if($v['is_freeze']===0): ?>
                <span style="color:green"><i class="glyphicon glyphicon-ok"></i> 未冻结</span>
                <a class="btn btn-xs btn-danger" data-tips="确定取消冻结吗？ " data-update="<?php echo $v['id']; ?>" data-field='is_freeze' data-value='1' data-action='<?php echo url("change_freeze"); ?>'
                   href="javascript:void(0)">冻结</a>
                <?php else: ?>
                <span style="color:red"><i class="glyphicon glyphicon-remove"></i> 已冻结</span>
                <a class="btn btn-warning btn-xs" data-tips="确定冻结吗？" data-update="<?php echo $v['id']; ?>" data-field='is_freeze' data-value='0' data-action='<?php echo url("change_freeze"); ?>'
                   href="javascript:void(0)">解冻</a>
                <?php endif; ?>
            </td>
            <td>
                <?php switch($v['is_proxy']): case "0": ?><font color="green">否</font><?php break; case "1": ?><font color="red">是</font><?php break; default: endswitch; ?>
            </td>
            <td><?php echo date("Y-m-d H:i:s",$v['create_at']); ?></td>
            <td>
                <a onclick="del(this,'<?php echo $v['id']; ?>')">删除</a>
                <a href="<?php echo url('manage/user/login',['user_id'=>$v['user_id']]); ?>" target="_blank">登录</a>
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

    function del(obj,id) {
        layer.confirm('确定删除？删除后，商品将进入回收站！',function(val){
            if(val){
                $.post('/manage/goods/del',{
                    id:id
                },function(res){
                    if(res.code!=200){
                        layer.msg('删除失败');
                    }else{
                        layer.msg('删除成功！',function(){
                            location.reload();
                        });
                    }
                });
            }
        })
    }
    
    
      $('#heand_del_batch').click(function () {
        var ids = '';
        $('.list-check-box').each(function () {
            var _this = $(this);
            if (_this.is(':checked')) {
                ids = ids + _this.val() + ',';
            }
        });
        layer.confirm('确定要批量删除吗？', function (index) {
            if (ids == '') {
                layer.msg('请选择选项！');
                return false;
            }
            $.ajax({
                url: "/manage/goods/handBatchDel",
                type: 'post',
                data: {
                    'ids': ids,
                },
                success: function (res) {
                    if (res.code == 1) {
                        setTimeout(function () {
                            location.reload();
                        }, 1000);
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        layer.msg('删除失败!', {icon: 1, time: 1000});
                    }
                }
            });
        });
    });

</script>

    </div>
    
</div>