<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$bh=$_GET[bh];
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
location.href="kclist.php?bh=<?=$bh?>&st1="+$("st1").value+"&st2="+$("st2").value+"&sd1="+$("sd1").value;
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu3").className="l31";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0102,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_product.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>������</strong></li><li class="l2"></li>
 </ul>
 <!--B-->
 <div class="listkuan">
 <ul class="psel">
 <li class="l1">ʹ�������</li>
 <li class="l2">
 <select id="sd1">
 <option value="">==����==</option>
 <option value="0"<? if(0==$_GET[sd1] && $_GET[sd1]!=""){?> selected="selected"<? }?>>δʹ��</option>
 <option value="1"<? if(1==$_GET[sd1]){?> selected="selected"<? }?>>��ʹ��</option>
 </select>
 </li>
 <li class="l1">���ţ�</li><li class="l2"><input value="<?=$_GET[st1]?>" type="text" id="st1" size="15" /></li>
 <li class="l1">���룺</li><li class="l2"><input value="<?=$_GET[st2]?>" type="text" id="st2" size="15" /></li>
 <li class="l3"><a href="javascript:ser()" class="a2">����</a><a href="kclist.php?bh=<?=$bh?>" class="a2">���</a></li>
 </ul>
 <ul class="typecap">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /></li>
 <li class="l2">&nbsp;����</li>
 <li class="l4">����</li>
 <li class="l3">ʹ�����</li>
 <li class="l5">����ʱ��</li>
 </ul>
 <ul class="typecon">
 <li class="l1">
 <a href="javascript:checkDEL(25,'yjcode_kc')" class="a2">ɾ��</a>
 <a href="kc.php?bh=<?=$bh?>" class="a1">�������</a>
 </li>
 </ul>
 <?
 $ses=" where probh='".$bh."'";
 if($_GET[st1]!=""){$ses=$ses." and ka like '%".$_GET[st1]."%'";}
 if($_GET[st2]!=""){$ses=$ses." and mi like '%".$_GET[st2]."%'";}
 if($_GET[sd1]!=""){$ses=$ses." and ifok=".$_GET[sd1];}
 $page=$_GET["page"];if($page==""){$page=1;}else{$page=intval($_GET["page"]);}
 pagef($ses,30,"yjcode_kc","order by id asc");while($row=mysql_fetch_array($res)){
 ?>
 <ul class="typelist1" onMouseOver="this.className='typelist1 typelist11';" onMouseOut="this.className='typelist1';">
 <li class="l1"><input name="C1" type="checkbox" value="<?=$row[id]?>" /></li>
 <li class="l2">&nbsp;<a href="kc.php?bh=<?=$bh?>&id=<?=$row[id]?>&action=update"><?=$row[ka]?></a></li>
 <li class="l4"><?=$row[mi]?></li>
 <li class="l3"><? if(1==$row[ifok]){?><span class="red">��ʹ��</span><? }else{?><span class="blue">δʹ��</span><? }?></li>
 <li class="l5"><?=$row[sj]?></li>
 </ul>
 <? }?>
 <?
 $nowurl="kclist.php";
 $nowwd="bh=".$bh."&st1=".$_GET[st1]."&st2=".$_GET[st2]."&sd1=".$_GET[sd1];
 include("page.html");
 ?>
 </div>
 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>