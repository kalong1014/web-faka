<?
include("../config/conn.php");
include("../config/function.php");
$mob=$_GET[mob];
if(empty($mob) || empty($_GET[uid])){echo "True";exit;}
if(panduan("uid,mot","yjcode_user where mot='".$mob."' and uid='".$_GET[uid]."'")==0){echo "True";exit;}

include("../config/mobphp/mysendsms.php");
$yz=MakePass(4);
$str="��֤�룺".$yz.",�������һ����룬������Ǳ��˲���������Դ���Ϣ��";
yjsendsms($mob,$str);
updatetable("yjcode_user","getpwd='".$yz."' where uid='".$_GET[uid]."'");echo "ok";exit;

?>