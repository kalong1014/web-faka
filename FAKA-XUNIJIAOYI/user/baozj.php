<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();

while3("uid,money1,baozj","yjcode_user where uid='".$_SESSION[SHOPUSER]."'");$row3=mysql_fetch_array($res3);
$baozj=$row3[baozj];
$money1=$row3[money1];

//B
if($_GET[control]=="update"){
 $id=$_GET[id];
 if($money1<$_POST[tbaozj]){Audit_alert("余额不足，请先充值！","pay.php?m=".($_POST[tbaozj]-$money1));}
 updatetable("yjcode_user","baozj=baozj+".$_POST[tbaozj].",money1=money1-".$_POST[tbaozj]." where uid='".$_SESSION[SHOPUSER]."'"); 
 php_toheader("baozj.php?t=suc");
 
}
//E

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
nid=0;
function anumonc(x,y,z){
 nid=z;
 ax=parseInt($("allnum").innerHTML);
 for(i=1;i<=ax;i++){
 if($("anum"+i)){$("anum"+i).className="s3";}
 }
 $("anum"+x).className="s3 s32";
 document.getElementById("allmoney").innerHTML=y;
}

function tj(){
if((document.f1.tbaozj.value).replace(/\s/,"")==""){alert("请输入保证金数额");document.f1.tbaozj.focus();return false;}	
 if(confirm("保证金费用将直接从您的余额中扣除，确认吗?")){}else{return false;}
 tjwait();
 f1.action="baozj.php?ty=<?=$ty?>&control=update&id="+nid;
}
</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 缴纳保证金</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? systs("恭喜您，操作成功!","baozj.php")?>
 <form name="f1" method="post" onsubmit="return tj()">
 <span id="allnum" style="display:none"><?=$i?></span>
   
 <ul class="uk">
 <li class="l1">缴纳保证金：</li>
 <li class="l2"><input type="text" class="inp" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" name="tbaozj" /></li>
 <li class="l1">总计保证金：</li>
 <li class="l21"><input type="text" class="inp" disabled="disabled" value="<?=$baozj?>"/>&nbsp;&nbsp;[<a href="jbaozj.php" class="red"><strong>解&nbsp;冻</strong></a>]</li>
 <li class="l1">您的余额：</li>
 <li class="l21"><?=$money1?>元  [<a href="pay.php" class="red"><strong>充值</strong></a>]</li>
 <li class="l1">保证金说明：</li>
 <li class="l21"><?=$rowcontrol[bzjsm]?></li>
 <li class="l3"></li>
 <li class="l4"><? tjbtnr("缴纳")?></li>
 </form>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>