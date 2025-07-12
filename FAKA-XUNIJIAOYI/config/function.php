<?
require("return.php");
$checkarr="',union,;,\",<?";
$keys = explode(',',$checkarr);
if(!empty($_GET[id])){if(!is_numeric($_GET[id])){echo "ERR074";exit;}}
if($keys){
 foreach($keys as $key){
  if(strstr($_SERVER["QUERY_STRING"],$key)!=''){echo "你的行为类似网站攻击，已受到防御墙防御！错误代码4004";exit;}
 }
}

function zwzr(){}

function intotable($itable,$zdarr,$resarr){global $conn;$sqlinto="insert into ".$itable."(".$zdarr.")values(".$resarr.")";mysql_query("SET NAMES 'GBK'");mysql_query($sqlinto,$conn);}
function updatetable($utable,$ures){global $conn;$sqlupdate="update ".$utable." set ".$ures;mysql_query("SET NAMES 'GBK'");mysql_query($sqlupdate,$conn);}
function deletetable($dsql){global $conn;$sqldelete="delete from ".$dsql;mysql_query("SET NAMES 'GBK'");mysql_query($sqldelete,$conn);}

function createDir($path){if(!is_dir($path)){mkdir($path,0777);}}
function sesCheck(){if(empty($_SESSION["SHOPUSER"])){php_toheader("../reg/");}}
function AdminSes_audit(){if($_SESSION["SHOPADMIN"]==""){php_toheader("index.php");}global $adminqx;$sqladmin="select * from yjcode_admin where adminuid='".$_SESSION["SHOPADMIN"]."'";mysql_query("SET NAMES 'GBK'");$resadmin=mysql_query($sqladmin);if(!$rowadmin=mysql_fetch_array($resadmin)){$_SESSION["SHOPADMIN"]="";php_toheader("./");}else{$adminqx=$rowadmin[qx];}}
function php_toheader($nurlx){echo "<script>";echo "location.href='".$nurlx."';";echo "</script>";exit;}
function Audit_alert($alertStr,$alertUrl){echo "<script>";echo "alert('".$alertStr."');location.href='".$alertUrl."';";echo "</script>";exit;}define("CHR",weburl);
function tjbtnr($a,$b="",$c=""){if($c==""){$ts="正在处理数据，请稍候 ^_^";}else{$ts=$c;}$bk="";if($b!=""){$bk="<input type=\"button\" class=\"btn1\" onmouseover=\"this.className='btn2';\" onclick=\"gourl('".$b."')\" onmouseout=\"this.className='btn1';\" value=\"返回\" />";}echo "<div id=\"tjbtn\"><input type=\"submit\" class=\"btn1\" onmouseover=\"this.className='btn2';\" onmouseout=\"this.className='btn1';\" value=\"".$a."\" />".$bk."</div><div id=\"tjing\" style=\"display:none;color:#F96F39;\"><img style=\"margin:0 0 6px 0;\" src=\"../img/ajax_loader.gif\" width=\"208\" height=\"13\" /><br>".$ts."</div>";}
function pagef($se,$ps,$ptable,$px,$pzd="*"){global $res;global $count;global $page_count;global $page;global $row;$ses=$se;$pagesize=$ps;$sql="select count(*) as id from ".$ptable." ".$ses;mysql_query("SET NAMES 'GBK'");$res=mysql_query($sql);$row=mysql_fetch_array($res);$count=$row["id"];if($count%$pagesize==0){$allpage=$count/$pagesize;}else{$allpage=($count-$count%$pagesize)/$pagesize+1;}if($count % $pagesize){$page_count=(int)($count / $pagesize)+1;}else{$page_count=$count / $pagesize;}
if($page>$page_count){$page=$page_count;}if($page<1){$page=1;}$sql="select ".$pzd." from ".$ptable." ".$ses." ".$px." limit ".($page-1)*$pagesize.",".$pagesize."";mysql_query("SET NAMES 'GBK'");$res=mysql_query($sql);}
function uploadtpnodata($tpi,$lj,$mc,$tpgs,$bw,$bg,$sw=0,$sh=0,$needsy="yes",$xw=0,$xh=0){
 $cm=new CreatMiniature();
 createDir("../".$lj);
 $i=$tpi;
 if(!empty($_FILES["inp$i"]["tmp_name"])){
  if($tpgs=="jpg"){$tp = array("image/pjpeg","image/jpeg","image/jpg");}
  elseif($tpgs=="gif"){$tp = array("image/gif");}
  elseif($tpgs=="allpic"){$tp = array("image/pjpeg","image/jpeg","image/jpg","image/gif","image/x-png","image/png");}
  if(!in_array($_FILES["inp$i"]["type"],$tp)){echo "<script>alert('格式不对');history.go(-1);</script>";exit;}
  $filetype = $_FILES["inp$i"]['type'];
  if($filetype == 'image/jpeg' || $filetype == 'image/jpg' || $filetype == 'image/pjpeg'){$type = '.jpg';}
  if($filetype == 'image/gif'){$type = '.gif';}$tna=$_FILES["inp$i"]["name"];
  move_uploaded_file($_FILES["inp$i"]['tmp_name'], "../".$lj.$mc);
  list($width, $height) = getimagesize(weburl.$lj.$mc);
  if($bg==0){$bgv=intval($height/($width/$bw));}else{$bgv=$bg;}
  $cm->SetVar("../".$lj.$mc,"file");
  if($width>$bw){$cm->Cut("../".$lj.$mc,$bw,$bgv);}
  if($needsy=="yes"){imageWaterMark("../".$lj.$mc,websypos,"../img/shuiyin.png","","","","",0,0);}
  if($sw!=0){$a=preg_split("/\./",$mc);$cm->Cut("../".$lj.$a[0]."-1.".$a[1],$sw,$sh);}
  if($xw!=0){$a=preg_split("/\./",$mc);$cm->Cut("../".$lj.$a[0]."-2.".$a[1],$xw,$xh);}
 }
}
function uploadtp($tbh,$tty,$tuid){
 global $res3;
 while3("*","yjcode_clear where bh='".$tbh."' and type1='".$tty."' order by id asc");
 $i=1;
 while($row3=mysql_fetch_array($res3)){
 $nxh=returnxh("yjcode_tp"," and bh='".$tbh."' and type1='".$tty."'");
 if(panduan("*","yjcode_tp where bh='".$tbh."' and type1='".$tty."' and iffm=1")==1){$fmv=0;}else{$fmv=1;}
 intotable("yjcode_tp","bh,tp,type1,iffm,sj,userid,xh","'".$tbh."','".$row3[tp]."','".$tty."',".$fmv.",'".$row3[sj]."','".$tuid."',".$nxh."");
 deletetable("yjcode_clear where id=".$row3[id]);
 $i++;
 }
}
 
