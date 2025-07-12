<?
include("../config/conn.php");
include("../config/function.php");
if(empty($_SESSION["SHOPUSER"])){echo "ok";exit;}
$mob=$_GET[mob];
if(empty($mob)){echo "True";exit;}
if(panduan("uid,mot,ifmot","yjcode_user where mot='".$_GET[mob]."' and ifmot=1")==1){echo "True";exit;}

include("../config/mobphp/mysendsms.php");
$yz=MakePass(5);
$str="验证码：".$yz.",您正在进行手机绑定，如果不是本人操作，请忽略此信息，顺控网-国内最优质的源码交易、域名交易、免费源码等站长服务平台-www.hzskdz.com。";
yjsendsms($mob,$str);
updatetable("yjcode_control","smskc=smskc-1");
updatetable("yjcode_user","bdmot='".$yz."',mot='".$_GET[mob]."' where uid='".$_SESSION[SHOPUSER]."'");echo "ok";exit;

?>