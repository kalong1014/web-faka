<?
include("../config/conn.php");
include("../config/function.php");
if(empty($_SESSION["SHOPUSER"])){echo "ok";exit;}

while1("uid,mot","yjcode_user where uid='".$_SESSION[SHOPUSER]."'");$row1=mysql_fetch_array($res1);if(empty($row1[mot])){echo "ok";exit;}

include("../config/mobphp/mysendsms.php");
$yz=MakePass(5);
$str="��֤�룺".$yz.",�����ڽ����ֻ�����󶨣�������Ǳ��˲���������Դ���Ϣ��˳����-���������ʵ�Դ�뽻�ס��������ס����Դ���վ������ƽ̨-www.hzskdz.com��";
yjsendsms($row1[mot],$str);

updatetable("yjcode_control","smskc=smskc-1");
updatetable("yjcode_user","bdmot='".$yz."' where uid='".$_SESSION[SHOPUSER]."'");echo "ok";exit;
?>