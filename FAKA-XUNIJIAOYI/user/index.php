<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
while0("*","yjcode_user where uid='".$_SESSION[SHOPUSER]."'");if(!$row=mysql_fetch_array($res)){php_toheader("un.php");}
$usertx="../upload/".$row[id]."/user.jpg";if(!is_file($usertx)){$usertx="img/nonetx.gif";}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户管理面板 - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a></li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="iright">

 <!--基本B-->
 <div class="jb">
 <ul class="ircap">
 <li class="l1">我的基本信息</li>
 </ul>
 <div class="tx"><a href="touxiang.php"><img border="0" src="<?=$usertx?>" width="100" height="100" /></a><br>[<a href="touxiang.php">更改头像</a>]</div>
 <ul class="u1">
 <li class="l1">用户名：<strong class="blue"><?=$_SESSION["SHOPUSER"]?></strong></li>
 <li class="l2">认证：</li>
 <li class="l3">
 <a href="mobbd.php"><? if(1==$row[ifmot]){?><img src="img/sj1.gif" title="手机已通过认证" /><? }else{?><img src="img/sj0.gif" title="手机未认证" /><? }?></a>
 <a href="emailbd.php"><? if(1==$row[ifemail]){?><img src="img/yx1.gif" title="邮箱已通过认证" /><? }else{?><img src="img/yx0.gif" title="邮箱未认证" /><? }?></a>
 </li>
 <li class="l1">
 上次登录：<?
 while1("*","yjcode_loginlog where userid=".$row[id]." and admin=1 order by id desc limit 2");$row1=mysql_fetch_array($res1);$psj=$row1[sj];$puip=$row1[uip];
 if($row1=mysql_fetch_array($res1)){$psj=$row1[sj];$puip=$row1[uip];}
 ?>
 <?=$psj?> <a href="http://www.baidu.com/s?wd=<?=$puip?>" title="<?=$puip?>" target="_blank">[查看地址]</a>
 </li>
 </ul>
 <ul class="u2">
 <li class="l0">可用积分<br><strong><?=$row[jf]?></strong></li>
 <li class="l1">可用余额<br><strong><?=sprintf("%.2f",$row[money1])?></strong></li>
 <li class="l2"><input type="button" value="充值" onclick="gourl('pay.php')" /></li>
 </ul>
 </div>
 <!--基本E-->
 
 <!--推广B-->
 <div class="tuig">
 <ul class="u1">
 <li class="l1">复制以下链接到论坛、QQ群、朋友圈等，通过该链接注册的顺控网会员交易后，您将获得每笔交易额<strong><? if(empty($rowcontrol[tjmoney])){echo 0;}else{echo $rowcontrol[tjmoney]*100;}?>%</strong>做为佣金，鼠标点点，轻松赚钱^_^</li>
 <li class="l2"><input type="text" onclick="this.select();" value="<?=weburl?>reg/reg.php?tid=<?=$row[id]?>" /></li>
 </ul>
 </div>
 <!--推广E-->
 
 <!--提示B-->
 <div class="rzts">
 <ul class="ircap">
 <li class="l1">安全中心</li>
 </ul>
 
 <? if(1==$row[sfzrz]){$a="ok";}else{$a="err";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">实名认证</li>
 <li class="l2">通过实名认证将有助于我们为您提供更好的服务</li>
 <li class="l3"><a href="smrz.php">查看</a></li>
 </ul>

 <? if(1==$row[ifmot]){$a="ok";}else{$a="err";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">手机绑定</li>
 <li class="l2">将您的手机绑定在您注册时的帐号上，提高帐户及资金安全性</li>
 <li class="l3"><a href="mobbd.php">查看</a></li>
 </ul>
 
 <? if(empty($row[txyh]) || empty($row[txname]) || empty($row[txzh])){$a="err";}else{$a="ok";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">收款帐号设置</li>
 <li class="l2">您在本站有资金收入时，我们将通过你的收款帐号汇款给你</li>
 <li class="l3"><a href="txsz.php">查看</a></li>
 </ul>
 
 <? if(1==$row[ifemail]){$a="ok";}else{$a="err";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">常用邮箱绑定</li>
 <li class="l2">当你忘记登录密码时，可以通过邮箱找回密码</li>
 <li class="l3"><a href="emailbd.php">查看</a></li>
 </ul>
  
 <? if(strcmp(sha1("admin"),$row[pwd])==0 || strcmp(sha1("123456"),$row[pwd])==0 || strcmp(sha1("admin888"),$row[pwd])==0){$a="err";}else{$a="ok";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">登录密码</li>
 <li class="l2">英文加数字或符号的组合密码，安全性更高，建议定期更换密码</li>
 <li class="l3"><a href="pwd.php">查看</a></li>
 </ul>
 
 <? if(1==$row[ifqq]){$a="ok";}else{$a="err";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">QQ绑定</li>
 <li class="l2">绑定QQ，以后可以用QQ一键登录，无需再输入帐号密码</li>
 <li class="l3"><a href="qq.php">查看</a></li>
 </ul>
  
 <? if(!empty($row[uqq]) && !empty($row[weixin])){$a="ok";}else{$a="err";}?>
 <ul class="u1 u0">
 <li class="l1 <?=$a?>">联系方式</li>
 <li class="l2">补充完善您的个人基本资料，有助于我们更好为您提供服务</li>
 <li class="l3"><a href="inf<?=$_SESSION[FCWuserID]?>.php">查看</a></li>
 </ul>

 </div>
 <!--提示E-->

</div> 
<!--RE-->

<!--RRB-->
<div class="icb">
 <div class="kf">
 <ul class="icbcap">
 <li class="l1">网站客服中心</li>
 <li class="l2"></li>
 </ul>
 <ul class="u1">
 <li class="l1">客服QQ:</li>
 <li class="l2">
 <?
 $qq=preg_split("/,/",$rowcontrol[webqqv]);
 for($qqi=0;$qqi<count($qq);$qqi++){
 $qv=preg_split("/\*/",$qq[$qqi]);
 if($qv[0]!=""){
 if($qv[1]==""){$qtit="网站客服";}else{$qtit=$qv[1];}
 ?>
 <a href="http://wpa.qq.com/msgrd?v=3&uin=<?=$qv[0]?>&site=<?=weburl?>&menu=yes" target="_blank"><?=$qtit?></a>
 <?
 }
 }
 ?>
 </li>
 <li class="l1">电话：<?=$rowcontrol[webtelv]?></li>
 </ul>
 </div>
 
 <div class="icbad">
 <? adwhile("ADU01");?>
 </div>
</div>
<!--RRE-->

</div>
<? include("bottom.php");?>
</body>
</html>