<?php
header("Content-type:text/html; charset=gb2312"); 
include("../../config/conn.php");
include("../../config/function.php");

//----------------------------------------------------
//  ��������
//  Receive the data
//----------------------------------------------------
$billno = $_GET['billno'];
$amount = $_GET['amount'];
$mydate = $_GET['date'];
$succ = $_GET['succ'];
$msg = $_GET['msg'];
$attach = $_GET['attach'];
$ipsbillno = $_GET['ipsbillno'];
$retEncodeType = $_GET['retencodetype'];
$currency_type = $_GET['Currency_type'];
$signature = $_GET['signature'];

//'----------------------------------------------------
//'   Md5ժҪ��֤
//'   verify  md5
//'----------------------------------------------------

//RetEncodeType����Ϊ17��MD5ժҪ����ǩ����ʽ��
//���׷��ؽӿ�MD5ժҪ��֤��������Ϣ���£�
//billno+��������š�+currencytype+�����֡�+amount+��������+date+���������ڡ�+succ+���ɹ���־��+ipsbillno+��IPS������š�+retencodetype +�����׷���ǩ����ʽ��+���̻��ڲ�֤�顿
//��:(billno000001000123currencytypeRMBamount13.45date20031205succYipsbillnoNT2012082781196443retencodetype17GDgLwwdK270Qj1w4xho8lyTpRQZV9Jm5x4NwWOTThUa4fMhEBK9jOXFrKRT6xhlJuU2FEa89ov0ryyjfJuuPkcGzO5CeVx5ZIrkkt1aBlZV36ySvHOMcNv8rncRiy3DQ)

//���ز����Ĵ���Ϊ��
//billno + mercode + amount + date + succ + msg + ipsbillno + Currecny_type + retencodetype + attach + signature + bankbillno
//ע2����RetEncodeType=17ʱ��ժҪ������ȫת��Сд�ַ���������֤��ʱ�������ɵ�Md5ժҪ��ת��Сд�������Ƚ�
$content = 'billno'.$billno.'currencytype'.$currency_type.'amount'.$amount.'date'.$mydate.'succ'.$succ.'ipsbillno'.$ipsbillno.'retencodetype'.$retEncodeType;
//���ڸ��ֶ��з����̻���½merchant.ips.com.cn���ص�֤��
$cert = 'GDgLwwdK270Qj1w4xho8lyTpRQZV9Jm5x4NwWOTThUa4fMhEBK9jOXFrKRT6xhlJuU2FEa89ov0ryyjfJuuPkcGzO5CeVx5ZIrkkt1aBlZV36ySvHOMcNv8rncRiy3DQ';
$signature_1ocal = md5($content . $cert);

if ($signature_1ocal == $signature)
{
	//----------------------------------------------------
	//  �жϽ����Ƿ�ɹ�
	//  See the successful flag of this transaction
	//----------------------------------------------------
	if ($succ == 'Y')
	{
       $sj=date("Y-m-d H:i:s");
       $uip=$_SERVER["REMOTE_ADDR"];
       while1("*","yjcode_dingdang where ddbh='".$billno."' and ddzt='�ȴ���Ҹ���'");if($row1=mysql_fetch_array($res1)){
        updatetable("yjcode_dingdang","sj='".$sj."',uip='".$uip."',alipayzt='TRADE_SUCCESS',ddzt='���׳ɹ�',ifok=1,bz='��Ѷ֧��' where id=".$row1[id]);
        $money1=$row1["money1"];
        PointIntoM($row1[userid],"��Ѷ֧����ֵ".$money1."Ԫ",$money1);
        PointUpdateM($row1[userid],$money1);
       }
		php_toheader("../paylog.php");
	}
	else
	{
		echo '����ʧ�ܣ�';
		exit;
	}
}
else
{
	echo 'ǩ������ȷ��';
	exit;
}
?>
