<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$ses=" where zt<>99";
if($_GET[st1]!=""){$ses=$ses." and tit like '%".$_GET[st1]."%'";}
if($_GET[gdzt]!=""){$ses=$ses." and gdzt=".$_GET[gdzt];}
$page=$_GET["page"];if($page==""){$page=1;}else{$page=intval($_GET["page"]);}
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
location.href="gdlist.php?st1="+$("st1").value+"&sd1="+$("sd1").value;	
}
</script>
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
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>��������</strong></li><li class="l2"></li>
 </ul>

 <!--B-->
 <div class="listkuan">
 <ul class="psel">
 <li class="l1">�ؼ��ʣ�</li><li class="l2"><input value="<?=$_GET[st1]?>" type="text" id="st1" size="15" /></li>
 <li class="l3"><a href="javascript:ser()" class="a2">����</a></li>
 </ul>
 <ul class="typecap">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /></li>
 <li class="l2">&nbsp;��������</li>
 <li class="l15">����״̬</li>
 <li class="l3">�û�</li>
 <li class="l4">������</li>
 <li class="l7">����</li>
 </ul>
 <ul class="typecon">
 <li class="l1">
 <a href="javascript:checkDEL(28,'yjcode_gd')" class="a2">ɾ��</a>
 </li>
 </ul>
 <?
 pagef($ses,20,"yjcode_gd","order by sj desc");while($row=mysql_fetch_array($res)){
 $aurl="gd.php?id=".$row[id];
 ?>
 <ul class="typelist2" onmouseover="this.className='typelist2 typelist21';" onmouseout="this.className='typelist2';">
 <li class="l1"><input name="C1" type="checkbox" value="<?=$row[bh]?>" /></li>
 <li class="l2" onclick="gourl('<?=$aurl?>')">&nbsp;<?=strgb2312(strip_tags($row["txt"]),0,58)?></li>
 <li class="l15"><?=returngdzt($row[gdzt])?></li>
 <li class="l3"><?=returnuser($row[userid])?></li>
 <li class="l4"><?=$row[sj]?></li>
 <li class="l7"><a href="<?=$aurl?>">�޸�</a> | <a href="gdhf.php?bh=<?=$row[bh]?>">�ظ�</a></li>
 </ul>
 <? }?>
 <?
 $nowurl="gdlist.php";
 $nowwd="st1=".$_GET[st1]."&gdzt=".$_GET[gdzt];
 include("page.html");
 ?>

 </div>
 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>