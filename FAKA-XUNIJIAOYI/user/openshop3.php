<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
$rowuser=mysql_fetch_array($resuser);

//��������ʼ
if($_POST[jvs]=="openshop"){
 zwzr();
 updatetable("yjcode_user","shopzt=0 where uid='".$_SESSION[SHOPUSER]."' and shopzt=3");
 php_toheader("openshop1.php");
}
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
if(confirm("ȷ�������ύ����������")){tjwait();f1.action="openshop3.php";}else{return false;}
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
 $("step3").className="l1 l11";
 </script>

 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="openshop" name="jvs" />
 <ul class="uk">
 <li class="l1">��˽����</li>
 <li class="l21"><?=returnshopztv($rowuser[shopzt])?></li>
 <li class="l1"></li>
 <li class="l21">�������ʣ���<a href="../help/aboutview4.html" class="blue" target="_blank">�����ϵ��վ�ͷ�</a></li>
 <? if(3==$rowuser[shopzt]){?>
 <li class="l1">����ԭ��</li>
 <li class="l21"><?=$rowuser[shopztsm]?></li>
 <li class="l3"></li>
 <li class="l4"><?=tjbtnr("�����ύ")?></li>
 <? }?>
 </ul>
 </form>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>