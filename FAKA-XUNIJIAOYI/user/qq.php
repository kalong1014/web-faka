<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
if($_GET[action]=="del"){
updatetable("yjcode_user","ifqq=0,openid='' where uid='".$_SESSION[SHOPUSER]."'");	
php_toheader("qq.php");
}

$sqluser="select uid,ifqq from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
$rowuser=mysql_fetch_array($resuser);

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
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > QQ��/���</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? include("rcap1.php");?>
 <script language="javascript">
 $("rcap6").className="l1 l2";
 </script>
 <? systs("��ϲ���������ɹ�!","qq.php")?>
 
 <? if(0==$rowuser[ifqq]){?>
 <ul class="qqtxt">
 <li class="l1">
 <a href="../config/qq/oauth/index.php"><img border="0" src="../img/qq_login.png" /></a><br>
 �����ť��������QQ�ʺ�
 </li>
 <li class="l2">
 ʹ��QQ�ʺŵ�¼��վ�������ԡ���<br>
 ��QQ�ʺ����ɵ�¼<br>
 �����ס��վ���ʺź����룬��ʱʹ��QQ�ʺ��������ɵ�¼
 </li>
 </ul>
 <? }elseif(1==$rowuser[ifqq]){?>
 <ul class="qqtxt">
 <li class="l3">
 <strong>���ѽ���վ�ʺ���QQ�����</strong><br>
 ����Ѱ��ʺţ�<br>
 <input type="button" class="btn1" onclick="gourl('qq.php?action=del')" onmouseover="this.className='btn2';" onmouseout="this.className='btn1';" value="ȷ�Ͻ��" />
 </li>
 </ul>
 <? }?>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>