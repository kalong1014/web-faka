<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$orderbh=$_GET[orderbh];
while0("*","yjcode_order where orderbh='".$orderbh."'");if(!$row=mysql_fetch_array($res)){php_toheader("orderlist.php");}
$tp="../".returntp("bh='".$row[probh]."' order by iffm desc","-2");

//������ʼ
if($_GET[control]=="update" && sqlzhuru($_POST[jvs])=="order"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0401,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 if($row[ddzt]!="back" && $row[ddzt]!="backerr"){Audit_alert("����״̬���󣬷����б�����","orderlist.php");}
 $sj=date("Y-m-d H:i:s");
 //ͬ��B
 if(sqlzhuru($_POST[R1])=="yes"){
  $tkjg="����Ա���룬�����˿�ɹ�";
  $allmoney=$row[money1]*$row[num];
  PointUpdateM($row[userid],$allmoney);
  PointIntoM($row[userid],$tkjg,$allmoney);
  updatetable("yjcode_order","ddzt='backsuc',tkjg='".$tkjg."',tkoksj='".$sj."' where id=".$row[id]);
  deletetable("yjcode_tk where orderbh='".$orderbh."'");
  deletetable("yjcode_db where orderbh='".$orderbh."'");
 }
 //ͬ��E
 //��ͬ��B
 if(sqlzhuru($_POST[R1])=="no"){
  $tkjg="����Ա���룬��������˿�����޸�Ϊ���׳ɹ�";
  $allmoney=$row[money1]*$row[num];
  PointUpdateM($row[selluserid],$allmoney);
  PointIntoM($row[selluserid],$tkjg,$allmoney);
  updatetable("yjcode_order","ddzt='suc',oksj='".$sj."' where orderbh='".$orderbh."'");
  deletetable("yjcode_tk where orderbh='".$orderbh."'");
  deletetable("yjcode_db where orderbh='".$orderbh."'");
 }
 //��ͬ��E
 php_toheader("orderview.php?t=suc&orderbh=".$orderbh); 
 
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
r=document.getElementsByName("R1");rr="";for(i=0;i<r.length;i++){if(r[i].checked==true){rr=r[i].value;}}if(rr==""){alert("��ѡ���˿��");return false;}
if(!confirm("ȷ��Ҫ�ύ�ò�����")){return false;}
tjwait();
f1.action="orderview.php?orderbh=<?=$orderbh?>&control=update";
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
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>�����б�</strong> - [<a href="orderlist.php">����</a>]</li><li class="l2"></li>
 </ul>
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","orderview.php?orderbh=".$orderbh);}?>
 <div class="rights">
 &nbsp;<strong>��ʾ��</strong><br>
 &nbsp;<span class="red">ֻ�е�����˫�����˿���һ�����޷���ɹ�ʶʱ������Ա�ſɽ��붩����������ֻ�ܵ���һ�Σ������ʵ��������ز���</span>
 </div>
 <ul class="rightcap">
 <li class="l1">������Ϣ</li>
 </ul>
 <ul class="uk">
 <li class="l1">����״̬��</li>
 <li class="l21"><strong><?=returnorderzt($row[ddzt])?></strong></li>
 <li class="l1">������</li>
 <li class="l21 feng"><strong><?=$row[money1]*$row[num]?>Ԫ</strong> (����<?=$row[money1]?>Ԫ * <?=$row[num]?>��)</li>

 <? if($row[ddzt]=="db" || $row[ddzt]=="suc"){?>
 <li class="l1">����ʱ�䣺</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[fhsj]?>" /></li>
 <? }?>
 
 <? if($row[ddzt]=="back"){while1("*","yjcode_tk where orderbh='".$orderbh."'");$row1=mysql_fetch_array($res1);?>
 <li class="l1">�˿�����ʱ�䣺</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row1[sj]?>" /></li>
 <li class="l1">�˿����ɣ�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="<?=$row1[tkly]?>" /></li>
 <? }?>
 
 <? if($row[ddzt]=="backsuc" || $row[ddzt]=="backerr"){?>
 <li class="l1">�˿�����ʱ�䣺</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[tksj]?>" /></li>
 <li class="l1">�˿����ɣ�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="<?=$row[tkly]?>" /></li>
 <li class="l1">�˿������</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="<?=$row[tkjg]?>" /></li>
 <li class="l1">�˿��ʱ�䣺</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[tkoksj]?>" /></li>
 <? }?>
 
 <? if($row[ddzt]=="suc"){?>
 <li class="l1">ȷ���ջ�ʱ�䣺</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[oksj]?>" /></li>
 <? }?>
 
 <li class="l1">������ţ�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[orderbh]?>" /></li>
 <li class="l1">��Ʒ���ƣ�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="<?=$row[tit]?>" /></li>
 <li class="l8"></li>
 <li class="l9"><img src="<?=returntppd($tp,"../img/none60x60.gif")?>" width="54" height="54" /></li>
 <li class="l1">����ʱ�䣺</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[sj]?>" /></li>
 <li class="l1">����IP��</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[uip]?>" /></li>
 </ul>
 <ul class="rightcap">
 <li class="l1">����˫��</li>
 </ul>
 <ul class="uk">
 <? while1("*","yjcode_user where id=".$row[userid]);$row1=mysql_fetch_array($res1);?>
 <li class="l1">�����Ϣ��</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="�ʺ�:<?=$row1[uid]?> �ǳ�:<?=$row1[nc]?> �ֻ�:<?=$row1[mot]?> QQ:<?=$row1[uqq]?>" /></li>
 <? while1("*","yjcode_user where id=".$row[selluserid]);$row1=mysql_fetch_array($res1);?>
 <li class="l1">������Ϣ��</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="�ʺ�:<?=$row1[uid]?> �ǳ�:<?=$row1[nc]?> �ֻ�:<?=$row1[mot]?> QQ:<?=$row1[uqq]?>" /></li>
 </ul>
 
 <? if($row[ddzt]=="back" || $row[ddzt]=="backerr"){?>
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" name="jvs" value="order" />
 <ul class="rightcap red">
 <li class="l1">����Ա����</li>
 </ul>
 <ul class="uk">
 <li class="l1">�˿��</li>
 <li class="l2">
 <span class="finp">
 <input name="R1" type="radio" value="yes" /><strong>ͬ���˿�</strong> 
 <input name="R1" type="radio" value="no" /><strong>��ͬ���˿� (��ͬ���˿�Ļ���������Ϊ���׳ɹ�)</strong> 
 </span>
 </li>
 <li class="l1">������ʾ��</li>
 <li class="l21">ֻ�е�����˫�����˿���һ�����޷���ɹ�ʶʱ������Ա�ſɽ��붩����������<strong class="red">ֻ�ܵ���һ�Σ������ʵ��������ز���</strong>��</li>
 <li class="l3"><? tjbtnr("��һ��","orderlist.php")?></li>
 </ul>
 </form>
 <? }?>
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>