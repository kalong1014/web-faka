<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$ses=" where id>0";
if($_GET[zt]!=""){$ses=$ses." and zt=".$_GET[zt];}
if($_GET[st1]!=""){$userid=returnuserid($_GET[st1]);$ses=$ses." and userid=".$userid;}
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
location.href="txlist.php?st1="+$("st1").value+"&zt="+$("zt").value;	
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu2").className="l21";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0702,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_user.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>��Ա���ֹ���</strong></li><li class="l2"></li>
 </ul>
 <div class="rights">
 &nbsp;<strong>��ʾ��</strong><br>
 &nbsp;<span class="red">�ȴ���������������޷�ɾ������Ҫɾ�������Ƚ�����״̬��Ϊ�ǵȴ�����</span>
 </div>
 <!--B-->
 <div class="listkuan">
 <ul class="psel">
 <li class="l1">��Ա�ʺţ�</li><li class="l2"><input value="<?=$_GET[st1]?>" type="text" id="st1" size="15" /></li>
 <li class="l1">���״̬��</li>
 <li class="l2">
 <select id="zt">
 <option value="">==����==</option>
 <option value="1"<? if(1==$_GET[zt]){?> selected="selected"<? }?>>���ֳɹ�</option>
 <option value="2"<? if(2==$_GET[zt]){?> selected="selected"<? }?>>�û���������</option>
 <option value="3"<? if(3==$_GET[zt]){?> selected="selected"<? }?>>����ʧ��</option>
 <option value="4"<? if(4==$_GET[zt]){?> selected="selected"<? }?>>�ȴ�����</option>
 </select>
 </li>
 <li class="l3"><a href="javascript:ser()" class="a2">����</a></li>
 </ul>
 <ul class="typecap">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /></li>
 <li class="l2">&nbsp;������Ϣ</li>
 <li class="l15">��������</li>
 <li class="l3">���ֽ��</li>
 <li class="l4">����ʱ��</li>
 <li class="l7">����</li>
 </ul>
 <ul class="typecon">
 <li class="l1">
 <a href="javascript:checkDEL(10,'yjcode_tixian')" class="a2">ɾ��</a>
 </li>
 </ul>
 <?
 pagef($ses,20,"yjcode_tixian","order by sj desc");while($row=mysql_fetch_array($res)){
 $au="tx.php?id=".$row[id];
 ?>
 <ul class="typelist2" onmouseover="this.className='typelist2 typelist21';" onmouseout="this.className='typelist2';">
 <li class="l1"><input name="C1" type="checkbox" value="<?=$row[id]?>" /></li>
 <li class="l2" onclick="gourl('<?=$au?>')">&nbsp;<?=returnuser($row[userid])?> | <?=returntxzt($row[zt],$row[sm])?></li>
 <li class="l15"><?=$row[txyh]?></li>
 <li class="l3"><?=$row[money1]?></li>
 <li class="l4"><?=$row[sj]?></li>
 <li class="l7">
 <a href="<?=$au?>">�༭</a>
 </li>
 </ul>
 <? }?>
 <?
 $nowurl="txlist.php";
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