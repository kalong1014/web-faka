<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$orderbh=$_GET[orderbh];
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
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ֧���ɹ�</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <div class="ordersuc">
 <ul class="u1">
 <li class="l1"><strong>����ɹ�</strong><br>�����Բ鿴�ñʶ�������ϸ��Ϣ�����<a href="orderview.php?orderbh=<?=$orderbh?>" class="blue">�鿴����</a></li>
 </ul>
 </div>
 <? 
 if(!empty($orderbh)){
  $userid=returnuserid($_SESSION["SHOPUSER"]);
  while0("*","yjcode_order where orderbh='".$orderbh."' and userid=".$userid);if($row=mysql_fetch_array($res)){
  include("orderv.php");
  }
 }
 ?>
 
</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>