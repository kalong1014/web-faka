<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$orderbh=$_GET[orderbh];
while0("*","yjcode_order where orderbh='".$orderbh."'");if(!$row=mysql_fetch_array($res)){php_toheader("orderlist.php");}
$tp="../".returntp("bh='".$row[probh]."' order by iffm desc","-2");

//函数开始
if($_GET[control]=="update" && sqlzhuru($_POST[jvs])=="order"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0401,")){Audit_alert("权限不够","default.php");}
 zwzr();
 if($row[ddzt]!="back" && $row[ddzt]!="backerr"){Audit_alert("订单状态错误，返回列表重试","orderlist.php");}
 $sj=date("Y-m-d H:i:s");
 //同意B
 if(sqlzhuru($_POST[R1])=="yes"){
  $tkjg="管理员介入，订单退款成功";
  $allmoney=$row[money1]*$row[num];
  PointUpdateM($row[userid],$allmoney);
  PointIntoM($row[userid],$tkjg,$allmoney);
  updatetable("yjcode_order","ddzt='backsuc',tkjg='".$tkjg."',tkoksj='".$sj."' where id=".$row[id]);
  deletetable("yjcode_tk where orderbh='".$orderbh."'");
  deletetable("yjcode_db where orderbh='".$orderbh."'");
 }
 //同意E
 //不同意B
 if(sqlzhuru($_POST[R1])=="no"){
  $tkjg="管理员介入，不允许的退款，订单修改为交易成功";
  $allmoney=$row[money1]*$row[num];
  PointUpdateM($row[selluserid],$allmoney);
  PointIntoM($row[selluserid],$tkjg,$allmoney);
  updatetable("yjcode_order","ddzt='suc',oksj='".$sj."' where orderbh='".$orderbh."'");
  deletetable("yjcode_tk where orderbh='".$orderbh."'");
  deletetable("yjcode_db where orderbh='".$orderbh."'");
 }
 //不同意E
 php_toheader("orderview.php?t=suc&orderbh=".$orderbh); 
 
}
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
r=document.getElementsByName("R1");rr="";for(i=0;i<r.length;i++){if(r[i].checked==true){rr=r[i].value;}}if(rr==""){alert("请选择退款处理！");return false;}
if(!confirm("确定要提交该操作吗？")){return false;}
tjwait();
f1.action="orderview.php?orderbh=<?=$orderbh?>&control=update";
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu6").className="l61";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0402,")){echo "<div class='noneqx'>无权限</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_order.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">当前位置：后台首页 - <strong>订单列表</strong> - [<a href="orderlist.php">返回</a>]</li><li class="l2"></li>
 </ul>
 <? if($_GET[t]=="suc"){systs("恭喜您，操作成功！","orderview.php?orderbh=".$orderbh);}?>
 <div class="rights">
 &nbsp;<strong>提示：</strong><br>
 &nbsp;<span class="red">只有当买卖双方在退款这一环节无法达成共识时，管理员才可介入订单调整，且只能调整一次，请根据实际情况慎重操作</span>
 </div>
 <ul class="rightcap">
 <li class="l1">订单信息</li>
 </ul>
 <ul class="uk">
 <li class="l1">订单状态：</li>
 <li class="l21"><strong><?=returnorderzt($row[ddzt])?></strong></li>
 <li class="l1">订单金额：</li>
 <li class="l21 feng"><strong><?=$row[money1]*$row[num]?>元</strong> (单价<?=$row[money1]?>元 * <?=$row[num]?>件)</li>

 <? if($row[ddzt]=="db" || $row[ddzt]=="suc"){?>
 <li class="l1">发货时间：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[fhsj]?>" /></li>
 <? }?>
 
 <? if($row[ddzt]=="back"){while1("*","yjcode_tk where orderbh='".$orderbh."'");$row1=mysql_fetch_array($res1);?>
 <li class="l1">退款申请时间：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row1[sj]?>" /></li>
 <li class="l1">退款理由：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="<?=$row1[tkly]?>" /></li>
 <? }?>
 
 <? if($row[ddzt]=="backsuc" || $row[ddzt]=="backerr"){?>
 <li class="l1">退款申请时间：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[tksj]?>" /></li>
 <li class="l1">退款理由：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="<?=$row[tkly]?>" /></li>
 <li class="l1">退款处理结果：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="<?=$row[tkjg]?>" /></li>
 <li class="l1">退款处理时间：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[tkoksj]?>" /></li>
 <? }?>
 
 <? if($row[ddzt]=="suc"){?>
 <li class="l1">确认收货时间：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[oksj]?>" /></li>
 <? }?>
 
 <li class="l1">订单编号：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[orderbh]?>" /></li>
 <li class="l1">商品名称：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="<?=$row[tit]?>" /></li>
 <li class="l8"></li>
 <li class="l9"><img src="<?=returntppd($tp,"../img/none60x60.gif")?>" width="54" height="54" /></li>
 <li class="l1">交易时间：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[sj]?>" /></li>
 <li class="l1">交易IP：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="20" value="<?=$row[uip]?>" /></li>
 </ul>
 <ul class="rightcap">
 <li class="l1">买卖双方</li>
 </ul>
 <ul class="uk">
 <? while1("*","yjcode_user where id=".$row[userid]);$row1=mysql_fetch_array($res1);?>
 <li class="l1">买家信息：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="帐号:<?=$row1[uid]?> 昵称:<?=$row1[nc]?> 手机:<?=$row1[mot]?> QQ:<?=$row1[uqq]?>" /></li>
 <? while1("*","yjcode_user where id=".$row[selluserid]);$row1=mysql_fetch_array($res1);?>
 <li class="l1">卖家信息：</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" size="100" value="帐号:<?=$row1[uid]?> 昵称:<?=$row1[nc]?> 手机:<?=$row1[mot]?> QQ:<?=$row1[uqq]?>" /></li>
 </ul>
 
 <? if($row[ddzt]=="back" || $row[ddzt]=="backerr"){?>
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" name="jvs" value="order" />
 <ul class="rightcap red">
 <li class="l1">管理员操作</li>
 </ul>
 <ul class="uk">
 <li class="l1">退款处理：</li>
 <li class="l2">
 <span class="finp">
 <input name="R1" type="radio" value="yes" /><strong>同意退款</strong> 
 <input name="R1" type="radio" value="no" /><strong>不同意退款 (不同意退款的话订单会变更为交易成功)</strong> 
 </span>
 </li>
 <li class="l1">友情提示：</li>
 <li class="l21">只有当买卖双方在退款这一环节无法达成共识时，管理员才可介入订单调整，且<strong class="red">只能调整一次，请根据实际情况慎重操作</strong>。</li>
 <li class="l3"><? tjbtnr("下一步","orderlist.php")?></li>
 </ul>
 </form>
 <? }?>
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>