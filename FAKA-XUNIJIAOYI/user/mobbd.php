<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();

if($_GET[control]=="bd"){
 zwzr();
 if(panduan("uid,mot,ifmot","yjcode_user where mot='".$_GET[mob]."' and ifmot=1")==1){Audit_alert("绑定失败，该号码已经被绑定过","mobbd.php");}
 if(empty($_GET[yz])){Audit_alert("验证码有误！","mobbd.php");}
 if(panduan("uid,mot,ifmot,bdmot","yjcode_user where mot='".$_GET[mob]."' and bdmot='".$_GET[yz]."' and uid='".$_SESSION[SHOPUSER]."'")==0){
 Audit_alert("验证码输入有误，请重新绑定","mobbd.php");
 }
 updatetable("yjcode_user","mot='".$_GET[mob]."',ifmot=1,bdmot='' where uid='".$_SESSION[SHOPUSER]."'");
 php_toheader("mobbd.php?t=suc"); 

}elseif($_GET[control]=="delbd"){
 if(panduan("uid,bdmot","yjcode_user where bdmot='".$_GET[yz]."' and uid='".$_SESSION[SHOPUSER]."'")==0){
 Audit_alert("验证码输入有误，请重新提交","mobbd.php");
 }
 updatetable("yjcode_user","mot='',ifmot=0,bdmot='' where uid='".$_SESSION[SHOPUSER]."'");
 php_toheader("mobbd.php?t=suc"); 

}


$sqluser="select uid,mot,ifmot from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("un.php");}
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
//绑定开始
var sz;
var xmlHttp = false;
try {
  xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttp = false;
  }
}
if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
  xmlHttp = new XMLHttpRequest();
}


function updatePage() {
  if (xmlHttp.readyState == 4) {
    var response = xmlHttp.responseText;
	response=response.replace(/[\r\n]/g,'');
	if(response=="True"){
		alert("该号码已经被绑定，请更换");
		$("uk1").style.display="";$("uk2").style.display="none";return false;
	}else{
		sz=setInterval("sjzou()",1000);return false;
	}
  }
}

function yzonc(){
 if(($("t1").value).replace("/\s/","")==""){alert("请输入手机号码");$("t1").focus();return false;}
 $("sjzouv").innerHTML=120;
 $("uk1").style.display="none";
 $("uk2").style.display="";
 $("fsid1").style.display=""; 
 $("fsid2").style.display="none"; 
 var url = "mobchk.php?mob="+$("t1").value;
 xmlHttp.open("get", url, true);
 xmlHttp.onreadystatechange = updatePage;
 xmlHttp.send(null);
}

function sjzou(){
 s=parseInt($("sjzouv").innerHTML);
 if(s<=0){
  clearInterval(sz);
  $("fsid1").style.display="none"; 
  $("fsid2").style.display=""; 
  return false;
 }else{$("sjzouv").innerHTML=s-1;}
}

function bd(){
 if(($("t2").value).replace("/\s/","")==""){alert("请输入验证码");$("t2").focus();return false;}
 location.href="mobbd.php?control=bd&yz="+$("t2").value+"&mob="+$("t1").value;
}

//解绑开始
var delsz;
var delxmlHttp = false;
try {
  delxmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    delxmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    delxmlHttp = false;
  }
}
if (!delxmlHttp && typeof XMLHttpRequest != 'undefined') {
  delxmlHttp = new XMLHttpRequest();
}


function delupdatePage() {
  if (delxmlHttp.readyState == 4) {
    response = delxmlHttp.responseText;
	response=response.replace(/[\r\n]/g,'');
	delsz=setInterval("delsjzou()",1000);
  }
}

function delbd(){
 if(!confirm("确定要解除该手机号码的绑定吗？")){return false;}
 $("delsjzouv").innerHTML=120;
 $("uk3").style.display="none";
 $("uk4").style.display="";
 $("fsid3").style.display=""; 
 $("fsid4").style.display="none"; 
 var url = "mobchkdel.php";
 delxmlHttp.open("post", url, true);
 delxmlHttp.onreadystatechange = delupdatePage;
 delxmlHttp.send(null);
}

function delsjzou(){
 s=parseInt($("delsjzouv").innerHTML);
 if(s<=0){
  clearInterval(delsz);
  $("fsid3").style.display="none"; 
  $("fsid4").style.display=""; 
  return false;
 }else{$("delsjzouv").innerHTML=s-1;}
}

function deltj(){
 if(($("t4").value).replace("/\s/","")==""){alert("请输入验证码");$("t4").focus();return false;}
 location.href="mobbd.php?control=delbd&yz="+$("t4").value;
}

</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 手机绑定</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? include("rcap1.php");?>
 <script language="javascript">
 $("rcap4").className="l1 l2";
 </script>

 <? systs("恭喜您，操作成功!","mobbd.php")?>

 <? if(1==$rowuser[ifmot]){?>
 <ul class="uk" id="uk3">
 <li class="l1">已绑定手机：</li>
 <li class="l21"><?=strgb2312($rowuser[mot],0,6)?>*****</li>
 <li class="l3"></li>
 <li class="l4"><input type="button" class="btn1" onclick="delbd()" onmouseover="this.className='btn2';" onmouseout="this.className='btn1';" value="解除手机绑定" /></li>
 </ul>

 <ul class="uk" id="uk4" style="display:none;">
 <li class="l1"></li>
 <li class="l21 blue">如果您的原手机号码已经丢失，请联系网站客服处理。</li>
 <li class="l1"><span class="red" style="font-weight:normal;">*</span>验证码：</li>
 <li class="l2"><input type="text" class="inp" id="t4"  /></li>
 <li class="l1"></li>
 <li class="l21" id="fsid3">请查看<?=strgb2312($rowuser[mot],0,6)?>*****手机短信,发送中……(<span id="delsjzouv" class="red">120</span>秒后重发)</li>
 <li class="l21" id="fsid4" style="display:none;">[<a href="#" onclick="javascript:delbd();">重新发送</a>]</li>
 <li class="l3"></li>
 <li class="l4"><input type="button" class="btn1" onclick="deltj()" onmouseover="this.className='btn2';" onmouseout="this.className='btn1';" value="下一步" /></li>
 </ul>
 
 
 <? }else{?>
 <ul class="uk" id="uk1">
 <li class="l1"><span class="red" style="font-weight:normal;">*</span>手机号码：</li>
 <li class="l2"><input type="text" class="inp" name="t1" id="t1"  /></li>
 <li class="l3"></li>
 <li class="l4"><input type="button" class="btn1" onclick="yzonc()" onmouseover="this.className='btn2';" onmouseout="this.className='btn1';" value="下一步" /></li>
 </ul>
 <ul class="uk" id="uk2" style="display:none;">
 <li class="l1"><span class="red" style="font-weight:normal;">*</span>验证码：</li>
 <li class="l2"><input type="text" class="inp" name="t2" id="t2"  /></li>
 <li class="l1"></li>
 <li class="l21" id="fsid1">发送中……(<span id="sjzouv" class="red">360</span>秒后重发)</li>
 <li class="l21" id="fsid2" style="display:none;">[<a href="#" onclick="javascript:yzonc();">重新发送</a>]</li>
 <li class="l3"></li>
 <li class="l4"><input type="button" class="btn1" onclick="bd()" onmouseover="this.className='btn2';" onmouseout="this.className='btn1';" value="绑定手机" /></li>
 </ul>
 
 <? }?>
 
 <ul class="uk">
 <li class="l1">友情提示：</li>
 <li class="l21 red">如果没有收到短信，请查看垃圾箱</li>
 </ul>


</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>