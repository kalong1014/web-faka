<?
 //��ʼִ�й���
 $probh=preg_split("/xcf/",$bharr);
 $pronum=preg_split("/xcf/",$numarr);
 for($i=0;$i<=count($probh);$i++){
 if($probh[$i]!=""){
  while0("*","yjcode_pro where bh='".$probh[$i]."' and zt=0 and ifxj=0 and kcnum>=".$pronum[$i]);if($row=mysql_fetch_array($res)){
  /////////////////////////////////��ʼ��һ����
  $uip=$_SERVER["REMOTE_ADDR"];
  $orderbh=time().$i.rnd_num(100);
  $money=returnyhmoney($row[yhxs],$row[money2],$row[money3],$sj,$row[yhsj1],$row[yhsj2],$row[id]);
  $allmoney=$money*$pronum[$i];
  $sqlu="select id,money1,email from yjcode_user where id=".$buyuserid;mysql_query("SET NAMES 'GBK'");$resu=mysql_query($sqlu);if(!$rowu=mysql_fetch_array($resu)){exit;}
  if($rowu[money1]<$allmoney){exit;}
  $kc=$row[kcnum]-$pronum[$i];updatetable("yjcode_pro","kcnum=".$kc." where id=".$row[id]);
  intotable("yjcode_order","probh,sj,uip,selluserid,userid,money1,orderbh,num,tit,ddzt","'".$row[bh]."','".$sj."','".$uip."',".$row[userid].",".$buyuserid.",".$money.",'".$orderbh."',".$pronum[$i].",'".$row[tit]."','wait'");
  PointUpdateM($buyuserid,$allmoney*(-1));
  PointIntoM($buyuserid,"������Ʒ,����".$pronum[$i],$allmoney*(-1));
  updatetable("yjcode_pro","xsnum=xsnum+".$pronum[$i]." where id=".$row[id]);
  deletetable("yjcode_car where userid=".$buyuserid." and probh='".$probh[$i]."'");
  
  //�Զ�������ƷB
  if(1!=$row[fhxs]){
   //����B
   if(4==$row[fhxs]){
	while1("*","yjcode_kc where probh='".$row[bh]."' and ifok=0 and userid=".$row[userid]." order by id asc limit ".$pronum[$i]);while($row1=mysql_fetch_array($res1)){
	$txt=$txt."���ţ�".$row1[ka]." ���룺".$row1[mi]."<br>";
    updatetable("yjcode_kc","ifok=1,sj='".$sj."',uip='".$uip."' where id=".$row1[id]);
	}  
   }
   //����E
  updatetable("yjcode_order","fhsj='".$sj."',ddzt='db',txt='".$txt."' where ddzt='wait' and orderbh='".$orderbh."'");
  $oksj=date("Y-m-d H:i:s",strtotime("+".$rowcontrol[dbsj]." day"));
  $c_tit="�����Ѿ�������������뵣���׶Σ��ȴ����ȷ���ջ�";
  intotable("yjcode_db","money1,sj,selluserid,userid,dboksj,probh,tit,orderbh","".$allmoney.",'".$sj."',".$row[userid].",".$buyuserid.",'".$oksj."','".$row[bh]."','".$c_tit."','".$orderbh."'");
  }
  //�Զ�������ƷE
  
  //д�����B
  if(!empty($rowu[email])){
   if(1==$row[fhxs]){$fh="�ö�������Ʒ�������ֶ�����������ϵ����";}
   elseif(2==$row[fhxs]){$fh="�ö�����Ʒͨ���������أ������������Ϣ����,���̵�ַ��".$row[wpurl]." �������룺".$row[wppwd];}
   elseif(3==$row[fhxs]){$fh="�ö�������Ʒ�Ѿ����������������������ص�ַ��".weburl."upload/".$row[userid]."/".$row[bh]."/".$row[upf];}
   elseif(4==$row[fhxs]){$fh="<br>".$txt;}
   $t="��Ʒ���ƣ�".$row[tit]."<br>����������".$pronum[$i]."<br>֧����".$allmoney."<br>ȡ����Ϣ��".$fh."<hr>";
   $sqls="select * from yjcode_smsmail where admin=1 and tyid=1 and userid=".$buyuserid;mysql_query("SET NAMES 'GBK'");$ress=mysql_query($sqls);
   if($rows=mysql_fetch_array($ress)){
   $txv=$rows[txt].$t;
   updatetable("yjcode_smsmail","txt='".$txv."' where id=".$rows[id]);
   }else{
   intotable("yjcode_smsmail","admin,fa,tyid,userid,txt,tit","1,'".$rowu[email]."',1,".$buyuserid.",'".$t."','���Ķ�����Ϣ'");
   }
  }
  //д�����E
  
  //////////////////////////////////������һ����
  }
 }	 
 }
 
 $sqls="select * from yjcode_smsmail where admin=1 and tyid=1 and userid=".$buyuserid;mysql_query("SET NAMES 'GBK'");$ress=mysql_query($sqls);
 if($rows=mysql_fetch_array($ress)){
  require("../config/mailphp/sendmail.php");
  @yjsendmail($rows[tit],$rows[fa],$rows[txt]);
  deletetable("yjcode_smsmail where id=".$rows[id]);
 }
 //����ִ�й���
?>