<?
include("../config/conn.php");
include("../config/function.php");
if(empty($_SESSION["SHOPUSER"])){echo "ok";exit;}
while1("uid,email,ifemail","yjcode_user where uid='".$_SESSION[SHOPUSER]."' and ifemail=1");if(!$row1=mysql_fetch_array($res1)){echo "ok";exit;}

require("../config/mailphp/sendmail.php");
$yz=MakePass(5);
$str="�������󶨣���֤�룺<font color='red' style='font-size:18px;'>".$yz."</font>,�����ڽ����������󶨲�����������Ǳ��˲���������Դ���Ϣ����".webname."��<hr>���ʼ�Ϊϵͳ����������ظ���˳����-���������ʵ�Դ�뽻�ס��������ס����Դ���վ������ƽ̨-www.hzskdz.com";
yjsendmail("�������󶨡�".webname."��",$row1["email"],$str);

updatetable("yjcode_user","bdemail='".$yz."' where uid='".$_SESSION[SHOPUSER]."'");echo "ok";exit;

?>