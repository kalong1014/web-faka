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
 <ul class="wz"><li class="l1">��ǰλ�ã�<a href="./" class="a2">��̨��ҳ</a> - <strong>��Ʒ����</strong></li><li class="l2"></li></ul>
 <div class="rights">
 &nbsp;<strong>��ʾ��</strong><br>
 &nbsp;1��ÿ������Ĳ㼶����1�������3����<br>
 &nbsp;2����Ϊ��ʹ��վ�����ۺ�ʵ������ѣ�<span class="blue">�����Ƽ���ʹ����ﵽ3��</span>��
 </div>

 <!--begin-->
 <div class="listkuan">
 <ul class="typecap">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /></li>
 <li class="l2">&nbsp;�����</li>
 <li class="l3">���</li>
 <li class="l4">�༭ʱ��</li>
 <li class="l5">����&nbsp;</li>
 </ul>
 <ul class="typecon">
 <li class="l1">
 <a href="type1.php" class="a1">��������</a>
 <a href="javascript:checkDEL(4,'yjcode_type')" class="a2">ɾ��</a>
 </li>
 </ul>
 <?
 while1("*","yjcode_type where admin=1 order by xh asc");while($row1=mysql_fetch_array($res1)){
 $nu="type1.php?action=update&id=".$row1[id];
 ?>
 <ul class="typelist1" onmouseover="this.className='typelist1 typelist11';" onmouseout="this.className='typelist1';">
 <li class="l1"><input name="C1" type="checkbox" value="<?=$row1[id]?>" /></li>
 <li class="l2" onclick="gourl('typelists.php?ty1id=<?=$row1[id]?>')">&nbsp;<strong><?=$row1[type1]?></strong></li>
 <li class="l3"><?=$row1[xh]?></li>
 <li class="l4"><?=$row1[sj]?></li>
 <li class="l5"><a href="type2.php?ty1id=<?=$row1[id]?>">�������</a> | <a href="<?=$nu?>">�༭</a> | <a href="typesxlist.php?typeid=<?=$row1[id]?>">����ѡ��</a>&nbsp;</li>
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