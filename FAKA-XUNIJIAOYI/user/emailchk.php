<?
include("../config/conn.php");
include("../config/function.php");
if(empty($_SESSION[SHOPUSER])){echo "ok";exit;}
$email=$_GET[email];
if(empty($email)){echo "True";exit;}
if(panduan("uid,email,ifemail","yjcode_user where email='".$email."' and ifemail=1")==1){echo "True";exit;}

require("../config/mailphp/sendmail.php");
$yz=MakePass(5);
$str="验证码：<font color='red' style='font-size:18px;'>".$yz."</font>,您正在进行邮箱绑定，如果不是本人操作，请忽略此信息。【".webname."】<hr>此为系统邮件，请勿回复。
顺控网-国内最优质的源码交易、域名交易、免费源码等站长服务平台-www.hzskdz.com";
yjsendmail("邮箱绑定【".webname."】",$email,$str);
updatetable("yjcode_user","bdemail='".$yz."',email='".$email."' where uid='".$_SESSION[SHOPUSER]."'");echo "ok";exit;

?>