<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:83:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/cash/index.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
<div class="ibox">
    
    <?php if(isset($title)): ?>
    <div class="ibox-title notselect">
        <h5><?php echo $title; ?></h5>
        
<div class="nowrap pull-right" style="margin-top:10px">
    <div class="layui-btn-group">
        <a href="<?php echo $self_url; ?>&#38;date_type=" class="layui-btn layui-btn-small <?php if(\think\Request::instance()->get('date_type') != ''): ?>layui-btn-primary<?php else: ?>layui-btn-normal<?php endif; ?>">全部</a>
        <a href="<?php echo $self_url; ?>&#38;date_type=month" class="layui-btn layui-btn-small <?php if(\think\Request::instance()->get('date_type') != 'month'): ?>layui-btn-primary<?php else: ?>layui-btn-normal<?php endif; ?>">本月</a>
        <a href="<?php echo $self_url; ?>&#38;date_type=week" class="layui-btn layui-btn-small <?php if(\think\Request::instance()->get('date_type') != 'week'): ?>layui-btn-primary<?php else: ?>layui-btn-normal<?php endif; ?>">本周</a>
        <a href="<?php echo $self_url; ?>&#38;date_type=day" class="layui-btn layui-btn-small <?php if(\think\Request::instance()->get('date_type') != 'day'): ?>layui-btn-primary<?php else: ?>layui-btn-normal<?php endif; ?>">今日</a>
    </div>
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
        
<style>
    .show_img img{
    position: absolute;
    top: -53px;
    left: 0;
	display:none;
	max-width: 249px;
    z-index: 2;
}
</style>
<!-- 表单搜索 开始 -->
<form class="layui-form layui-form-pane form-search" action="__SELF__" onsubmit="return false" method="get" id="srarch-form">
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">商户账号</label>
        <div class="layui-input-inline">
            <input name="username" value="<?php echo (\think\Request::instance()->get('username') ?: ''); ?>" placeholder="请输入商户账号" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">收款类型</label>
        <div class="layui-input-inline">
            <select name="type">
                <option value="">全部</option>
                <option value="1" <?php if(\think\Request::instance()->get('type')==1): ?>selected<?php endif; ?>>支付宝 </option> <option value="2" <?php if(\think\Request::instance()->get('type')==2): ?>selected<?php endif; ?>>微信 </option> <option value="3" <?php if(\think\Request::instance()->get('type')==3): ?>selected<?php endif; ?>>银行
                    </option> </select> </div> </div> <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">审核状态</label>
                    <div class="layui-input-inline">
                        <select name="status">
                            <option value="">全部</option>
                            <option value="0" <?php if(\think\Request::instance()->get('status')==='0'): ?>selected<?php endif; ?>>待审核 </option> <option value="1"
                                <?php if(\think\Request::instance()->get('status')==1): ?>selected<?php endif; ?>>已打款 </option> <option value="2" <?php if(\think\Request::instance()->get('status')==2): ?>selected<?php endif; ?>>驳回 </option> </select> </div> </div> <div class="layui-form-item layui-inline">
                                <label class="layui-form-label">时间范围</label>
                                <div class="layui-input-inline">
                                    <input name="date_range" id="date_range" value="<?php echo urldecode(\think\Request::instance()->get('date_range')); ?>"
                                        placeholder="请选择时间范围" class="layui-input">
                                </div>
                    </div>

                    <div class="layui-form-item layui-inline">
                        <button type="submit" class="layui-btn layui-btn-primary"><i class="fa fa-search"></i> 搜
                            索</button>
                    </div>

                    <div class="layui-form-item layui-inline">
                        <a href="/admin.html#/manage/cash/index.html?spm=m-106-107&username=&type=1&status=0&date_range=" class="layui-btn layui-btn-primary"><i class="fa fa-search"></i> 支付宝待审核</a>
                        <a href="/admin.html#/manage/cash/index.html?spm=m-106-107&username=&type=2&status=0&date_range=" class="layui-btn layui-btn-primary"><i class="fa fa-search"></i> 微信待审核</a>
                        <a href="/admin.html#/manage/cash/index.html?spm=m-106-107&username=&type=3&status=0&date_range=" class="layui-btn layui-btn-primary"><i class="fa fa-search"></i> 银行待审核</a>
                        <a href="javascript:excel()" class="layui-btn layui-btn-primary"><i class="layui-icon">&#xe62d;</i>导出 excel </a>
                    </div>
    
                    <div class="layui-form-item layui-inline">
                        <a href="javascript:zfbexcel()" class="layui-btn layui-btn-light"><i class="layui-icon">&#xe62d;</i>
                            导出支付宝 excel </a>
                    </div>
    
