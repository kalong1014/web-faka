<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
if($_GET[control]=="add"){
 zwzr();
 $sj=date("Y-m-d H:i:s");
 $userid=returnuserid($_SESSION["SHOPUSER"]);
 $endsj=date("Y-m-d H:i:s",strtotime("+".$_POST[d2]." day"));
 $money1=$_POST[t2];if(!is_numeric($money1)){$money1=0;}
 $bh=time()."task".$userid;
 if(empty($rowcontrol[taskok])){$zt=1;}else{$zt=0;}
 intotable("yjcode_task","bh,userid,sj,zt,tit,txt,endsj,type1id,money1,ifok,djl,uqq","'".$bh."',".$userid.",'".$sj."',".$zt.",'".sqlzhuru($_POST[t1])."','".sqlzhuru($_POST[content])."','".$endsj."',".sqlzhuru($_POST[d1]).",".$money1.",0,0,'".sqlzhuru($_POST[t5])."'");
 php_toheader("../user/tasklist.php");
}
?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�������� - <?=webname?></title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<link href="index.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/basic.js"></script>
<script language="javascript" src="index.js"></script>
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
 if((document.f1.t1.value).replace(/\s/,"")==""){alert("���������");document.f1.t1.focus();return false;}	
 if((document.f1.t2.value).replace(/\s/,"")==""){alert("������Ԥ��");document.f1.t2.focus();return false;}	
 if((document.f1.t5.value).replace(/\s/,"")==""){alert("������QQ����");document.f1.t5.focus();return false;}
 tjwait();
 f1.action="taskadd.php?control=add";
}
</script>
</head>
<body>
<? include("../tem/top.html");?>
<? include("../tem/top1.html");?>
<div class="yjcode">
 <div class="dqwz">
 <ul class="u1">
 <li class="l1">��ǰλ�ã�<a href="<?=weburl?>">��ҳ</a> > <a href="./">�������</a> > ����������</li></ul>
 </div>
 
 <div class="tleft">
  <form name="f1" method="post" onSubmit="return tj()">
  <ul class="u1">
  <li class="l1">һ�仰������������</li>
  <li class="l2"><input type="text" class="inp inp1" style="width:740px;" name="t1" /></li>
  <li class="l1">������˵����ϸЩ</li>
  <li class="l3"><textarea id="content" name="content" style="width:740px;height:200px;visibility:hidden;"></textarea></li>
  <li class="l4">Ԥ�����</li>
  <li class="l4">��ϵQQ</li>
  <li class="l5"><input type="text" class="inp inp2" style="width:200px;" name="t2" /></li>
  <li class="l5"><input type="text" class="inp inp5" style="width:200px;" name="t5" /></li>
  <li class="l4">�������</li>
  <li class="l4">������Ч����</li>
  <li class="l5">
  <select name="d1">
  <option value="0">==����==</option>
  <? while1("*","yjcode_tasktype order by xh asc");while($row1=mysql_fetch_array($res1)){?>
  <option value="<?=$row1[id]?>"><?=$row1[name1]?></option>
  <? }?>
  </select>
  </li>
  <li class="l5">
  <select name="d2">
  <option value="7">7��</option>
  <option value="15">15��</option>
  <option value="30">30��</option>
  <option value="90">90��</option>
  <option value="365">365��</option>
  </select>
  </li>
  <li class="l6"><? tjbtnr("�ύ����")?></li>
  </ul>
  </form>
 </div>
 
  <div class="xqright">
   <h2><?=webname?>Ϊ����ŵ</h2>
   <ul class="u1">
   <li class="l1">�̼�100%�ϸ������֤</li>
   <li class="l2">��Ʒ�����⣬ȫ���˿�</li>
   <li class="l3">ƽ̨��������������</li>
   <li class="l4">�ṩרҵ�ۺ���񣬷��Ĺ���</li>
   </ul>
   <h3>���ᷢ����</h3>
   <div class="tel">ȫ��ͳһ��������<br><strong><?=$rowcontrol[webtelv]?></strong></div>
  </div>

</div>
<? include("../tem/bottom.html");?>
</body>
</html>