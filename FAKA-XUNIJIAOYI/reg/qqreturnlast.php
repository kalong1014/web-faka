<?
require_once("../config/qq/API/qqConnectAPI.php");
include("../config/conn.php");
include("../config/function.php");
$qc = new QC();
$acs = $qc->qq_callback();
$openid = $qc->get_openid();


//��ʾ�ѵ�¼��ʼ ���а�
if(!empty($_SESSION["SHOPUSER"])){
 if(panduan("uid,openid,ifqq","yjcode_user where openid='".$openid."' and ifqq=1")==1){Audit_alert("��ʧ�ܣ���QQ�Ѿ��󶨹������ʺ�","../user/");}
 updatetable("yjcode_user","openid='',ifqq=0 where openid='".$openid."'");
 updatetable("yjcode_user","openid='".$openid."',ifqq=1 where uid='".$_SESSION[SHOPUSER]."'");	
 php_toheader("../user/");
}
//��ʾ�ѵ�¼���� ���а�

//��ʾδ��¼��ʼ
while0("uid,openid","yjcode_user where openid='".$openid."'");if($row=mysql_fetch_array($res)){ //��ʾ��QQ�Ѿ�����
 $_SESSION["SHOPUSER"]=$row[uid];
 php_toheader("../user/");
 exit;
}

//�޸ĸ��ļ���Ҫͬ���޸���reg/reg.php��reg/qqreturnlast.php 

$qc = new QC($acs,$openid);
$arr = $qc->get_user_info();
$nc=iconv('UTF-8', 'GB2312',$arr["nickname"]);
$bh=time();
$uid="qq".$bh.rnd_num(300);
$pwd=rnd_num(100).time().rnd_num(1000);
$email=$uid."@qq.com";
$sj=date("Y-m-d H:i:s");
$uip=$_SERVER["REMOTE_ADDR"];

$shopzt=0;if($rowcontrol["ifsell"]=="on"){$shopzt=2;}
intotable("yjcode_user","uid,pwd,sj,uip,money1,jf,nc,ifmot,ifemail,yxsj,openid,ifqq,djl,pm,zt,openshop,shopzt,sellmall,sellmyue,sellbl,sfzrz","'".$uid."','".$pwd."','".$sj."','".$uip."',0,0,'".$nc."',0,0,'2014-10-15','".$openid."',1,0,0,1,0,".$shopzt.",0,0,".$rowcontrol[sellbl].",3");$id=mysql_insert_id();
if(!empty($rowcontrol[regmoney]) && $rowcontrol[regmoney]>0){PointIntoM($id,"ע���Ա����",$rowcontrol[regmoney]);PointUpdateM($id,$rowcontrol[regmoney]);}
if(!empty($rowcontrol[regjf]) && $rowcontrol[regjf]>0){PointInto($id,"ע���Ա���ͻ���",$rowcontrol[regjf]);PointUpdate($id,$rowcontrol[regjf]);}
createDir("../upload/".$id."/");
$_SESSION["SHOPUSER"]=$uid;
intotable("yjcode_loginlog","admin,userid,sj,uip","1,".$id.",'".$sj."','".$uip."'");

php_toheader("../user/");

//��ʾδ��¼����
?>