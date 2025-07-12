<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."' and shopzt=2";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("openshop3.php");}

$sqlinfo = "select * from yjcode_pro where id='".intval($_GET['id'])."' limit 1";
$rowinfo=mysql_fetch_array(mysql_query($sqlinfo),1);


if($_POST['weiid'] == 'weiid') {
	$s_time = time()+(intval($_POST['m1'])*3600*24);
	$sql = "update yjcode_pro set `jifendijia`='".intval($_POST['jfs'])."',`jifensj_s`='". time() ."',`jifensj_e`='".$s_time."' where id in(".trim($_POST['info']).") and userid='".$rowuser['id']."'";
	if(mysql_query($sql)) {
		echo '<script>alert("设置成功");window.location.href="productlist.php";</script>';
	}
	exit;
}elseif($_POST['weiid'] == 'all') {
	$s_time = time()+(intval($_POST['m1'])*3600*24);
	$sql = "update yjcode_pro set `jifendijia`='".intval($_POST['jfs'])."',`jifensj_s`='". time() ."',`jifensj_e`='".$s_time."' where userid='".$rowuser['id']."'";
	if(mysql_query($sql)) {
		echo '<script>alert("设置成功");window.location.href="productlist.php";</script>';
	}
	exit;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户管理面板 - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 商品列表</li>
</ul>
<? include("left.php");?>
<script type="text/javascript"> 
<!-- 
function winOpen() 
{ 
    window.open ("content_list.php", "", "height=430, width=630,location=no,scrollbars=yes"); 
} 
--> 
</script>
<script>
function  onclickOK(x,y,z){   
document.getElementById("div"+x+"").style.display="";  
document.getElementById("div"+z+"").style.display="none";
if(x == 3) {
document.getElementById("weiid").value='all';
}
if(x == 1) {
document.getElementById("weiid").value='weiid';
}
}
</script>
<!--RB-->
<div class="right">
<form action="" method="post">
<div class="jifens">
<ul class="u1">
<li class="l1"> 商品积分批量设置 </li>
</ul>

<div id="div0">
<ul class="u2">
<li class="l1">操作方式</li>
<li class="l2">
<input type="radio" onclick="onclickOK(1,2,3)" value="1" name="r1" checked="">
按指定商品
</li>
<li class="l2">
<input type="radio" onclick="onclickOK(3,2,1)" value="3" name="r1">
所有商品
</li>
<li id="div1" class="l3" style="">
<textarea id="text" class="textarea" readonly="true" name="textarea"><?php echo $rowinfo['tit']; ?></textarea>
<input name="info" id="info" value="<?php echo $rowinfo['id']; ?>" type="hidden">
<br>
<input type="button" onclick="javascript:winOpen();" name="submit" value="添加商品">
</li>

<li id="div3" class="l3" style="display:none"> 将所有出售的商品设置统一的可用积分比例。 </li>
<li id="xz" class="l3">
选择操作属性:
<select onchange="check(this.value)" name="jfs">
<option selected="selected" value="0">不支持抵价</option>
<option value="10">可抵价10%</option>
<option value="20">可抵价20%</option>
<option value="30">可抵价30%</option>
<option value="40">可抵价40%</option>
<option value="50">可抵价50%</option>
</select>
<br>
<span id="jfts"></span>
<script>
 
function  check(y){
	var jfts = document.getElementById('jfts');
if (y!=0){      
var kdm =(100*(y*10)/10)*0.01;
var sm = (100-kdm);
var jfs =(100*(y*10))*0.001;
	jfts.innerHTML="操作说明：允许买家最多使用积分抵售价的"+kdm+"%。例：100元的商品=<font color=blue>"+jfs+"积分</font>+<font color=red>"+sm+"元</font>。"
		}else{jfts.innerHTML="操作说明：不支持买家使用积分抵价。";}
		
}
</script>
</li>




<li id="xz" class="l3">
填写抵价时间：
<input id="money1" class="inprmb" type="text" value="7" name="m1"><span>默认为7天</span>
<br>
<span id="jfts"></span>
</li>



</ul>
</div>
<div id="tjbtn">
<input type="hidden" value="weiid" name="weiid" id="weiid">
<input class="btn" width="96" type="submit" height="30" value="确认提交">
</div>
</div>
</form>
</div>


</div>

</div>
<style>
.jifens {
    border: 1px solid #dddddd;
    float: left;
    margin: 10px 0 0;
    text-align: left;
    width: 786px;
}
.jifens #tjbtn {
    margin: 10px 0 0;
    text-align: center;
    width: 798px;
}
.jifens .u1 {
    background: rgba(0, 0, 0, 0) url("img/viptit.png") repeat-x scroll 0 0;
    border-bottom: 1px solid #dddddd;
    line-height: 36px;
    overflow: hidden;
}
.jifens .u1 .l1 {
    float: left;
    padding: 0 0 0 10px;
}
.jifens .u1 .l2 {
    float: right;
    padding: 0 10px 0 0;
}
.jifens .u2 {
    background: rgba(0, 0, 0, 0) url("img/viptit.png") repeat-x scroll 0 0;
    border: 1px solid #dddddd;
    margin: 10px 0 0 144px;
    overflow: hidden;
    width: 500px;
}
.jifens .u2 li {
    line-height: 30px;
}
.jifens .u2 .l1 {
    float: left;
    font-weight: 700;
    line-height: 35px;
    text-align: right;
    width: 140px;
}
.jifens .u2 .l2 {
    float: left;
    padding: 0 0 0 10px;
}
.jifens .u2 .l3 {
    float: left;
    text-align: center;
    width: 500px;
}
.jifens .u2 #xz {
    border-top: 1px solid #dddddd;
}
.jifens .u2 .minp {
    background: rgba(0, 0, 0, 0) url("../img/inputbg.gif") repeat-x scroll left top;
    border: 1px solid #cccccc;
    height: 18px;
    margin: 0 5px;
    padding: 2px 0 0 2px;
    width: 50px;
}
.jifens .u2 .textarea {
    background: rgba(0, 0, 0, 0) url("../img/inputbg.gif") repeat-x scroll left top;
    border: 1px solid #cccccc;
    height: 200px;
    line-height: 22px;
    overflow: hidden;
    width: 500px;
}
.jifens .u4 {
    background-color: #fffbe2;
    border: 1px solid #ff6600;
    margin: 10px;
    overflow: hidden;
    padding: 10px;
}
.jifens .u4 .l1 {
    float: left;
    line-height: 25px;
    width: 758px;
}
.tuiguang {
    border: 1px solid #dddddd;
    float: left;
    text-align: left;
    width: 798px;
}
.btn {
    background: #f57403 none repeat scroll 0 0;
    border: 0 none;
    color: #fff;
    cursor: pointer;
    font-size: 14px;
    font-weight: 700;
    height: 31px;
    line-height: 31px;
    width: 100px;
}
.btn:hover {
    background: #fb8218 none repeat scroll 0 0;
}
</style>
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>