<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$ses=" where id>0";
if($_GET[ddzt]!=""){$ses=$ses." and ddzt='".$_GET[ddzt]."'";}
if($_GET[st1]!=""){$ses=$ses." and orderbh ='".$_GET[st1]."'";}
if($_GET[st2]!=""){$ses=$ses." and tit like '%".$_GET[st2]."%'";}
if($_GET[page]!=""){$page=$_GET[page];}else{$page=1;}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>����ϵͳ</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script language="javascript">
function ser(){
location.href="orderlist.php?st1="+$("st1").value+"&st2="+$("st2").value+"&ddzt=<?=$_GET[ddzt]?>";	
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu6").className="l61";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0402,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_order.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - �����б� <strong><?=returnorderzt($_GET[ddzt])?></strong></li><li class="l2"></li>
 </ul>
 <div class="rights">
 &nbsp;<strong>��ʾ��</strong><br>
 &nbsp;<span class="red">����������Ա���Ȩ�ޣ���ɾ�����ⶩ����Ϣ����ɾ�����ڽ����еĶ��������ܻ������Ա�ʽ����ݵĲ�ͬ�����Ҳ��ɻָ��������ء�</span>
 </div>
 <!--B-->
 <div class="listkuan">
 <ul class="psel">
 <li class="l1">�������룺</li><li class="l2"><input value="<?=$_GET[st1]?>" type="text" id="st1" size="15" /></li>
 <li class="l1">��Ʒ��Ϣ��</li><li class="l2"><input value="<?=$_GET[st2]?>" type="text" id="st2" size="15" /></li>
 <li class="l3"><a href="javascript:ser()" class="a2">����</a></li>
 </ul>
 <ul class="typecap">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /></li>
 <li class="l2">&nbsp;������Ϣ</li>
 <li class="l6">����״̬</li>
 <li class="l6">�۸�</li>
 <li class="l6">���</li>
 <li class="l6">����</li>
 <li class="l7">����</li>
 </ul>
 <ul class="typecon">
 <li class="l1">
 <a href="javascript:checkDEL(17,'yjcode_order')" class="a2">ɾ��</a>
 </li>
 </ul>
 <?
 pagef($ses,10,"yjcode_order","order by sj desc");while($row=mysql_fetch_array($res)){
 $tp="../".returntp("bh='".$row[probh]."' order by iffm desc","-2");
 $au="orderview.php?orderbh=".$row[orderbh];
 ?>
 <ul class="typecon1">
 <li class="l1"><input name="C1" type="checkbox" value="<?=$row[orderbh]?>" /></li>
 <li class="l2">������ţ�<?=$row[orderbh]?> | ����ʱ�䣺<?=$row[sj]?></li>
 </ul>
 <ul class="typelist3">
 <li class="l1"></li>
 <li class="l2">
 <a href="<?=$au?>"><img border="0" class="imgtp" src="<?=returntppd($tp,"../img/none60x60.gif")?>" width="52" height="52" align="left" /></a>
 <a title="<?=$row["tit"]?>" href="<?=$au?>" class="a1"><?=returntitdian($row["tit"],100)?></a><br>
 </li>
 <li class="l6"><?=returnorderzt($row[ddzt])?></li>
 <li class="l6 hui"><strong class="feng">��<?=$row[money1]*$row[num]?></strong><br>����:<?=$row[money1]?><br>����:<?=$row[num]?></li>
 <li class="l6"><a href="user.php?id=<?=$row[userid]?>"><?=returnnc($row[userid])?></a><br><a href="http://wpa.qq.com/msgrd?v=3&uin=<?=returnqq($row[userid])?>&site=<?=weburl?>&menu=yes" target="_blank"><img border="0" src="img/qq.png" /></a></li>
 <li class="l6"><a href="user.php?id=<?=$row[selluserid]?>"><?=returnnc($row[selluserid])?></a><br><a href="http://wpa.qq.com/msgrd?v=3&uin=<?=returnqq($row[selluserid])?>&site=<?=weburl?>&menu=yes" target="_blank"><img border="0" src="img/qq.png" /></a></li>
 <li class="l7"><a href="<?=$au?>" class="a1">�޸�</a></li>
 </ul>
 <? }?>
 <?
 $nowurl="orderlist.php";
 $nowwd="ddzt=".$_GET[ddzt]."&st1=".$_GET[st1]."&st2=".$_GET[st2];
 include("page.html");
 ?>
 </div>
 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>