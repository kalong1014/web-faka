<?
include("../config/conn.php");
include("../config/function.php");
if($_SESSION["SHOPUSER"]!=""){php_toheader("../user/");}

//�޸ĸ��ļ���Ҫͬ���޸���reg/reg.php��reg/qqreturnlast.php 

//д�����ݿ⿪ʼ
if($_GET[action]=="add"){
 $sj=date("Y-m-d H:i:s");
 $uip=$_SERVER["REMOTE_ADDR"];
 zwzr();
 if(strtolower($_SESSION["authnum_session"])!=strtolower(sqlzhuru($_POST["t5"]))){Audit_alert("��֤�벻��ȷ�������޸���֤�룡","reg.php");}
 $uid=sqlzhuru(trim($_POST[t1]));
 if(panduan("uid","yjcode_user where uid='".$uid."'")==1){Audit_alert("���ʺ��Ѿ���ע�ᣬ�����޸��ʺ�","reg.php");}
 if(panduan("nc","yjcode_user where nc='".sqlzhuru($_POST[t4])."'")==1){Audit_alert("���ǳ��ѱ�ʹ�ã������޸��ǳ�","reg.php");}
 if(strlen($uid)<4 || strlen($uid)>20 || !ereg("^[_a-zA-Z0-9]*$",$uid)){Audit_alert("��Ա�ʺŸ�ʽ����","reg.php");}
 $shopzt=0;if($rowcontrol["ifsell"]=="on"){$shopzt=2;}
 if(empty($_COOKIE['tjuserid'])){$tu=0;}else{$tu=$_COOKIE['tjuserid'];}
 intotable("yjcode_user","uid,pwd,sj,uip,money1,jf,nc,ifmot,ifemail,uqq,yxsj,djl,pm,zt,openshop,shopzt,sellmall,sellmyue,tjuserid,sellbl,sfzrz","'".sqlzhuru($_POST[t1])."','".sha1(sqlzhuru($_POST[t2]))."','".$sj."','".$uip."',0,0,'".sqlzhuru($_POST[t4])."',0,0,'".sqlzhuru($_POST[t6])."','2014-10-15',0,0,1,0,".$shopzt.",0,0,".$tu.",".$rowcontrol[sellbl].",3");$id=mysql_insert_id();
 if(!empty($rowcontrol[regmoney]) && $rowcontrol[regmoney]>0){PointIntoM($id,"ע���Ա���ͽ��",$rowcontrol[regmoney]);PointUpdateM($id,$rowcontrol[regmoney]);}
 if(!empty($rowcontrol[regjf]) && $rowcontrol[regjf]>0){PointInto($id,"ע���Ա���ͻ���",$rowcontrol[regjf]);PointUpdate($id,$rowcontrol[regjf]);}
 createDir("../upload/".$id."/");
 $_SESSION["SHOPUSER"]=$_POST[t1];
 intotable("yjcode_loginlog","admin,userid,sj,uip","1,".$id.",'".$sj."','".$uip."'");
 php_toheader("../user/");
 
}
//д�����ݿ����


//�Ƽ���ID COOKIE��
$tid=$_GET[tid];
if(!empty($tid)){
 $Month = 864000 + time();
 setcookie(tjuserid,$tid, $Month,'/');
}

?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ע���Ա - <?=webname?></title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<link href="index.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/basic.js"></script>
<script language="javascript" src="index.js"></script>
</head>
<body>
<div id="bghui" style="position:absolute;top:0px;filter:alpha(Opacity=60);-moz-opacity:0.6;opacity:0.6;background-color:#777;z-index:199;left:0px;"></div>
<div id="openw" class="openw" style="display:none;"><div class="kf"><span id="tangts">ϵͳ���ڴ������ݣ�����ˢ�»�ر�ҳ�桭��</span></div></div>

<? include("../tem/top.html");?>

<div class="yjcode">
 <div class="mtop">
 <ul class="u1 fontyh">
 <li class="l1"><a href="../"><img border="0" src="../img/logo.png" /></a></li>
 <li class="l2">����<?=webname?>�˺ţ�<a href="./">������¼</a></li>
 </ul>
 </div>
</div>

<div class="bfb bfb1">
<div class="yjcode">

  <div class="regleft">
  <form name="f1" method="post" onSubmit="return tj()">
  <ul class="u1">
  <li class="cap fontyh">��ӭ����<?=webname?></li>
  <li class="l1">ע���ʺ�</li>
  <li class="l2">
  <input type="text" class="inp1" name="t1" autocomplete="off" disableautocomplete onBlur="userCheck()">
  <span class="s1" id="imgts1"></span>
  <span class="s2" id="ts1">4-20λ��ĸ�����ֻ��»������</span>
  </li>
  <li class="l1">����</li>
  <li class="l2">
  <input type="password" class="inp1" name="t2" autocomplete="off" disableautocomplete onBlur="pwd1chk()">
  <span class="s1" id="imgts2"></span>
  <span class="s2" id="ts2">6-20����ĸ�����֡��»��ߵ����</span>
  </li>
  <li class="l1">ȷ������</li>
  <li class="l2">
  <input type="password" class="inp1" name="t3" autocomplete="off" disableautocomplete onBlur="pwd2chk()">
  <span class="s1" id="imgts3"></span>
  <span class="s2" id="ts3">ȷ������������ȷ</span>
  </li>
  <li class="l1">�ǳ�</li>
  <li class="l2">
  <input type="text" class="inp1" name="t4" autocomplete="off" disableautocomplete onBlur="ncCheck()">
  <span class="s1" id="imgts4"></span>
  <span class="s2" id="ts4">���������ڱ�վ���ǳ�</span>
  </li>
  <li class="l1">��ϵQQ</li>
  <li class="l2">
  <input type="text" class="inp1" name="t6" autocomplete="off" disableautocomplete onBlur="qqCheck()">
  <span class="s1" id="imgts6"></span>
  <span class="s2" id="ts6">�������д��ȷ����ϵQQ</span>
  </li>
  <li class="l1">��֤��</li>
  <li class="l2">
  <input type="text" class="inp2" name="t5"> 
  <img src="../config/getYZM.php" onClick="this.src='../config/getYZM.php?'+Math.random();" class="img1" />
  </li>
  <li class="l3"><input type="submit" value="ͬ������Э�鲢ע��"></li>
  <li class="l4"><a href="../help/aboutview1.html" class="feng" target="_blank">��<?=webname?>��Աע��Э�顷</a></li>
  </ul>
  </form>
  </div>
  
  <div class="regright">
  <ul class="u1">
  <li class="l1">�������ʺŵ�¼</li>
  <li class="l2"><a href="../config/qq/oauth/index.php"><img src="../img/qq1.gif" width="138" height="37" border="0" /></a></li>
  </ul>
  </div>

</div>
</div>

<? include("../tem/bottom.html");?>

</body>
</html>