<?
include("../config/conn.php");
include("../config/function.php");
include("../config/xy.php");
$sj=date("Y-m-d H:i:s");
$uid=$_GET[id];
$sqluser="select * from yjcode_user where zt=1 and shopzt=2 and id=".$uid;mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("./");}
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
  <ul class="rcap"><li class="l1">橱窗推荐</li><li class="l2"><a href="prolist_i<?=$uid?>v.html">查看更多商品</a></li></ul>
  <?
  while1("*","yjcode_pro where zt=0 and userid=".$uid." and ifxj=0 order by lastsj desc limit 16");while($row1=mysql_fetch_array($res1)){
  $au="../product/view".$row1[id].".html";
  $tp="../".returntp("bh='".$row1[bh]."' order by iffm desc","-2");
  ?>
  <ul class="u1">
  <li class="l1"><a href="<?=$au?>" title="<?=$row1[tit]?>" target="_blank"><img alt="<?=$row1[tit]?>" border="0" src="<?=returntppd($tp,"../img/none180x180.gif")?>" width="200" height="150" /></a></li>
  <li class="l2"><a href="<?=$au?>" title="<?=$row1[tit]?>" target="_blank"><?=strgb2312($row1[tit],0,44)?></a><br><strong class="feng">￥<?=returnjgdian(returnyhmoney($row1[yhxs],$row1[money2],$row1[money3],$sj,$row1[yhsj1],$row1[yhsj2],$row1[id]))?></strong></li>
  </ul>
  <?
  }
  ?>
  </div>
 
  <div class="about">
  <ul class="rcap"><li class="l1">店铺概况</li><li class="l2"><a href="aboutview<?=$uid?>.html">查看更多资料</a></li></ul>
  <div class="txt"><?=$rowuser[seodes]?></div>
  </div>

 </div>
 <!--右E-->

</div>

<? include("../tem/bottom.html");?>
</body>
</html>