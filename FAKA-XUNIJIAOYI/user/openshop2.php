<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
$rowuser=mysql_fetch_array($resuser);
if(1==$rowuser[shopzt] || 2==$rowuser[shopzt] || 3==$rowuser[shopzt]){php_toheader("openshop3.php");}

//��������ʼ
if($_POST[jvs]=="openshop"){
 zwzr();
 $t1=sha1(sqlzhuru($_POST[t1]));
 if(panduan("uid,pwd","yjcode_user where uid='".$_SESSION[SHOPUSER]."' and zfmm='".$t1."'")==0){Audit_alert("֧��������֤ʧ�ܣ��������ԣ�","openshop2.php");}
 if($rowcontrol[openshop]>$rowuser[money1]){Audit_alert("�������������ȳ�ֵ��","openshop2.php");}
 $m=$rowcontrol[openshop];
 PointUpdateM($rowuser[id],$m*(-1));
 PointIntoM($rowuser[id],"���뿪�꣬���ɷ���",$m*(-1));
 updatetable("yjcode_user","openshop=".$m.",shopzt=1 where uid='".$_SESSION[SHOPUSER]."'");
 php_toheader("openshop3.php");
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
if((document.f1.t1.value).replace(/\s/,"")==""){alert("������֧������");document.f1.t1.focus();return false;}	
if(confirm("ȷ���ύ��")){tjwait();f1.action="openshop2.php";}else{return false;}
}
</script>
</head>
<body>
<div class="yjcode">

<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ���뿪��</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? include("kdcap.php");?>
 <script language="javascript">
 $("step2").className="l1 l11";
 </script>

 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="openshop" name="jvs" />
 <ul class="uk">
 <li class="l1">������ã�</li>
 <li class="l21 red"><strong><?=$rowcontrol[openshop]?> Ԫ</strong></li>
 <li class="l1">���Ŀ�����</li>
 <li class="l21 green"><strong><?=$rowuser[money1]?> Ԫ</strong><? if($rowcontrol[openshop]>$rowuser[money1]){?>[<a href="pay.php">����,�����ֵ</a>]<? }?></li>
 <li class="l1">֧�����룺</li>
 <li class="l2"><input type="password" class="inp" name="t1" /> [<a href="zfmm.php">����֧������?</a>]</li>
 <li class="l3"></li>
 <li class="l4"><?=tjbtnr("��һ��")?></li>
 </ul>
 </form>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>