<?php
include("../../config/conn.php");
include("../../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("../reg/");}
$sj=date("Y-m-d H:i:s");
include("../buycheck.php");

if(sqlzhuru($_POST[jvs])=="carpay"){
if($needmoney<=$usermoney){Audit_alert("���Ŀ��������㣬�������ֱ��֧����","../carpay.php?carid=".$carid);}
zwzr();
updatetable("yjcode_user","uqq='".sqlzhuru($_POST[tuqq])."' where uid='".$_SESSION[SHOPUSER]."'");
$bh=time();
$uip=$_SERVER["REMOTE_ADDR"];
$ddbh=time()."|".$rowuser[id];	
$money1=($needmoney*10-$usermoney*10)/10;
intotable("yjcode_dingdang","bh,ddbh,userid,sj,uip,money1,ddzt,alipayzt,bz,ifok,probh,pronum","'".$bh."','".$ddbh."',".$rowuser[id].",'".$sj."','".$uip."',".$money1.",'�ȴ���Ҹ���','','�Ƹ�ͨ',0,'".$bharr."','".$numarr."'");
require_once ("classes/RequestHandler.class.php");
require_once ("buy_tenpay_config.php");
$curDateTime = date("YmdHis");
$strDate = date("Ymd");
$strTime = date("His");
$randNum = rand(1000, 9999);
$strReq = $strTime . $randNum;
$mch_vno = $dingbh;
}

if(sqlzhuru($_POST[R1])=="tenpay"){$nbtv="0";}else{$nbtv=sqlzhuru($_POST[R1]);}
?>
 
<HTML>
<HEAD>
<TITLE>�Ƹ�ͨ����ͨ��</TITLE>
</HEAD>
<BODY onLoad="document.directFrm.submit();">


<form action='buy_tenpay.php' method='post' name='directFrm'>
<input type="hidden" value="1" name="trade_mode" > <!--��ʱ���ʣ����׷�ʽ-->
<input type="hidden" name="order_no" value="<?=$ddbh?>" > <!--�������-->
<input name="product_name" type="hidden" value="<?=webname?>����̨����" > <!--������Ŀ-->
<input name="remarkexplain" type="hidden" value="��" > <!--��ע-->
<input type="hidden" name="order_price" value="<?=$money1?>"> <!--������-->
<input type="hidden" name="bank_type_value" value="<?=$nbtv?>"  id="bank_type_value">
</form>


</body>
</html>
