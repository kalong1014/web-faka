<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("../reg/");}
$sj=date("Y-m-d H:i:s");

//函数B
if($_GET[action]=="del"){
deletetable("yjcode_car where id=".$_GET[id]." and userid=".$rowuser[id]);
php_toheader("car.php");

}

if($_POST['type'] == 'get_j') {
	$sqluser="select * from yjcode_pro where id='".sqlzhuru($_POST['id'])."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
	$rowss=mysql_fetch_array($resuser);
	$data = array();
	if($rowuser['jf'] > ($rowss['money2']*$rowss['jifendijia']*0.01*10)) {
		$data['jifen'] = $rowss['money2']*$rowss['jifendijia']*0.01*10;
	}else{
		$data['jifen'] = $rowuser['jf'];//用户可使用积分，同上面的if
	}
	$data['price'] = $rowss['money2'];//原价
	$data['keshiyong'] = $data['jifen']/10;//可使用积分扣除的金额
	$data['xianjia'] = $data['price'] - ($data['jifen']/10);//可使用积分扣除的金额
	echo json_encode($data);
	exit;
}

if($_POST['type'] == 'get_p') {
	$sqluser="select * from yjcode_pro where id='".sqlzhuru($_POST['id'])."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
	$rowss=mysql_fetch_array($resuser);
	$data['price'] = $rowss['money2'];//原价
	echo json_encode($data);
	exit;
}
//函数E
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />

<title>用户管理面板 - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script type="text/javascript" src="/jquery-1.10.2-min-1385621546604.js"></script>

<script language="javascript">
function xuanall(){
xuan();
carmoney();
}

function carmoney(){
am=0;
carallv=parseInt($("carallnum").innerHTML);
for(i=0;i<carallv;i++){
 c=$("check"+i).checked;
 if(c==true){
  inpmoney=parseFloat($("inpmoney"+i).value)
  inpnum=parseInt($("inpnum"+i).value)
  am=addNum(am,accMul(inpnum,inpmoney));
 }
}
$("moneyall").innerHTML=am;
}

function carjs(){
carid="";
carallv=parseInt($("carallnum").innerHTML);
for(i=0;i<carallv;i++){
 c=$("check"+i).checked;
 if(c==true){
	
  carid=carid+$("check"+i).value+"-"+$("inpnum"+i).value+"-"+$("jifen"+i).value+"c";
 }
}
if(carid==""){alert("未选择任何结算商品");return false;}
location.href="carpay.php?carid="+carid;
}

</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 购物车</li>
</ul>
<? include("left.php");?>
<script>
function jifenok(str,sti){
	if(jQuery("#yjf"+str).html() == 0) {
	jQuery.post('car.php',{"type":'get_j',"id":str},function(data){
			if(data) {
				jQuery("#yjf"+str).html(data.jifen);
				jQuery("#jifen"+sti).val(data.jifen);
				jQuery("#jgt"+str).html('￥<span id="jgs'+str+'">'+data.price+'-'+data.keshiyong+'='+data.xianjia+'</span>');
				jQuery("#inpmoney"+sti).val(data.xianjia);
				carmoney();
			}
		},"json");
		
	}else{
		
		jQuery("#yjf"+str).html(0);
		jQuery("#jifen"+sti).val(0);
		jQuery.post('car.php',{"type":'get_p',"id":str},function(data){ //获取价格
			if(data) {
				jQuery("#jgt"+str).html('￥<span id="jgs'+str+'">'+data.price+'</span>');
				jQuery("#inpmoney"+sti).val(data.price);
				carmoney();
			}
		},"json");
	}

}
</script>
<!--RB-->
<div class="right">
<ul class="carcap">
<li class="l0"><input name="C2" onclick="xuanall()" checked="checked" type="checkbox" value="" /></li>
<li class="l1">商品信息</li>
<li class="l4">购买数量</li>
<li class="l2">单价</li>
<li class="l3">操作</li>
</ul>
<?
$i=0;
while0("*","yjcode_car where userid=".$rowuser[id]." order by sj desc");while($row=mysql_fetch_array($res)){
 while1("*","yjcode_pro where bh='".$row[probh]."' and zt=0 and ifxj=0");if($row1=mysql_fetch_array($res1)){
 $money=returnyhmoney($row1[yhxs],$row1[money2],$row1[money3],$sj,$row1[yhsj1],$row1[yhsj2],$row1[id]);
 $tp="../".returntp("bh='".$row[probh]."' order by iffm desc","-2");
 $au="../product/view".$row1[id].".html";
?>
 <ul class="carlist">
 <li class="cap">
 <a class="s1" href="http://wpa.qq.com/msgrd?v=1&uin=<?=returnqq($row1[userid])?>&site=<?=weburl?>&menu=yes" target="_blank">卖家：<?=returnnc($row1[userid])?></a>
 <span class="s2"><?=$row[sj]?></span>
 </li>
 <li class="l0"><input onclick="carmoney()" checked="checked" name="C1" id="check<?=$i?>" type="checkbox" value="<?=$row[id]?>" /></li>
 <li class="l1"><a href="<?=$au?>" target="_blank"><img border="0" src="<?=returntppd($tp,"img/none60x60.gif")?>" width="50" height="50" /></a></li>
 <li class="l11"><a href="<?=$au?>" target="_blank" class="a2" title="<?=$row1["tit"]?>"><?=returntitdian($row1["tit"],128)?></a></li>
 <?php if($row1['jifendijia'] > 0 && $row1['jifensj_e'] > time()) { ?>
 <li class="l3">
使用积分抵价:<input id="jfio1" name="ios" type="checkbox" onclick="jifenok(<?php echo $row1[id]; ?>,<?php echo $i; ?>)">
<br>本商品可用<span id="zjf1" style="color:#247fbd;"><?php echo $row1['money2']*$row1['jifendijia']*0.01*10; ?></span>积分,已用<span id="yjf<?php echo $row1[id]; ?>" style="color:#fe9101;">0</span>积分。<br><span id="sjf1" name="sjf" style="color:#247fbd;"></span>
<input type="hidden" id="jifen<?php echo $i; ?>" name="jifen" value="0" />
</li>
<?php } ?>
 <li class="l4">
 <input type="hidden" id="inpmoney<?=$i?>" type="text" value="<?=$money?>" />
 <input class="inp1" id="inpnum<?=$i?>" onchange="carmoney()" onkeyup="value=value.replace(/[^\d]/g,'');carmoney();" type="text" value="<?=$row[num]?>" />
 </li>
 <li class="l2"><s>￥<?=returnjgdian($row1["money1"])?></s><br><strong id="jgt<?php echo $row1[id]; ?>">￥<span id="jgs<?php echo $row1[id]; ?>"><?=returnjgdian($money)?></span></strong></li>
 <li class="l3"><a href="car.php?action=del&id=<?=$row[id]?>">删除</a></li>
 </ul>
<?
 $i++;
 }
}
?>
<ul class="carjs">
<li class="l4"><img src="img/js.gif" style="cursor:pointer;" onclick="carjs()" /></li>
<li class="l5">合计：<span class="s1">￥</span><span class="s2" id="moneyall">0</span></li>
</ul>
<span id="carallnum" style="display:none;"><?=$i?></span>
<script src="loadxmldoc.js"></script>
<script language="javascript">
carmoney();
function msgsave(str,id){
	var str = str.value;
	loadXMLDoc("msgsave.php?id="+id+"&str="+str);
	
}
</script>
</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>