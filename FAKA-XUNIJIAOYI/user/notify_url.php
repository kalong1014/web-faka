<?php
require("../config/conn.php");
require_once("alipay.config.php");

//开始自定义函数
function updatetable($utable,$ures,$uwhere=""){$sqlupdate="update ".$utable." set ".$ures." ".$uwhere;mysql_query("SET NAMES 'GBK'");mysql_query($sqlupdate);}
function intotable($itable,$zdarr,$resarr){$sqlinto="insert into ".$itable."(".$zdarr.")values(".$resarr.")";mysql_query("SET NAMES 'GBK'");mysql_query($sqlinto);}
function PointUpdateM($c_uid,$c_money){updatetable("yjcode_user","money1=money1+(".$c_money.") where id=".$c_uid);}
function PointIntoM($c_uid,$c_tit,$c_money){intotable("yjcode_moneyrecord","bh,userid,tit,moneynum,sj,uip","'".time()."',".$c_uid.",'".$c_tit."',".$c_money.",'".date('Y-m-d H:i:s')."','".$_SERVER['REMOTE_ADDR']."'");}
//结束自定义函数

if(empty($rowcontrol[zftype])){$webzftype=0;}else{$webzftype=$rowcontrol[zftype];}
if($webzftype==0){$alipay_config['cacert']    = getcwd().'\\cacert.pem';}
elseif($webzftype==1){$alipay_config['cacert']    = getcwd().'\\db_cacert.pem';}

require_once("lib/alipay_notify.class.php");

//计算得出通知验证结果
$alipayNotify = new AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyNotify();

if($verify_result) {//验证成功

	$out_trade_no = $_POST['out_trade_no'];

	//支付宝交易号

	$trade_no = $_POST['trade_no'];

	//交易状态
	$trade_status = $_POST['trade_status'];
    switch($trade_status){
	  case "WAIT_BUYER_PAY";
	  $nddzt="等待买家付款";
	  break;
	  case "TRADE_FINISHED":
	  case "WAIT_SELLER_SEND_GOODS":
	  case "WAIT_BUYER_CONFIRM_GOODS":
	  case "TRADE_SUCCESS";
	  $nddzt="交易成功"; 
	  break;
      }


$sj=date("Y-m-d H:i:s");
$uip=$_SERVER["REMOTE_ADDR"];
$dingdanbh=preg_split("/\|/",$out_trade_no);
$userid=$dingdanbh[1];

$sql="select * from yjcode_dingdang where ddbh='".$out_trade_no."' and userid=".$userid;mysql_query("SET NAMES 'GBK'");$res=mysql_query($sql);
if($row=mysql_fetch_array($res)){
 if(1==$row1[ifok]){echo "success";exit;}
 if($trade_status=="TRADE_SUCCESS" || $trade_status=="TRADE_FINISHED" || $trade_status=="WAIT_SELLER_SEND_GOODS" || $trade_status=="WAIT_BUYER_CONFIRM_GOODS"){
 updatetable("yjcode_dingdang","sj='".$sj."',uip='".$uip."',alipayzt='".$trade_status."',ddzt='".$nddzt."',ifok=1 where id=".$row[id]);
 $money1=$row["money1"];
 PointIntoM($userid,"支付宝充值".$money1."元",$money1);
 PointUpdateM($userid,$money1);
 updatetable("yjcode_dingdang","ifok=1 where id=".$row1[id]);
 echo "success";exit;
 }
}


}
?>