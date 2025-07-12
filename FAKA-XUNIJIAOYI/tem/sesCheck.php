<?
header("Content-Type:text/html;charset=GB2312");
session_start();
if($_SESSION["SHOPUSER"]==""){echo 0;exit;}else{
echo $_SESSION["SHOPUSER"];
 include("../config/conn.php");
 include("../config/function.php");
 while1("*","yjcode_qiandao where userid=".returnuserid($_SESSION[SHOPUSER])." order by sj desc limit 1");
 if($row1=mysql_fetch_array($res1)){
 $sj=date("Y-m-d H:i:s");
 $a_ux = strtotime($sj);
 $a_date = date('Y-m-d',$a_ux);
 $b_date = date('Y-m-d',strtotime($row1[sj]));
 if($a_date==$b_date){$ifq="yes";}else{$ifq="no";}
 }else{$ifq="no";}
echo " ".$ifq;
}
?>