<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();

if(sqlzhuru($_POST[jvs])=="control"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 if(panduan("*","yjcode_control")==0){intotable("code_control","webnamev","'����ʧ��'");}
 updatetable("yjcode_control","
			  ifsell='".sqlzhuru($_POST[Rifsell])."',
			  openshop=".sqlzhuru($_POST[topenshop]).",
			  ifproduct='".sqlzhuru($_POST[Rifproduct])."',
			  ifkf='".sqlzhuru($_POST[Rifkf])."',
			  taskok=".sqlzhuru($_POST[Rtaskok]).",
			  taskhfok=".sqlzhuru($_POST[Rtaskhfok])."
			  ");
 php_toheader("inf1.php?t=suc");
}

while0("*","yjcode_control");$row=mysql_fetch_array($res);
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
tjwait();
f1.action="inf1.php";
}
</script>
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
 <ul class="wz">
 <li class="l1">��ǰλ�ã�<a href="default.php">��̨��ҳ</a> - <strong>Ȩ������</strong></li><li class="l2"></li>
 </ul>
 
 <? include("rightcap1.php");?>
 <script language="javascript">$("rtit2").className="l1";</script>
 
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","inf1.php");}?>
 
 <!--Begin-->
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" name="jvs" value="control" />
 <ul class="uk">
 <li class="l1">���ҿ���Ȩ�ޣ�</li>
 <li class="l2">
 <span class="finp">
 <input name="Rifsell" type="radio" value="off" <? if($row[ifsell]=="off"){?> checked="checked"<? }?> />��Ҫ��� 
 <input name="Rifsell" type="radio" value="on" <? if($row[ifsell]=="on"){?> checked="checked"<? }?> />����Ҫ��� 
 </span>
 </li>
 <li class="l1">������ã�</li>
 <li class="l2"><input type="text" class="inp" name="topenshop" size="10" value="<?=$row[openshop]?>" onfocus="inpf(this)" onblur="inpb(this)" /></li>
 <li class="l1">��ƷչʾȨ�ޣ�</li>
 <li class="l2">
 <span class="finp">
 <input name="Rifproduct" type="radio" value="off" <? if($row[ifproduct]=="off"){?> checked="checked"<? }?> />��Ҫ��� 
 <input name="Rifproduct" type="radio" value="on" <? if($row[ifproduct]=="on"){?> checked="checked"<? }?> />����Ҫ��� 
 </span>
 </li>
 <li class="l1">�Ҳ�ͷ���</li>
 <li class="l2">
 <span class="finp">
 <input name="Rifkf" type="radio" value="on" <? if($row[ifkf]=="on"){?> checked="checked"<? }?> />���� 
 <input name="Rifkf" type="radio" value="off" <? if($row[ifkf]=="off"){?> checked="checked"<? }?> />������ 
 </span>
 </li>
 <li class="l1">�������Ȩ�ޣ�</li>
 <li class="l2">
 <span class="finp">
 <input name="Rtaskok" type="radio" value="0" <? if(empty($row[taskok])){?> checked="checked"<? }?> />��Ҫ��� 
 <input name="Rtaskok" type="radio" value="1" <? if($row[taskok]==1){?> checked="checked"<? }?> />������� 
 </span>
 </li>
 <li class="l1">����ظ���ˣ�</li>
 <li class="l2">
 <span class="finp">
 <input name="Rtaskhfok" type="radio" value="0" <? if(empty($row[taskhfok])){?> checked="checked"<? }?> />��Ҫ��� 
 <input name="Rtaskhfok" type="radio" value="1" <? if($row[taskhfok]==1){?> checked="checked"<? }?> />������� 
 </span>
 </li>
 <li class="l3"><? tjbtnr("�����޸�");?></li>
 </ul>
 </form>

 <!--End-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>