<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$id=$_GET[id];
$userid=returnuserid($_SESSION[SHOPUSER]);
while0("*","yjcode_task where id=".$id." and userid=".$userid);if(!$row=mysql_fetch_array($res)){php_toheader("tasklist.php");}

if($_GET[control]=="add"){
 $money1=$_POST[tmoney1];if(!is_numeric($money1)){$money1=0;}
 if(empty($rowcontrol[taskok])){$zt=1;}else{$zt=0;}
 updatetable("yjcode_task","tit='".sqlzhuru($_POST[ttit])."',txt='".sqlzhuru($_POST[content])."',type1id=".$_POST[d1].",money1=".$money1.",uqq='".sqlzhuru($_POST[tuqq])."',zt=".$zt.",endsj='".$_POST[tendsj]."' where userid=".$userid." and id=".$id);
 php_toheader("task.php?t=suc&id=".$id);
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
<script type="text/javascript" charset="utf-8" src="../ckeditor/kindeditor.js"></script>
<script type="text/javascript">
KE.show({
      id : 'content',
       resizeMode : 1,
       cssPath : '../ckeditor/examples/index.css',
       items : [
       'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
       'removeformat', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
       'insertunorderedlist']
});
function tj(){
 if((document.f1.ttit.value).replace(/\s/,"")==""){alert("���������");document.f1.ttit.focus();return false;}	
 if((document.f1.tmoney1.value).replace(/\s/,"")==""){alert("������Ԥ��");document.f1.tmoney1.focus();return false;}	
 if((document.f1.tendsj.value).replace(/\s/,"")==""){alert("������QQ����");document.f1.tendsj.focus();return false;}
 if((document.f1.tuqq.value).replace(/\s/,"")==""){alert("������QQ����");document.f1.tuqq.focus();return false;}
 tjwait();
 f1.action="task.php?control=add&id=<?=$id?>";
}
</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > �������</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <? include("rcap9.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>
 <? systs("��ϲ���������ɹ�!","task.php?id=".$id)?>
 
 <!--B-->
 <form name="f1" method="post" onsubmit="return tj()">
 <ul class="uk">
 <li class="l1">���״̬��</li>
 <li class="l21"><?=returnztv($row[zt])?></li>
 <li class="l1"><span class="red">*</span> ���ڷ��飺</li>
 <li class="l2">
 <select name="d1">
 <option value="0">==����==</option>
 <? while1("*","yjcode_tasktype order by xh asc");while($row1=mysql_fetch_array($res1)){?>
 <option value="<?=$row1[id]?>"<? if($row1[id]==$row[type1id]){?> selected="selected"<? }?>><?=$row1[name1]?></option>
 <? }?>
 </select>
 </li>
 <li class="l1"><span class="red">*</span> �������⣺</li>
 <li class="l2"><input type="text" size="80" value="<?=$row[tit]?>" class="inp" name="ttit" /></li>
 <li class="l1"><span class="red">*</span> Ԥ����ã�</li>
 <li class="l2"><input type="text" size="20" value="<?=$row[money1]?>" class="inp" name="tmoney1" /></li>
 <li class="l1"><span class="red">*</span> ��ֹʱ�䣺</li>
 <li class="l2"><input type="text" size="20" value="<?=$row[endsj]?>" class="inp" name="tendsj" /></li>
 <li class="l1"><span class="red">*</span> ��ϵQQ��</li>
 <li class="l2"><input type="text" size="20" value="<?=$row[uqq]?>" class="inp" name="tuqq" /></li>
 <li class="l7">��ϸ���ݣ�</li>
 <li class="l8"><textarea id="content" name="content" style="width:640px;height:450px;visibility:hidden;"><?=$row[txt]?></textarea></li>
 <li class="l3"></li>
 <li class="l4"><? tjbtnr("��һ��","tasklist.php")?></li>
 </ul>
 </form>
 <!--E-->

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>