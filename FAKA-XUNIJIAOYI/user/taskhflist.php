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
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ����ظ�</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <? include("rcap9.php");?>
 <script language="javascript">
 $("rcap2").className="l1 l2";
 </script>

 <ul class="typecap">
 <li class="l1">&nbsp;&nbsp;&nbsp;�ظ�����</li>
 <li class="l4">���״̬</li>
 <li class="l4">�ظ�ʱ��</li>
 <li class="l4">Ԥ������</li>
 </ul>
 <ul class="listcap1">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /> ȫѡ</li>
 <li class="l2">
 <a href="javascript:NcheckDEL(4,'yjcode_taskhf')" class="a2">ɾ��</a>
 </li>
 <li class="l3"></li>
 </ul>
  
 <?
 $ses=" where useridhf=".$luserid;
 $page=$_GET["page"];if($page==""){$page=1;}else{$page=intval($_GET["page"]);}
 pagef($ses,30,"yjcode_taskhf","order by sj desc");while($row=mysql_fetch_array($res)){
 while1("id,bh","yjcode_task where bh='".$row[bh]."'");$row1=mysql_fetch_array($res1);
 $au="../task/view".$row1[id].".html";
 ?>
 <ul class="typelist2" onmouseover="this.className='typelist2 typelist21';" onmouseout="this.className='typelist2';">
 <li class="l0"><input name="C1" type="checkbox" value="<?=$row[id]?>" /></li>
 <li class="l1"><a href="<?=$au?>" target="_blank"><?=strgb2312(strip_tags($row[txt]),0,100)?></a></li>
 <li class="l4"><?=returnztv($row[zt])?></li>
 <li class="l4"><?=$row[sj]?></li>
 <li class="l4"><a href="<?=$au?>" target="_blank" class="feng">Ԥ��</a></li>
 </ul>
 <? }?>

 <div class="npa">
 <?
 $nowurl="taskhflist.php";
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