<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();

if(sqlzhuru($_POST[jvs])=="control"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 updatetable("yjcode_control","
			  dbsj=".sqlzhuru($_POST[tdbsj]).",
			  ycsj=".sqlzhuru($_POST[tycsj]).",
			  tksj=".sqlzhuru($_POST[ttksj]).",
			  regmoney=".sqlzhuru($_POST[tregmoney]).",
			  regjf=".sqlzhuru($_POST[tregjf]).",
			  pjjf=".sqlzhuru($_POST[tpjjf]).",
			  qdjf=".sqlzhuru($_POST[tqdjf]).",
			  jfmoney=".sqlzhuru($_POST[tjfmoney]).",
			  tjmoney=".sqlzhuru($_POST[ttjmoney]).",
			  sellbl=".sqlzhuru($_POST[tsellbl]).",
			  tknum=".sqlzhuru($_POST[ttknum]).",
			  txdi=".sqlzhuru($_POST[ttxdi]).",
			  txfl=".sqlzhuru($_POST[ttxfl])."
			  ");
 php_toheader("inf4.php?t=suc");
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
f1.action="inf4.php";
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
 <li class="l1">��ǰλ�ã�<a href="default.php">��̨��ҳ</a> - <strong>ӯ����������</strong></li><li class="l2"></li>
 </ul>
 
 <? include("rightcap1.php");?>
 <script language="javascript">$("rtit5").className="l1";</script>
 
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","inf4.php");}?>
 
 <!--Begin-->
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" name="jvs" value="control" />
 <ul class="uk">
 <li class="l1">����ʱ�䣺</li>
 <li class="l2">
 <input name="tdbsj" value="<?=$row[dbsj]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">������Ϊ3����ʾ������3�������δȷ���ջ���ϵͳ���Զ�ȷ���ջ�</span>
 </li>
 <li class="l1">�ӳ��ջ�ʱ�䣺</li>
 <li class="l2">
 <input name="tycsj" value="<?=$row[ycsj]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">������Ϊ7����ʾ���ӳ�7��ȷ���ջ�</span>
 </li>
 <li class="l1">�˿�ʱ�䣺</li>
 <li class="l2">
 <input name="ttksj" value="<?=$row[tksj]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">������Ϊ5����ʾ���ҷ����������5���ڿ��������˿�</span>
 </li>
 <li class="l1">ע�����ͽ�Ǯ��</li>
 <li class="l2">
 <input name="tregmoney" value="<?=$row[regmoney]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">Ĭ��Ϊ0����ֵ��ʾ��Աע��ʱ���͵Ľ���Ҫ̫��Ŷ</span>
 </li>
 <li class="l1">ע�����ͻ��֣�</li>
 <li class="l2">
 <input name="tregjf" value="<?=$row[regjf]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">Ĭ��Ϊ0����ֵ��ʾ��Աע��ʱ���͵Ļ��֣���Ҫ̫��Ŷ</span>
 </li>
 <li class="l1">���ֶһ�������</li>
 <li class="l2">
 <input name="tjfmoney" value="<?=$row[jfmoney]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">100��ʾ100���ֶһ�1����ң�10��ʾ10���ֶһ�1����ң���������</span>
 </li>
 <li class="l1">���ۻ��֣�</li>
 <li class="l2">
 <input name="tpjjf" value="<?=$row[pjjf]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">���׳ɹ�����ҷ��������õĻ�����</span>
 </li>
 <li class="l1">ǩ�����֣�</li>
 <li class="l2">
 <input name="tqdjf" value="<?=$row[qdjf]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">ÿ��ǩ�����û��ɻ�õĻ���</span>
 </li>
 <li class="l1">�Ƽ�Ӷ�������</li>
 <li class="l2">
 <input name="ttjmoney" value="<?=$row[tjmoney]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">���׳ɹ����Ƽ����û��ɻ�õĽ���Ӷ����� <span class="red">0.01��ʾ�ٷ�֮һ��0.02��ʾ�ٷ�֮��</span>����������</span>
 </li>
 <li class="l1">�������������</li>
 <li class="l2">
 <input name="tsellbl" value="<?=$row[sellbl]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">���׳ɹ������ҿɻ�õĽ����� <span class="red">1��ʾȫ�����ң�0.9��ʾ90%�����ң�0.5��ʾ50%������</span>����������</span>
 </li>
 <li class="l1">�������ֵ��</li>
 <li class="l2">
 <input name="ttxdi" value="<?=returnjgdw($row[txdi],"",0)?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">����Ϊ���������ܴ�С����</span>
 </li>
 <li class="l1">���������ѣ�</li>
 <li class="l2">
 <input name="ttxfl" value="<?=returnjgdw($row[txfl],"",0)?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">��0.01����ʾ�ٷ�֮һ����100Ԫ��ȡ1Ԫ������</span>
 </li>
 <li class="l1">�˿�������ƣ�</li>
 <li class="l2">
 <input name="ttknum" value="<?=$row[tknum]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">������Ϊ3����ʾ����������3���˿���ͬ�ʶ����˿��3�Σ��ͻᱻ�������޷��ٽ����˿�</span>
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