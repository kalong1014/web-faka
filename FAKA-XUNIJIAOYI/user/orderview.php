<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION["SHOPUSER"]);
$orderbh=$_GET[orderbh];
while0("*","yjcode_order where orderbh='".$orderbh."' and userid=".$userid);if(!$row=mysql_fetch_array($res)){php_toheader("order.php");}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û�������� - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ��������</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <ul class="wz">
 <li class="l0"></li>
 <li class="l1 l2">��������</li>
 <li class="l1"><a href="order.php">�ҵĶ���</a></li>
 <li class="l3" style="width:594px;"></li>
 </ul>
 <? include("orderv.php");?>
 
 <? if($row[ddzt]=="suc"){if(panduan("orderbh,userid","yjcode_propj where orderbh='".$orderbh."' and userid=".$userid)==0){?>
 <ul class="typeuk1"><li class="l1">���е���</li><li class="l2"><a href="orderpj.php?orderbh=<?=$orderbh?>" class="btn red">д����׬����</a></li></ul>
 <? }}?>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>