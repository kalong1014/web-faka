<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
$rowuser=mysql_fetch_array($resuser);
$userid=$rowuser[id];
$bh=$_GET[bh];
while0("*","yjcode_gd where bh='".$bh."' and zt=99 and userid=".$userid);if(!$row=mysql_fetch_array($res)){php_toheader("gdlist.php");}

//������ʼ
if($_GET[control]=="update"){
 zwzr();
 $sj=date("Y-m-d H:i:s");
 $txt=sqlzhuru($_POST[content]);
 updatetable("yjcode_gd","
			 sj='".$sj."',
			 zt=1,
			 mot='".sqlzhuru($_POST[tmot])."',
			 mail='".sqlzhuru($_POST[tmail])."',
			 orderbh='".sqlzhuru($_POST[torderbh])."',
			 txt='".$txt."',
			 gdzt=1
			 where bh='".$bh."' and userid=".$userid);
 php_toheader("gdlist.php");

}
//�������

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û�������� - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script type="text/javascript" charset="utf-8" src="../ckeditor/kindeditor.js"></script>
<script type="text/javascript">
KE.show({
      id : 'content',
       resizeMode : 1,
       cssPath : '../ckeditor/examples/index.css',
       items : [
       'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
       'removeformat','image', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
       'insertunorderedlist']
});
function tj(){
tjwait();
f1.action="gd.php?bh=<?=$bh?>&control=update";
}
</script>

</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ��������</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">

 <? include("rcap12.php");?>
 <script language="javascript">
 document.getElementById("rcap1").className="l1 l2";
 </script>

 <!--B-->
 <form name="f1" method="post" onsubmit="return tj()" enctype="multipart/form-data">
 <ul class="uk">
 <li class="l7"><span class="red">*</span> ����������</li>
 <li class="l8"><textarea id="content" name="content" style="width:640px;height:440px;visibility:hidden;"></textarea></li>
 <li class="l1">������ţ�</li>
 <li class="l2"><input type="text" size="20" class="inp" name="torderbh" /> [<a href="order.php" target="_blank">�鿴�ҵĶ���</a>]</li>
 <li class="l1">�ֻ����룺</li>
 <li class="l2"><input type="text" size="20" value="<?=$rowuser[mot]?>" class="inp" name="tmot" /></li>
 <li class="l1">������룺</li>
 <li class="l2"><input type="text" size="20" value="<?=$rowuser[email]?>" class="inp" name="tmail" /></li>
 <li class="l3"></li>
 <li class="l4"><? tjbtnr("�ύ����","gdlist.php")?></li>
 </ul>
 </form>

 <!--E-->
 
</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>