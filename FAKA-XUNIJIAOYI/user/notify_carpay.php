<?php
require("../config/conn.php");
require_once("alipay.config.php");

function while1($wzd,$wses){global $res1;$sql1="select ".$wzd." from ".$wses;mysql_query("SET NAMES 'GBK'");$res1=mysql_query($sql1);}
function while0($wzd,$wses){global $res;$sql="select ".$wzd." from ".$wses;mysql_query("SET NAMES 'GBK'");$res=mysql_query($sql);}
function updatetable($utable,$ures,$uwhere=""){$sqlupdate="update ".$utable." set ".$ures." ".$uwhere;mysql_query("SET NAMES 'GBK'");mysql_query($sqlupdate);}
function intotable($itable,$zdarr,$resarr){$sqlinto="insert into ".$itable."(".$zdarr.")values(".$resarr.")";mysql_query("SET NAMES 'GBK'");mysql_query($sqlinto);}
function PointUpdateM($c_uid,$c_money){updatetable("yjcode_user","money1=money1+(".$c_money.") where id=".$c_uid);}
function PointIntoM($c_uid,$c_tit,$c_money){intotable("yjcode_moneyrecord","bh,userid,tit,moneynum,sj,uip","'".time()."',".$c_uid.",'".$c_tit."',".$c_money.",'".date('Y-m-d H:i:s')."','".$_SERVER['REMOTE_ADDR']."'");}
function deletetable($dsql){$sqldelete="delete from ".$dsql;mysql_query("SET NAMES 'GBK'");mysql_query($sqldelete);}
function rnd_num($num){$seedarray =microtime();$seedstr =preg_split("/\s/",$seedarray,5);$seed =$seedstr[0]*10000;srand($seed);return rand(1,$num);}
function returnyhmoney($m,$m2,$m3,$s1,$s2,$s3,$d){if(2==$m){if($s1>=$s2 && $s1<=$s3){$mv=$m3;}else{$mv=$m2;}if($s1>$s3){updatetable("yjcode_pro","yhxs=1 where id=".$d);}}else{$mv=$m2;}return $mv;}

if(empty($rowcontrol[zftype])){$webzftype=0;}else{$webzftype=$rowcontrol[zftype];}
if($webzftype==0){$alipay_config['cacert']    = getcwd().'\\cacert.pem';}
elseif($webzftype==1){$alipay_config['cacert']    = getcwd().'\\db_cacert.pem';}
elseif($webzftype==2){$alipay_config['cacert']    = getcwd().'\\t_cacert.pem';}

require_once("lib/alipay_notify.class.php");

//����ó�֪ͨ��֤���
$alipayNotify = new AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyNotify();

if($verify_result) {//��֤�ɹ�




	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//������������̻���ҵ���߼������

	
	//�������������ҵ���߼�����д�������´�������ο�������
	
    //��ȡ֧������֪ͨ���ز������ɲο������ĵ��з������첽֪ͨ�����б�
	
	//�̻�������

	$out_trade_no = $_POST['out_trade_no'];

	//֧�������׺�

	$trade_no = $_POST['trade_no'];

	//����״̬
	$trade_status = $_POST['trade_status'];
    switch($trade_status){
	  case "WAIT_BUYER_PAY";
	  $nddzt="�ȴ���Ҹ���";
	  break;
	  case "TRADE_FINISHED":
	  case "WAIT_SELLER_SEND_GOODS":
	  case "WAIT_BUYER_CONFIRM_GOODS":
	  case "TRADE_SUCCESS";
	  $nddzt="���׳ɹ�"; 
	  break;
      }


$sj=date("Y-m-d H:i:s");
$uip=$_SERVER["REMOTE_ADDR"];
$dingdanbh=preg_split("/\|/",$out_trade_no);

while1("*","yjcode_dingdang where ddbh='".$out_trade_no."' and userid=".$dingdanbh[1]);if($row1=mysql_fetch_array($res1)){
 if(1==$row1[ifok]){echo "success";exit;}
 if($trade_status=="TRADE_SUCCESS" || $trade_status=="TRADE_FINISHED" || $trade_status=="WAIT_SELLER_SEND_GOODS" || $trade_status=="WAIT_BUYER_CONFIRM_GOODS"){
  updatetable("yjcode_dingdang","sj='".$sj."',uip='".$uip."',alipayzt='".$trade_status."',ddzt='".$nddzt."',ifok=1 where id=".$row1[id]);
  $money1=$row1["money1"];
  PointIntoM($row1[userid],"֧������ֵ".$money1."Ԫ",$money1);
  PointUpdateM($row1[userid],$money1);
  $buyuserid=$row1[userid];
  $bharr=$row1[probh];
  $numarr=$row1[pronum];
  include("buy.php"); 
  echo "success";exit;
 }
}
  
}
?>