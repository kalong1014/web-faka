<?
include("../config/conn.php");
include("../config/function.php");
include("../config/tpclass.php");
sesCheck();

if(sqlzhuru($_POST[jvs])=="shop"){
 zwzr();
 $t1=sqlzhuru($_POST[t1]);
 $t2=sqlzhuru($_POST[t2]);
 $s1=sqlzhuru($_POST[s1]);
 if(empty($t1) || empty($t2) || empty($s1)){Audit_alert("��Ϣ���������������ԣ�","shop.php");}
 $userid=returnuserid($_SESSION[SHOPUSER]);
 if(panduan("*","yjcode_user where shopname='".$t1."' and uid<>'".$_SESSION[SHOPUSER]."'")==1){Audit_alert("���������Ѿ��������û�ʹ�ã��������ԣ�","shop.php");}
 updatetable("yjcode_user","shopname='".$t1."',seokey='".$t2."',seodes='".$s1."',txt='".sqlzhuru($_POST[content])."' where uid='".$_SESSION[SHOPUSER]."'");
 uploadtpnodata(1,"upload/".$userid."/","shop.jpg","allpic",124,124);
 php_toheader("shop.php?t=suc"); 
}

$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."' and shopzt=2";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("openshop3.php");}
$usertx="../upload/".$rowuser[id]."/shop.jpg";
if(!is_file($usertx)){$usertx="img/nonetx.gif";}else{$usertx=$usertx."?id=".rnd_num(1000);}
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
if((document.f1.t1.value).replace(/\s/,"")==""){alert("�������������");document.f1.t1.focus();return false;}	
if((document.f1.t2.value).replace(/\s/,"")==""){alert("��������Ӫ��Ʒ");document.f1.t2.focus();return false;}	
if((document.f1.s1.value).replace(/\s/,"")==""){alert("��������̼�Ҫ����");document.f1.s1.focus();return false;}	
tjwait();
f1.action="shop.php";
}
</script>

<script type="text/javascript" charset="gbk" src="../config/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/unit.js"></script>

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
 <? include("rcap4.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>
 <? systs("��ϲ���������ɹ�!","shop.php")?>
 <form name="f1" method="post" onsubmit="return tj()" enctype="multipart/form-data">
 <input type="hidden" value="shop" name="jvs" />
 <ul class="uk">
 <li class="l1">�������ƣ�</li>
 <li class="l2"><input type="text" class="inp" value="<?=$rowuser[shopname]?>" name="t1" /></li>
 <li class="l1">����LOGO��</li>
 <li class="l2"><input type="file" name="inp1" id="inp1" size="25"> ��ѳߴ磺124*124</li>
 <li class="l5"></li>
 <li class="l6"><img src="<?=$usertx?>" width="100" height="100" /></li>
 <li class="l1">��Ӫ��Ʒ��</li>
 <li class="l2"><input type="text" class="inp" value="<?=$rowuser[seokey]?>" name="t2" size="60" /></li>
 <li class="l9">���̼�Ҫ������</li>
 <li class="l10"><textarea name="s1"><?=$rowuser[seodes]?></textarea></li>
 <li class="l7">��ϸ������</li>
 <li class="l8"><script id="editor" name="content" type="text/plain" style="width:640px;height:290px;"><?=$rowuser[txt]?></script></li>
 <li class="l3"></li>
 <li class="l4"><?=tjbtnr("�����޸�")?></li>
 </ul>
 </form>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
<script type="text/javascript">
//ʵ�����༭��
var ue = UE.getEditor('editor');
</script>
</body>
</html>