<?
include("../config/conn.php");
include("../config/function.php");
$mob=$_GET[mob];
if(empty($mob) || empty($_GET[uid])){echo "True";exit;}
if(panduan("uid,mot","yjcode_user where mot='".$mob."' and uid='".$_GET[uid]."'")==0){echo "True";exit;}

include("../config/mobphp/mysendsms.php");
$yz=MakePass(4);
$str="验证码：".$yz.",您正在找回密码，如果不是本人操作，请忽略此信息。";
yjsendsms($mob,$str);
updatetable("yjcode_user","getpwd='".$yz."' where uid='".$_GET[uid]."'");echo "ok";exit;

?>