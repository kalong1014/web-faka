<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION["SHOPUSER"]);
$ses=" where userid=".$userid;
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
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > �ҵĶ���</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <ul class="typecap">
 <li class="l1">��Ʒ����</li>
 <li class="l2">�����ܶ�</li>
 <li class="l5">����</li>
 <li class="l3">����״̬</li>
 <li class="l4">����</li>
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
 $tp="../".returntp("bh='".$row[probh]."' order by iffm desc","-2");
 $cz="";
 if($row[ddzt]=="suc"){ //���׳ɹ�
  if(panduan("userid,orderbh","yjcode_propj where orderbh='".$row[orderbh]."' and userid=".$userid)==0){
  $cz="<a href='orderpj.php?orderbh=".$row[orderbh]."' class='btn feng'>����</a>";
  }else{
  $cz="<a href='orderpj.php?orderbh=".$row[orderbh]."' class='blue'>������</a><br>";
  }
  $cz=$cz."<a href='../product/view".returnproid($row[probh]).".html' target=_blank>�ٴι���</a>";
 
 }elseif($row[ddzt]=="wait"){ //�ȴ�����
  $cz="<a href='http://wpa.qq.com/msgrd?v=1&uin=".returnqq($row[selluserid])."&site=".weburl."&menu=yes' target=_blank class='blue'>�������ҷ���</a>";
  $cz=$cz."<br><a href='orderclose.php?orderbh=".$row[orderbh]."' class='hui'>ȡ������</a>";
 
 }elseif($row[ddzt]=="backsuc"){ //�˿�ɹ�
  $cz="<a href='../product/view".returnproid($row[probh]).".html' target=_blank>���¹���</a>";
 
 }elseif($row[ddzt]=="backerr"){ //�˿�ʧ�ܣ���ͬ���˿�
  $cz="<a href='shouhuo.php?orderbh=".$row[orderbh]."' class='btn'>�ջ�</a>";
  $cz=$cz."<br><a href='ordertk.php?orderbh=".$row[orderbh]."' class='blue'>�ٴ������˿�</a>";
  $cz=$cz."<br><a href='../help/aboutview4.html' target=_blank class='hui'>����ͷ�����</a>";

 }elseif($row[ddzt]=="db"){ //������
  $cz="<a href='shouhuo.php?orderbh=".$row[orderbh]."' class='btn'>�ջ�</a>";
  $cz=$cz."<br><a href='ordertk.php?orderbh=".$row[orderbh]."' class='hui'>�˿�</a>";

 }elseif($row[ddzt]=="close"){ //����ȡ��
  $cz="<a href='../product/view".returnproid($row[probh]).".html' target=_blank>���¹���</a>";
  
 }
 ?>
 <ul class="listcap">
 <? if($row[ddzt]=="wpay"){?><li class="l1"><input name="C1" id="ck<?=$row[id]?>" type="checkbox" value="<?=$row[id]?>" /></li><? }?>
 <li class="l2">������ţ�<?=$row[orderbh]?>  |  ʱ�䣺<?=$row[sj]?></li>
 <li class="l3"><a href="orderview.php?orderbh=<?=$row[orderbh]?>" class="lookdd">�鿴����</a></li>
 </ul>
 <ul class="typelist">
 <li class="l1">
 <a href="orderview.php?orderbh=<?=$row[orderbh]?>"><img class="tp" src="<?=returntppd($tp,"img/none60x60.gif")?>" width="50" height="50" align="left" /></a>
 <a title="<?=$row["tit"]?>" href="orderview.php?orderbh=<?=$row[orderbh]?>" class="a1"><?=returntitdian($row["tit"],100)?></a><br>
 </li>
 <li class="l0"></li>
 <li class="l2 hui"><strong class="feng"><?=returnjgdian($row[money1]*$row[num])?><?php if($row[jifen] > 0) { ?> + <?php echo $row[jifen]; ?>����<?php } ?></strong><br>(����:<?=returnjgdian($row[money1])?>)</li>
 <li class="l5"><?=$row[num]?></li>
 <li class="l3"><?=returnorderzt($row[ddzt])?></li>
 <li class="l4"><?=$cz?></li>
 </ul>
 <? }?>
 <!--�б����-->
 <div class="npa">
 <?
 $nowurl="order.php";
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