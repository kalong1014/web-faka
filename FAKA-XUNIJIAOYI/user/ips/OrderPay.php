<?php
header("Content-type:text/html; charset=gb2312");

include("../../config/conn.php");
include("../../config/function.php");

//商户交易日期
$BillDate = date('Ymd');

//商户返回地址
$url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') ? 'https://' : 'http://';
$url .= str_ireplace('localhost', '127.0.0.1', $_SERVER['HTTP_HOST']) . $_SERVER['SCRIPT_NAME'];
$url = str_ireplace('orderpay', 'OrderReturn', $url);

$userid=returnuserid($_SESSION["SHOPUSER"]);
$sj=date("Y-m-d H:i:s");
$BillNo = date('YmdHis') . mt_rand(100000,999999)."|".$userid;
$bh=time();
$uip=$_SERVER["REMOTE_ADDR"];
$money1=sqlzhuru($_POST[t1]);
intotable("yjcode_dingdang","bh,ddbh,userid,sj,uip,money1,ddzt,alipayzt,bz,ifok","'".$bh."','".$BillNo."',".$userid.",'".$sj."','".$uip."',".$money1.",'等待买家付款','','环讯支付',0");

?>
<html>
  <head>
    <meta http-equiv="content-Type" content="text/html; charset=gb2312">
    <title>环讯支付接口跳转中……</title>
  </head>
  <body onLoad="javascript:document.frm1.submit()">
    <form action="redirect.php" METHOD="POST" name="frm1">	
    <input type="hidden" value="0" name="test" />
    <input type="hidden" value="<?=$rowcontrol[ipsshh]?>" name="Mer_code" />
    <input type="hidden" value="<?=$rowcontrol[ipszs]?>" name="Mer_key" />
    <input type="hidden" value="<?=$BillNo?>" name="Billno" />
    <input type="hidden" value="<?=$money1?>" name="Amount" />
    <input type="hidden" value="<?=$money1?>" name="DispAmount" />
    <input type="hidden" value="<?=$BillDate?>" name="Date" />
    <input type="hidden" value="RMB" name="Currency_Type" />
    <input type="hidden" value="01" name="Gateway_Type" />
    <input type="hidden" value="GB" name="Lang" />
    <input type="hidden" value="<?=$url?>" name="Merchanturl" />
    <input type="hidden" value="5" name="OrderEncodeType" />
    <input type="hidden" value="17" name="RetEncodeType" />
    <input type="hidden" value="1" name="Rettype" />
    <input type="hidden" value="<?=$url?>" name="ServerUrl" />
    </form> 
  </body> 
</html>