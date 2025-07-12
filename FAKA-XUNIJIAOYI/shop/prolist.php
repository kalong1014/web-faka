<?
include("../config/conn.php");
include("../config/function.php");
include("../config/xy.php");
$sj=date("Y-m-d H:i:s");
$getstr=$_GET[str];

$uid=returnsx("i");
$sqluser="select * from yjcode_user where zt=1 and shopzt=2 and id=".$uid;mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("./");}

$ses=" where zt=0 and ifxj=0 and userid=".$uid;
if(returnsx("p")!=-1){$page=returnsx("p");}else{$page=1;}
$px="order by lastsj desc";
?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=$rowuser[shopname]?>的网上店铺 - <?=webname?></title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<link href="shop.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/basic.js"></script>
<script language="javascript" src="index.js"></script>
</head>
<body>
<? include("top.php");?>

<div class="yjcode">
 <!--左B-->
 <? include("left.php");?>
 <!--左E-->

 <!--右B-->
 <div class="right">
 
  <div class="prolist">
  <ul class="rcap"><li class="l1">宝贝展示</li><li class="l2"></li></ul>
  <? 
  pagef($ses,20,"yjcode_pro",$px);while($row=mysql_fetch_array($res)){
  $au="../product/view".$row[id].".html";
  $tp="../".returntp("bh='".$row[bh]."' order by iffm desc","-2");
  ?>
  <ul class="u1">
  <li class="l1"><a href="<?=$au?>" title="<?=$row[tit]?>" target="_blank"><img alt="<?=$row[tit]?>" border="0" src="<?=returntppd($tp,"../img/none180x180.gif")?>" width="200" height="150" /></a></li>
  <li class="l2"><a href="<?=$au?>" title="<?=$row[tit]?>" target="_blank"><?=strgb2312($row[tit],0,44)?></a><br><strong class="feng">￥<?=returnjgdian(returnyhmoney($row[yhxs],$row[money2],$row[money3],$sj,$row[yhsj1],$row[yhsj2],$row[id]))?></strong></li>
  </ul>
  <?
  }
  ?>
  <div class="npa">
  <?
  $nowurl="prolist";
  $nowwd="";
  require("../tem/page.html");
  ?>
  </div>
  </div>

 </div>
 <!--右E-->

</div>

<? include("../tem/bottom.html");?>
</body>
</html>