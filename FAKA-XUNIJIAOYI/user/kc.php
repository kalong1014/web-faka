<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
if(empty($_SESSION[SAFEPWD])){Audit_alert("卡密信息操作需要先进行安全码验证!","safepwd.php");}
$bh=$_GET[bh];
$userid=returnuserid($_SESSION[SHOPUSER]);
//函数开始
if($_GET[control]=="add"){
 zwzr();
 if($_POST[Rtjfs]=="one"){
  if(panduan("probh,userid,ka","yjcode_kc where probh='".$bh."' and ka='".sqlzhuru($_POST[tka])."' and userid=".$userid)==1){
  Audit_alert("卡号已存在，添加失败!","kc.php?bh=".$bh);
  }
  intotable("yjcode_kc","probh,userid,ka,mi,ifok","'".$bh."',".$userid.",'".sqlzhuru($_POST[tka])."','".sqlzhuru($_POST[tmi])."',0");
 
 }else{
  $up1=$_FILES["inp1"]["name"];
  if(!empty($up1)){
  $hz=returnhz($up1);
  if($hz!="xls"){Audit_alert("失败.只能上传导入.xls后缀的文件，返回重试","kc.php?bh=".$bh);}
  $mu="../upload/".$userid."/";
  inp_tp_upload(1,$mu,$bh,"xls");
  //导入开始
  require_once '../config/Excel/reader.php';
  $data = new Spreadsheet_Excel_Reader();
  $data->setOutputEncoding('CP936');
  $data->read($mu.$bh.".xls");
  error_reporting(E_ALL ^ E_NOTICE);
  for ($i = 1; $i <= $data->sheets[0]['numRows']; $i++) {
  $ka= $data->sheets[0]['cells'][$i][1]."";
  $mi= $data->sheets[0]['cells'][$i][2]."";
   if(panduan("probh,userid,ka","yjcode_kc where probh='".$bh."' and ka='".$ka."' and userid=".$userid)==0){
   intotable("yjcode_kc","probh,userid,ka,mi,ifok","'".$bh."',".$userid.",'".$ka."','".$mi."',0");
   }
  }
  //导入结束
  delFile($mu.$bh.".xls");
  }
 }
 kamikc($bh);
 php_toheader("kc.php?t=suc&bh=".$bh);
 
}elseif($_GET[control]=="update"){
 zwzr();
 $id=$_GET[id];
 if(panduan("id,probh,userid,ka","yjcode_kc where probh='".$bh."' and ka='".sqlzhuru($_POST[tka])."' and id<>".$id." and userid=".$userid)==1){
 Audit_alert("卡号已存在，保存失败!","kc.php?bh=".$bh."&action=update&id=".$id);}
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
<title>用户管理面板 - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
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
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 库存管理</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <? include("rcap10.php");?>
 <script language="javascript">
 $("rcap2").className="l1 l2";
 </script>

 <? while1("bh,userid,tit","yjcode_pro where bh='".$bh."' and userid=".$luserid);if(!$row1=mysql_fetch_array($res1)){php_toheader("productlist.php");}?>
 <div class="upfile">
 <ul class="uk">
 <li class="l1">商品标题：</li>
 <li class="l21"><a href="product.php?bh=<?=$bh?>"><?=$row1[tit]?></a></li>
 </ul> 
 </div>
 
 <? systs("恭喜您，操作成功!","kc.php?id=".$_GET[id]."&bh=".$bh."&action=".$_GET[action])?>

 <? if($_GET[action]==""){?>
 <script language="javascript">
 function tj(){
  tjwait();
  f1.action="kc.php?control=add&bh=<?=$bh?>"; 
 }
 </script>
 <form name="f1" method="post" onsubmit="return tj()" enctype="multipart/form-data">
 <input type="hidden" value="inf" name="jvs" />
 <ul class="uk">
 <li class="l1">添加方式：</li>
 <li class="l2">
 <span class="finp">
 <input name="Rtjfs" type="radio" value="one" onclick="tjfsonc(1)" checked="checked" /> 单一添加 &nbsp;&nbsp;
 <input name="Rtjfs" type="radio" value="more" onclick="tjfsonc(2)" /> 批量上传
 </span>
 </li>
 </ul>
 
 <ul class="uk" id="tjfs1">
 <li class="l1">卡号：</li>
 <li class="l2"><input type="text" class="inp" size="80" name="tka" /></li>
 <li class="l1">密码：</li>
 <li class="l2"><input type="text" class="inp" size="80" name="tmi" /></li>
 </ul>
 
 <ul class="uk" id="tjfs2" style="display:none;">
 <li class="l1">选择文件：</li>
 <li class="l2"><input type="file" name="inp1" id="inp1" size="25"></li>
 <li class="l5"></li>
 <li class="l6">
 上传格式为xls文件，即excel，程序会自动识别，但必须保证符合规则，<strong class="red">第一列为卡号，第二列为密码</strong>，如下图<br>
 <img src="img/xls.gif" width="270" height="76" style="margin:10px 0 0 0;" />
 </li>
 </ul>
 
 <ul class="uk">
 <li class="l3"></li>
 <li class="l4"><? tjbtnr("保存","kclist.php?bh=".$bh)?></li>
 </ul>
 </form>
 
 <?
 }else{
 while0("*","yjcode_kc where userid=".$luserid." and id=".$_GET[id]);if(!$row=mysql_fetch_array($res)){php_toheader("kclist.php?bh=".$bh);}
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
 <li class="l1">卡号：</li>
 <li class="l2"><input type="text" class="inp" size="80" value="<?=$row[ka]?>" name="tka" /></li>
 <li class="l1">密码：</li>
 <li class="l2"><input type="text" class="inp" size="80" value="<?=$row[mi]?>" name="tmi" /></li>
 <li class="l1">使用情况：</li>
 <li class="l2">
 <span class="finp">
 <input name="Rifok" type="radio" value="0"<? if(empty($row[ifok])){?> checked="checked"<? }?> /> 未使用 &nbsp;&nbsp;
 <input name="Rifok" type="radio" value="1"<? if(1==$row[ifok]){?> checked="checked"<? }?> /> 已使用
 </span>
 </li>
 <li class="l3"></li>
 <li class="l4"><? tjbtnr("保存","kclist.php?bh=".$bh)?></li>
 </ul>
 </form>
 
 <? }?>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>