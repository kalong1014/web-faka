<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$bh=$_GET[bh];
while0("*","yjcode_pro where bh='".$bh."'");if(!$row=mysql_fetch_array($res)){php_toheader("productlist.php");}
//������ʼ
if($_GET[control]=="add"){
 zwzr();
 if($_POST[Rtjfs]=="one"){
  if(panduan("probh,userid,ka","yjcode_kc where probh='".$bh."' and ka='".sqlzhuru($_POST[tka])."'")==1){
  Audit_alert("�����Ѵ��ڣ����ʧ��!","kc.php?bh=".$bh);
  }
  intotable("yjcode_kc","probh,userid,ka,mi,ifok","'".$bh."',".$row[userid].",'".sqlzhuru($_POST[tka])."','".sqlzhuru($_POST[tmi])."',0");
 
 }else{
  $up1=$_FILES["inp1"]["name"];
  if(!empty($up1)){
  $hz=returnhz($up1);
  if($hz!="xls"){Audit_alert("ʧ��.ֻ���ϴ�����.xls��׺���ļ�����������","kc.php?bh=".$bh);}
  $mu="../upload/".$row[userid]."/";
  inp_tp_upload(1,$mu,$bh,"xls");
  //���뿪ʼ
  require_once '../config/Excel/reader.php';
  $data = new Spreadsheet_Excel_Reader();
  $data->setOutputEncoding('CP936');
  $data->read($mu.$bh.".xls");
  error_reporting(E_ALL ^ E_NOTICE);
  for ($i = 1; $i <= $data->sheets[0]['numRows']; $i++) {
  $ka= $data->sheets[0]['cells'][$i][1]."";
  $mi= $data->sheets[0]['cells'][$i][2]."";
   if(panduan("probh,userid,ka","yjcode_kc where probh='".$bh."' and ka='".$ka."' and userid=".$row[userid])==0){
   intotable("yjcode_kc","probh,userid,ka,mi,ifok","'".$bh."',".$row[userid].",'".$ka."','".$mi."',0");
   }
  }
  //�������
  delFile($mu.$bh.".xls");
  }
 }
 kamikc($bh);
 php_toheader("kc.php?t=suc&bh=".$bh);
 
}elseif($_GET[control]=="update"){
 zwzr();
 $id=$_GET[id];
 if(panduan("id,probh,userid,ka","yjcode_kc where probh='".$bh."' and ka='".sqlzhuru($_POST[tka])."' and id<>".$id." and userid=".$row[userid])==1){
 Audit_alert("�����Ѵ��ڣ�����ʧ��!","kc.php?bh=".$bh."&action=update&id=".$id);}
 updatetable("yjcode_kc","ka='".sqlzhuru($_POST[tka])."',mi='".sqlzhuru($_POST[tmi])."',ifok=".sqlzhuru($_POST[Rifok])." where id=".$id);
 kamikc($bh);
 php_toheader("kc.php?t=suc&bh=".$bh."&action=update&id=".$id);

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
function tjfsonc(x){
$("tjfs1").style.display="none";
$("tjfs2").style.display="none";
$("tjfs"+x).style.display="";
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu3").className="l31";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0102,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_product.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>������</strong></li><li class="l2"></li>
 </ul>
 <!--B-->
 <? systs("��ϲ���������ɹ�!","kc.php?id=".$_GET[id]."&bh=".$bh."&action=".$_GET[action])?>
 <? if($_GET[action]==""){?>
 <script language="javascript">
 function tj(){
  tjwait();
  f1.action="kc.php?control=add&bh=<?=$bh?>"; 
 }
 </script>
 <form name="f1" method="post" onsubmit="return tj()" enctype="multipart/form-data">
 <ul class="uk">
 <li class="l1">��ӷ�ʽ��</li>
 <li class="l2">
 <span class="finp">
 <input name="Rtjfs" type="radio" value="one" onclick="tjfsonc(1)" checked="checked" /> ��һ��� &nbsp;&nbsp;
 <input name="Rtjfs" type="radio" value="more" onclick="tjfsonc(2)" /> �����ϴ�
 </span>
 </li>
 </ul>
 
 <ul class="uk" id="tjfs1">
 <li class="l1">���ţ�</li>
 <li class="l2"><input type="text" class="inp" size="30" name="tka" /></li>
 <li class="l1">���룺</li>
 <li class="l2"><input type="text" class="inp" size="30" name="tmi" /></li>
 </ul>
 
 <ul class="uk" id="tjfs2" style="display:none;">
 <li class="l1">ѡ���ļ���</li>
 <li class="l2"><input type="file" name="inp1" id="inp1" size="25"></li>
 <li class="l1"></li>
 <li class="l21">�ϴ���ʽΪxls�ļ�����excel��������Զ�ʶ�𣬵����뱣֤���Ϲ���<strong class="red">��һ��Ϊ���ţ��ڶ���Ϊ����</strong>������ͼ</li>
 <li class="l8"></li>
 <li class="l9">
 <img src="img/xls.gif" width="270" height="76" />
 </li>
 </ul>
 
 <ul class="uk">
 <li class="l3"><? tjbtnr("����","kclist.php?bh=".$bh)?></li>
 </ul>
 </form>
 
 <?
 }else{
 while0("*","yjcode_kc where id=".$_GET[id]);if(!$row=mysql_fetch_array($res)){php_toheader("kclist.php?bh=".$bh);}
 ?>
 <script language="javascript">
 function tj(){
  tjwait();
  f1.action="kc.php?control=update&bh=<?=$bh?>&id=<?=$_GET[id]?>"; 
 }
 </script>
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="inf" name="jvs" />
 <ul class="uk">
 <li class="l1">���ţ�</li>
 <li class="l2"><input type="text" class="inp" size="30" value="<?=$row[ka]?>" name="tka" /></li>
 <li class="l1">���룺</li>
 <li class="l2"><input type="text" class="inp" size="30" value="<?=$row[mi]?>" name="tmi" /></li>
 <li class="l1">ʹ�������</li>
 <li class="l2">
 <span class="finp">
 <input name="Rifok" type="radio" value="0"<? if(empty($row[ifok])){?> checked="checked"<? }?> /> δʹ�� &nbsp;&nbsp;
 <input name="Rifok" type="radio" value="1"<? if(1==$row[ifok]){?> checked="checked"<? }?> /> ��ʹ��
 </span>
 </li>
 <li class="l3"><? tjbtnr("����","kclist.php?bh=".$bh)?></li>
 </ul>
 </form>
 
 <? }?>
 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>