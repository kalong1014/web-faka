<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
$rowuser=mysql_fetch_array($resuser);
if(1==$rowuser[shopzt] || 2==$rowuser[shopzt] || 3==$rowuser[shopzt]){php_toheader("openshop3.php");}

//入库操作开始
if($_POST[jvs]=="openshop"){
 zwzr();
 $t1=sha1(sqlzhuru($_POST[t1]));
 if(panduan("uid,pwd","yjcode_user where uid='".$_SESSION[SHOPUSER]."' and zfmm='".$t1."'")==0){Audit_alert("支付密码验证失败，返回重试！","openshop2.php");}
 if($rowcontrol[openshop]>$rowuser[money1]){Audit_alert("您的余额不够，请先充值！","openshop2.php");}
 $m=$rowcontrol[openshop];
 PointUpdateM($rowuser[id],$m*(-1));
 PointIntoM($rowuser[id],"申请开店，缴纳费用",$m*(-1));
 updatetable("yjcode_user","openshop=".$m.",shopzt=1 where uid='".$_SESSION[SHOPUSER]."'");
 php_toheader("openshop3.php");
}
//入库操作结束

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户管理面板 - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script language="javascript">
function tj(){
if((document.f1.t1.value).replace(/\s/,"")==""){alert("请输入支付密码");document.f1.t1.focus();return false;}	
if(confirm("确定提交吗？")){tjwait();f1.action="openshop2.php";}else{return false;}
}
</script>
</head>
<body>
<div class="yjcode">

<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 申请开店</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? include("kdcap.php");?>
 <script language="javascript">
 $("step2").className="l1 l11";
 </script>

 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="openshop" name="jvs" />
 <ul class="uk">
 <li class="l1">开店费用：</li>
 <li class="l21 red"><strong><?=$rowcontrol[openshop]?> 元</strong></li>
 <li class="l1">您的可用余额：</li>
 <li class="l21 green"><strong><?=$rowuser[money1]?> 元</strong><? if($rowcontrol[openshop]>$rowuser[money1]){?>[<a href="pay.php">余额不足,点击充值</a>]<? }?></li>
 <li class="l1">支付密码：</li>
 <li class="l2"><input type="password" class="inp" name="t1" /> [<a href="zfmm.php">忘记支付密码?</a>]</li>
 <li class="l3"></li>
 <li class="l4"><?=tjbtnr("下一步")?></li>
 </ul>
 </form>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>