<?
include("../config/conn.php");
include("../config/function.php");
if(empty($_SESSION["SHOPUSER"])){echo "ok";exit;}
$mob=$_GET[mob];
if(empty($mob)){echo "True";exit;}
if(panduan("uid,mot,ifmot","yjcode_user where mot='".$_GET[mob]."' and ifmot=1")==1){echo "True";exit;}

include("../config/mobphp/mysendsms.php");
$yz=MakePass(5);
$str="��֤�룺".$yz.",�����ڽ����ֻ��󶨣�������Ǳ��˲���������Դ���Ϣ��˳����-���������ʵ�Դ�뽻�ס��������ס����Դ���վ������ƽ̨-www.hzskdz.com��";
yjsendsms($mob,$str);
updatetable("yjcode_control","smskc=smskc-1");
updatetable("yjcode_user","bdmot='".$yz."',mot='".$_GET[mob]."' where uid='".$_SESSION[SHOPUSER]."'");echo "ok";exit;

?>