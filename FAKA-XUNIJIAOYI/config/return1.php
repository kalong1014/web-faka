<?php
/*
2014�����Ѽ��Ŷ�ȫ��Դ�벻�������ܴ���ȫ����Դ�������û����ο�����
ͬʱ���ǽ�����������������û��ṩ����֧�֡�
�����Դ�빺�����ת����Ϊ�����Ǽ�ɾ�������֤�ʺţ�ͬʱҲ�����ṩ�κ�֧�֡�
www.yj99.cn
�Ѽ�Դ��
*/

function sqlzhuru($string){
if(!get_magic_quotes_gpc()){$string = addslashes($string);}else{$string=stripslashes($string);}
$string=str_replace("<?","",$string);
$string=str_replace("?>","",$string);

return $string;
}

function returndw($m,$d,$t=""){
 if(empty($m)){return $t;}else{return $m.$d;}
}

function returnhz($t){
$a=preg_split("/\./",$t);
return $a[count($a)-1];
}

function rentser($x,$xv,$y,$yv,$nq="search",$z='',$zv='',$w='',$wv=''){
if(empty($nq)){$nq="search";}
$nstr=$_GET[str];
if(!check_in("_".$x.$xv."v",$nstr)){
if(check_in("_".$x,$nstr)){
 $a=preg_split("/_".$x."/",$nstr);
 $re3=preg_split("/_/",$a[1]);
 $b=preg_split("/v/",$re3[0]);
 $ssr="";for($ri=0;$ri<count($b);$ri++){$ssr=$ssr.$b[$ri];if($ri<(count($b)-2)){$ssr=$ssr."v";}}
 $d=preg_split("/_".$x.$ssr."v/",$nstr);
 $nstr=$a[0]."_".$x.$xv."v".$d[1];
}else{
 $nstr=$nstr."_".$x.$xv."v";
}
}
if($y!=""){
if(!check_in("_".$y.$yv."v",$nstr)){
if(check_in("_".$y,$nstr)){
 $a=preg_split("/_".$y."/",$nstr);
 $re3=preg_split("/_/",$a[1]);
 $b=preg_split("/v/",$re3[0]);
 $ssr="";for($ri=0;$ri<count($b);$ri++){$ssr=$ssr.$b[$ri];if($ri<(count($b)-2)){$ssr=$ssr."v";}}
 $d=preg_split("/_".$y.$ssr."v/",$nstr);
 $nstr=$a[0]."_".$y.$yv."v".$d[1];
}else{
 $nstr=$nstr."_".$y.$yv."v";
}
}
}
if($z!=""){
if(!check_in("_".$z.$zv."v",$nstr)){
if(check_in("_".$z,$nstr)){
 $a=preg_split("/_".$z."/",$nstr);
 $re3=preg_split("/_/",$a[1]);
 $b=preg_split("/v/",$re3[0]);
 $ssr="";for($ri=0;$ri<count($b);$ri++){$ssr=$ssr.$b[$ri];if($ri<(count($b)-2)){$ssr=$ssr."v";}}
 $d=preg_split("/_".$z.$ssr."v/",$nstr);
 $nstr=$a[0]."_".$z.$zv."v".$d[1];
}else{
 $nstr=$nstr."_".$z.$zv."v";
}
}
}
if($w!=""){
if(!check_in("_".$w.$wv."v",$nstr)){
if(check_in("_".$w,$nstr)){
 $a=preg_split("/_".$w."/",$nstr);
 $re3=preg_split("/_/",$a[1]);
 $b=preg_split("/v/",$re3[0]);
 $ssr="";for($ri=0;$ri<count($b);$ri++){$ssr=$ssr.$b[$ri];if($ri<(count($b)-2)){$ssr=$ssr."v";}}
 $d=preg_split("/_".$w.$ssr."v/",$nstr);
 $nstr=$a[0]."_".$w.$wv."v".$d[1];
}else{
 $nstr=$nstr."_".$w.$wv."v";
}
}
}
if($xv==""){$nstr=str_replace("_".$x."v","",$nstr);}
if($yv==""){$nstr=str_replace("_".$y."v","",$nstr);}
if($zv==""){$nstr=str_replace("_".$z."v","",$nstr);}
if($wv==""){$nstr=str_replace("_".$w."v","",$nstr);}
return ($nq.$nstr).".html";}
function inp_tp_upload($ni,$mcnur,$mcname,$gs=""){
 $i=$ni;
 if(!empty($_FILES["inp$i"]["tmp_name"])){
 $filetype = strtolower($_FILES["inp$i"]['type']); 
 $tp = array("image/gif","image/pjpeg","image/jpeg","image/jpg","image/x-png","application/x-shockwave-flash","application/octet-stream","application/vnd.ms-excel"); 
 if(!in_array($_FILES["inp$i"]["type"],$tp)){ 
 echo "<script>alert('��ʽ����');history.go(-1);</script>";exit;
 }
 $gs=strtolower($gs);
 if($filetype == 'image/jpeg'){$type = '.jpg';}
 if($filetype == 'image/jpg'){$type = '.jpg';}
 if($filetype == 'image/pjpeg'){$type = '.jpg';}
 if($filetype == 'image/gif'){$type = '.gif';}
 if($filetype == 'image/x-png'){$type = '.png';}
 if($filetype == 'application/x-shockwave-flash'){$type = '.swf';}
 if($filetype == 'application/octet-stream'){$type = '.flv';}
 if($filetype == 'application/vnd.ms-excel'){$type = '.xls';}
 $tna=$_FILES["inp$i"]["name"]; 
 if($gs==""){$gsv=$type;}else{$gsv=".".$gs;}
 move_uploaded_file($_FILES["inp$i"]['tmp_name'],$mcnur.$mcname.$gsv);
 $lastB=$mcname.$gsv;}else{$lastB="";}return $lastB;
}
 function DateDiff($date1, $date2, $unit = "") {switch($unit){case 's':$dividend = 1;break;case 'i':$dividend = 60;break;case 'h':$dividend = 3600;break;case 'd':$dividend = 86400;break;default:$dividend = 86400;}$time1 = strtotime($date1);$time2 = strtotime($date2);if ($time1 && $time2) return (float)($time1 - $time2) / $dividend;return false;}function read_file_content($FileName) {$fp=fopen($FileName,"r"); $data=""; while(!feof($fp)) {$data.=fread($fp,4096); } fclose($fp); return $data; }function returnsx($x){$nstr=$_GET[str];if(check_in("_".$x,$nstr)){$re1=preg_split("/_".$x."/",$nstr);$re3=preg_split("/_/",$re1[1]);$re2=preg_split("/v/",$re3[0]);$ssr="";for($ri=0;$ri<count($re2);$ri++){$ssr=$ssr.$re2[$ri];if($ri<(count($re2)-2)){$ssr=$ssr."v";}}if($ssr==""){$nr=-1;}else{$nr=$ssr;}return $nr;}else{return -1; }}function check_in($arr, $text){$keys = explode(',',$arr);$result = 0;if($keys){foreach($keys as $key){if(strstr($text,$key)!=''){$result = 1;break;}}}return $result;}function returnjgdw($m,$d,$t="����"){if(empty($m)){return $t;}else{return $m.$d;}}function returntppd($tp1,$tp2){if(is_file($tp1)){return $tp1;}else{return $tp2;}}function safeEncoding($string){global $rowcontrol;if(empty($rowcontrol[sermode])){return base64_decode(urldecode($string));}else{return $string;}}
 function while0( $wzd, $wses )
{
	global $res;
	$sql = "select ".$wzd." from ".$wses;
	mysql_query( "SET NAMES 'GBK'" );
	$res = mysql_query( $sql );
}

