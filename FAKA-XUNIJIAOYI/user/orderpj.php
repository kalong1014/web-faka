<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION["SHOPUSER"]);
$orderbh=$_GET[orderbh];
while0("*","yjcode_order where orderbh='".$orderbh."' and ddzt='suc' and userid=".$userid);if(!$row=mysql_fetch_array($res)){php_toheader("order.php");}
if(panduan("bh","yjcode_pro where bh='".$row[probh]."'")==0){Audit_alert("该商品已被删除，无法进行评价！","order.php");}
$sqlpj="select * from yjcode_propj where orderbh='".$orderbh."' and userid=".$userid;mysql_query("SET NAMES 'GBK'");$respj=mysql_query($sqlpj);
if($rowpj=mysql_fetch_array($respj)){$ifpj=1;}else{$ifpj=0;}

if(sqlzhuru($_POST[jvs])=="pj"){
 zwzr();
 if(1==$ifpj){Audit_alert("您已评价过，不能重复点评！","orderpj.php?orderbh=".$orderbh);}
 $sj=date("Y-m-d H:i:s");
 $uip=$_SERVER["REMOTE_ADDR"];
 intotable("yjcode_propj","probh,selluserid,userid,sj,uip,pf1,pf2,pf3,txt,orderbh","'".$row[probh]."',".$row[selluserid].",".$row[userid].",'".$sj."','".$uip."',".sqlzhuru($_POST[hpjjf1]).",".sqlzhuru($_POST[hpjjf2]).",".sqlzhuru($_POST[hpjjf3]).",'".sqlzhuru($_POST[s1])."','".$row[orderbh]."'");
 $sql1="select avg(pf1) as pf1v,avg(pf2) as pf2v,avg(pf3) as pf3v from yjcode_propj where probh='".$row[probh]."' and selluserid=".$row[selluserid];mysql_query("SET NAMES 'GBK'");$res1=mysql_query($sql1);
 $row1=mysql_fetch_array($res1);
 updatetable("yjcode_pro","pf1=".round($row1[pf1v],2).",pf2=".round($row1[pf2v],2).",pf3=".round($row1[pf3v],2)." where bh='".$row[probh]."'");
 PointInto($userid,"交易成功，点评商品获得积分",$rowcontrol[pjjf]);
 PointUpdate($userid,$rowcontrol[pjjf]); 
 php_toheader("orderpj.php?orderbh=".$orderbh);

}
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
function pjover(x,y){
document.getElementById("pjbg"+x).style.backgroundImage="url(img/pj"+y+"v.gif)";
if(y==0){sv="未打分";}
else if(y==1){sv="失望";}
else if(y==2){sv="不满";}
else if(y==3){sv="一般";}
else if(y==4){sv="满意";}
else if(y==5){sv="惊喜";}
document.getElementById("pjf"+x).innerHTML=y+"分&nbsp;"+sv;
}

function pjonc(x,y){
$("hpjjf"+x).value=y;
}

function pjout(x,y){
 pjjf=parseInt($("hpjjf"+x).value);
 if(pjjf!=0){pjover(x,pjjf);}
 else{pjover(x,0);}
}

function tj(){
 if(parseInt($("hpjjf1").value)==0){alert("请先对描述相符打分");return false;}
 if(parseInt($("hpjjf2").value)==0){alert("请先对发货速度打分");return false;}
 if(parseInt($("hpjjf3").value)==0){alert("请先对服务态度打分");return false;}
 if((document.f1.s1.value).replace(/\s/,"")==""){alert("请输入简要的点评内容");document.f1.s1.focus();return false;}
 tjwait();
 f1.action="orderpj.php?orderbh=<?=$orderbh?>";
}
</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 评价</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <ul class="wz">
 <li class="l0"></li>
 <li class="l1 l2">订单详情</li>
 <li class="l1"><a href="order.php">我的订单</a></li>
 <li class="l3" style="width:594px;"></li>
 </ul>
 <? include("orderv.php");?>
 
 <? if(0==$ifpj){?>
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="pj" name="jvs" />
 <input type="hidden" id="hpjjf1" name="hpjjf1" value="0" />
 <input type="hidden" id="hpjjf2" name="hpjjf2" value="0" />
 <input type="hidden" id="hpjjf3" name="hpjjf3" value="0" />
 <div class="orderpj">
 <ul class="u1">
 <li class="l1">填写真实评价信息，可获得网站赠送的<?=$rowcontrol[pjjf]?>积分</li>
 <li class="l2">评价<br>商品</li>
 <li class="l3"><textarea name="s1"></textarea></li>
 </ul>
 <ul class="u2">
 <li class="l1">描述相符：</li>
 <li class="l2" id="pjbg1"><? for($i=1;$i<=5;$i++){?><span class="s1" onclick="pjonc(1,<?=$i?>)" onmouseout="pjout(1,<?=$i?>)" onmouseover="pjover(1,<?=$i?>)"></span><? }?><span id="pjf1" class="pjf"></span></li>
 <li class="l1">发货速度：</li>
 <li class="l2" id="pjbg2"><? for($i=1;$i<=5;$i++){?><span class="s1" onclick="pjonc(2,<?=$i?>)" onmouseout="pjout(2,<?=$i?>)" onmouseover="pjover(2,<?=$i?>)"></span><? }?><span id="pjf2" class="pjf"></span></li>
 <li class="l1">服务态度：</li>
 <li class="l2" id="pjbg3"><? for($i=1;$i<=5;$i++){?><span class="s1" onclick="pjonc(3,<?=$i?>)" onmouseout="pjout(3,<?=$i?>)" onmouseover="pjover(3,<?=$i?>)"></span><? }?><span id="pjf3" class="pjf"></span></li>
 </ul>
 <div class="pjbtn"><? tjbtnr("发表评价")?></div>
 </div>
 </form>
 
 <? }else{?>
 <ul class="typeuk1"><li class="l1">评价内容</li><li class="l2">您于 <?=$rowpj[sj]?> 对本次交易进行了评价：<br><strong class="feng">描述相符度<?=$rowpj[pf1]?>分，发货速度<?=$rowpj[pf2]?>分，卖家服务态度<?=$rowpj[pf3]?>分</strong><br>评价：<?=$rowpj[txt]?></li></ul>
 <? }?>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>