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
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<!--<link rel="stylesheet" href="http://demo.vip-admin.com/frame/layui/css/layui.css">-->
<link href="//lib.baomitu.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="../assets/HotLove/layui.css" rel="stylesheet">
<link href="../assets/HotLove/css/global.css" rel="stylesheet">
<link href="../assets/HotLove/css/icon.css" rel="stylesheet">
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
<a class="navbar-brand" href="#" id="sitename">订单查询</a>
</div>
<div class="collapse navbar-collapse" id="example-navbar-collapse">
<ul class="nav navbar-nav navbar-right">
<li class=""><a href="../"><i class="glyphicon glyphicon-user"></i> 在线下单</a></li>
<li class="active"><a href="/"><i class="fa fa-search"></i> 订单查询</a></li>
<li class=""><a href="/user/reg.php"><i class="glyphicon glyphicon-bookmark"></i> 网站搭建</a></li>
<li class="">
<a href="/user"><i class="glyphicon glyphicon-print"></i> 分站登录</a>
</li>

</ul>
</div>
</div>
</nav>
<div class="container"> 
<div class="col-sm-10 center-block" style="float: none;">
<div id="pjaxmain">
<style>
.icon {
    font-size: 18px;
}
</style>
<div class="col-md-auto box">
<div class="panel layui-anim layui-anim-scaleSpring">
<div class="panel-heading text-center panel-headcolor-pink" id="panel-heading">
<font color="#fff">订单完成情况查询</font>
</div>
<div class="panel-body">
<div class="layui-row">
<div class="layui-col-md12">
<table class="table table-bordered">
<tbody>
<tr>
<td align="center">
<font color="blue"><b>客服: 订单客服</b></font>
<img src="https://www.sogou.com/images/vr/service/auth.gif" title="正版认证">
<br>
<img src="//q4.qlogo.cn/headimg_dl?dst_uin=<?php echo $conf['kfqq']?>&amp;spec=100" alt="Avatar" width="50" height="50" class="img-circle"><br>
<a target="_blank" href="http://cqy.wlansq.cn/<?php echo $conf['kfqq']?>" class="btn btn-info btn-xs">QQ：<?php echo $conf['kfqq']?></a><br>
</td>
</tr>
</tbody>
</table>
</div>
<div class="layui-col-md12">
<?php echo $conf['gg_search']?>
</div>
</div>
<hr class="layui-bg-blue">
<div class="form-group">
<input type="text" name="qq" id="qq3" value="<?php echo $qq?>" class="layui-input" placeholder="请输入下单账号（留空则根据浏览器缓存查询）" onkeydown="if(event.keyCode==13){submit_query.click()}" required/>
</div>
<button type="submit" id="submit_query" class="layui-btn layui-btn-primary btn-block">立即查询</button>
<hr>
<div id="result2" class="form-group" style="display:none;">
				<table class="table table-striped">
				<thead><tr><th>下单账号</th><th>商品名称</th><th>数量</th><th class="hidden-xs">购买时间</th><th>状态</th><th>操作</th></tr></thead>
				<tbody id="list">
				</tbody>
				</table>
</div>
</div>
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
<script src="assets/js/HotLove.js?ver=<?php echo VERSION ?>"></script>


</body></html>