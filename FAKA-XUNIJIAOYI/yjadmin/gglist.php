<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$ses=" where zt<>99";
if($_GET[zt]!=""){$ses=$ses." and zt=".$_GET[zt];}
if($_GET[st1]!=""){$ses=$ses." and tit like '%".$_GET[st1]."%'";}
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
location.href="gglist.php?st1="+$("st1").value+"&zt="+$("zt").value;	
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu4").className="l41";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0202,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_news.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>��վ�������</strong></li><li class="l2"></li>
 </ul>

 <!--B-->
 <div class="listkuan">
 <ul class="psel">
 <li class="l1">�ؼ��ʣ�</li><li class="l2"><input value="<?=$_GET[st1]?>" type="text" id="st1" size="15" /></li>
 <li class="l1">���״̬��</li>
 <li class="l2">
 <select id="zt">
 <option value="">==����==</option>
 <option value="0"<? if("0"==$_GET[zt]){?> selected="selected"<? }?>>ͨ�����</option>
 <option value="1"<? if("1"==$_GET[zt]){?> selected="selected"<? }?>>�������</option>
 <option value="2"<? if("2"==$_GET[zt]){?> selected="selected"<? }?>>��˱���</option>
 </select>
 </li>
 <li class="l3"><a href="javascript:ser()" class="a2">����</a></li>
 </ul>
 <ul class="typecap">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /></li>
 <li class="l2">&nbsp;��վ������Ϣ</li>
 <li class="l15">���</li>
 <li class="l3">��ע</li>
 <li class="l4">������</li>
 <li class="l7">����</li>
 </ul>
 <ul class="typecon">
 <li class="l1">
 <a href="javascript:checkDEL(19,'yjcode_gg')" class="a2">ɾ��</a>
 <a href="gglx.php" class="a1">��������</a>
 </li>
 </ul>
 <?
 pagef($ses,20,"yjcode_gg","order by sj desc");while($row=mysql_fetch_array($res)){
 $aurl="gg.php?bh=".$row[bh];
 ?>
 <ul class="typelist2" onmouseover="this.className='typelist2 typelist21';" onmouseout="this.className='typelist2';">
 <li class="l1"><input name="C1" type="checkbox" value="<?=$row[bh]?>" /></li>
 <li class="l2" onclick="gourl('<?=$aurl?>')">&nbsp;<?=returntitdian($row["tit"],65)?></li>
 <li class="l15"><?=returnztv($row[zt])?></li>
 <li class="l3"><?=$row[djl]?></li>
 <li class="l4"><?=$row[sj]?></li>
 <li class="l7"><a href="<?=$aurl?>">�༭</a> | <a href="../help/ggview<?=$row[id]?>.html" target="_blank">Ԥ��</a></li>
 </ul>
 <? }?>
 <?
 $nowurl="gglist.php";
 $nowwd="zt=".$_GET[zt]."&st1=".$_GET[st1];
 include("page.html");
 ?>

 </div>
 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>