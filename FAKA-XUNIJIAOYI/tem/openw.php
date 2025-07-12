<?
include("../config/conn.php");
include("../config/function.php");

//登录验证开始
if($_GET[control]=="dl"){
 zwzr();
 $uid=sqlzhuru($_POST[t1]);$pwd=sqlzhuru($_POST[t2]);
 if(empty($uid) || empty($pwd)){Audit_alert("帐号或密码输入有误，返回重试","openw.php");}
 while0("id,uid,pwd,zt","yjcode_user where uid='".$uid."' and pwd='".sha1($pwd)."'");if(!$row=mysql_fetch_array($res)){Audit_alert("帐号密码输入有误，返回重试","openw.php");}
 if(0==$row[zt]){Audit_alert("您的帐号已被禁用，请联系网站客服处理","openw.php");}
 $sj=date("Y-m-d H:i:s");
 $uip=$_SERVER["REMOTE_ADDR"];
 intotable("yjcode_loginlog","admin,userid,sj,uip","1,".$row[id].",'".$sj."','".$uip."'");
 $_SESSION["SHOPUSER"]=$uid;
 php_toheader("openw.php?t=suc");
}
//登录验证结束

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>登录/注册弹窗</title>
<style type="text/css">
body{margin:0;font-size:12px;text-align:left;}
p{margin:2pt 0 0 0;}
*{margin:0 auto;padding:0;}
a{color:#333;text-decoration:none;}
a:hover{color:#ff6600;}
.blue{color:#3366CC;}
ul{list-style-type:none;margin:0;padding:0;}
.yjcode{float:left;width:300px;height:248px;background-color:#FAFAFA;}
.yjcode1{background-color:#fff;}
.u1{float:left;width:300px;height:34px;background:url(../img/bgcap4.gif) left center repeat-x;border-bottom:#E4E4E4 solid 1px;}
.u1 li{float:left;}
.u1 .l1{width:200px;padding:10px 0 0 10px;font-weight:700;font-size:14px;}
.u1 .l2{width:80px;padding:10px 0 0 0;text-align:right;}
.dl{float:left;width:250px;padding:10px 0 0 50px;}
.dl .err{float:left;width:173px;height:16px;padding:4px 0 0 25px;border:#FF8080 solid 1px;margin:0 0 8px 0;color:#6B6B6B;background:url(../img/err.gif) no-repeat;background-position:5px 3px;background-color:#FFF2F2;}
.dl .suc{float:left;width:200px;color:#6B6B6B;background:url(../img/suc.jpg) center top no-repeat;padding:100px 0 0 0;height:50px;line-height:25px;text-align:center;}
.dl .u2{float:left;width:200px;}
.dl .u2 li{float:left;}
.dl .u2 .l1{width:110px;height:17px;}
.dl .u2 .l2{width:90px;height:17px;text-align:right;}
.dl .u2 .l3{height:37px;width:200px;}
.dl .u2 .l3 input{float:left;border:#CBCBCB solid 1px;height:24px;width:198px;}
.dl .u2 .l4{height:37px;width:200px;}
.dl .u2 .l4 input{float:left;border:0;color:#fff;font-weight:700;background:url(../img/btnbg3.gif) left top no-repeat;width:200px;height:29px;cursor:pointer;}
</style>
<script language="javascript">
function tj(){
 if((document.f1.t1.value).replace("/\s/","")==""){alert("请输入帐号");document.f1.t1.focus();return false;}	
 if((document.f1.t2.value).replace("/\s/","")==""){alert("请输入密码");document.f1.t2.focus();return false;}	
 document.getElementById("tjbtn").style.display="none";
 document.getElementById("tjing").style.display="";	
 f1.action="openw.php?control=dl";
}
function miaos(){
s=parseInt(document.getElementById("miao").innerHTML);
if(s>1){s=s-1;document.getElementById("miao").innerHTML=s;}else{clearInterval(sm);document.getElementById("miao").innerHTML=5;parent.tangc(0);}
}
</script>
</head>
<body>
<div class="yjcode<? if($_GET[t]=="suc"){?> yjcode1<? }?>">

<ul class="u1">
<li class="l1">快速登录</li>
<li class="l2"><img src="../img/err1.png" width="11" height="11" style="cursor:pointer;" onclick="parent.tangc(0);" /></li>
</ul>
<form name="f1" method="post" onsubmit="return tj()">
<div class="dl">
 <? if($_GET[t]=="err"){?><div class="err">您输入的帐号和密码不匹配</div><? }?>
 <? if($_GET[t]=="suc"){?>
 <div class="suc">
 <strong>登录成功，请继续之前的操作</strong><br>
 <span id="miao">4</span>秒后自动关闭登录窗口
 </div>
 <? }else{?>
 <ul class="u2">
 <li class="l1">登录名：</li>
 <li class="l2"></li>
 <li class="l3"><input type="text" name="t1" /></li>
 <li class="l1">登录密码：</li>
 <li class="l2"><a href="<?=weburl?>reg/getpasswd.php" class="blue" target="_blank">忘记登录密码?</a></li>
 <li class="l3"><input type="password" name="t2" /></li>
 <li class="l4"><? tjbtnr("登 录")?></li>
 <li class="l1"></li>
 <li class="l2"><a href="<?=weburl?>reg/reg.php" class="blue" target="_blank">免费注册</a></li>
 </ul>
 <? }?>
</div>
</form>
<? if($_GET[t]=="suc"){?>
<script language="javascript">
var sm=setInterval("miaos()",1000);
</script>
<? }?>
</div>
</body>
</html>