<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
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
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ���Ƽ��Ļ�Ա</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">

 <ul class="typecap">
 <li class="l4">��ԱID</li>
 <li class="l7">ע��ʱ��</li>
 </ul>
   
 <?
 $ses=" where tjuserid=".$luserid;
 $page=$_GET["page"];if($page==""){$page=1;}else{$page=intval($_GET["page"]);}
 pagef($ses,30,"yjcode_user","order by sj desc");while($row=mysql_fetch_array($res)){
 ?>
 <ul class="typelist2" onmouseover="this.className='typelist2 typelist21';" onmouseout="this.className='typelist2';">
 <li class="l4"><?=$row[id]?></li>
 <li class="l7"><?=$row[sj]?></li>
 <li class="l0"></li>
 </ul>
 <? }?>

 <div class="npa">
 <?
 $nowurl="tjuid.php";
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