<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();

if(sqlzhuru($_POST[jvs])=="tx"){
 zwzr();
 if(empty($_POST[t1])){Audit_alert("验证码有误！","txsz.php");}
 $zfmm=sha1(sqlzhuru($_POST[t1]));
 if(panduan("uid,zfmm","yjcode_user where zfmm='".$zfmm."' and uid='".$_SESSION[SHOPUSER]."'")==0){Audit_alert("安全码有误！","txsz.php");}
 updatetable("yjcode_user","txyh='".sqlzhuru($_POST[ttxyh])."',txname='".sqlzhuru($_POST[ttxname])."',txzh='".sqlzhuru($_POST[ttxzh])."',txkhh='".sqlzhuru($_POST[ttxkhh])."' where uid='".$_SESSION[SHOPUSER]."'");
 php_toheader("txsz.php?t=suc"); 

}

$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
$rowuser=mysql_fetch_array($resuser);

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
 if((document.f1.ttxzh.value).replace("/\s/","")==""){alert("请输入卡号/账号");document.f1.ttxzh.focus();return false;}
 if((document.f1.ttxname.value).replace("/\s/","")==""){alert("请输入户名");document.f1.ttxname.focus();return false;}
 if((document.f1.t1.value).replace("/\s/","")==""){alert("请输入安全码");document.f1.t1.focus();return false;}
 tjwait();
 f1.action="txsz.php";
}

function txlxcha(){
 tx=$("ttxyh").value;
 if(tx=="支付宝" || tx=="财付通"){$("khh1").style.display="none";$("khh2").style.display="none";}
 else{$("khh1").style.display="";$("khh2").style.display="";}
}
</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 提现设置</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? include("rcap2.php");?>
 <script language="javascript">
 $("rcap3").className="l1 l2";
 </script>
 <? systs("恭喜您，操作成功!","txsz.php")?>
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="tx" name="jvs" />
 <ul class="uk">
 <li class="l1">提现类型：</li>
 <li class="l2">
 <select name="ttxyh" id="ttxyh" onchange="txlxcha()">
 <?
 $yharr=array("支付宝","工商银行","农业银行","建设银行","中国银行","财付通");
 for($i=0;$i<count($yharr);$i++){
 ?>
 <option value="<?=$yharr[$i]?>"<? if($rowuser[txyh]==$yharr[$i]){?> selected="selected"<? }?>><?=$yharr[$i]?></option>
 <?
 }
 ?>
 </select>
 </li>
 <li class="l1"><span class="red" style="font-weight:normal;">*</span>卡号/账号：</li>
 <li class="l2"><input type="text" value="<?=$rowuser[txzh]?>" class="inp" name="ttxzh" /></li>
 <li class="l1" id="khh1">开户行：</li>
 <li class="l2" id="khh2"><input type="text" value="<?=$rowuser[txkhh]?>" class="inp" name="ttxkhh" /></li>
 <li class="l1"><span class="red" style="font-weight:normal;">*</span>户名：</li>
 <li class="l2"><input type="text" value="<?=$rowuser[txname]?>" class="inp" name="ttxname" /> 帐号对应的姓名</li>
 <li class="l1"><span class="red" style="font-weight:normal;">*</span>安全码：</li>
 <li class="l2"><input type="password" class="inp" name="t1" /> <a href="zfmm.php">忘了安全码？</a></li>
 <li class="l3"></li>
 <li class="l4"><?=tjbtnr("提交")?></li>
 </ul>
 </form>

 
</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
<script language="javascript">txlxcha();</script>
</body>
</html>