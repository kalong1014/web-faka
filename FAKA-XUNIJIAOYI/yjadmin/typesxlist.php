<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$typeid=$_GET[typeid];if(empty($typeid)){php_toheader("default.php");}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>�����̨</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu1").className="l11";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0302,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_quanju.html");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz"><li class="l1">��ǰλ�ã�<a href="./" class="a2">��̨��ҳ</a> - <strong><?=returntype(1,$typeid)?>����ѡ��</strong> - [<a href="typelist.php">����</a>]</li><li class="l2"></li></ul>
 <!--begin-->
 <div class="listkuan">
 <ul class="typecap">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /></li>
 <li class="l2">&nbsp;����ѡ���б�</li>
 <li class="l3">���</li>
 <li class="l4">�༭ʱ��</li>
 <li class="l5">����&nbsp;</li>
 </ul>
 <ul class="typecon">
 <li class="l1">
 <a href="typesx.php?typeid=<?=$typeid?>" class="a1">����ѡ��</a>
 <a href="javascript:checkDEL(18,'yjcode_typesx')" class="a2">ɾ��</a>
 </li>
 </ul>
 <?
 while1("*","yjcode_typesx where admin=1 and typeid=".$typeid." order by xh asc");while($row1=mysql_fetch_array($res1)){
 $nu="typesx.php?action=update&id=".$row1[id]."&typeid=".$typeid;
 ?>
 <ul class="typelist1" onmouseover="this.className='typelist1 typelist11';" onmouseout="this.className='typelist1';">
 <li class="l1"><input name="C1" type="checkbox" value="<?=$row1[id]?>xcf0" /></li>
 <li class="l2" onclick="gourl('<?=$nu?>')">&nbsp;<strong><?=$row1[name1]?></strong></li>
 <li class="l3"><?=$row1[xh]?></li>
 <li class="l4"><?=$row1[sj]?></li>
 <li class="l5"><a href="typesx1.php?ty1id=<?=$row1[id]?>">��Ӷ���ѡ��</a> | <a href="<?=$nu?>">�༭</a>&nbsp;</li>
 </ul>
 <?
 while2("*","yjcode_typesx where admin=2 and name1='".$row1[name1]."' and typeid=".$typeid." order by xh asc");while($row2=mysql_fetch_array($res2)){
 $nu="typesx1.php?action=update&id=".$row2[id]."&ty1id=".$row1[id]; 
 ?>
 <ul class="typelist2" onmouseover="this.className='typelist2 typelist21';" onmouseout="this.className='typelist2';">
 <li class="l1"><input name="C1" type="checkbox" value="xcf<?=$row2[id]?>" /></li>
 <li class="l2" onclick="gourl('<?=$nu?>')">&nbsp;&nbsp;- <?=$row2[name2]?></li>
 <li class="l3"><?=$row2[xh]?></li>
 <li class="l4"><?=$row2[sj]?></li>
 <li class="l5"><a href="<?=$nu?>">�༭</a>&nbsp;</li>
 </ul>
 <?
 }
 }
 ?>
 </div>
 <!--end-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>