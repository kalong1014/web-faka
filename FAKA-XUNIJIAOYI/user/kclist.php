<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
if(empty($_SESSION[SAFEPWD])){Audit_alert("������Ϣ������Ҫ�Ƚ��а�ȫ����֤!","safepwd.php");}
$bh=$_GET[bh];
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
function ser(){
location.href="kclist.php?bh=<?=$bh?>&st1="+$("st1").value+"&st2="+$("st2").value+"&sd1="+$("sd1").value;
}
</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ������</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <? include("rcap10.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>

 <? while1("bh,userid,tit","yjcode_pro where bh='".$bh."' and userid=".$luserid);if(!$row1=mysql_fetch_array($res1)){php_toheader("productlist.php");}?>
 <div class="upfile">
 <ul class="uk">
 <li class="l1">��Ʒ���⣺</li>
 <li class="l21"><a href="product.php?bh=<?=$bh?>"><?=$row1[tit]?></a></li>
 </ul> 
 </div>

 <!--selB-->
 <ul class="psel">
 <li class="l1">ʹ�������</li>
 <li class="l2">
 <select id="sd1">
 <option value="">==����==</option>
 <option value="0"<? if(0==$_GET[sd1] && $_GET[sd1]!=""){?> selected="selected"<? }?>>δʹ��</option>
 <option value="1"<? if(1==$_GET[sd1]){?> selected="selected"<? }?>>��ʹ��</option>
 </select>
 </li>
 <li class="l1">���ţ�</li><li class="l2"><input value="<?=$_GET[st1]?>" type="text" id="st1" size="15" /></li>
 <li class="l1">���룺</li><li class="l2"><input value="<?=$_GET[st2]?>" type="text" id="st2" size="15" /></li>
 <li class="l3"><a href="javascript:ser()" class="a2">����</a><a href="kclist.php?bh=<?=$bh?>" class="a2">���</a></li>
 </ul>
 <!---selE-->

 <ul class="typecap">
 <li class="l1">&nbsp;&nbsp;&nbsp;����</li>
 <li class="l4">&nbsp;&nbsp;&nbsp;����</li>
 <li class="l4">״̬</li>
 <li class="l4">����ʱ��</li>
 </ul>
 <ul class="listcap1">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /> ȫѡ</li>
 <li class="l2">
 <a href="javascript:NcheckDEL(5,'yjcode_kc')" class="a2">ɾ��</a>
 <a href="javascript:gourl('kc.php?bh=<?=$bh?>')" class="a1">��ӿ���</a>
 </li>
 <li class="l3"></li>
 </ul>
  
 <?
 $ses=" where userid=".$luserid." and probh='".$bh."'";
 if($_GET[st1]!=""){$ses=$ses." and ka like '%".$_GET[st1]."%'";}
 if($_GET[st2]!=""){$ses=$ses." and mi like '%".$_GET[st2]."%'";}
 if($_GET[sd1]!=""){$ses=$ses." and ifok=".$_GET[sd1];}
 $page=$_GET["page"];if($page==""){$page=1;}else{$page=intval($_GET["page"]);}
 pagef($ses,30,"yjcode_kc","order by id asc");while($row=mysql_fetch_array($res)){
 ?>
 <ul class="typelist3" onmouseover="this.className='typelist3 typelist31';" onmouseout="this.className='typelist3';">
 <li class="l0"><input name="C1" type="checkbox" value="<?=$row[id]?>" /></li>
 <li class="l1"><strong><a href="kc.php?bh=<?=$bh?>&id=<?=$row[id]?>&action=update" title="<?=$row[ka]?>"><?=returntitdian($row[ka],36)?></a></strong></li>
 <li class="l4"><?=returntitdian($row[mi],24)?></li>
 <li class="l4"><? if(1==$row[ifok]){?><span class="red">��ʹ��</span><? }else{?><span class="blue">δʹ��</span><? }?></li>
 <li class="l4"><?=$row[sj]?></li>
 </ul>
 <? }?>

 <div class="npa">
 <?
 $nowurl="kclist.php";
 $nowwd="bh=".$bh."&st1=".$_GET[st1]."&st2=".$_GET[st2]."&sd1=".$_GET[sd1];
 require("page.html");
 ?>
 </div>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>