<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();

if(sqlzhuru($_POST[jvs])=="control"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 if(panduan("*","yjcode_control")==0){intotable("yjcode_control","webnamev","'����ʧ��'");}
 updatetable("yjcode_control","
			  partner='".sqlzhuru($_POST[zf1])."',
			  security_code='".sqlzhuru($_POST[zf2])."',
			  seller_email='".sqlzhuru($_POST[zf3])."',
			  zftype=".sqlzhuru($_POST[d1]).",
			  tenpay1='".sqlzhuru($_POST[tenpay1])."',
			  tenpay2='".sqlzhuru($_POST[tenpay2])."',
			  bankbh='".sqlzhuru($_POST[tbankbh])."',
			  bankkey='".sqlzhuru($_POST[tbankkey])."',
			  ipsshh='".sqlzhuru($_POST[ips1])."',
			  ipszs='".sqlzhuru($_POST[ips2])."'
			  ");
 php_toheader("inf3.php?t=suc");
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
f1.action="inf3.php";
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
 <li class="l1">��ǰλ�ã�<a href="default.php">��̨��ҳ</a> - <strong>֧���ӿ�</strong></li><li class="l2"></li>
 </ul>
 
 <? include("rightcap1.php");?>
 <script language="javascript">$("rtit4").className="l1";</script>
 
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","inf3.php");}?>
 
 <!--Begin-->
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" name="jvs" value="control" />
 <ul class="uk">
 <li class="cap">֧�������� <a href="https://b.alipay.com/order/productIndex.htm" target="_blank">[����]</a></li>
 <li class="l1">ѡ��֧����ʽ��</li>
 <li class="l2">
 <select name="d1">
 <option value="0" <? if($row[zftype]==0 || $row[zftype]==NULL){?> selected="selected"<? }?>>֧������ʱ����</option>
 <option value="1" <? if($row[zftype]==1){?> selected="selected"<? }?>>֧������������</option>
 <option value="2" <? if($row[zftype]==2){?> selected="selected"<? }?>>֧����˫���ܽӿ�</option>
 </select>
 <span class="red">�������Ľӿ�ʵ�������ѡ���Ӧ��֧����ʽ</span>
 </li>
 <li class="l1">partner��</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="��������,Ȩ�޲���";}else{$sv=$row[partner];}?>
 <input  name="zf1" value="<?=$sv?>" size="20" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">������֧������partner</span>
 </li>
 <<li class="l1">security_code��</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="��������,Ȩ�޲���";}else{$sv=$row[security_code];}?>
 <input  name="zf2" value="<?=$sv?>" size="60" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">������֧������security_code</span>
 </li>
 <li class="l1">seller_email��</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="��������,Ȩ�޲���";}else{$sv=$row[seller_email];}?>
 <input  name="zf3" value="<?=$sv?>" size="20" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">������֧������seller_email</span>
 </li>
 
 <li class="cap">�Ƹ�ͨ���� <a href="http://www.itenwang.com/user/pay.php/" target="_blank">[����]</a></li>
 <li class="l1">�̻���ţ�</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="��������,Ȩ�޲���";}else{$sv=$row[tenpay1];}?>
 <input  name="tenpay1" value="<?=$sv?>" size="20" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">������Ƹ�ͨ���̻���</span>
 </li>
 <li class="l1">��Կ��</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="��������,Ȩ�޲���";}else{$sv=$row[tenpay2];}?>
 <input  name="tenpay2" value="<?=$sv?>" size="60" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">������Ƹ�ͨ���̻���Կ</span>
 </li>
 
 <li class="cap">��Ѷ֧���ӿ� <a href="http://www.ips.com.cn/" target="_blank">[����]</a></li>
 <li class="l1">�̻���ţ�</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="��������,Ȩ�޲���";}else{$sv=$row[ipsshh];}?>
 <input  name="ips1" value="<?=$sv?>" size="20" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">�����뻷Ѷ���̻���</span>
 </li>
 <li class="l1">��Կ��</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="��������,Ȩ�޲���";}else{$sv=$row[ipszs];}?>
 <input  name="ips2" value="<?=$sv?>" size="60" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">�����뻷Ѷ��֤���</span>
 </li>
 
 <li class="cap">�������߽ӿ� <a href="http://www.chinabank.com.cn/" target="_blank">[����]</a></li>
 <li class="l1">�̻��ţ�</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="��������,Ȩ�޲���";}else{$sv=$row[bankbh];}?>
 <input  name="tbankbh" value="<?=$sv?>" size="20" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">�������������ߵ��̻���</span>
 </li>
 <li class="l1">�̻�KEY��</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="��������,Ȩ�޲���";}else{$sv=$row[bankkey];}?>
 <input  name="tbankkey" value="<?=$sv?>" size="60" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">�������������ߵ�KEY</span>
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