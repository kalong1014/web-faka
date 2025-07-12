<?
include("../config/conn.php");
include("../config/function.php");
if(empty($_SESSION["SHOPUSER"])){echo "ok";exit;}

while1("uid,mot","yjcode_user where uid='".$_SESSION[SHOPUSER]."'");$row1=mysql_fetch_array($res1);if(empty($row1[mot])){echo "ok";exit;}

include("../config/mobphp/mysendsms.php");
$yz=MakePass(5);
$str="验证码：".$yz.",您正在进行手机解除绑定，如果不是本人操作，请忽略此信息，顺控网-国内最优质的源码交易、域名交易、免费源码等站长服务平台-www.hzskdz.com。";
yjsendsms($row1[mot],$str);

updatetable("yjcode_control","smskc=smskc-1");
updatetable("yjcode_user","bdmot='".$yz."' where uid='".$_SESSION[SHOPUSER]."'");echo "ok";exit;
?>