function delDirAndFile($dirName){
if(is_dir($dirName)){
if ( $handle = opendir( "$dirName" ) ) {
while ( false !== ( $item = readdir( $handle ) ) ) {
if ( $item != "." && $item != ".." ) {
if ( is_dir( "$dirName/$item" ) ) {delDirAndFile( "$dirName/$item" );} 
else {if( unlink( "$dirName/$item" ) );}}
}
closedir($handle);
if(rmdir($dirName));}
}
}
function delFile($nowu){if(is_file($nowu)){unlink($nowu);}}

function html_template($yurl,$nurl){$url =weburl.$yurl;$ch = curl_init();curl_setopt($ch, CURLOPT_URL, $url);curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);curl_setopt($ch, CURLOPT_HEADER, 0);$output = curl_exec($ch);curl_close($ch);$fp= fopen($nurl,"w");fwrite($fp,$output);fclose($fp);}
function html1(){
html_template("tem/top.php","../tem/top.html");
html_template("tem/top1.php","../tem/top1.html");
html_template("tem/bottom.php","../tem/bottom.html");
html_template("indextemplate.php","../index.html");
html_template("news/indextemplate.php","../news/index.html");
}

function PointUpdateM($c_uid,$c_money){$m=sprintf("%.2f",$c_money);updatetable("yjcode_user","money1=money1+(".$m.") where id=".$c_uid);}
function PointIntoM($c_uid,$c_tit,$c_money){$m=sprintf("%.2f",$c_money);intotable("yjcode_moneyrecord","bh,userid,tit,moneynum,sj,uip","'".time()."',".$c_uid.",'".$c_tit."',".$m.",'".date('Y-m-d H:i:s')."','".$_SERVER['REMOTE_ADDR']."'");}
function PointUpdate($c_uid,$c_jf){updatetable("yjcode_user","jf=jf+(".$c_jf.") where id=".$c_uid);}
function PointInto($c_uid,$c_tit,$c_jf){intotable("yjcode_jfrecord","userid,tit,jfnum,sj,uip","".$c_uid.",'".$c_tit."',".$c_jf.",'".date('Y-m-d H:i:s')."','".$_SERVER['REMOTE_ADDR']."'");}

function delproduct($b,$u){
 deletetable("yjcode_pro where bh='".$b."'");
 deletetable("yjcode_clear where bh='".$b."'");
 deletetable("yjcode_tp where bh='".$b."'");
 deletetable("yjcode_propj where probh='".$b."'");
 deletetable("yjcode_car where probh='".$b."'");
 deletetable("yjcode_profav where probh='".$b."'");
 deletetable("yjcode_kc where probh='".$b."'");
 delDirAndFile("../upload/".$u."/".$b."/");
}

