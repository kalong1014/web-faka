<?php
include("../config/conn.php");
include("../config/function.php");
include("../config/tpclass.php");
AdminSes_audit();
$id=$_GET[id];
while0("*","yjcode_user where id=".$id);if(!$row=mysql_fetch_array($res)){php_toheader("userlist.php");}

//������ʼ
if($_GET[control]=="update"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0701,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 $shopzt=sqlzhuru($_POST[R1]);
 if(3==$shopzt){$ses="openshop=0,";PointUpdateM($row[id],$row[openshop]);PointIntoM($row[id],"�������뱻�ܣ������˻�",$row[openshop]);}
 updatetable("yjcode_user",$ses."
			 shopname='".sqlzhuru($_POST[tshopname])."',
			 seokey='".sqlzhuru($_POST[tseokey])."',
			 seodes='".sqlzhuru($_POST[tseodes])."',
			 txt='".sqlzhuru($_POST[content])."',
			 pm=".sqlzhuru($_POST[tpm]).",
			 djl=".sqlzhuru($_POST[tdjl]).",
			 shopzt=".$shopzt.",
			 shopztsm='".sqlzhuru($_POST[tshopztsm])."',
			 sellbl=".sqlzhuru($_POST[tsellbl]).",
			 xinyong=".sqlzhuru($_POST[txinyong])." 
			 where id=".$id);
 uploadtpnodata(1,"upload/".$id."/","shop.jpg","allpic",124,124);
 php_toheader("shop.php?t=suc&id=".$id);
}
//�������
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
 if((document.f1.tshopname.value).replace("/\s/","")==""){alert("�������������");document.f1.tshopname.focus();return false;}
 tjwait();
 f1.action="shop.php?control=update&id=<?=$id?>";
}
function shopztonc(x){
 if(3==x){$("shopztv").style.display="";}else{$("shopztv").style.display="none";}
}
</script>

<script type="text/javascript" charset="gbk" src="../config/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/unit.js"></script>

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
 <li class="l1">��ǰλ�ã���̨��ҳ - ��Ա���� - �������� - <strong><?=$row[uid]?></strong></li><li class="l2"></li>
 </ul>
 <? include("rightcap3.php");?>
 <script language="javascript">$("rtit2").className="l1";</script>
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","shop.php?id=".$id);}?>
 <!--B-->
 <form name="f1" method="post" onsubmit="return tj()" enctype="multipart/form-data">
 <ul class="uk">
 <li class="l1">�������״̬��</li>
 <li class="l21"><strong><?=returnshopztv($row[shopzt])?></strong></li>
 <li class="l1"><span class="red">*</span> �������ƣ�</li>
 <li class="l2"><input type="text" size="30" value="<?=$row[shopname]?>" class="inp" name="tshopname" /></li>
 <li class="l1">����LOGO��</li>
 <li class="l2"><input type="file" name="inp1" id="inp1" size="15" accept=".jpg,.gif,.jpeg,.png"></li>
 <li class="l8"></li>
 <li class="l9"><img src="../upload/<?=$id?>/shop.jpg?t=<?=rnd_num(100)?>" width="54" height="54" /></li>
 <li class="l1">���̹ؼ��ʣ�</li>
 <li class="l2"><input  name="tseokey" value="<?=$row[seokey]?>" size="60" type="text" class="inp" /></li>
 <li class="l4">��Ҫ������</li>
 <li class="l5"><textarea name="tseodes"><?=$row[seodes]?></textarea></li>
 <li class="l10"><span class="red">*</span> ��ϸ������</li>
 <li class="l11"><script id="editor" name="content" type="text/plain" style="width:710px;height:330px;"><?=$row[txt]?></script></li>
 </ul>
 
 <ul class="rightcap">
 <li class="l1 red">�������</li>
 </ul>
 <ul class="uk">
 <li class="l1 red">�������������</li>
 <li class="l2">
 <input name="tsellbl" value="<?=$row[sellbl]?>" size="5" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" />
 <span class="hui">���׳ɹ������ҿɻ�õĽ����� <span class="red">1��ʾȫ�����ң�0.9��ʾ90%�����ң�0.5��ʾ50%������</span>����������</span>
 </li>
 <li class="l1">�Ƽ�������</li>
 <li class="l2"><input type="text" size="5" value="<?=$row[pm]?>" class="inp" name="tpm" /> 0��ʾ���Ƽ�����֮��С��������</li>
 <li class="l1">�������ã�</li>
 <li class="l2"><input type="text" size="5" value="<?=returnjgdw($row[xinyong],"",0)?>" class="inp" name="txinyong" /> 0��ʾ��ȡ��������ֵ����֮��ȡ��ֵ</li>
 <li class="l1">���̵���ʣ�</li>
 <li class="l2"><input type="text" size="5" value="<?=$row[djl]?>" class="inp" name="tdjl" /></li>
 <li class="l1">������ˣ�</li>
 <li class="l2">
 <span class="finp">
 <input name="R1" type="radio" onclick="shopztonc(0)" value="0"<? if(0==$row[shopzt]){?> checked="checked"<? }?> />δ�ύ����
 <input name="R1" type="radio" onclick="shopztonc(0)" value="1"<? if(1==$row[shopzt]){?> checked="checked"<? }?> />�������
 <input name="R1" type="radio" onclick="shopztonc(0)" value="2"<? if(2==$row[shopzt]){?> checked="checked"<? }?> />��������
 <input name="R1" type="radio" onclick="shopztonc(3)" value="3"<? if(3==$row[shopzt]){?> checked="checked"<? }?> />�ܾ�����
 </span>
 </li>
 </ul>
 <ul class="uk" id="shopztv" style="display:none;">
 <li class="l1">�ر�˵����</li>
 <li class="l21 red">����ܾ����룬���Ա���ɵķ��ý��˻������Ա�ʺ��С�ͨ�����룬�����Զ��۷ѡ���������ظò���</li>
 <li class="l1">����ԭ��</li>
 <li class="l2"><input type="text" class="inp" name="tshopztsm" size="90" value="<?=$row[shopztsm]?>" /></li>
 </ul>
 <ul class="uk">
 <li class="l3"><? tjbtnr("��һ��","userlist.php")?></li>
 </ul>
 </form>
 <script language="javascript">
 shopztonc(<?=$row[shopzt]?>);
 </script>

 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
<script type="text/javascript">
//ʵ�����༭��
var ue = UE.getEditor('editor');
</script>
</body>
</html>