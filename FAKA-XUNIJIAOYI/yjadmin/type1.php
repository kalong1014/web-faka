<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$sj=date("Y-m-d H:i:s");

//������ʼ
if($_GET[control]=="add"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 if(panduan("*","yjcode_type where admin=1 and type1='".sqlzhuru($_POST[t1])."'")==1){Audit_alert("�÷����Ѵ��ڣ�","type1.php");}
 intotable("yjcode_type","admin,type1,xh,sj,col,iftj","1,'".sqlzhuru($_POST[t1])."',".sqlzhuru($_POST[t2]).",'".$sj."','".sqlzhuru($_POST[tcol])."',".sqlzhuru($_POST[R1])."");$id=mysql_insert_id();
 php_toheader("type1.php?t=suc");
 
}elseif($_GET[control]=="update"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 if(panduan("*","yjcode_type where admin=1 and type1='".sqlzhuru($_POST[t1])."' and id<>".$_GET[id])==1)
 {Audit_alert("�÷����Ѵ��ڣ�","type1.php?action=update&id=".$_GET[id]);}
 updatetable("yjcode_type","type1='".sqlzhuru($_POST[t1])."' where type1='".sqlzhuru($_POST[oldty1])."'");
 updatetable("yjcode_type","sj='".$sj."',xh=".sqlzhuru($_POST[t2]).",col='".sqlzhuru($_POST[tcol])."',iftj=".sqlzhuru($_POST[R1])." where id=".$_GET[id]);
 php_toheader("type1.php?t=suc&action=update&id=".$_GET[id]);

}
//�������

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>�����̨</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu1").className="l11";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0302,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_quanju.html");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz"><li class="l1">��ǰλ�ã�<a href="./" class="a2">��̨��ҳ</a> - <strong>��Ʒ����</strong> [<a href="typelist.php">����</a>]</li><li class="l2"></li></ul>
 
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","type1.php?action=".$_GET[action]."&id=".$_GET[id]);}?>
 
 <!--begin-->
 <? if($_GET[action]!="update"){?>
 <script language="javascript">
 function tj(){
 if((document.f1.t1.value).replace(/\s/,"")==""){alert("���������ƣ�");document.f1.t1.focus();return false;}
 if((document.f1.t2.value).replace(/\s/,"")=="" || isNaN(document.f1.t2.value)){alert("��������Ч������ţ�");document.f1.t2.focus();return false;}
 tjwait();
 f1.action="type1.php?control=add";
 }
 </script>
 <form name="f1" method="post" onsubmit="return tj()" enctype="multipart/form-data">
 <ul class="uk">
 <li class="l1">�������ƣ�</li>
 <li class="l2"><input type="text" class="inp" name="t1" onfocus="inpf(this)" onblur="inpb(this)" /></li>
 <li class="l1">�Ƿ��Ƽ���</li>
 <li class="l2">
 <span class="finp">
 <input name="R1" type="radio" checked="checked" value="0" />�Ƽ�
 <input name="R1" type="radio" value="1" />���Ƽ�
 </span>
 </li>
 <li class="l1">��ɫֵ��</li>
 <li class="l2"><input type="text" class="inp" name="tcol" value="#333" onfocus="inpf(this)" onblur="inpb(this)" /> <a href="http://www.yj99.cn/faq/view38.html" target="_blank">ʲô����ɫֵ��</a></li>
 <li class="l1">����</li>
 <li class="l2"><input type="text" class="inp" name="t2" onfocus="inpf(this)" onblur="inpb(this)" value="<?=returnxh("yjcode_type"," and admin=1")?>" /> <span class="hui">���ԽС��Խ��ǰ</span></li>
 <li class="l3"><? tjbtnr("�����޸�","typelist.php");?></li>
 </ul>
 </form>
 
 <? 
 }elseif($_GET[action]=="update"){
 while0("*","yjcode_type where admin=1 and id=".$_GET[id]);if(!$row=mysql_fetch_array($res)){php_toheader("jiajctypelist.php");}
 ?>
 <script language="javascript">
 function tj(){
 if((document.f1.t1.value).replace(/\s/,"")==""){alert("���������ƣ�");document.f1.t1.focus();return false;}
 if((document.f1.t2.value).replace(/\s/,"")=="" || isNaN(document.f1.t2.value)){alert("��������Ч������ţ�");document.f1.t2.focus();return false;}
 tjwait();
 f1.action="type1.php?control=update&id=<?=$row[id]?>";
 }
 </script>
 <form name="f1" method="post" onsubmit="return tj()" enctype="multipart/form-data">
 <input type="hidden" value="<?=$row[type1]?>" name="oldty1" />
 <ul class="uk">
 <li class="l1">�������ƣ�</li>
 <li class="l2"><input type="text" value="<?=$row[type1]?>" class="inp" name="t1" onfocus="inpf(this)" onblur="inpb(this)" /></li>
 <li class="l1">�Ƿ��Ƽ���</li>
 <li class="l2">
 <span class="finp">
 <input name="R1" type="radio"<? if(empty($row[iftj])){?> checked="checked"<? }?> value="0" />�Ƽ�
 <input name="R1" type="radio"<? if($row[iftj]==1){?> checked="checked"<? }?> value="1" />���Ƽ�
 </span>
 </li>
 <li class="l1">��ɫֵ��</li>
 <li class="l2"><input type="text" value="<?=$row[col]?>" class="inp" name="tcol" onfocus="inpf(this)" onblur="inpb(this)" /> <a href="http://www.yj99.cn/faq/view38.html" target="_blank">ʲô����ɫֵ��</a></li>
 <li class="l1">����</li>
 <li class="l2"><input type="text" class="inp" name="t2" onfocus="inpf(this)" onblur="inpb(this)" value="<?=$row[xh]?>" /> <span class="hui">���ԽС��Խ��ǰ</span></li>
 <li class="l3"><? tjbtnr("�����޸�","typelist.php");?></li>
 </ul>
 </form>
 
 <? }?>
 <!--end-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>