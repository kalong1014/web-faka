<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION[SHOPUSER]);

if($_GET[e]=="back"){
 $id=$_GET[id];
 while0("*","yjcode_tixian where id=".$id." and userid=".$userid." and zt=4");if($row=mysql_fetch_array($res)){
  updatetable("yjcode_tixian","zt=3,sm='�û�����' where id=".$id);
  PointUpdateM($userid,$row[money1]);
  PointIntoM($userid,"������������",$row[money1]);
 }
 php_toheader("tixianlog.php");
}

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
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ���ּ�¼</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <? include("rcap2.php");?>
 <script language="javascript">
 $("rcap5").className="l1 l2";
 </script>
 <? systs("�����ɹ�!","tixianlog.php")?>
 <ul class="typecap">
 <li class="l4">ʱ��</li>
 <li class="l4">���ֽ��</li>
 <li class="l1">˵��</li>
 <li class="l4">����</li>
 </ul>
   
 <?
 $ses=" where userid=".$userid;
 $page=$_GET["page"];if($page==""){$page=1;}else{$page=intval($_GET["page"]);}
 pagef($ses,30,"yjcode_tixian","order by sj desc");while($row=mysql_fetch_array($res)){
 $cz="";
 if($row[zt]==4){$cz="��<a href='tixianlog.php?e=back&id=".$row[id]."'>��������</a>��";}
 ?>
 <ul class="typelist2" onmouseover="this.className='typelist2 typelist21';" onmouseout="this.className='typelist2';">
 <li class="l4"><?=$row[sj]?></li>
 <li class="l4"><strong class="feng"><?=$row[money1]?></strong></li>
 <li class="l1">&nbsp;&nbsp;&nbsp;<strong><?=returntxzt($row[zt],$row[sm])?></strong><br>&nbsp;&nbsp;&nbsp;�տ��ˣ�<?=$row[txname]?>��<?=$row[txyh]?>��<?=$row[txzh]?>��</li>
 <li class="l0"></li>
 <li class="l4"><?=$cz?></li>
 </ul>
 <? }?>

 <div class="npa">
 <?
 $nowurl="tixianlog.php";
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