<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION[SHOPUSER]);
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
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > �ʽ��¼</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <? include("rcap2.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>

 <ul class="typecap">
 <li class="l4">ʱ��</li>
 <li class="l4">���</li>
 <li class="l4">��֧</li>
 <li class="l1">˵��</li>
 </ul>
   
 <?
 $ses=" where userid=".$userid;
 $page=$_GET["page"];if($page==""){$page=1;}else{$page=intval($_GET["page"]);}
 pagef($ses,30,"yjcode_moneyrecord","order by sj desc");while($row=mysql_fetch_array($res)){
 ?>
 <ul class="typelist3" onmouseover="this.className='typelist3 typelist31';" onmouseout="this.className='typelist3';">
 <li class="l4"><?=$row[sj]?></li>
 <li class="l4"><?=$row[moneynum]?></li>
 <li class="l4"><? if($row[moneynum]>0){?><span class="blue">����</span><? }else{?><span class="red">֧��</span><? }?></li>
 <li class="l1">&nbsp;&nbsp;&nbsp;<?=$row[tit]?></li>
 <li class="l0"></li>
 </ul>
 <? }?>

 <div class="npa">
 <?
 $nowurl="paylog.php";
 $nowwd="";
 require("page.html");
 ?>
 </div>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>