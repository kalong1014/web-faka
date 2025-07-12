<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$ht1=preg_split("/\//",$_SERVER['PHP_SELF']);
if($_GET[control]=="ret"){deletetable("yjcode_update");php_toheader("default.php");}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>管理系统</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script language="javascript" src="js/gx.js"></script>
<script language="javascript">
function retgx(){
if(confirm("建议在升级失败的情况下才提交重新升级，确定吗？")){location.href="default.php?control=ret";}else{return false;}	
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu1").className="l11";
</script>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_quanju.html");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">当前位置：后台首页 - 欢迎页</li><li class="l2"></li>
 </ul>
 
<!--开始判断高危-->
<div class="gaowei" id="gaowei" style="display:none;">
 <span class="gaocap">您的网站发现<strong id="errnum"></strong>个高危漏洞，请尽快修复，避免严重损失</span>
 <?
 $errnum=0;
 $testv="yes";
 $dirarr=array("img/",
			   "ad/",
			   "ckeditor/attached/",
			   "config/ueditor/php/upload/",
			   "config/ueditor/php/upload1/",
			   "config/ueditor/php/upload2/",
			   "config/ueditor/php/upload3/",
			   "config/ueditor_mini/php/upload/",
			   "config/ueditor_mini/php/upload1/",
			   "config/ueditor_mini/php/upload2/",
			   "config/ueditor_mini/php/upload3/",
			   "upload/"
			   );
 for($i=0;$i<count($dirarr);$i++){
 createDir("../".$dirarr[$i]);
 $fp= fopen("../".$dirarr[$i]."shell.php","w");fwrite($fp,$testv);fclose($fp);if(@htmlget(weburl.$dirarr[$i]."shell.php")=="yes"){
  $errnum++;
 ?>
 <ul class="u1" onmouseover="this.className='u1 u2';" onmouseout="this.className='u1';">
 <li class="l1"><a href="http://www.hzskdz.com" target="_blank">修复方法</a></li>
 <li class="l2">文件夹：<strong><?=$dirarr[$i]?></strong> 存在可执行脚本权限漏洞，有被注入并运行木马的风险</li>
 </ul>
 <? 
 }
 }
 while1("*","yjcode_admin where adminuid='".$_SESSION["SHOPADMIN"]."'");$row1=mysql_fetch_array($res1);
 if(strcmp(sha1("admin"),$row1[adminpwd])==0 || strcmp(sha1("123456"),$row1[adminpwd])==0 || strcmp(sha1("admin888"),$row1[adminpwd])==0){$errnum++;
 ?>
 <ul class="u1" onmouseover="this.className='u1 u2';" onmouseout="this.className='u1';">
 <li class="l1"><a href="pwd.php">立即修复</a></li>
 <li class="l2">请不要采用admin、123456、admin888之类的容易被猜到的字符做为密码</li>
 </ul>
 <? }?>
</div>
<script language="javascript">
if(<?=$errnum?>==0){$("gaowei").style.display="none";}else{$("gaowei").style.display="";$("errnum").innerHTML=<?=$errnum?>;}
</script>
<!--结束判断高危--> 

<form name="f1" method="post" onsubmit="return callServer('<?=$ht1[1]?>')">
<div class="gx" id="gx1" style="display:none;">
<span class="gxts">&nbsp;检测到有新补丁发布，建议升级</span>
<ul class="uk">
<li class="l1">后台密码：</li>
<li class="l2"><input type="password" class="inp" name="t1" size="20" onfocus="inpf(this)" onblur="inpb(this)" /></li>
<li class="l1"></li>
<li class="l21">
升级后，会同步到官网最新版本，<strong class="red">如您需要二次开发，请联系qq75901760</strong>，
【<a href="http://www.hzskdz.com" class="blue" target="_blank">关于在线升级的详细说明</a>】
</li>
<li class="l3"><? tjbtnr("开始升级");?></li>
</ul>
</div>

<div class="gx" id="gx2" style="display:none;">
<span class="gxts">&nbsp;您的版本已是最新版 <span style="font-size:12px;color:#94B5DC;font-weight:100;cursor:pointer;" onClick="retgx()">[重新升级]</span></span>
</div>

<div class="gx" id="gx3" style="display:;">
<span class="gxts">&nbsp;正在获取最新版本信息……</span>
</div>
</form>
<script language="javascript">gxchk();</script>

<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0302,")){echo "<div class='noneqx'>无权限</div>";exit;}?>

<!--统计B-->
<div class="tongji">
 <ul class="u1">
 <li class="l1">&nbsp;用户信息统计</li>
 <li class="l2">
 <a href="userlist.php?shopzt=1"><strong class="red"><?=returncount("yjcode_user where shopzt=1")?></strong><br>开店审核</a>
 <a href="txlist.php?zt=4"><strong class="red"><?=returncount("yjcode_tixian where zt=4")?></strong><br>需要处理提现</a>
 <a href="userlist.php?rz=xy"><strong class="red"><?=returncount("yjcode_user where sfzrz=0")?></strong><br>实名认证审核</a>
 <a href="userlist.php?zt=0"><strong><?=returncount("yjcode_user where zt=0")?></strong><br>禁用会员</a>
 <a href="userlist.php"><strong><?=returncount("yjcode_user")?></strong><br>总用户数</a>
 </li>
 </ul>

 <ul class="u1">
 <li class="l1">&nbsp;商品/订单信息统计</li>
 <li class="l2">
 <a href="productlist.php?zt=1"><strong class="red"><?=returncount("yjcode_pro where zt=1")?></strong><br>需要审核商品</a>
 <a href="productlist.php"><strong><?=returncount("yjcode_pro where zt<>99")?></strong><br>所有商品</a>
 <? $ddztarr=array("wpay","wait","db","back","backsuc","backerr","suc","close");for($i=0;$i<count($ddztarr);$i++){?>
 <a href="orderlist.php?ddzt=<?=$ddztarr[$i]?>"><strong><?=returncount("yjcode_order where ddzt='".$ddztarr[$i]."'")?></strong><br><?=returnorderzt($ddztarr[$i])?></a>
 <? }?>
 </li>
 </ul>

 <ul class="u1">
 <li class="l1">&nbsp;互动信息统计</li>
 <li class="l2">
 <a href="newslist.php?zt=1"><strong class="red"><?=returncount("yjcode_news where zt=1")?></strong><br>需要审核稿件</a>
 <a href="tasklist.php?zt=1"><strong class="red"><?=returncount("yjcode_task where zt=1")?></strong><br>需要审核任务</a>
 <a href="gdlist.php?gdzt=1"><strong class="red"><?=returncount("yjcode_gd where gdzt=1 and zt<>99")?></strong><br>等待受理工单</a>
 <a href="taskhflist.php?zt=1"><strong class="red"><?=returncount("yjcode_taskhf where zt=1")?></strong><br>审核任务回复</a>
 <a href="inf2.php"><strong<? if($rowcontrol[smskc]<=50){?> class="red"<? }?>><?=$rowcontrol[smskc]?></strong><br>可用短信数量</a>
 <a href="tasklist.php"><strong><?=returncount("yjcode_task where zt=0 or zt=1")?></strong><br>所有任务</a>
 <a href="taskhflist.php"><strong><?=returncount("yjcode_taskhf where zt=0 or zt=1")?></strong><br>所有任务回复</a>
 </li>
 </ul>

</div>
<!--统计E-->

 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>