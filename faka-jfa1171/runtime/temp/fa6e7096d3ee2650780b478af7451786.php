<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:95:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/article_category/index.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
<div class="ibox">
    
    <?php if(isset($title)): ?>
    <div class="ibox-title notselect">
        <h5><?php echo $title; ?></h5>
        
<div class="nowrap pull-right" style="margin-top:10px">
    <button data-modal='<?php echo url("add"); ?>' data-title="添加分类" class='layui-btn layui-btn-small'><i
            class='fa fa-plus'></i> 添加分类
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
        

<form onsubmit="return false;" data-auto="true" method="post">
    <input type="hidden" value="resort" name="action"/>
    <table class="layui-table" lay-skin="line" lay-size="sm">
        <thead>
        <tr>
            <th>ID</th>
            <th>分类名</th>
            <th>别名</th>
            <th>分类备注</th>
            <th>状态</th>
            <th>添加时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            <?php foreach($categorys as $v): ?>
            <tr>
            <td><?php echo $v['id']; ?></td>
            <td><?php echo $v['name']; ?></td>
            <td><?php echo $v['alias']; ?></td>
            <td><?php echo $v['remark']; ?></td>
            <td>
                <?php if($v['status']==1): ?>
                <a style="color:green" data-tips="确定不可用吗？ " data-update="<?php echo $v['id']; ?>" data-field='status' data-value='0' data-action='<?php echo url("change_status"); ?>'
                   href="javascript:void(0)"><i class="glyphicon glyphicon-ok"></i></a>
                <?php else: ?>
                <a style="color:red" data-tips="确定可用吗？" data-update="<?php echo $v['id']; ?>" data-field='status' data-value='1' data-action='<?php echo url("change_status"); ?>'
                   href="javascript:void(0)"><i class="glyphicon glyphicon-remove"></i></a>
                <?php endif; ?>
            </td>
            <td><?php echo date("Y-m-d H:i:s",$v['create_at']); ?></td>
            <td>
                <a data-title="编辑" data-modal='<?php echo url("edit"); ?>?cate_id=<?php echo $v['id']; ?>' href="javascript:void(0)">编辑</a>
                <a data-title="删除"  href="javascript:void(0)" onclick="del(this,'<?php echo $v['id']; ?>')">删除</a>
            </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</form>
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
    function del(obj, id) {
        layer.confirm('确认要删除此分类吗？', function (index) {
            $.ajax({
                url:"/manage/article_category/del",
                type:'post',
                data:'id='+id,
                success:function(res){
                    if(res.code == 1){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{icon:1,time:1000});
                    } else {
                        layer.msg('删除失败!',{icon:1,time:1000});
                    }
                }
            });
        });
    }
</script>

    </div>
    
</div>