function while1( $wzd, $wses )
{
	global $res1;
	$sql1 = "select ".$wzd." from ".$wses;
	mysql_query( "SET NAMES 'GBK'" );
	$res1 = mysql_query( $sql1 );
}

function while2( $wzd, $wses )
{
	global $res2;
	$SQL2 = "select ".$wzd." from ".$wses;
	mysql_query( "SET NAMES 'GBK'" );
	$res2 = mysql_query( $SQL2 );
}

function while3( $wzd, $wses )
{
	global $res3;
	$sql3 = "select ".$wzd." from ".$wses;
	mysql_query( "SET NAMES 'GBK'" );
	$res3 = mysql_query( $sql3 );
} 
 
function returntitcss($t,$b,$c){$tit=$t;if(1==$b){$tit="<strong>".$tit."</strong>";}if(!empty($c)){$tit="<font color='".$c."'>".$tit."</font>";}return $tit;}function returntitdian($t,$l){$len=strlen($t);if($len>$l){return strgb2312($t,0,$l-3)."...";}else{return $t;}}function returnztv($zv,$zvsm=""){if(0==$zv){$ztv="<span class='blue'>��ͨ�����</span>";}elseif(1==$zv){$ztv="<span class='feng'>�������</span>";}elseif(2==$zv){$ztv="<span class='red'>��˲�ͨ��,".$zvsm."</span>";}return $ztv;}function htmlget($url){$ch = curl_init();curl_setopt($ch, CURLOPT_URL, $url);curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);curl_setopt($ch, CURLOPT_REFERER, CHR);curl_setopt($ch, CURLOPT_HEADER,0);$output = curl_exec($ch);curl_close($ch);return $output;}function systs($a,$b){if($_GET[t]=="suc"){echo "<div class=\"systs\">".$a."[<a href=\"".$b."\">֪����</a>]</div>";}}
function rnd_num($num){$seedarray =microtime();$seedstr =preg_split("/\s/",$seedarray,5);$seed =$seedstr[0]*10000;srand($seed);return rand(1,$num);}
function strgb2312($str, $start, $len) {$tmpstr = "";$strlen = $start + $len;for($i = 0; $i < $strlen; $i++) {if(ord(substr($str, $i, 1)) > 0xa0) {$tmpstr .= substr($str, $i, 2);$i++;} else$tmpstr .= substr($str, $i, 1);}return $tmpstr;}function dateYMDN($m){$a=preg_split("/\s/",$m);$b=str_replace("-","",$a[0]);$b=str_replace("/","",$b);return $b;}
function returnonecon($x){
 if(1==$x){return "��Աע��Э��";}
 elseif(2==$x){return "��������";}
 elseif(3==$x){return "������";}
 elseif(4==$x){return "��ϵ����";}
 elseif(5==$x){return "��˽����";}
 elseif(6==$x){return "��������";}
 elseif(7==$x){return "����Э��";}
 elseif(8==$x){return "��Ʒ��������";}
}function dateYMD($m){$a=preg_split("/\s/",$m);return $a[0];}function dateMD($m){$a=dateYMD($m);$b=preg_split("/-/",$a);$mv=$b[1];$dv=$b[2];return $mv."/".$dv;}function dateYMDHM($m){$a=preg_split("/:/",$m);return $a[0].":".$a[1];}function is_date($date){if($date == date('Y-m-d H:i:s',strtotime($date))){return true;}else{return false;}}function MakePass($length){$possible = "0123456789";$str="";while(strlen($str)<$length){$str.= substr($possible,(rand() % strlen($possible)),1);}return($str);}function MakePassAll($length){$possible = "abcdefghkmnprstuvwxyzABCDEFGHKMNPRSTUVWXYZ23456789";$str="";while(strlen($str)<$length){$str.= substr($possible,(rand() % strlen($possible)),1);}return($str);}function returnjgdian($a){$b=preg_split("/\./",$a);if(count($b)>1){return $a;}elseif(0==$a){return 0;}else{return $a.".00";}}function returnyhmoney($m,$m2,$m3,$s1,$s2,$s3,$d){if(2==$m){if($s1>=$s2 && $s1<=$s3){$mv=$m3;}else{$mv=$m2;}if($s1>$s3){updatetable("yjcode_pro","yhxs=1 where id=".$d);}}else{$mv=$m2;}return $mv;}

