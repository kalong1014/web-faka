<?
set_time_limit(0);
error_reporting(NULL);
ini_set('display_errors','Off');
require("../config/conn.php");
require("../config/function.php");
$sj=date("Y-m-d H:i:s");
if(panduan("*","yjcode_admin where adminuid='".$_SESSION["SHOPADMIN"]."' and adminpwd='".sha1($_GET[pwd])."'")==0){echo "err1";exit;}
$url=htmlget("http://www.yjcode.com/vip/update.php?ty1=shop&ty2=t5&buy=yjcode.com&md5v=".read_file_content("../config/userkey.dll"));
$fp_output = fopen("gx.zip", 'wb');
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_FILE, $fp_output);
curl_exec($ch);
curl_close($ch);
echo "ok";
?>