</form>
<div class="layui-form-item layui-inline">
    <div class="layui-input-inline">
        <span style="color:green"><i class="glyphicon glyphicon-ok"></i> 已开启打款站内信通知</span>
    </div>
</div>

<div class="layui-form-item layui-inline">
    <div class="layui-input-inline">
       <form onsubmit="return false;" data-auto="true" method="post">
        <?php if(sysconf('cash_weixinnotify_open')==1): ?>
        <span style="color:green"><i class="glyphicon glyphicon-ok"></i> 已开启打款微信通知</span>
        <a class="btn btn-danger btn-xs text-white" data-update="0" data-field='status' data-value='0' data-action='<?php echo url("cash_weixinnotify_open"); ?>'
           href="javascript:void(0)">关闭</a>
        <?php else: ?>
        <span style="color:red"><i class="glyphicon glyphicon-remove"></i> 已关闭打款微信通知</span>
        <a class="btn btn-warning btn-xs"  data-update="0" data-field='status' data-value='1' data-action='<?php echo url("cash_weixinnotify_open"); ?>'
           href="javascript:void(0)">开启</a>
        <?php endif; ?>
       </form>
    </div>
</div>

<div class="layui-form-item layui-inline">
    <div class="layui-input-inline">
       <form onsubmit="return false;" data-auto="true" method="post">
        <?php if(sysconf('cash_emailnotify_open')==1): ?>
        <span style="color:green"><i class="glyphicon glyphicon-ok"></i> 已开启打款邮件通知</span>
        <a class="btn btn-danger btn-xs text-white" data-update="0" data-field='status' data-value='0' data-action='<?php echo url("cash_emailnotify_open"); ?>'
           href="javascript:void(0)">关闭</a>
        <?php else: ?>
        <span style="color:red"><i class="glyphicon glyphicon-remove"></i> 已关闭打款邮件通知</span>
        <a class="btn btn-warning btn-xs"  data-update="0" data-field='status' data-value='1' data-action='<?php echo url("cash_emailnotify_open"); ?>'
           href="javascript:void(0)">开启</a>
        <?php endif; ?>
       </form>
    </div>
</div>


<!-- 表单搜索 结束 -->
<div class="layui-card-body">
    <table class="layui-table" lay-even="" lay-skin="line">
        <colgroup>
            <col width="20%">
            <col width="30%">
            <col width="20%">
            <col width="30%">
        </colgroup>
        <thead>
            <tr>
                <th class="text-left">今日结算总金额</th>
                <th class="text-left">结算总金额</th>
                <th class="text-left">结算手续费</th>
                <th class="text-left">实结金额</th>
                <th class="text-left">未结金额</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="nowrap"><?php echo $stat['todaysum']; ?></td>
                <td class="nowrap"><?php echo $stat['totalsum']; ?></td>
                <td class="nowrap"><?php echo $stat['totalfee']; ?></td>
                <td class="nowrap"><?php echo $stat['totalactual']; ?></td>
                <td class="nowrap"><?php echo $stat['totalmoney']; ?></td>
            </tr>

    </table>