function deluid($u){//删除会员
global $res3;
$userid=returnuserid($u);
if(is_numeric($userid)){
 deletetable("yjcode_news where userid=".$userid);
 deletetable("yjcode_tp where userid=".$userid);
 deletetable("yjcode_loginlog where userid=".$userid);
 deletetable("yjcode_moneyrecord where userid=".$userid);
 deletetable("yjcode_jfrecord where userid=".$userid);
 deletetable("yjcode_tixian where userid=".$userid);
 while3("bh,userid","yjcode_pro where userid=".$userid);while($row3=mysql_fetch_array($res3)){delproduct($row3[bh],$row3[userid]);}
 deletetable("yjcode_propj where userid=".$userid);
 deletetable("yjcode_car where userid=".$userid);
 deletetable("yjcode_order where selluserid=".$userid." or userid=".$userid);
 deletetable("yjcode_db where selluserid=".$userid." or userid=".$userid);
 deletetable("yjcode_tk where selluserid=".$userid." or userid=".$userid);
 deletetable("yjcode_shopfav where shopid=".$userid." or userid=".$userid);
 deletetable("yjcode_profav where userid=".$userid);
 deletetable("yjcode_dingdang where userid=".$userid);
 deletetable("yjcode_qiandao where userid=".$userid);
 deletetable("yjcode_task where userid=".$userid);
 deletetable("yjcode_taskhf where userid=".$userid." or useridhf=".$userid);
 deletetable("yjcode_kc where userid=".$userid." or userid1=".$userid);
 deletetable("yjcode_smsmail where userid=".$userid);
 deletetable("yjcode_gd where userid=".$userid);
 deletetable("yjcode_gdhf where userid=".$userid);
 delDirAndFile("../upload/".$userid."/");
 clearstatcache();
 if(!is_dir("../upload/".$userid."/")){deletetable("yjcode_user where uid='".$u."'");}
}
}

function checkdjl($c,$bhid,$tb){
 $uid=returnuserid($_SESSION[SHOPUSER]);
 $sj1=date("Y-m-d H:i:s");
 $uip1=$_SERVER["REMOTE_ADDR"];
 global $res1;
 $y=0;
 while1("sj,uip,admin,bhid","yjcode_djl where admin='".$c."' and uip='".$uip1."' and bhid='".$bhid."' order by sj desc");
 if(!$row1=mysql_fetch_array($res1)){$y=2;}else{
  $sjc=DateDiff($sj1,$row1[sj],"s");
  if($sjc>600){$y=1;}else{$y=0;}
 }	
 if(2==$y){intotable("yjcode_djl","userid,sj,uip,admin,bhid","".$uid.",'".$sj1."','".$uip1."','".$c."','".$bhid."'");}
 elseif(1==$y){updatetable("yjcode_djl","sj='".$sj1."' where admin='".$c."' and uip='".$uip1."' and bhid='".$bhid."'");}
 if(0!=$y){
  if(check_in($c,"c1,c2")){
  updatetable($tb,"djl=djl+1 where id=".$bhid);
  }
 }
}

function sellmoneytj($u){
 $ma=0;
 $sqlb="select sum(money1*num) as totalall from yjcode_order where ddzt='suc' and selluserid=".$u;
 mysql_query("SET NAMES 'GBK'");$resb=mysql_query($sqlb);if($rowb=mysql_fetch_array($resb)){$ma=$rowb["totalall"];}
 $mb=0;
 $sqlb="select sum(money1*num) as totalall from yjcode_order where ddzt='suc' and month(sj) = month(curdate()) and year(sj) = year(curdate()) and selluserid=".$u;
 mysql_query("SET NAMES 'GBK'");$resb=mysql_query($sqlb);if($rowb=mysql_fetch_array($resb)){$mb=$rowb["totalall"];}
 updatetable("yjcode_user","sellmall=".$ma.",sellmyue=".$mb." where id=".$u);
}

function taskok($esj,$d){
$sj1=date("Y-m-d H:i:s");
if($sj1>=$esj){updatetable("yjcode_task","ifok=1 where id=".$d);}
}

function kamikc($b){
 if(!empty($b)){
  if(panduan("bh,fhxs","yjcode_pro where bh='".$b."' and fhxs=4")==1){
  $a=returncount("yjcode_kc where ifok=0 and probh='".$b."'");
  updatetable("yjcode_pro","kcnum=".$a." where bh='".$b."'");
  }
 }
}
?>