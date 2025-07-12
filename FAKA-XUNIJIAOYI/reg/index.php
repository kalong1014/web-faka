<?
include("../config/conn.php");
include("../config/function.php");
if($_SESSION["SHOPUSER"]!=""){php_toheader("../user/");}

//登录验证开始
if($_GET[action]=="login" && sqlzhuru($_POST[jvs])=="login"){
 zwzr();
 $uid=sqlzhuru($_POST[t1]);$pwd=sqlzhuru($_POST[t2]);
 if(empty($uid) || empty($pwd)){Audit_alert("帐号或密码输入有误，返回重试","./");}
 while0("id,uid,pwd,zt","yjcode_user where uid='".$uid."' and pwd='".sha1($pwd)."'");if(!$row=mysql_fetch_array($res)){Audit_alert("帐号密码输入有误，返回重试","./");}
 if(0==$row[zt]){Audit_alert("您的帐号已被禁用，请联系网站客服处理","./");}
 
 $sj=date("Y-m-d H:i:s");
 $uip=$_SERVER["REMOTE_ADDR"];
 intotable("yjcode_loginlog","admin,userid,sj,uip","1,".$row[id].",'".$sj."','".$uip."'");
 $_SESSION["SHOPUSER"]=$uid;
 php_toheader("../user/");
}
//登录验证结束

?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>会员登录 - <?=webname?></title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<link href="index.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/basic.js"></script>
<script language="javascript" src="index.js"></script>
</head>
<body>
<? include("../tem/top.html");?>

<div class="yjcode">
 <div class="mtop">
 <ul class="u1 fontyh">
 <li class="l1"><a href="../"><img border="0" src="../img/logo.png" /></a></li>
 <li class="l2">还没有<?=webname?>账号？<a href="reg.php">免费注册</a></li>
 </ul>
 </div>
</div>

<div class="bfb bfb1">
<div class="yjcode">

<div class="loginleft"><? adread("ADO01",448,344)?></div>
<div class="loginright">
<form name="f1" method="post" onSubmit="return login()">
<ul class="u1">
<li class="cap fontyh">欢迎登录<?=webname?></li>
<li class="l1">帐号</li>
<li class="l2"><input type="text" class="inp1" name="t1"></li>
<li class="l1">密码</li>
<li class="l2"><input type="password" class="inp1" name="t2"></li>
<li class="l3"><input type="submit" value="登 录"></li>
<li class="l4"><a href="getmm.php">忘记密码？</a></li>
<li class="l1">第三方帐号登录</li>
<li class="l5"><a href="../config/qq/oauth/index.php"><img src="../img/qq1.gif" width="138" height="37" border="0" /></a></li>
</ul>
<input type="hidden" value="login" name="jvs" />
</form>
</div>

</div>
</div>

<? include("../tem/bottom.html");?>
</body>
</html>