<?php
/*
2014年起，友价团队全部源码不再做加密处理，全部开源，方便用户二次开发。
同时我们仅对正规渠道购买的用户提供技术支持。
另：如果源码购买后有转卖行为，我们即删除你的认证帐号，同时也不再提供任何支持。
www.yj99.cn
友价源码
*/
require("return1.php");
function panduan($pzd,$ptable){
 $sqlpd="select ".$pzd." from ".$ptable;mysql_query("SET NAMES 'GBK'");$respd=mysql_query($sqlpd);
 if($rowpd=mysql_fetch_array($respd)){return 1;}else{return 0;}
}

function returnxh($tabxh,$sesxh=""){
$sqlxh="select * from ".$tabxh." where id<>0 ".$sesxh." order by xh desc";mysql_query("SET NAMES 'GBK'");$resxh=mysql_query($sqlxh);
if($rowxh=mysql_fetch_array($resxh)){$nxh=$rowxh[xh]+1;}else{$nxh=1;}
return $nxh;
}

function returncount($ctable){
 $sqlcount="select count(*) as id from ".$ctable;
 mysql_query("SET NAMES 'GBK'");$rescount=mysql_query($sqlcount);$rowcount=mysql_fetch_array($rescount);return $rowcount[id];
}

function returnsum($zd,$t){
$sqlb="select sum(".$zd.") as allzd from ".$t;mysql_query("SET NAMES 'GBK'");$resb=mysql_query($sqlb);$rowb=mysql_fetch_array($resb);
if(empty($rowb[allzd])){return "0";}else{return $rowb[allzd];}
}

function returnhelptype($tv,$tid){
$sqltype="select * from yjcode_helptype where id=".$tid."";mysql_query("SET NAMES 'GBK'");$restype=mysql_query($sqltype);
$rowtype=mysql_fetch_array($restype);
if($tv==1){return $rowtype[name1];}else{return $rowtype[name2];}
}

function returnnewstype($tyid,$wv){
 global $res3;
 if($tyid==1){while3("id,name1","yjcode_newstype where id=".$wv);if($row3=mysql_fetch_array($res3)){return $row3[name1];}else{return "";}}
 if($tyid==2){while3("id,name2","yjcode_newstype where id=".$wv);if($row3=mysql_fetch_array($res3)){return $row3[name2];}else{return "";}}
}

function returntasktype($tid){
$sqltype="select * from yjcode_tasktype where id=".$tid."";mysql_query("SET NAMES 'GBK'");$restype=mysql_query($sqltype);
$rowtype=mysql_fetch_array($restype);
return $rowtype[name1];
}

function returntype($jbid,$aid){
$sqlp="select * from yjcode_type where id=".$aid;mysql_query("SET NAMES 'GBK'");$resp=mysql_query($sqlp);
 if($rowp=mysql_fetch_array($resp)){
  if($jbid==1){return $rowp[type1];}	
  elseif($jbid==2){return $rowp[type2];}	
  elseif($jbid==3){return $rowp[type3];}	
 }else{return "";}
}

function returnuserid($u){
$sqlother="select id,uid from yjcode_user where uid='".$u."'";mysql_query("SET NAMES 'GBK'");$resother=mysql_query($sqlother);
if($rowother=mysql_fetch_array($resother)){return $rowother[id];}else{return 0;}
}

function returnsellbl($u){
global $rowcontrol;
$sqlother="select id,sellbl from yjcode_user where id=".$u;mysql_query("SET NAMES 'GBK'");$resother=mysql_query($sqlother);$rowother=mysql_fetch_array($resother);
if(!empty($rowother[sellbl])){return $rowother[sellbl];}else{return $rowcontrol[sellbl];}
}

function returnuser($uid){
$sqlother="select id,uid from yjcode_user where id=".$uid;mysql_query("SET NAMES 'GBK'");$resother=mysql_query($sqlother);
$rowother=mysql_fetch_array($resother);
return $rowother[uid];
}

function returnqq($u){
$sqlother="select id,uqq from yjcode_user where id=".$u;mysql_query("SET NAMES 'GBK'");$resother=mysql_query($sqlother);
$rowother=mysql_fetch_array($resother);
return $rowother[uqq];
}

function returntjuserid($u){
$sqlother="select id,tjuserid from yjcode_user where id=".$u;mysql_query("SET NAMES 'GBK'");$resother=mysql_query($sqlother);
$rowother=mysql_fetch_array($resother);
if(empty($rowother[tjuserid])){$v=0;}else{$v=$rowother[tjuserid];}
return $v;
}

function returnnc($u){
$sqlother="select id,nc from yjcode_user where id=".$u;mysql_query("SET NAMES 'GBK'");$resother=mysql_query($sqlother);
$rowother=mysql_fetch_array($resother);
return $rowother[nc];
}

