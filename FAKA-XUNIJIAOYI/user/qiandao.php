<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION[SHOPUSER]);
$sj=date("Y-m-d H:i:s");

while1("*","yjcode_qiandao where userid=".$userid." order by sj desc limit 1");
if($row1=mysql_fetch_array($res1)){
$a_ux = strtotime($sj);
$a_date = date('Y-m-d',$a_ux);
$b_date = date('Y-m-d',strtotime($row1[sj]));
if($a_date==$b_date){$ifq=1;}else{$ifq=0;}
}else{$ifq=0;}

//��������ʼ
if($_POST[jvs]=="qd"){
 zwzr();
 if(1==$ifq){Audit_alert("������ǩ���������ظ�ǩ��","qiandao.php");}
 $uip=$_SERVER["REMOTE_ADDR"];
 intotable("yjcode_qiandao","userid,sj,uip,tit,jf","".$userid.",'".$sj."','".$uip."','".sqlzhuru($_POST[t1])."',".$rowcontrol[qdjf]."");
 PointInto($userid,"ÿ��ǩ��",$rowcontrol[qdjf]);
 PointUpdate($userid,$rowcontrol[qdjf]); 
 php_toheader("qiandao.php");
}
//����������

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û�������� - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script language="javascript">
function tj(){
if((document.f1.t1.value).replace(/\s/,"")==""){alert("����д��������");document.f1.t1.focus();return false;}
tjwait();
f1.action="qiandao.php?control=add";
}
</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ÿ��ǩ��</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? include("rcap8.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>
 
 <? if(0==$ifq){$weekarray=array("��","һ","��","��","��","��","��");?>
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="qd" name="jvs" />
 <ul class="uk">
 <li class="l1">�������飺</li>
 <li class="l2"><input name="t1"  style="width:305px;" value="��ʱǩ���Ǹ���ϰ��^_^ ǩ���÷�����" class="inp" type="text" /></li>
 <li class="l3"></li>
 <li class="l4">
 <div id="tjbtn"><input type="submit" value="��<?=$weekarray[date("w")]?>" class="qd" /></div>
 <div id="tjing" style="display:none;color:#F96F39;"><img style="margin:0 0 6px 0;" src="../img/ajax_loader.gif" width="208" height="13" /><br>����ǩ�������Ժ�^_^</div>
 </li>
 </ul>
 </form>
 <? }else{?>
 <ul class="uk">
 <li class="l1">ǩ����ʾ��</li>
 <li class="l21"><strong class="feng">�𾴵��û����������Ѿ�ǩ���ɹ�������Ҳ�ǵ���ǩ��Ŷ^_^</strong></li>
 </ul>
 <? }?>

 <ul class="typecap">
 <li class="l4">ǩ��ʱ��</li>
 <li class="l4">��������</li>
 <li class="l4">ǩ��IP</li>
 <li class="l1">����</li>
 </ul>
   
 <?
 $ses=" where userid=".$userid;
 $page=$_GET["page"];if($page==""){$page=1;}else{$page=intval($_GET["page"]);}
 pagef($ses,30,"yjcode_qiandao","order by sj desc");while($row=mysql_fetch_array($res)){
 ?>
 <ul class="typelist2" onmouseover="this.className='typelist2 typelist21';" onmouseout="this.className='typelist2';">
 <li class="l4"><?=$row[sj]?></li>
 <li class="l4"><?=$row[jf]?></li>
 <li class="l4"><a href="http://www.baidu.com/s?wd=<?=$row[uip]?>" target="_blank"><?=$row[uip]?></a></li>
 <li class="l1">&nbsp;&nbsp;&nbsp;<?=$row[tit]?></li>
 <li class="l0"></li>
 </ul>
 <? }?>

 <div class="npa">
 <?
 $nowurl="qiandao.php";
 $nowwd="";
 require("page.html");
 ?>
 </div>


</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>