<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();

if(sqlzhuru($_POST[jvs])=="control"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){Audit_alert("权限不够","default.php");}
 zwzr();
 if(panduan("*","yjcode_control")==0){intotable("yjcode_control","webnamev","'保存失败'");}
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
<title><?=webname?>管理系统</title>
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
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0302,")){echo "<div class='noneqx'>无权限</div>";exit;}?>

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
 <li class="l1">当前位置：<a href="default.php">后台首页</a> - <strong>支付接口</strong></li><li class="l2"></li>
 </ul>
 
 <? include("rightcap1.php");?>
 <script language="javascript">$("rtit4").className="l1";</script>
 
 <? if($_GET[t]=="suc"){systs("恭喜您，操作成功！","inf3.php");}?>
 
 <!--Begin-->
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" name="jvs" value="control" />
 <ul class="uk">
 <li class="cap">支付宝设置 <a href="https://b.alipay.com/order/productIndex.htm" target="_blank">[申请]</a></li>
 <li class="l1">选择支付方式：</li>
 <li class="l2">
 <select name="d1">
 <option value="0" <? if($row[zftype]==0 || $row[zftype]==NULL){?> selected="selected"<? }?>>支付宝即时到帐</option>
 <option value="1" <? if($row[zftype]==1){?> selected="selected"<? }?>>支付宝担保交易</option>
 <option value="2" <? if($row[zftype]==2){?> selected="selected"<? }?>>支付宝双功能接口</option>
 </select>
 <span class="red">请根据你的接口实际情况来选择对应的支付方式</span>
 </li>
 <li class="l1">partner：</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="机密数据,权限不够";}else{$sv=$row[partner];}?>
 <input  name="zf1" value="<?=$sv?>" size="20" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">请输入支付宝的partner</span>
 </li>
 <<li class="l1">security_code：</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="机密数据,权限不够";}else{$sv=$row[security_code];}?>
 <input  name="zf2" value="<?=$sv?>" size="60" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">请输入支付宝的security_code</span>
 </li>
 <li class="l1">seller_email：</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="机密数据,权限不够";}else{$sv=$row[seller_email];}?>
 <input  name="zf3" value="<?=$sv?>" size="20" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">请输入支付宝的seller_email</span>
 </li>
 
 <li class="cap">财付通设置 <a href="http://www.itenwang.com/user/pay.php/" target="_blank">[申请]</a></li>
 <li class="l1">商户编号：</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="机密数据,权限不够";}else{$sv=$row[tenpay1];}?>
 <input  name="tenpay1" value="<?=$sv?>" size="20" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">请输入财付通的商户号</span>
 </li>
 <li class="l1">密钥：</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="机密数据,权限不够";}else{$sv=$row[tenpay2];}?>
 <input  name="tenpay2" value="<?=$sv?>" size="60" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">请输入财付通的商户密钥</span>
 </li>
 
 <li class="cap">环讯支付接口 <a href="http://www.ips.com.cn/" target="_blank">[申请]</a></li>
 <li class="l1">商户编号：</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="机密数据,权限不够";}else{$sv=$row[ipsshh];}?>
 <input  name="ips1" value="<?=$sv?>" size="20" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">请输入环讯的商户号</span>
 </li>
 <li class="l1">密钥：</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="机密数据,权限不够";}else{$sv=$row[ipszs];}?>
 <input  name="ips2" value="<?=$sv?>" size="60" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">请输入环讯的证书号</span>
 </li>
 
 <li class="cap">网银在线接口 <a href="http://www.chinabank.com.cn/" target="_blank">[申请]</a></li>
 <li class="l1">商户号：</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="机密数据,权限不够";}else{$sv=$row[bankbh];}?>
 <input  name="tbankbh" value="<?=$sv?>" size="20" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">请输入网银在线的商户号</span>
 </li>
 <li class="l1">商户KEY：</li>
 <li class="l2">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){$sv="机密数据,权限不够";}else{$sv=$row[bankkey];}?>
 <input  name="tbankkey" value="<?=$sv?>" size="60" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">请输入网银在线的KEY</span>
 </li>

 <li class="l3"><? tjbtnr("保存修改");?></li>
 </ul>
 </form>

 <!--End-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>