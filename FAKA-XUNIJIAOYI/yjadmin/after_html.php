<?
set_time_limit(0);
require("../config/conn.php");
require("../config/function.php");
AdminSes_audit();

$admin=$_GET[admin];
if(empty($admin)){$admin="0";}

switch($admin)
{
 case "0": //���滺������
 html1();
 break;
}
 echo "ok";
?>