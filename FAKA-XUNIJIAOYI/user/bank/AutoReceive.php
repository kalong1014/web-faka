<?
include("../../config/conn.php");
include("../../config/function.php");
$key=$rowcontrol[bankkey];
$v_oid     =trim($_POST['v_oid']);      
$v_pmode   =trim($_POST['v_pmode']);      
$v_pstatus =trim($_POST['v_pstatus']);      
$v_pstring =trim($_POST['v_pstring']);      
$v_amount  =trim($_POST['v_amount']);     
$v_moneytype  =trim($_POST['v_moneytype']);     
$remark1   =trim($_POST['remark1' ]);     
$remark2   =trim($_POST['remark2' ]);     
$v_md5str  =trim($_POST['v_md5str' ]);     
/**
 * ���¼���md5��ֵ
 */
                           
$md5string=strtoupper(md5($v_oid.$v_pstatus.$v_amount.$v_moneytype.$key)); //ƴ�ռ��ܴ�
if ($v_md5str==$md5string)
{
	
 if($v_pstatus=="20"){
  $sj=date("Y-m-d H:i:s");
  $uip=$_SERVER["REMOTE_ADDR"];
  while1("*","yjcode_dingdang where ddbh='".$v_oid."' and ddzt='�ȴ���Ҹ���'");if($row1=mysql_fetch_array($res1)){
   updatetable("yjcode_dingdang","sj='".$sj."',uip='".$uip."',alipayzt='TRADE_SUCCESS',ddzt='���׳ɹ�',ifok=1,bz='��������֧��' where id=".$row1[id]);
   $money1=$row1["money1"];
   PointIntoM($row1[userid],"�������߳�ֵ".$money1."Ԫ",$money1);
   PointUpdateM($row1[userid],$money1);
  }
 }

echo "ok";
}else{
echo "error";
}
?>