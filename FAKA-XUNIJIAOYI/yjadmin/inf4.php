<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();

if(sqlzhuru($_POST[jvs])=="control"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){Audit_alert("权限不够","default.php");}
 zwzr();
 updatetable("yjcode_control","
			  dbsj=".sqlzhuru($_POST[tdbsj]).",
			  ycsj=".sqlzhuru($_POST[tycsj]).",
			  tksj=".sqlzhuru($_POST[ttksj]).",
			  regmoney=".sqlzhuru($_POST[tregmoney]).",
			  regjf=".sqlzhuru($_POST[tregjf]).",
			  pjjf=".sqlzhuru($_POST[tpjjf]).",
			  qdjf=".sqlzhuru($_POST[tqdjf]).",
			  jfmoney=".sqlzhuru($_POST[tjfmoney]).",
			  tjmoney=".sqlzhuru($_POST[ttjmoney]).",
			  sellbl=".sqlzhuru($_POST[tsellbl]).",
			  tknum=".sqlzhuru($_POST[ttknum]).",
			  txdi=".sqlzhuru($_POST[ttxdi]).",
			  txfl=".sqlzhuru($_POST[ttxfl])."
			  ");
 php_toheader("inf4.php?t=suc");
}

while0("*","yjcode_control");$row=mysql_fetch_array($res);
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
tjwait();
f1.action="inf4.php";
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu1").className="l11";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0302,")){echo "<div class='noneqx'>无权限</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_quanju.html");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">当前位置：<a href="default.php">后台首页</a> - <strong>盈利数据设置</strong></li><li class="l2"></li>
 </ul>
 
 <? include("rightcap1.php");?>
 <script language="javascript">$("rtit5").className="l1";</script>
 
 <? if($_GET[t]=="suc"){systs("恭喜您，操作成功！","inf4.php");}?>
 
 <!--Begin-->
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" name="jvs" value="control" />
 <ul class="uk">
 <li class="l1">担保时间：</li>
 <li class="l2">
 <input name="tdbsj" value="<?=$row[dbsj]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">比如设为3，表示发货后，3天内买家未确认收货，系统将自动确认收货</span>
 </li>
 <li class="l1">延迟收货时间：</li>
 <li class="l2">
 <input name="tycsj" value="<?=$row[ycsj]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">比如设为7，表示能延迟7天确认收货</span>
 </li>
 <li class="l1">退款时间：</li>
 <li class="l2">
 <input name="ttksj" value="<?=$row[tksj]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /> 
 <span class="hui">比如设为5，表示卖家发货后，买家在5天内可以申请退款</span>
 </li>
 <li class="l1">注册赠送金钱：</li>
 <li class="l2">
 <input name="tregmoney" value="<?=$row[regmoney]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">默认为0，数值表示会员注册时赠送的金额，不要太高哦</span>
 </li>
 <li class="l1">注册赠送积分：</li>
 <li class="l2">
 <input name="tregjf" value="<?=$row[regjf]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">默认为0，数值表示会员注册时赠送的积分，不要太高哦</span>
 </li>
 <li class="l1">积分兑换比例：</li>
 <li class="l2">
 <input name="tjfmoney" value="<?=$row[jfmoney]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">100表示100积分兑换1人民币，10表示10积分兑换1人民币，依次类推</span>
 </li>
 <li class="l1">评价积分：</li>
 <li class="l2">
 <input name="tpjjf" value="<?=$row[pjjf]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">交易成功后，买家发表点评获得的积分数</span>
 </li>
 <li class="l1">签到积分：</li>
 <li class="l2">
 <input name="tqdjf" value="<?=$row[qdjf]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">每日签到，用户可获得的积分</span>
 </li>
 <li class="l1">推荐佣金比例：</li>
 <li class="l2">
 <input name="ttjmoney" value="<?=$row[tjmoney]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">交易成功后，推荐的用户可获得的交易佣金比例 <span class="red">0.01表示百分之一，0.02表示百分之二</span>，依次类推</span>
 </li>
 <li class="l1">卖家收入比例：</li>
 <li class="l2">
 <input name="tsellbl" value="<?=$row[sellbl]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">交易成功后，卖家可获得的金额比例 <span class="red">1表示全归卖家，0.9表示90%归卖家，0.5表示50%归卖家</span>，依次类推</span>
 </li>
 <li class="l1">最低提现值：</li>
 <li class="l2">
 <input name="ttxdi" value="<?=returnjgdw($row[txdi],"",0)?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">必须为整数，不能带小数点</span>
 </li>
 <li class="l1">提现手续费：</li>
 <li class="l2">
 <input name="ttxfl" value="<?=returnjgdw($row[txfl],"",0)?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">如0.01，表示百分之一，即100元收取1元手续费</span>
 </li>
 <li class="l1">退款最大限制：</li>
 <li class="l2">
 <input name="ttknum" value="<?=$row[tknum]?>" size="10" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">比如设为3，表示最多允许进行3次退款，如果同笔订单退款超过3次，就会被锁定，无法再进行退款</span>
 </li>
 <li class="l3"><? tjbtnr("保存修改");?></li>
 </ul>
 </form>

 <!--End-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>