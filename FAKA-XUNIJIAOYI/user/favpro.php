<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION[SHOPUSER]);
$sj=date("Y-m-d H:i:s");
if($_GET[control]=="del"){
deletetable("yjcode_profav where userid=".$userid." and id=".$_GET[id]);
php_toheader("favpro.php");
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
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ���ղص���Ʒ</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <? include("rcap7.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>
 
 <!--�����ղ�B-->
 <div class="favpro">
 <ul class="u1">
 <?
 if($_GET[page]!=""){$page=$_GET[page];}else{$page=1;}
 pagef(" where userid=".$userid,10,"yjcode_profav","order by sj desc");while($row=mysql_fetch_array($res)){
 while1("*","yjcode_pro where bh='".$row[probh]."' order by lastsj desc limit 5");$row1=mysql_fetch_array($res1);
 ?>
 <li class="l1"><a href="../product/view<?=$row1[id]?>.html" target="_blank"><img border="0" src="../<?=returntp("bh='".$row1[bh]."' order by iffm desc limit 1","-2")?>" width="120" height="120" /><br><?=returntitdian($row1[tit],50)?></a><br><strong class="feng">��<?=returnjgdian(returnyhmoney($row1[yhxs],$row1[money2],$row1[money3],$sj,$row1[yhsj1],$row1[yhsj2],$row1[id]))?></strong><br>[<a href="favpro.php?id=<?=$row[id]?>&control=del">�Ƴ�</a>]</li>
 <? }?>
 </ul>
 </div>
 <?
 $nowurl="favfav.php";
 $nowwd="";
 include("page.html");
 ?>
 <!--�����ղ�E-->

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>