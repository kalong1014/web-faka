<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();

if(sqlzhuru($_POST[xl])==sha1("pwd")){
 zwzr();
 if(panduan("*","yjcode_admin where adminpwd='".sha1(sqlzhuru($_POST[t0]))."' and adminuid='".$_SESSION[SHOPADMIN]."'")==1){
 updatetable("yjcode_admin","adminpwd='".sha1(sqlzhuru($_POST[t1]))."' where adminuid='".$_SESSION[SHOPADMIN]."'");
 php_toheader("pwd.php?t=suc");

}else{Audit_alert("ԭ�����������������ԣ�","pwd.php");}

}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>����ϵͳ</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script language="javascript">
function tj(){
if((document.f1.t0.value).replace(/\s/,"")==""){alert("�����������!");document.f1.t0.select();return false;}
if((document.f1.t1.value).replace(/\s/,"")==""){alert("������������!");document.f1.t1.select();return false;}
if(document.f1.t1.value!=document.f1.t2.value){alert("�����������벻һ��,������!");document.f1.t2.select();return false;}
tjwait();
f1.action="pwd.php";
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu1").className="l11";
</script>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_quanju.html");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã�<a href="default.php">��̨��ҳ</a> - <strong>�޸�����</strong></li><li class="l2"></li>
 </ul>
 
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","pwd.php");}?>
 
 <!--Begin-->
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="<?=sha1('pwd')?>" name="xl" />
 <ul class="uk">
 <li class="l1">�����룺</li>
 <li class="l2"><input type="password" class="inp" name="t0" size="30" onfocus="inpf(this)" onblur="inpb(this)" /></li>
 <li class="l1">�����룺</li>
 <li class="l2"><input type="password" class="inp" name="t1" size="30" onfocus="inpf(this)" onblur="inpb(this)" /></li>
 <li class="l1">�ظ����룺</li>
 <li class="l2"><input type="password" class="inp" name="t2" size="30" onfocus="inpf(this)" onblur="inpb(this)" /></li>
 <li class="l3"><? tjbtnr("�����޸�");?></li>
 </ul>
 </form>

 <!--End-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>