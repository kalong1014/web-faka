<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$id=$_GET[id];
while0("*","yjcode_tixian where id=".$id);if(!$row=mysql_fetch_array($res)){php_toheader("txlist.php");}

if($_GET[control]=="update"){
 $zt=intval(sqlzhuru($_POST[R1]));
 if(4==$row[zt] && ($zt==1 || $zt==3)){
  if(3==$zt){
  PointUpdateM($row[userid],$row[money1]);
  PointIntoM($row[userid],"�������뱻��,ԭ��:".sqlzhuru($_POST[tsm]),$row[money1]);
  }
  updatetable("yjcode_tixian","zt=".$zt.",sm='".sqlzhuru($_POST[tsm])."' where id=".$id);
 }
php_toheader("tx.php?t=suc&id=".$id);
}
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
function tj(){
r=document.getElementsByName("R1");rr="";for(i=0;i<r.length;i++){if(r[i].checked==true){rr=r[i].value;}}if(rr==""){alert("��ѡ������״̬��");return false;}
if(confirm("ȷ��ִ�иò�����")){tjwait();f1.action="tx.php?id=<?=$id?>&control=update";}else{return false;}
}
function ztonc(x){
if(3==x){$("ztsmv").style.display="";}else{$("ztsmv").style.display="none";}
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
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>��Ա���ֹ���</strong> [<a href="txlist.php">�����б�</a>]</li><li class="l2"></li>
 </ul>
 <div class="rights">
 &nbsp;<strong>��ʾ��</strong><br>
 &nbsp;<span class="green">һ�����ã������޸ģ������ظò���(�����Ƚ����·��Ĺ���Ա�������ٽ���ת��)</span>
 </div>
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","tx.php?id=".$id);}?>
 <!--B-->
 <form name="f1" method="post" onsubmit="return tj()">
 <ul class="uk">
 <li class="l1">��Ա��Ϣ��</li>
 <li class="l2">
 <? while1("uid,nc","yjcode_user where id=".$row[userid]);$row1=mysql_fetch_array($res1);?>
 <input type="text" class="inp redony" readonly="readonly" size="40" value="<?=$row1[uid]?> �ǳ�:<?=$row1[nc]?>" /> 
 <a href="user_ses.php?uid=<?=$row1[uid]?>" target="_blank">����̨</a>
 </li>
 <li class="l1">���ֽ�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="40" value="<?=$row[money1]?>Ԫ" /></li>
 <li class="l1">�������ʣ�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="40" value="<?=$rowcontrol[txfl]?>" /></li>
 <li class="l1">Ӧ����</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="40" value="<?=sprintf("%.2f",$row[money1]-$rowcontrol[txfl]*$row[money1])?>" /></li>
 <li class="l1">�տ��ˣ�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="40" value="<?=$row[txname]?>" /></li>
 <li class="l1">�տ����У�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="40" value="<?=$row[txyh]?>" /></li>
 <li class="l1">��/�ʺţ�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="40" value="<?=$row[txzh]?>" /></li>
 <li class="l1">��ǰ״̬��</li>
 <li class="l21"><strong><?=returntxzt($row[zt],$row[sm])?></strong></li>
 </ul>
 
 <? if(4==$row[zt]){?>
 <ul class="rightcap">
 <li class="l1 red">����Ա����</li>
 </ul>
 <ul class="uk">
 <li class="l1">������</li>
 <li class="l2">
 <span class="finp">
 <input name="R1" type="radio" onclick="ztonc(1)" value="1"<? if(1==$row[zt]){?> checked="checked"<? }?> />��ת�ʣ����ֳɹ�&nbsp;&nbsp;&nbsp;&nbsp;
 <input name="R1" type="radio" onclick="ztonc(3)" value="3"<? if(3==$row[zt]){?> checked="checked"<? }?> />����ʧ��
 </span>
 </li>
 </ul>
 <ul class="uk" id="ztsmv"<? if(3!=$row[zt]){?> style="display:none;"<? }?>>
 <li class="l1">ʧ��ԭ��</li>
 <li class="l2"><input type="text" class="inp" name="tsm" size="90" value="<?=$row[sm]?>" /></li>
 </ul>
 <ul class="uk">
 <li class="l3"><? tjbtnr("��һ��","txlist.php")?></li>
 </ul>
 <? }?>
 </form>
 <!--E-->

</div>

</div>

<?php include("bottom.html");?>
</body>
</html>