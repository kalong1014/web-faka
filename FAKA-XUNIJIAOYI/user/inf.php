<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();

if(sqlzhuru($_POST[jvs])=="inf"){
 zwzr();
 $nc=sqlzhuru($_POST[tnc]);
 if(empty($nc)){Audit_alert("�������ǳ�","inf.php");}
 updatetable("yjcode_user","uqq='".sqlzhuru($_POST[tuqq])."',weixin='".sqlzhuru($_POST[tweixin])."' where uid='".$_SESSION[SHOPUSER]."'");
 if(panduan("uid,nc","yjcode_user where uid<>'".$_SESSION[SHOPUSER]."' and nc='".$nc."'")){Audit_alert("���ǳ��ѱ������û�ʹ��","inf.php");}
 updatetable("yjcode_user","nc='".$nc."' where uid='".$_SESSION[SHOPUSER]."'");
 php_toheader("inf.php?t=suc"); 
}

$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("../reg/");}

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
 if((document.f1.tnc.value).replace("/\s/","")==""){alert("�������ǳ�");document.f1.tnc.focus();return false;}
 tjwait();
 f1.action="inf.php";
}
</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ���˻�������</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? include("rcap1.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>
 <? systs("��ϲ���������ɹ�!","inf.php")?>
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="inf" name="jvs" />
 <ul class="uk">
 <li class="l1">�û��ʺţ�</li>
 <li class="l21"><?=$_SESSION[SHOPUSER]?></li>
 <li class="l1"><span class="red" style="font-weight:normal;">*</span> �ǳƣ�</li>
 <li class="l2"><input type="text" class="inp" name="tnc" value="<?=$rowuser[nc]?>" /></li>
 <li class="l1">�����ַ��</li>
 <li class="l21"><?=$rowuser["email"]?> <a href="emailbd.php" class="blue">[������֤]</a></li>
 <li class="l1">�ֻ����룺</li>
 <li class="l21"><?=$rowuser[mot]?> <a href="mobbd.php" class="blue">[�޸��ֻ�����]</a></li>
 <li class="l1">QQ���룺</li>
 <li class="l2"><input type="text" class="inp" name="tuqq" value="<?=$rowuser[uqq]?>" /></li>
 <li class="l1">΢�ź��룺</li>
 <li class="l2"><input type="text" class="inp" name="tweixin" value="<?=$rowuser[weixin]?>" /></li>
 <li class="l1">İİ���룺</li>
 <li class="l2"><input type="text" class="inp" name="tweixin" value="<?=$rowuser[weixin]?>" /></li>

 <li class="l3"></li>
 <li class="l4"><? tjbtnr("�����޸�")?></li>
 </ul>
 </form>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>