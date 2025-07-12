<!--模板来自:蔚蓝-->
<!--兼容程序:彩虹代刷4.6版本-->
<!--作者:迷失的爱上云-->
<!--QQ：487845970-->
<!--TIME:2018年5月26日 15:38:31-->
<!--请务必保留以上版权信息-->

<!--温馨提醒：如果您没有在"迷失的爱上云"购买,说明您使用的为盗版程序,有被入侵的风险。-->
<?php
if(!defined('IN_CRONLITE'))exit();
?>
<!DOCTYPE html>
<html lang="zh-cn"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no,user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="copyright" content="HotLove">
<title><?php echo $conf['sitename']?> - <?php echo $conf['title']?></title>
<meta name="keywords" content="<?php echo $conf['keywords']?>">
<meta name="description" content="<?php echo $conf['description']?>">
<link rel="stylesheet" href="../assets/HotLove/css/bootstrap.min.css?date=20180508">
<link href="//lib.baomitu.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="../assets/HotLove/css/icon.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/HotLove/layui/css/layui.css">
<link href="../assets/HotLove/layui.css" rel="stylesheet">
<style>
html,body{
	font-family:微软雅黑;
}
::-webkit-scrollbar {
	width: 6px;
	background-color: transparent;
}
::-webkit-scrollbar-thumb {
	-webkit-border-radius: 8px;
	background-color: rgba(0,0,0,.16);
}
::-webkit-scrollbar-thumb:hover {
	background-color: rgba(0,0,0,.2);
}
.panel{border-radius:0px;border-color:#cfdbe2}
.panel-title {
color:#fff;
font-size:15px;
}
.addclass{
	border:3px solid #5ccdde;
}
</style>
<link href="../assets/HotLove/css/colpick.css" rel="stylesheet">
<script src="../assets/HotLove/js/colpick.js"></script>
<link id="layuicss-laydate" rel="stylesheet" href="../assets/HotLove/css/laydate.css" media="all">
<link id="layuicss-layer" rel="stylesheet" href="../assets/HotLove/css/layer.css" media="all">
<link id="layuicss-skincodecss" rel="stylesheet" href="../assets/HotLove/css/code.css" media="all">
</head>

<body style="background:url(<?php echo $background_image?>) fixed">
<div class="modal fade" align="left" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"><font color="#000000"><?php echo $conf['sitename']?></font></h4>
      </div>
      <div class="modal-body">
	  <?php echo $conf['modal']?>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">知道了</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade in" id="Showgg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header bg-primary-dark">
<i class="layui-icon close" style="font-size:20px;" data-dismiss="modal" aria-hidden="true">ဆ</i>
<h4 class="modal-title">公告详情</h4>
</div>
<div class="modal-body">
<h3 class="text-center" id="ggtitle"></h3>
<hr class="layui-bg-black">
<div class="text-muted text-center"> <i class="layui-icon"></i> 系统管理员 
<i class="layui-icon" style="font-size: 23px; color: #FF5722;"></i> 
<span id="ggdate"></span>
<i class="layui-icon layui-icon-dialogue"></i>  
<b id="gglook"></b>人已读
<hr class="layui-bg-black">
</div>
<div id="ggbody" class="text-center"></div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">好的</button>
</div>
</div>
</div>
</div>

<div class="page-loading" style="display: none;">
<div id="loader"></div>
<div class="loader-section section-left"></div>
<div class="loader-section section-right"></div>
</div>
<nav class="navbar navbar-default" role="navigation">
<div class="container-fluid">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
<span class="sr-only">切换导航</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="#" id="sitename"><?php echo $conf['sitename']?></a>
</div>
<div class="collapse navbar-collapse" id="example-navbar-collapse">
<ul class="nav navbar-nav navbar-right">
<li class="active"><a href="/"><i class="fa fa-shopping-cart"></i> 在线下单</a></li>
<li class=""><a href="/?mod=query"><i class="fa fa-search"></i> 订单查询</a></li>
<li class=""><a href="/user/reg.php"><i class="layui-icon layui-icon-website"></i> 网站搭建</a></li>
<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-heart-o"></i> 平台福利</a>
    <ul class="dropdown-menu">
                    <li <?php if($conf['iskami']==0){?>style="display:none;"<?php }?>><a data-toggle="modal" data-target="#kamibuy">卡密下单</a></li>
                    <li <?php if($conf['gift_open']==0){?>class="hide"<?php }?>><a data-toggle="modal" data-target="#choujiang">福利抽奖</a></li>
					<li><a href="/?mod=invite" target="_blank">免费领赞</a></li>
    </ul>
</li>
<li class="">
<a href="/user"><i class="layui-icon layui-icon-user"></i> 分站登录</a>
</li>

</ul>
</div>
</div>
</nav>
<div class="container"> 
<div class="col-sm-10 center-block" style="float: none;">
<div id="pjaxmain"><link rel="stylesheet" href="../assets/HotLove/index.css">
<style>
.icon {
    font-size: 18px;
}
</style>
<div class="col-md-auto box">
<div class="panel layui-anim layui-anim-up">
<div class="panel-heading text-center panel-headcolor-qq">
<font color="#fff">公告栏</font>
</div>
<div class="panel-body">
<?php
$rs = $DB->query('SELECT * FROM shua_gonggao');
while ($row = $DB->fetch($rs)) {
	echo '<a href="javascript:ShowGG(' . $row['id'] . ');"><div class="layui-elem-info">' . $row['title'] . '  <font style="float:right;position:relative;margin-right:0px" color="red">['; echo date("m-d",strtotime($row['date'])); echo ']</font></div></a>';
}
?>
<?php echo $conf['anounce']?>
</div>
</div>
<div class="panel layui-anim layui-anim-up" id="display_selectclass">
<div class="panel-heading text-center panel-headcolor-pink" id="panel-heading">
<font color="#fff">24小时自助下单</font>
</div>
<center class="list-group-item" style="padding-top:0px;">
<br><b><font color="blue">注册分站下单商品价格会变低哦！</font><br>如果有问题请联系客服QQ：<?php echo $conf['kfqq']?></b><br>
<br>
<div class="btn-group btn-group-justified">
<a class="layui-btn layui-btn-normal" href="/?mod=query"><i class="fa fa-search"></i> 订单查询</a>
<a class="layui-btn layui-btn-danger" href="/user/reg.php"><i class="fa fa-send-o"></i> 注册分站/赚钱</a>
</div>
</center>
	<div class="panel-body list-group-item">
<?php
$file = "update.php";
if(file_exists($file))
{
     echo '<div class="panel panel-default"><div class="panel-body">请贵站长先访问 http://';
	 echo $_SERVER['SERVER_NAME']; 
	 echo'/update.php 安装必要组件！不再出现此提示为正常使用。</div></div>';
}
else
{
    echo "<!-- 模板作者：迷失的爱上云 -->";
}
?>
  <div class="layui-form-pane">
				<div class="layui-form-item">
				<label class="layui-form-label">选择业务</label>
				<div class="layui-input-block">
				<select name="tid" id="cid" lay-verify="required" class="form-control"><?php echo $select?></select>
				</div>
				</div>
	</div>
	<div id="shoplist">

	</div>
	</div>
</div>
	<div class="form-group" id="shopinfo" style="display:none;">
			<div class="panel panel-info">
				<div class="panel-heading text-center panel-headcolor-pink" id="panel-heading">
					<font color="#fff"><div id="selected"></div></font>
				</div>
			<div class="panel-body">
			<div id="infoshop"></div>
			<hr class="layui-bg-green">
			<div class="layui-form layui-form-pane" id="display_num" style="display:none;">
				<div class="layui-form-item">
				<label class="layui-form-label">下单份数</label>
				<div class="layui-input-block">
				<div class="input-group">
				<div class="input-group-addon" id="num_min" style="background-color: #FBFBFB;border-radius: 2px 0 0 2px;cursor: pointer;">-</div>
				<input id="num" name="num" class="layui-input" type="number" min="1" value="1"/>
				<div class="input-group-addon" id="num_add" style="background-color: #FBFBFB;border-radius: 2px 0 0 2px;cursor: pointer;">+</div>
				</div>
				</div>
				</div>
			</div>
			<div class="layui-form layui-form-pane">
				<div class="layui-form-item">
				<label class="layui-form-label">所需金额</label>
				<div class="layui-input-block">
				<input type="text" name="need" id="need" class="layui-input" disabled/>
				</div>
				</div>
			</div>
			<div class="layui-form layui-form-pane" id="display_left" style="display:none;">
				<div class="layui-form-item">
				<label class="layui-form-label">库存数量</label>
				<div class="layui-input-block">
				<input type="text" name="leftcount" id="leftcount" class="layui-input" disabled/>
				</div>
				</div>
			</div>
			<div class="layui-form layui-form-pane">
				<div class="layui-form-item">
				<label class="layui-form-label" id="inputname">下单输入框</label>
				<div class="layui-input-block">
				<input type="text" name="inputvalue" id="inputvalue" value="<?php echo $qq?>" class="layui-input layui-form-danger" required/>
				</div>
				</div>
			</div>
			<div id="inputsname"></div>
			<div id="pay_frame" class="form-group text-center" style="display:none;">
			<div class="layui-form layui-form-pane">
				<div class="layui-form-item">
				<label class="layui-form-label">订单编号</label>
				<div class="layui-input-block">
				<input class="form-control" name="orderid" id="orderid" value="" disabled>
				</div>
				</div>
			</div>
			<div class="layui-form layui-form-pane">
				<div class="layui-form-item">
				<label class="layui-form-label">订单金额</label>
				<div class="layui-input-block">
				<input class="form-control" name="needs" id="needs" value="" disabled>
				</div>
				</div>
			</div>
			<div class="alert alert-success">订单保存成功，请点击以下链接支付！</div>
<?php
if($conf['alipay_api'])echo '<button type="submit" class="btn btn-default" id="buy_alipay"><img src="assets/icon/alipay.ico" class="logo">支付宝</button>';
if($conf['qqpay_api'])echo '<button type="submit" class="btn btn-default" id="buy_qqpay"><img src="assets/icon/qqpay.ico" class="logo">QQ支付</button>';
if($conf['wxpay_api'])echo '<button type="submit" class="btn btn-default" id="buy_wxpay"><img src="assets/icon/wechat.ico" class="logo">微信支付</button>';
?>
			</div>
			<input type="submit" id="submit_buy" class="layui-btn layui-btn-normal btn-block" value="立即购买">
			</div>
			</div>
		</div>
<!-- 卡密下单弹框开始 -->
<div class="modal fade" id="kamibuy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"><font color="#000000">卡密兑换</font></h4>
            </div>
            <div class="modal-body"><?php if(!empty($conf['kaurl'])){?>
			<div class="form-group">
				<a href="<?php echo $conf['kaurl']?>" class="btn btn-default btn-block" target="_blank"/>点击进入购买卡密</a>
			</div>
			<?php }?>
			<div class="layui-form layui-form-pane">
				<div class="layui-form-item">
				<label class="layui-form-label">输入卡密</label>
				<div class="layui-input-block">
				<input type="text" name="km" id="km" value="" class="form-control" onkeydown="if(event.keyCode==13){submit_checkkm.click()}" required/>
				</div>
				</div>
			</div>
			<input type="submit" id="submit_checkkm" class="btn btn-primary btn-block" value="检查卡密">
			<div id="km_show_frame" style="display:none;">
			<div class="layui-form layui-form-pane">
				<div class="layui-form-item">
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-block">
				<input type="text" name="name" id="km_name" value="" class="form-control" disabled/>
				</div>
				</div>
			</div>
			<div class="layui-form layui-form-pane">
				<div class="layui-form-item">
				<label class="layui-form-label" id="km_inputname">下单ＱＱ</label>
				<div class="layui-input-block">
				<input type="text" name="inputvalue" id="km_inputvalue" value="<?php echo $qq?>" class="form-control" required/>
				</div>
				</div>
			</div>
			<div id="km_inputsname"></div>
			<div id="km_alert_frame" class="alert alert-warning" style="display:none;font-weight: bold;"></div>
			<input type="submit" id="submit_card" class="btn btn-primary btn-block" value="立即购买">
			<div id="result1" class="form-group text-center" style="display:none;">
			</div>
			</div></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 卡密下单结束 -->
<!-- 抽奖弹框开始 -->
<div class="modal fade" id="choujiang" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"><font color="#000000">平台抽奖</font></h4>
            </div>
            <div class="modal-body">
			<div class="panel-body text-center">
			<div id="roll">点击下方按钮开始抽奖</div>
			<hr>
			<p>
			<a class="btn btn-info" id="start" style="display:block;">开始抽奖</a>
			<a class="btn btn-danger" id="stop" style="display:none;">停止</a>
			</p> 
			<div id="result"></div> 
			</div>
			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 抽奖结束 -->

<div class="panel-body">
<center>
<?php
$rs = $DB->query('SELECT * FROM shua_site limit 0,15');
while ($row = $DB->fetch($rs)) {
	echo '<img class="img-circle" src="//q1.qlogo.cn/g?b=qq&amp;nk=' . $row['qq'] . '&amp;s=100" width="60px" height="60px" alt="' . $row['qq'] . '" title="' . $row['qq'] . '|开通时间:' . $row['addtime'] . '">';
}
?>
</center>
</div>
</div>
<div class="panel layui-anim layui-anim-up">
<div class="panel-heading text-center panel-headcolor-qq"><h3 class="panel-title">本站运行数据</h3></div>
<table class="table table-bordered" style="background-color:#fff;border: 1px solid #ddd;">
<tbody>
<tr>
<td align="center"><font size="2"><span id="count_yxts"></span>天<br><font color="#65b1c9"><i class="layui-icon layui-icon-engine layui-icon layui-anim layui-anim-rotate layui-anim-loop" style="font-size: 22px; color: #1E9FFF;"></i></font><br>本站运营天数</font></td>
<td align="center"><font size="2"><span id="count_orders"></span>条<br><font color="#65b1c9"><i class="layui-icon layui-icon-upload-drag" style="font-size: 22px; color: #1E9FFF;"></i></font><br>本站订单数量</font></td>
<td align="center"><font size="2"><span id="count_orders1"></span>条<br><font color="#65b1c9"><i class="layui-icon layui-icon-loading layui-icon layui-anim layui-anim-rotate layui-anim-loop" style="font-size: 22px; color: #1E9FFF;"></i></font><br>已处理订单数</font></td>
<td align="center"><font size="2"><span id="count_money"></span>元<br><font color="#65b1c9"><i class="layui-icon layui-icon-dollar" style="font-size: 22px; color: #1E9FFF;"></i></font><br>累计交易金额</font></td>
</tr>
</tbody>
</table>
</div>
</div>
<script src="../assets/HotLove/js/layui.all.js"></script>
</div>
</div>
</div>

<script src="//lib.baomitu.com/jquery/1.12.4/jquery.min.js"></script>
<script src="//lib.baomitu.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//lib.baomitu.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="//lib.baomitu.com/layer/2.3/layer.js"></script>

<script type="text/javascript">
var isModal=<?php echo empty($conf['modal'])?'false':'true';?>;
var homepage=true;
var hashsalt=<?php echo $addsalt_js?>;
</script>
<!--当前模板版本：V2.5-->
<script src="assets/js/HotLove.js?ver=<?php echo VERSION ?>"></script>


</body></html>