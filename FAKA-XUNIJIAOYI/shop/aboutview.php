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
<title><?=$rowuser[shopname]?>�ò��ã�<?=$rowuser[shopname]?>��ô����<?=$rowuser[shopname]?>����ʲô�� - <?=webname?></title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<link href="shop.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/basic.js"></script>
<script language="javascript" src="index.js"></script>
</head>
<body>
<? include("top.php");?>

<div class="yjcode">
 <!--��B-->
 <? include("left.php");?>
 <!--��E-->

 <!--��B-->
 <div class="right">
 
  <div class="about">
  <ul class="rcap"><li class="l1">��������</li><li class="l2"></li></ul>
  <div class="txt"><?=$rowuser[txt]?></div>
  </div>

 </div>
 <!--��E-->

</div>

<? include("../tem/bottom.html");?>
</body>
</html>