function returnshopztv($x){
 if(0==$x){return "<span class='hui'>δ�ύ����</span>";}
 elseif(1==$x){return "<span class='feng'>�������</span>";}
 elseif(2==$x){return "<span class='blue'>��������</span>";}
 elseif(3==$x){return "<span class='red'>��˱���</span>";}
}
function returntxzt($x,$y){
 if(1==$x){return "<span class='blue'>���ֳɹ�</span>";}
 elseif(2==$x){return "<span class='hui'>�û��Ѿ���������</span>";}
 elseif(3==$x){return "<span class='red'>����ʧ��,".$y."</span>";}
 elseif(4==$x){return "<span class='green'>�ȴ�����</span>";}
}
function returnadminqx(){
$qx=array("0101,��Ʒ�༭|0102,��Ʒ�鿴|0103,��Ʒɾ��",
		  "0201,��Ѷ�༭|0202,��Ѷ�鿴|0203,��Ѷɾ��",
		  "0301,ȫ�ֱ༭|0302,ȫ�ֲ鿴|0303,ȫ��ɾ��",
		  "0401,�����༭|0402,�����鿴|0403,����ɾ��",
		  "0601,���༭|0602,���鿴|0603,���ɾ��",
		  "0701,��Ա�༭|0702,��Ա�鿴|0703,��Աɾ��"
		  );	
return $qx;
}

function returnorderzt($zv){
if($zv=="suc"){ //���׳ɹ�
$ztv="<span class='green'>���׳ɹ�</span>";
}elseif($zv=="wait"){ //�ȴ�����
$ztv="<span class='red'>�ȴ�����</span>";
}elseif($zv=="db"){ //�ȴ�����ջ�
$ztv="<span class='blue'>�ѷ���,�ȴ��ջ�</span>";
}elseif($zv=="back"){ //��Ҫ������˿�
$ztv="<span class='feng'>�˿����</span>";
}elseif($zv=="backsuc"){ //�˿�ɹ�
$ztv="<span class='hui'>�˿�ɹ�</span>";
}elseif($zv=="backerr"){ //�˿�����ܾ�
$ztv="<span class='red'>��ͬ���˿�</span>";
}elseif($zv=="wpay"){ //�ȴ���Ҹ���
$ztv="<span class='hui'>�ȴ���Ҹ���</span>";
}elseif($zv=="close"){ //������ȡ��
$ztv="<span class='hui'>����ȡ��</span>";
}
return $ztv;
}

function returngdzt($zv){
if($zv==1){$ztv="<span class='feng'>�ȴ�����</span>";}
elseif($zv==2){$ztv="<span class='blue'>������</span>";}
elseif($zv==3){$ztv="<span class='red'>�ȴ�����</span>";}
elseif($zv==4){$ztv="<span class='green'>�ѽᵥ</span>";}
return $ztv;
}

?>