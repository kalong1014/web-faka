<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION["SHOPUSER"]);
$ses=" where selluserid=".$userid;
if($_GET[ddzt]!=""){$ses=$ses." and ddzt='".$_GET[ddzt]."'";}
if($_GET[page]!=""){$page=$_GET[page];}else{$page=1;}
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
 <? include("sellzf.php");?>
 <? include("rcap6.php");?>
 <script language="javascript">
 $("rcap<?=$_GET[ddzt]?>").className="l1 l2";
 </script>
 <ul class="typecap">
 <li class="l1">��Ʒ��Ϣ</li>
 <li class="l2">�����۸�</li>
 <li class="l5">������ʽ</li>
 <li class="l3">�����Ϣ</li>
 <li class="l4">״̬/����</li>
 </ul>
 <ul class="listcap1">
 <li class="l1"><input name="C2" onclick="xuan()" type="checkbox" /> ȫѡ</li>
 <li class="l2">
 <a href="javascript:codecheckDEL(3,'code_down')" class="a1">ɾ������</a>
 </li>
 </ul>
 <!--�б�ʼ-->
 <?
 pagef($ses,10,"yjcode_order","order by sj desc");while($row=mysql_fetch_array($res)){
 $au="sellorderview.php?orderbh=".$row[orderbh];
 $tp="../".returntp("bh='".$row[probh]."' order by iffm desc","-2");
 $cz="";
 if($row[ddzt]=="suc"){ //���׳ɹ�
 
 }elseif($row[ddzt]=="wait"){ //�ȴ�����
 $cz="<a href='fahuo.php?orderbh=".$row[orderbh]."' class='btn'>����</a>";
 $cz=$cz."<br><a href='sellclose.php?orderbh=".$row[orderbh]."' class='hui'>ȡ������</a>";
 
 }elseif($row[ddzt]=="back"){ //�˿����
 $cz="<a href='selltk.php?orderbh=".$row[orderbh]."' class='hui'>�����˿�</a>";
 
 }elseif($row[ddzt]=="backsuc"){ //�˿�ɹ�
 $cz="";

 }elseif($row[ddzt]=="db"){ //������

 }elseif($row1[ddzt]=="wpay"){ //�ȴ���Ҹ���
  
 }
 ?>
 <ul class="listcap">
 <? if($row[ddzt]=="wpay"){?><li class="l1"><input name="C1" id="ck<?=$row[id]?>" type="checkbox" value="<?=$row[id]?>" /></li><? }?>
 <li class="l2">
 ������ţ�<?=$row[orderbh]?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 �µ�ʱ�䣺<?=$row[sj]?>
 </li>
 <li class="l3"><a href="<?=$au?>" class="lookdd">�鿴����</a></li>
 </ul>
 <ul class="typelist">
 <li class="l1">
 <a href="<?=$au?>"><img class="tp" src="<?=returntppd($tp,"img/none60x60.gif")?>" width="50" height="50" align="left" /></a>
 <a title="<?=$row["tit"]?>" href="<?=$au?>" class="a1"><?=returntitdian($row["tit"],102)?></a><br>
 </li>
 <li class="l0"></li>
 <li class="l2 hui"><strong class="feng"><?=returnjgdian($row[money1]*$row[num])?><?php if($row[jifen] > 0) { ?> + <?php echo $row[jifen]; ?>����<?php } ?></strong><br>����:<?=$row[num]?><br>����:<?=returnjgdian($row[money1])?></li>
 <li class="l5"></li>
 <li class="l3 hui"><?=returnnc($row[userid])?><br><a href="http://wpa.qq.com/msgrd?v=3&uin=<?=returnqq($row[userid])?>&site=<?=weburl?>&menu=yes" target="_blank"><img src="../img/qq2.gif" width="25" height="25" border="0" /></a></li>
 <li class="l4"><?=returnorderzt($row[ddzt])?><br><?=$cz?></li>
 </ul>
 <? }?>
 <!--�б����-->
 <div class="npa">
 <?
 $nowurl="sellorder.php";
 $nowwd="ddzt=".$_GET[ddzt];
 require("page.html");
 ?>
 </div>
 
</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>