</div>
<button id="pay_batch" type="button" class="layui-btn layui-btn-normal layui-btn-small">批量打款</button>
<div class="" style="margin-bottom:10px;"></div>
<form onsubmit="return false;" data-auto="true" method="post">
    <input type="hidden" value="resort" name="action" />
    <table class="layui-table" lay-skin="line" lay-size="sm">
        <thead>
            <tr>
                <th class='list-table-check-td'>
                    <input data-none-auto="" data-check-target='.list-check-box' type='checkbox' />
                </th>
                <th class='text-center'>ID</th>
                <th class='text-center'>触发类型</th>
                <th class='text-center'>商户账号</th>
                <th class='text-center'>收款类型</th>
                <th>收款信息</th>
                <th class='text-center'>提现金额（元）</th>
                <th class='text-center'>手续费</th>
                <th class='text-center'>实际到账（元）</th>
                <th class='text-center'>状态</th>
                <th class='text-center'>创建时间</th>
                <th class='text-center'>打款时间</th>
                <th class='text-center'>操作</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach($cashs as $v): ?>
            <tr>
                <td class='list-table-check-td'>
                    <input class="list-check-box" value='<?php echo $v['id']; ?>' type='checkbox' />
                </td>
                <td class='text-center'><?php echo $v['id']; ?></td>
                <td class='text-center'><?php if($v['auto_cash'] == 1): ?><span style="color:red;">自动提现</span><?php else: ?><span>手动提现</span><?php endif; ?></td>
                <td class='text-center'><?php echo $v['user']['username']; ?></td>
                <td class='text-center'>
                    <?php switch($v['type']): case "1": ?>支付宝<?php break; case "2": ?>微信<?php break; case "3": ?>银行<?php break; endswitch; ?>
                </td>
                <td class="show_img">
                    <?php echo $v['collect_info']; if(($v['type'] == 1 || $v['type'] == 2) && $v['collect_img']): ?><br />
                    收款二维码：<a href="javascript:;">点击查看</a><img src="<?php echo $v['collect_img']; ?>" alt=''><?php endif; ?>
                </td>
                <td class='text-center'><?php echo $v['money']; ?></td>
                <td class='text-center'><?php echo $v['fee']; ?></td>
                <td class='text-center'><?php echo $v['actual_money']; ?></td>
                <td class='text-center'>
                    <?php switch($v['status']): case "0": ?><font color="blue">待审核</font><?php break; case "1": ?><font color="green">已打款</font><?php break; case "2": ?><font color="red">驳回</font><?php break; endswitch; ?>
                </td>
                <td class='text-center'><?php echo date("Y-m-d H:i:s",$v['create_at']); ?></td>
                <td class='text-center'><?php if($v['status']==1): ?><?php echo date("Y-m-d H:i:s",$v['complete_at']); endif; ?></td>
                <td class='text-center'>
                    <?php if($v['status']==0 && $v['daifu_status'] == 0): ?>
                    <button class="layui-btn layui-btn-small" type="button" onclick="do_action('pass', <?php echo $v['id']; ?>)">手工打款</button>
                    <button class="layui-btn layui-btn-small" type="button" data-modal='<?php echo url("daifu"); ?>?cash_id=<?php echo $v['id']; ?>'>代付打款</button>
                    <button class="layui-btn layui-btn-small" type="button" onclick="do_action('notpass',<?php echo $v['id']; ?>)">驳回</button>
                    <?php elseif($v['status']==0 && $v['daifu_status'] == 1): ?>
                    已申请代付，请耐心等候，代付单号为<br>
                    <?php echo $v['orderid']; endif; ?>
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

    function do_action(action, id) {
        if (action == 'pass') {
            layer.confirm("是否打款？", function (index) {
                $.ajax({
                    url: "<?php echo url('detail'); ?>",
                    type: 'post',
                    data: {
                        cash_id: id,
                        action: action
                    },
                    success: function (res) {
                        if (res.code == 1) {
                            window.location.reload();
                            layer.msg(res.msg, {
                                icon: 1,
                                time: 1000
                            });
                        } else {
                            layer.msg(res.msg, {
                                icon: 1,
                                time: 1000
                            });
                        }
                    }
                });
            });
        } else if (action == 'notpass') {
           layer.prompt({formType: 2,title: '请输入驳回理由', }, function(value, index, elem){
               
                  $.ajax({
                    url: "<?php echo url('detail'); ?>",
                    type: 'post',
                    data: {
                        cash_id: id,
                        action: action,
                        reason: value
                    },
                    success: function (res) {
                        if (res.code == 1) {
                            window.location.reload();
                            layer.msg(res.msg, {
                                icon: 1,
                                time: 1000
                            });
                        } else {
                            layer.msg(res.msg, {
                                icon: 1,
                                time: 1000
                            });
                        }
                    }
                });
           });
         
        }
    }

    function excel() {
        window.open('/manage/cash/dumpCashs?' + $('#srarch-form').serialize())
    }
    function zfbexcel() {
        window.open('/manage/plugin/zfbCashs?' + $('#srarch-form').serialize())
    }


    $(function () {
        $(".show_img a").mouseover(function () {

            $(this).parent().find("img").show();
        });

        $(".show_img img").mouseout(function () {
            $(this).hide();

        });
    });
    $('#pay_batch').click(function () {
        var ids = '';
        $('.list-check-box').each(function () {
            var _this = $(this);
            if (_this.is(':checked')) {
                ids = ids + _this.val() + ',';
            }
        });
        layer.confirm('确定要批量打款吗？', function (index) {
            if (ids == '') {
                layer.msg('请选择提现申请！');
                return false;
            }
            $.ajax({
                url: "/manage/cash/pay_batch",
                type: 'post',
                data: {
                    'ids': ids
                },
                success: function (res) {
                    if (res.code == 1) {
                        layer.msg(res.msg, {
                            icon: 1,
                            time: 1000
                        });
                        $.form.reload();
                    } else {
                        layer.msg(res.msg, {
                            icon: 1,
                            time: 1000
                        });
                    }
                }
            });
        });
    });
</script>

    </div>
    
</div>