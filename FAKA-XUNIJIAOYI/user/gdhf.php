<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION[SHOPUSER]);
$bh=$_GET[bh];
while0("*","yjcode_gd where userid=".$userid." and bh='".$bh."'");if(!$row=mysql_fetch_array($res)){php_toheader("gdlist.php");}

//������ʼ
if($_GET[control]=="add"){
 zwzr();
 $txt=sqlzhuru($_POST[content]);
 $sj=date("Y-m-d H:i:s");
 if(!empty($txt)){
 if($row[gdzt]!=4){
 intotable("yjcode_gdhf","userid,gdbh,admin,txt,sj,zt","".$row[userid].",'".$bh."',2,'".$txt."','".$sj."',0");
 }
 }
 updatetable("yjcode_gd","gdzt=1 where id=".$id);
 php_toheader("gdhf.php?t=suc&bh=".$bh);

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
f1.action="gdhf.php?bh=<?=$bh?>&control=add";
}
</script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > <a href="gdlist.php">�����б�</a> > ��ͨ��¼</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? include("rcap12.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>

 <ul class="uk">
 <li class="l1">����״̬��</li>
 <li class="l21"><?=returngdzt($row[gdzt])?></li>
 </ul>

 <div class="gdhflist">
  <div class="cap">&nbsp;&nbsp;��ͨ��¼</div>
  <ul class="u1">
  <li class="l1"><img src="../upload/<?=$row[userid]?>/user.jpg" width="40" height="40" /></li>
  <li class="l2"><?=$row[txt]?><br><?=$row[sj]?></li>
  </ul>
  <? 
  while1("*","yjcode_gdhf where gdbh='".$bh."' and zt=0 order by sj asc");while($row1=mysql_fetch_array($res1)){
  $txt=$row1[txt];
  $tp="../upload/".$row1[userid]."/user.jpg";
  if($row1[admin]==1){$txt="<strong>".$txt."</strong>";$tp="img/nonetx.jpg";}
  ?>
  <ul class="u1">
  <li class="l1"><img src="<?=$tp?>" width="40" height="40" /></li>
  <li class="l2"><?=$txt?><br><?=$row1[sj]?></li>
  </ul>
  <? }?>
 
  <? if($row[gdzt]!=4){?>
  <form name="f1" method="post" onsubmit="return tj()">
  <ul class="uk">
  <li class="l7">�ظ����ݣ�</li>
  <li class="l8"><textarea id="content" name="content" style="width:600px;height:440px;visibility:hidden;"></textarea></li>
  <li class="l3"></li>
  <li class="l4"><? tjbtnr("��һ��","gdlist.php")?></li>
  </ul>
  </form>
  <? }?>

 </div>
 
</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>