<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>����ϵͳ</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu5").className="l51";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0602,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_ad.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>������</strong> - <strong class="red">[<?=$_GET[sm]?>]</strong></li><li class="l2">&nbsp;</li>
 </ul>
 
 <!--begin-->
 <div class="listkuan">
 <ul class="typecap">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /></li>
 <li class="l2">&nbsp;�����Ϣ</li>
 <li class="l3">���</li>
 <li class="l4">�༭ʱ��</li>
 <li class="l5">����</li>
 </ul>
 <ul class="typecon">
 <li class="l1">
 <a href="ad.php?bh=<?=$_GET[bh]?>&sm=<?=urlencode($_GET[sm])?>&must=<?=$_GET[must]?>" class="a1">��ӹ��</a>
 <a href="javascript:checkDEL(8,'yjcode_ad')" class="a2">ɾ��</a>
 </li>
 </ul>
 <?
 while0("*","yjcode_ad where adbh='".$_GET[bh]."' order by xh asc");while($row=mysql_fetch_array($res)){
 if($row[type1]=="ͼƬ"){$na=strgb2312($row[aurl],0,50);}elseif($row[type1]=="����"){$na="������";}elseif($row[type1]=="����"){$na=$row[aurl];}
 $aurl="ad.php?bh=".$row[bh]."&sm=".urlencode($_GET[sm])."&must=".$_GET[must]."&action=update";
 ?>
 <ul class="typelist1" onmouseover="this.className='typelist1 typelist11';" onmouseout="this.className='typelist1';">
 <li class="l1"><input name="C1" type="checkbox" value="<?=$row[bh]?>" /></li>
 <li class="l2" onclick="gourl('<?=$aurl?>')">&nbsp;<?=$row[tit]?></li>
 <li class="l3"><?=$row[xh]?></li>
 <li class="l4"><?=$row[sj]?></li>
 <li class="l5"><a href="<?=$aurl?>">�༭</a></li>
 </ul>
 <?
 }
 ?>
 </div>
 <!--end-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>