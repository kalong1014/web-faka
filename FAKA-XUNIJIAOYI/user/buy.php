<?
 //开始执行购买
 $probh=preg_split("/xcf/",$bharr);
 $pronum=preg_split("/xcf/",$numarr);
 for($i=0;$i<=count($probh);$i++){
 if($probh[$i]!=""){
  while0("*","yjcode_pro where bh='".$probh[$i]."' and zt=0 and ifxj=0 and kcnum>=".$pronum[$i]);if($row=mysql_fetch_array($res)){
  /////////////////////////////////开始逐一购买
  $uip=$_SERVER["REMOTE_ADDR"];
  $orderbh=time().$i.rnd_num(100);
  $money=returnyhmoney($row[yhxs],$row[money2],$row[money3],$sj,$row[yhsj1],$row[yhsj2],$row[id]);
  $allmoney=$money*$pronum[$i];
  $sqlu="select id,money1,email from yjcode_user where id=".$buyuserid;mysql_query("SET NAMES 'GBK'");$resu=mysql_query($sqlu);if(!$rowu=mysql_fetch_array($resu)){exit;}
  if($rowu[money1]<$allmoney){exit;}
  $kc=$row[kcnum]-$pronum[$i];updatetable("yjcode_pro","kcnum=".$kc." where id=".$row[id]);
  intotable("yjcode_order","probh,sj,uip,selluserid,userid,money1,orderbh,num,tit,ddzt","'".$row[bh]."','".$sj."','".$uip."',".$row[userid].",".$buyuserid.",".$money.",'".$orderbh."',".$pronum[$i].",'".$row[tit]."','wait'");
  PointUpdateM($buyuserid,$allmoney*(-1));
  PointIntoM($buyuserid,"购买商品,数量".$pronum[$i],$allmoney*(-1));
  updatetable("yjcode_pro","xsnum=xsnum+".$pronum[$i]." where id=".$row[id]);
  deletetable("yjcode_car where userid=".$buyuserid." and probh='".$probh[$i]."'");
  
  //自动发货商品B
  if(1!=$row[fhxs]){
   //卡密B
   if(4==$row[fhxs]){
	while1("*","yjcode_kc where probh='".$row[bh]."' and ifok=0 and userid=".$row[userid]." order by id asc limit ".$pronum[$i]);while($row1=mysql_fetch_array($res1)){
	$txt=$txt."卡号：".$row1[ka]." 密码：".$row1[mi]."<br>";
    updatetable("yjcode_kc","ifok=1,sj='".$sj."',uip='".$uip."' where id=".$row1[id]);
	}  
   }
   //卡密E
  updatetable("yjcode_order","fhsj='".$sj."',ddzt='db',txt='".$txt."' where ddzt='wait' and orderbh='".$orderbh."'");
  $oksj=date("Y-m-d H:i:s",strtotime("+".$rowcontrol[dbsj]." day"));
  $c_tit="卖家已经发货，款项进入担保阶段，等待买家确认收货";
  intotable("yjcode_db","money1,sj,selluserid,userid,dboksj,probh,tit,orderbh","".$allmoney.",'".$sj."',".$row[userid].",".$buyuserid.",'".$oksj."','".$row[bh]."','".$c_tit."','".$orderbh."'");
  }
  //自动发货商品E
  
  //写入短信B
  if(!empty($rowu[email])){
   if(1==$row[fhxs]){$fh="该订单的商品由卖家手动发货，请联系卖家";}
   elseif(2==$row[fhxs]){$fh="该订单商品通过网盘下载，请根据以下信息下载,网盘地址：".$row[wpurl]." 网盘密码：".$row[wppwd];}
   elseif(3==$row[fhxs]){$fh="该订单的商品已经传至服务器，以下是下载地址：".weburl."upload/".$row[userid]."/".$row[bh]."/".$row[upf];}
   elseif(4==$row[fhxs]){$fh="<br>".$txt;}
   $t="商品名称：".$row[tit]."<br>购买数量：".$pronum[$i]."<br>支付金额：".$allmoney."<br>取货信息：".$fh."<hr>";
   $sqls="select * from yjcode_smsmail where admin=1 and tyid=1 and userid=".$buyuserid;mysql_query("SET NAMES 'GBK'");$ress=mysql_query($sqls);
   if($rows=mysql_fetch_array($ress)){
   $txv=$rows[txt].$t;
   updatetable("yjcode_smsmail","txt='".$txv."' where id=".$rows[id]);
   }else{
   intotable("yjcode_smsmail","admin,fa,tyid,userid,txt,tit","1,'".$rowu[email]."',1,".$buyuserid.",'".$t."','您的订单信息'");
   }
  }
  //写入短信E
  
  //////////////////////////////////结束逐一购买
  }
 }	 
 }
 
 $sqls="select * from yjcode_smsmail where admin=1 and tyid=1 and userid=".$buyuserid;mysql_query("SET NAMES 'GBK'");$ress=mysql_query($sqls);
 if($rows=mysql_fetch_array($ress)){
  require("../config/mailphp/sendmail.php");
  @yjsendmail($rows[tit],$rows[fa],$rows[txt]);
  deletetable("yjcode_smsmail where id=".$rows[id]);
 }
 //结束执行购买
?>