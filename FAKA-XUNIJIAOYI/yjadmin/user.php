<?php
include("../config/conn.php");
include("../config/function.php");
require("../config/tpclass.php");
AdminSes_audit();
$id=$_GET[id];

//������ʼ
if($_GET[control]=="update"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0701,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 $nc=sqlzhuru($_POST[tnc]);if(empty($nc)){Audit_alert("�����·����Դ��","user.php");}
 $pwd=sqlzhuru($_POST[tpwd]);if(!empty($pwd)){$ses="pwd='".sha1($pwd)."',";}
 $zf=sqlzhuru($_POST[tzf]);if(!empty($zf)){$ses="zfmm='".sha1($zf)."',";}
 $refreshtimes=sqlzhuru($_POST["refreshtimes"]);
 if(empty($refreshtime)){$refreshtime=date('Y-m-d H:i:s');}
 updatetable("yjcode_user",$ses."
			 nc='".$nc."',
			 mot='".sqlzhuru($_POST[tmot])."',
			 ifmot=".$_GET[ifm].",
			 email='".sqlzhuru($_POST[temail])."',
			 ifemail=".$_GET[ife].",
			 uqq='".sqlzhuru($_POST[tuqq])."',
			 sxnum=".sqlzhuru($_POST[tsxnum]).",
			 weixin='".sqlzhuru($_POST[tweixin])."',
			 zt=".sqlzhuru($_POST[R1])."
			 where id=".$id);
 uploadtpnodata(1,"upload/".$id."/","user.jpg","allpic",124,124);
 php_toheader("user.php?t=suc&id=".$id);

}
//�������
while0("*","yjcode_user where id=".$id);if(!$row=mysql_fetch_array($res)){php_toheader("userlist.php");}
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
 if((document.f1.tnc.value).replace("/\s/","")==""){alert("�������ǳ�");document.f1.tnc.focus();return false;}
 c=document.getElementsByName("Cr2");if(c[0].checked){ife=1;}else{ife=0;}
 c=document.getElementsByName("Cr3");if(c[0].checked){ifm=1;}else{ifm=0;}
 tjwait();
 f1.action="user.php?control=update&id=<?=$id?>&ife="+ife+"&ifm="+ifm;
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu2").className="l21";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0702,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_user.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - ��Ա���� - <strong><?=$row[uid]?></strong></li><li class="l2"></li>
 </ul>
 <? include("rightcap3.php");?>
 <script language="javascript">$("rtit1").className="l1";</script>
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","user.php?id=".$id);}?>
 <!--B-->
 <form name="f1" method="post" onsubmit="return tj()" enctype="multipart/form-data">
 <ul class="uk">
 <li class="l1">��Ա�ʺţ�</li>
 <li class="l2"><input type="text" class="inp redony" readonly="readonly" name="tuid" size="20" value="<?=$row[uid]?>" /></li>
 <li class="l1">��Ա���룺</li>
 <li class="l2"><input type="text" size="20" class="inp" name="tpwd" /> ���ձ�ʾ���޸�</li>
 <li class="l1">֧�����룺</li>
 <li class="l2"><input type="text" size="20" class="inp" name="tzf" /> ���ձ�ʾ���޸�</li>
 
 <li class="l1">ʣ��ˢ������</li>
 <li class="l2"><input class="inp" name="tsxnum" value="<?=returnjgdw($row[sxnum],"",0)?>" size="5" type="text"/></li>
 
 <li class="l1"><span class="red">*</span> �ǳƣ�</li>
 <li class="l2"><input type="text" size="20" value="<?=$row[nc]?>" class="inp" name="tnc" /></li>
 <li class="l1">�����ַ��</li>
 <li class="l2">
 <input type="text" size="20" value="<?=$row["email"]?>" class="inp" name="temail" />
 <input name="Cr2" type="checkbox" value="1"<? if(1==$row[ifemail]){?> checked="checked"<? }?>/> ������
 </li>
 <li class="l1">�ֻ����룺</li>
 <li class="l2">
 <input type="text" size="20" value="<?=$row[mot]?>" class="inp" name="tmot" />
 <input name="Cr3" type="checkbox" value="1"<? if(1==$row[ifmot]){?> checked="checked"<? }?>/> ���ֻ�
 </li>
 <li class="l1">QQ���룺</li>
 <li class="l2"><input type="text" size="20" value="<?=$row[uqq]?>" class="inp" name="tuqq" /></li>
 <li class="l1">΢�ź��룺</li>
 <li class="l2"><input type="text" size="20" value="<?=$row[weixin]?>" class="inp" name="tweixin" /></li>
 <li class="l1">����ͷ��</li>
 <li class="l2"><input type="file" name="inp1" id="inp1" size="15" accept=".jpg,.gif,.jpeg,.png"></li>
 <li class="l8"></li>
 <li class="l9"><img src="../upload/<?=$id?>/user.jpg?t=<?=rnd_num(100)?>" width="54" height="54" /></li>
 </ul>
 
 <ul class="rightcap">
 <li class="l1 red">�������</li>
 </ul>
 <ul class="uk">
 <li class="l1">�Ƿ���ã�</li>
 <li class="l2">
 <span class="finp">
 <input name="R1" type="radio" value="1"<? if(1==$row[zt]){?> checked="checked"<? }?> /> ����
 <input name="R1" type="radio" value="0"<? if(0==$row[zt]){?> checked="checked"<? }?> /> ����
 </span>
 </li>
 <li class="l1">������</li>
 <li class="l2">
 <input class="inp redony" readonly="readonly" value="<?=$row[money1]?>" size="5" type="text"/> [<a href="usermoney.php?id=<?=$row[id]?>">�ı���</a>]
 </li>
 <li class="l1">���û��֣�</li>
 <li class="l2">
 <input class="inp redony" readonly="readonly" value="<?=$row[jf]?>" size="5" type="text"/> [<a href="userjf.php?id=<?=$row[id]?>">�ı����</a>]
 </li>
 <li class="l3"><? tjbtnr("��һ��","userlist.php")?></li>
 </ul>
 </form>


 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>