<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();

while3("uid,money1,baozj","yjcode_user where uid='".$_SESSION[SHOPUSER]."'");$row3=mysql_fetch_array($res3);
$baozj=$row3[baozj];
$money1=$row3[money1];

//B
if($_GET[control]=="update"){
 $id=$_GET[id];
 if($money1<$_POST[tbaozj]){Audit_alert("���㣬���ȳ�ֵ��","pay.php?m=".($_POST[tbaozj]-$money1));}
 updatetable("yjcode_user","baozj=baozj+".$_POST[tbaozj].",money1=money1-".$_POST[tbaozj]." where uid='".$_SESSION[SHOPUSER]."'"); 
 php_toheader("baozj.php?t=suc");
 
}
//E

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
nid=0;
function anumonc(x,y,z){
 nid=z;
 ax=parseInt($("allnum").innerHTML);
 for(i=1;i<=ax;i++){
 if($("anum"+i)){$("anum"+i).className="s3";}
 }
 $("anum"+x).className="s3 s32";
 document.getElementById("allmoney").innerHTML=y;
}

function tj(){
if((document.f1.tbaozj.value).replace(/\s/,"")==""){alert("�����뱣֤������");document.f1.tbaozj.focus();return false;}	
 if(confirm("��֤����ý�ֱ�Ӵ���������п۳���ȷ����?")){}else{return false;}
 tjwait();
 f1.action="baozj.php?ty=<?=$ty?>&control=update&id="+nid;
}
</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ���ɱ�֤��</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? systs("��ϲ���������ɹ�!","baozj.php")?>
 <form name="f1" method="post" onsubmit="return tj()">
 <span id="allnum" style="display:none"><?=$i?></span>
   
 <ul class="uk">
 <li class="l1">���ɱ�֤��</li>
 <li class="l2"><input type="text" class="inp" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" name="tbaozj" /></li>
 <li class="l1">�ܼƱ�֤��</li>
 <li class="l21"><input type="text" class="inp" disabled="disabled" value="<?=$baozj?>"/>&nbsp;&nbsp;[<a href="jbaozj.php" class="red"><strong>��&nbsp;��</strong></a>]</li>
 <li class="l1">������</li>
 <li class="l21"><?=$money1?>Ԫ  [<a href="pay.php" class="red"><strong>��ֵ</strong></a>]</li>
 <li class="l1">��֤��˵����</li>
 <li class="l21"><?=$rowcontrol[bzjsm]?></li>
 <li class="l3"></li>
 <li class="l4"><? tjbtnr("����")?></li>
 </form>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>