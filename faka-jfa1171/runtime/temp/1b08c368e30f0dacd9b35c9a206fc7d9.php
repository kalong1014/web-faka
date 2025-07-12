<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:92:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/risk_pedding.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
<div class="layui-form-item">

    <button <?php if(plugconf('risk','mode')=='0'): ?>style="display:none"<?php endif; ?> type="button" class="layui-btn layui-btn-normal" data-modal="<?php echo url('riskKeyword'); ?>" data-title="关键词风控设置">关键词风控设置</button>
    <button <?php if(plugconf('risk','mode')=='0'): ?>style="display:none"<?php endif; ?> type="button" class="layui-btn layui-btn-normal" data-modal="<?php echo url('riskComplaint'); ?>" data-title="投诉风控设置">投诉风控设置</button>
    <button type="button" onclick="search(this)" class="layui-btn"><i class="fa fa-search"></i> 智能筛选</button>

    <button  type="button" class="layui-btn layui-btn-primary pull-right" data-open="<?php echo url('riskWhite'); ?>" data-title="风控白名单">风控白名单</button>
    <button  type="button" class="layui-btn layui-btn-primary pull-right" data-modal="<?php echo url('riskDefault'); ?>" data-title="默认提示语">默认提示语</button>
</div>

<div class="layui-form-item layui-inline">
    <label class="layui-form-label">待处理</label>
    <div class="layui-input-inline">
        <input type="text" class="layui-input" value="<?php echo $peddingCount; ?> 个" readonly="">
    </div>
</div>


<form onsubmit="return false;" data-auto="true" method="post">
    <input type="hidden" value="resort" name="action"/>
    <table class="layui-table" lay-skin="line" lay-size="sm">
        <thead>
            <tr>
                <th class='text-center'>ID</th>
                <th class='text-center'>商户账号</th>
                <th class='text-center'>风控原因</th>
                <th class='text-center'>风控来源</th>
                <th class='text-center'>创建时间</th>
                <th class='text-center'>操作</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach($list as $v): ?>
            <tr>
                <td class='text-center'><?php echo $v['id']; ?></td>
                <td class='text-center'><a data-open="<?php echo url('manage/user/index'); ?>?field=1&keyword=<?php echo $v['user_id']; ?>"  href="javascript:void(0)"><?php echo $v['user']['username']; ?></a></td>
                <td class='text-center'><?php echo $v['reason']; ?></td>

                <td class='text-center'>
                    <?php switch($v['from_type']): case "0": ?>商品名 <a data-open="<?php echo url('manage/goods/index',['id'=>$v['from_id']]); ?>" href="javascript:void(0)">查看</a><?php break; case "1": ?><font color="blue">商品描述</font><?php break; case "2": ?><font color="blue">投诉信息</font><?php break; case "3": ?><font color="blue">投诉率</font><?php break; case "4": ?><font color="red">手动添加</font><?php break; endswitch; ?>
                </td>
                <td class='text-center'><?php echo date("Y-m-d H:i:s",$v['create_at']); ?></td>
                <td class='text-center'>
                    <a href="javascript:;"  data-modal="<?php echo url('riskManage',['id'=>$v['id']]); ?>" data-title="风控操作">风控操作</a>
                    <a href="javascript:;" onclick="white(this, '<?php echo $v['id']; ?>')">忽略加白</a>
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
        //日期范围
        laydate.render({
            elem: '#date_range',
            range: true
        });
    });



    /*订单-删除*/
    function search(obj) {
        $.ajax({
            url: "<?php echo url('riskAction'); ?>",
            type: 'post',
            data: 'act=search',
            success: function (res) {
                if (res.code == 1) {
                    layer.msg("刷新成功");
                    setTimeout(function () {
                        location.reload();
                    }, 200);
                } else {
                    layer.alert(res.msg);
                }
            }
        });
    }
    function white(obj, id) {
        layer.confirm('确认要忽略加白此项吗？', function (index) {
            $.ajax({
                url: "<?php echo url('riskAction'); ?>",
                type: 'post',
                data: 'act=addwhite&id=' + id,
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