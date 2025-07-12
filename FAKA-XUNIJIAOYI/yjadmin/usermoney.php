<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$id=$_GET[id];
while0("*","yjcode_user where id=".$id);if(!$row=mysql_fetch_array($res)){php_toheader("userlist.php");}

//函数开始
if($_GET[control]=="update"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0701,")){Audit_alert("权限不够","default.php");}
 zwzr();
 PointIntoM($id,sqlzhuru($_POST[t2]),sqlzhuru($_POST[t1]));
 PointUpdateM($id,sqlzhuru($_POST[t1])); 
 php_toheader("usermoney.php?t=suc&id=".$id);

}elseif($_GET[control]=="ql"){
 PointIntoM($id,"同步金额数字",0);
 updatetable("yjcode_user","money1=0 where id=".$id);
 php_toheader("usermoney.php?t=suc&id=".$id);

}
//函数结果
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
 if((document.f1.t1.value).replace(/\s/,"")==""){alert("请输入有效的金钱数量!");document.f1.t1.select();return false;}
 if(isNaN(document.f1.t1.value)){alert("请输入有效的金钱数量!");document.f1.t1.select();return false;}
 tjwait();
 f1.action="usermoney.php?control=update&id=<?=$row[id]?>";
 }
function ql(){
if(confirm("只要金额形式出现异常时，才适用本操作，确认吗？")){location.href="usermoney.php?id=<?=$id?>&control=ql";}else{return false;}
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu2").className="l21";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0702,")){echo "<div class='noneqx'>无权限</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_user.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">当前位置：后台首页 - 会员管理 - 金钱管理 - <strong><?=$row[uid]?></strong></li><li class="l2"></li>
 </ul>
 <? include("rightcap3.php");?>
 <script language="javascript">$("rtit3").className="l1";</script>
 <? if($_GET[t]=="suc"){systs("恭喜您，操作成功！","usermoney.php?id=".$id);}?>
 <!--B-->
 <form name="f1" method="post" onsubmit="return tj()">
 <ul class="uk">
 <li class="l1">会员帐号：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" name="tuid" size="20" value="<?=$row[uid]?>" /></li>
 <li class="l1">可用余额：</li>
 <li class="l2"><input class="inp redony" readonly="readonly" value="<?=$row[money1]?>" size="10" type="text"/> 【<a href="javascript:ql()">金额清零</a>】</li>
 <li class="l1">金钱数量：</li>
 <li class="l2"><input name="t1" class="inp" size="10" type="text" /> 正数表示增加，负数表示减少，如：100、+100表示加上100金钱，-100表示减去100金钱</li>
 <li class="l1">说明：</li>
 <li class="l2"><input name="t2" class="inp" size="50" type="text" /></li>
 <li class="l3"><? tjbtnr("下一步","userlist.php")?></li>
 </ul>
 </form>


 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>