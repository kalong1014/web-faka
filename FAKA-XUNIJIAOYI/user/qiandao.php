<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION[SHOPUSER]);
$sj=date("Y-m-d H:i:s");

while1("*","yjcode_qiandao where userid=".$userid." order by sj desc limit 1");
if($row1=mysql_fetch_array($res1)){
$a_ux = strtotime($sj);
$a_date = date('Y-m-d',$a_ux);
$b_date = date('Y-m-d',strtotime($row1[sj]));
if($a_date==$b_date){$ifq=1;}else{$ifq=0;}
}else{$ifq=0;}

//入库操作开始
if($_POST[jvs]=="qd"){
 zwzr();
 if(1==$ifq){Audit_alert("今日已签到，无须重复签到","qiandao.php");}
 $uip=$_SERVER["REMOTE_ADDR"];
 intotable("yjcode_qiandao","userid,sj,uip,tit,jf","".$userid.",'".$sj."','".$uip."','".sqlzhuru($_POST[t1])."',".$rowcontrol[qdjf]."");
 PointInto($userid,"每日签到",$rowcontrol[qdjf]);
 PointUpdate($userid,$rowcontrol[qdjf]); 
 php_toheader("qiandao.php");
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
if((document.f1.t1.value).replace(/\s/,"")==""){alert("请填写今日心情");document.f1.t1.focus();return false;}
tjwait();
f1.action="qiandao.php?control=add";
}
</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 每日签到</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? include("rcap8.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>
 
 <? if(0==$ifq){$weekarray=array("日","一","二","三","四","五","六");?>
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="qd" name="jvs" />
 <ul class="uk">
 <li class="l1">今日心情：</li>
 <li class="l2"><input name="t1"  style="width:305px;" value="按时签到是个好习惯^_^ 签到拿分走人" class="inp" type="text" /></li>
 <li class="l3"></li>
 <li class="l4">
 <div id="tjbtn"><input type="submit" value="周<?=$weekarray[date("w")]?>" class="qd" /></div>
 <div id="tjing" style="display:none;color:#F96F39;"><img style="margin:0 0 6px 0;" src="../img/ajax_loader.gif" width="208" height="13" /><br>正在签到，请稍候^_^</div>
 </li>
 </ul>
 </form>
 <? }else{?>
 <ul class="uk">
 <li class="l1">签到提示：</li>
 <li class="l21"><strong class="feng">尊敬的用户，您今日已经签到成功，明天也记得来签到哦^_^</strong></li>
 </ul>
 <? }?>

 <ul class="typecap">
 <li class="l4">签到时间</li>
 <li class="l4">奖励积分</li>
 <li class="l4">签到IP</li>
 <li class="l1">心情</li>
 </ul>
   
 <?
 $ses=" where userid=".$userid;
 $page=$_GET["page"];if($page==""){$page=1;}else{$page=intval($_GET["page"]);}
 pagef($ses,30,"yjcode_qiandao","order by sj desc");while($row=mysql_fetch_array($res)){
 ?>
 <ul class="typelist2" onmouseover="this.className='typelist2 typelist21';" onmouseout="this.className='typelist2';">
 <li class="l4"><?=$row[sj]?></li>
 <li class="l4"><?=$row[jf]?></li>
 <li class="l4"><a href="http://www.baidu.com/s?wd=<?=$row[uip]?>" target="_blank"><?=$row[uip]?></a></li>
 <li class="l1">&nbsp;&nbsp;&nbsp;<?=$row[tit]?></li>
 <li class="l0"></li>
 </ul>
 <? }?>

 <div class="npa">
 <?
 $nowurl="qiandao.php";
 $nowwd="";
 require("page.html");
 ?>
 </div>


</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>