<?
set_time_limit(0);
require("../config/conn.php");
require("../config/function.php");
sesCheck();
$admin=$_GET[admin];
$bhid=$_GET[idbh];
$tab=$_GET[tab];
$userid=returnuserid($_SESSION[SHOPUSER]);
switch($admin){
 case "1":   //���¼�
 $nb=preg_split("/,/",$bhid);
 for($i=0;$i<count($nb);$i++){
  while0("bh,ifxj",$tab." where bh='".$nb[$i]."' and userid=".$userid);while($row=mysql_fetch_array($res)){
  if(0==$row[ifxj]){$nn=1;}else{$nn=0;}
  updatetable($tab,"ifxj=".$nn." where bh='".$row[bh]."'");
  }
 }
 break;	
 case "2":   //ɾ����Ʒ
 $nb=preg_split("/,/",$bhid);
 for($i=0;$i<count($nb);$i++){
 while1("bh,userid","yjcode_pro where bh='".$nb[$i]."' and userid=".$userid);
  if($row1=mysql_fetch_array($res1)){delproduct($row1[bh],$row1[userid]);}
 }
 break;	
 case "3":   //ɾ������
 $nb=preg_split("/,/",$bhid);
 for($i=0;$i<count($nb);$i++){
 deletetable("yjcode_taskhf where userid=".$userid." and bh='".$nb[$i]."'");
 deletetable("yjcode_task where userid=".$userid." and bh='".$nb[$i]."'");
 }
 break;	
 case "4":   //ɾ������ظ�
 $nb=preg_split("/,/",$bhid);
 for($i=0;$i<count($nb);$i++){
 if(!is_numeric($nb[$i])){echo "ERR074";exit;}
 deletetable("yjcode_taskhf where useridhf=".$userid." and id=".$nb[$i]);
 }
 break;	
 case "5":   //ɾ������
 $nb=preg_split("/,/",$bhid);
 $pbh="";
 if(!empty($nb[0])){while0("id,probh,userid","yjcode_kc where userid=".$userid." and id=".$nb[0]);if($row=mysql_fetch_array($res)){$pbh=$row[probh];}}
 for($i=0;$i<count($nb);$i++){
  if(!is_numeric($nb[$i])){echo "ERR074";exit;}
  deletetable("yjcode_kc where userid=".$userid." and id=".$nb[$i]);
 }
 kamikc($pbh);
 break;	
 case "6":   //ɾ����Ѷ
 $nb=preg_split("/,/",$bhid);
 for($i=0;$i<count($nb);$i++){
  while0("bh,sj","yjcode_news where bh='".$nb[$i]."' and zt<>0 and userid=".$userid);while($row=mysql_fetch_array($res)){
  delDirAndFile("../upload/news/".dateYMDN($row[sj])."/".$row[bh]."/");
  deletetable("yjcode_news where bh='".$row[bh]."' and userid=".$userid);
  deletetable("yjcode_tp where type1='��Ѷ' and bh='".$row[bh]."'");
  }
 }
 break;	

}
echo "True";
?>