function returnproid($b){
$sqlother="select id,bh from yjcode_pro where bh='".$b."'";mysql_query("SET NAMES 'GBK'");$resother=mysql_query($sqlother);
$rowother=mysql_fetch_array($resother);
return $rowother[id];
}

function returnxy($u,$t){ //1卖家 2买家
if(1==$t){$sqlxy="select count(*) as id from yjcode_order where selluserid=".$u." and ddzt='suc'";}
elseif(2==$t){$sqlxy="select count(*) as id from yjcode_order where userid=".$u." and ddzt='suc'";}
mysql_query("SET NAMES 'GBK'");$resxy=mysql_query($sqlxy);
$rowxy=mysql_fetch_array($resxy);
return $rowxy[id];
}

function adwhile($adbh,$adnum=0){
$li="";
if($adnum!=0){$li=" limit ".$adnum;}
$sqlad="select * from yjcode_ad where adbh='".$adbh."' order by xh asc".$li;
mysql_query("SET NAMES 'GBK'");
$resad=mysql_query($sqlad);
while($rowad=mysql_fetch_array($resad)){
switch($rowad[type1]){
case "代码":
echo "<div class=\"ad1\">$rowad[txt]</div>";
break;
case "图片":
echo "<div class=\"ad1\"><a href=\"".$rowad[aurl]."\" target=_blank><img alt=\"".$rowad[tit]."\" border=0 src=".weburl."ad/".$rowad[bh].".".$rowad[jpggif]."></a></div>";
break;
case "文字":
echo "<div class=\"ad1\">·<a href=\"".$rowad[aurl]."\" target=_blank>".$rowad[utit]."</a></div>";
break;
case "动画":
echo "<div class=\"ad1\"><embed src=\"".weburl."/ad/".$rowad[bh].".swf\" quality=\"high\" width=\"".$rowad[aw]."\" height=\"".$rowad[ah]."\" wmode=transparent type=\"application/x-shockwave-flash\"></embed></div>";
break;
}
}
}

function adread($adbh,$w,$h){
$sqlad="select * from yjcode_ad where adbh='".$adbh."'";
mysql_query("SET NAMES 'GBK'");
$resad=mysql_query($sqlad);
if($rowad=mysql_fetch_array($resad)){
switch($rowad[type1]){
case "代码":
echo "$rowad[txt]";
break;
case "图片":
if($h==0 || $w==0){
echo "<a href=\"".$rowad[aurl]."\" target=_blank><img border=0 src=".weburl."ad/".$rowad[bh].".".$rowad[jpggif]."></a>";
}else{
echo "<a href=$rowad[aurl] target=_blank><img border=0 src=".weburl."ad/$rowad[bh].$rowad[jpggif] width=$w height=$h></a>";
}
break;
case "文字":
echo "·<a href=\"".$rowad[aurl]."\" target=_blank>".$rowad[utit]."</a>";
break;
case "动画":
echo "<div class=\"ad\"><embed src=\"".weburl."ad/".$rowad[bh].".swf\" quality=\"high\" width=\"".$rowad[aw]."\" height=\"".$rowad[ah]."\" wmode=transparent type=\"application/x-shockwave-flash\"></embed></div>";
break;
}
}
}

function adreadID($adid,$w,$h){
$sqlad="select * from yjcode_ad where id=".$adid;
mysql_query("SET NAMES 'GBK'");
$resad=mysql_query($sqlad);
if($rowad=mysql_fetch_array($resad)){
switch($rowad[type1]){
case "代码":
echo "$rowad[txt]";
break;
case "图片":
if($h==0 || $w==0){
echo "<a href=\"".$rowad[aurl]."\" target=_blank><img border=0 src=".weburl."ad/".$rowad[bh].".".$rowad[jpggif]."></a>";
}else{
echo "<a href=$rowad[aurl] target=_blank><img border=0 src=".weburl."ad/$rowad[bh].$rowad[jpggif] width=$w height=$h></a>";
}
break;
case "文字":
echo "·<a href=\"".$rowad[aurl]."\" target=_blank>".$rowad[utit]."</a>";
break;
case "动画":
echo "<div class=\"ad\"><embed src=\"".weburl."ad/".$rowad[bh].".swf\" quality=\"high\" width=\"".$rowad[aw]."\" height=\"".$rowad[ah]."\" wmode=transparent type=\"application/x-shockwave-flash\"></embed></div>";
break;
}
}
}

function returntp($tsql,$a=""){$sqltp="select * from yjcode_tp where ".$tsql;mysql_query("SET NAMES 'GBK'");$restp=mysql_query($sqltp);if($rowtp=mysql_fetch_array($restp)){$t=preg_split("/\./",$rowtp[tp]);return $t[0].$a.".".$t[1];}else{return "";}}

?>