<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$id=$_GET[id];
while0("*","yjcode_user where id=".$id);if(!$row=mysql_fetch_array($res)){php_toheader("userlist.php");}

//������ʼ
if($_GET[control]=="update"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0701,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 PointInto($id,sqlzhuru($_POST[t2]),sqlzhuru($_POST[t1]));
 PointUpdate($id,sqlzhuru($_POST[t1])); 
 php_toheader("userjf.php?t=suc&id=".$id);

}
//�������
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
 if((document.f1.t1.value).replace(/\s/,"")==""){alert("��������Ч�Ļ�������!");document.f1.t1.select();return false;}
 if(isNaN(document.f1.t1.value)){alert("��������Ч�Ļ�������!");document.f1.t1.select();return false;}
 tjwait();
 f1.action="userjf.php?control=update&id=<?=$row[id]?>";
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
 <li class="l1">��ǰλ�ã���̨��ҳ - ��Ա���� - ���ֹ��� - <strong><?=$row[uid]?></strong></li><li class="l2"></li>
 </ul>
 <? include("rightcap3.php");?>
 <script language="javascript">$("rtit4").className="l1";</script>
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","userjf.php?id=".$id);}?>
 <!--B-->
 <form name="f1" method="post" onsubmit="return tj()">
 <ul class="uk">
 <li class="l1">��Ա�ʺţ�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" name="tuid" size="20" value="<?=$row[uid]?>" /></li>
 <li class="l1">���û��֣�</li>
 <li class="l2"><input class="inp redony" readonly="readonly" value="<?=$row[jf]?>" size="5" type="text"/></li>
 <li class="l1">����������</li>
 <li class="l2"><input name="t1" class="inp" size="5" type="text" /> ������ʾ���ӣ�������ʾ���٣��磺100��+100��ʾ����100���֣�-100��ʾ��ȥ100����</li>
 <li class="l1">˵����</li>
 <li class="l2"><input name="t2" class="inp" size="50" type="text" /></li>
 <li class="l3"><? tjbtnr("��һ��","userlist.php")?></li>
 </ul>
 </form>


 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>