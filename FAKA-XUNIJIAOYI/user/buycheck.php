<?
$carid=$_GET[carid];
if($carid==""){php_toheader("car.php");}
$c=preg_split("/c/",$carid);
$needmoney=0;
$pnum=0;
$bharr="";
$numarr="";
for($i=0;$i<count($c);$i++){
 if($c[$i]!=""){
 $d=preg_split("/-/",$c[$i]);
 $id=$d[0];
 $num=intval($d[1]);
 if($num<=0){Audit_alert("错误，购买数量不得少于1，返回重试","car.php");}
 
 while0("*","yjcode_car where userid=".$rowuser[id]." and id=".$id."");if(!$row=mysql_fetch_array($res)){php_toheader("car.php");}
 
 while1("*","yjcode_pro where bh='".$row[probh]."' and zt=0 and ifxj=0");if(!$row1=mysql_fetch_array($res1)){Audit_alert("商品已下架或未审核","car.php");}
 $money=returnyhmoney($row1[yhxs],$row1[money2],$row1[money3],$sj,$row1[yhsj1],$row1[yhsj2],$row1[id]);
 
 $needmoney=$needmoney+$money*$num;
 $pnum=$pnum+$num;
 $bharr=$bharr.$row1[bh]."xcf";
 $numarr=$numarr.$num."xcf";
 if($row1[kcnum]<$num){Audit_alert("库存不够了","car.php");}
 updatetable("yjcode_car","num=".$num." where id=".$id);
 }
}

$usermoney=sprintf("%.2f",$rowuser[money1]);
$needmoney=sprintf("%.2f",$needmoney);
?>