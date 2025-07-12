<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."' and shopzt=2";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("openshop3.php");}
$userid=$rowuser[id];
$bh=$_GET[bh];
while0("*","yjcode_pro where bh='".$bh."' and userid=".$userid);if(!$row=mysql_fetch_array($res)){php_toheader("productlist.php");}

//函数开始
if($_GET[control]=="update"){
 zwzr();
 $sj=date("Y-m-d H:i:s");
 $txt=sqlzhuru($_POST[content]);
 $tit=sqlzhuru($_POST[ttit]);
 $wkey=strgb2312(sqlzhuru($_POST[twkey]),0,240);
 $wdes=strgb2312(sqlzhuru($_POST[twdes]),0,240);
 $yhsj1=sqlzhuru($_POST[tyhsj1]);if(!empty($yhsj1)){$ses="yhsj1='".$yhsj1."',";}
 $yhsj2=sqlzhuru($_POST[tyhsj2]);if(!empty($yhsj1)){$ses=$ses."yhsj2='".$yhsj2."',";}
 $money1=sqlzhuru($_POST[tmoney1]);
 $money2=sqlzhuru($_POST[tmoney2]);
 $money3=sqlzhuru($_POST[tmoney3]);if(!is_numeric($money3)){$money3=0;}
 $kcnum=sqlzhuru($_POST[tkcnum]);if(!is_numeric($kcnum)){$kcnum=0;}
 if($money1<0 || $money2<0 || $money3<0){Audit_alert("girl let's make friends","productlist.php");}
 $fhxs=intval(sqlzhuru($_POST[Rfhxs]));
 if($rowcontrol[ifproduct]=="on"){$nzt=0;}else{$nzt=1;}
 updatetable("yjcode_pro",$ses."
			 mybh='".sqlzhuru($_POST[tmybh])."',
			 lastsj='".$sj."',
			 tysx='".sqlzhuru($_POST[tysx])."',
			 zt=".$nzt.",
			 tit='".$tit."',
			 wkey='".$wkey."',
			 wdes='".$wdes."',
			 txt='".$txt."',
			 kcnum=".$kcnum.", 
			 money1=".$money1.", 
			 money2=".$money2.",
			 money3=".$money3.",
			 yhxs=".sqlzhuru($_POST[Ryhxs]).",
			 yhsm='".sqlzhuru($_POST[tyhsm])."',
			 ifxj=".sqlzhuru($_POST[Rifxj]).",
			 fhxs=".$fhxs.",
			 wpurl='".sqlzhuru($_POST[twpurl])."',
			 wppwd='".sqlzhuru($_POST[twppwd])."',
			 ysweb='".sqlzhuru($_POST[tysweb])."'
			 where bh='".$bh."' and userid=".$userid);
 uploadtp($bh,"商品",$userid);
 //上传B
 if(3==$fhxs){
  $up1=$_FILES["inp1"]["name"];
  if(!empty($up1)){
  $mc=MakePassAll(15)."-".time()."-".$userid.".".returnhz($up1);
  $lj="../upload/".$userid."/".$bh."/";
  move_uploaded_file($_FILES["inp1"]['tmp_name'],$lj.$mc);
  delFile($lj.$row[upf]);
  updatetable("yjcode_pro","upf='".$mc."' where bh='".$bh."' and userid=".$userid);
  }
 }
 //上传E
 //卡密B
 if(4==$fhxs){
  $up1=$_FILES["inp2"]["name"];
  if(!empty($up1)){
  $hz=returnhz($up1);
  if($hz!="xls"){Audit_alert("失败.只能上传导入.xls后缀的文件，返回重试","product.php?bh=".$bh);}
  $mu="../upload/".$userid."/";
  inp_tp_upload(2,$mu,$bh,"xls");
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
  kamikc($bh);
 }
 //卡密E
 php_toheader("product.php?t=suc&bh=".$bh);

}
//函数结果

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
function tj(){
if((document.f1.ttit.value).replace(/\s/,"")==""){alert("请输入标题");document.f1.ttit.focus();return false;}
a=document.f1.tkcnum.value;if(a.replace("/\s/","")=="" || isNaN(a)){alert("请输入有效的库存");document.f1.tkcnum.focus();return false;}
a=document.f1.tmoney1.value;if(a.replace("/\s/","")=="" || isNaN(a)){alert("请输入有效的价格");document.f1.tmoney1.focus();return false;}
a=document.f1.tmoney2.value;if(a.replace("/\s/","")=="" || isNaN(a)){alert("请输入有效的价格");document.f1.tmoney2.focus();return false;}
cstr="xcf";
c=document.getElementsByName("Csx");
for(i=0;i<c.length;i++){if(c[i].checked==true){cstr=cstr+c[i].value+"xcf";}}
document.f1.tysx.value=cstr;
tjwait();
f1.action="product.php?bh=<?=$bh?>&control=update";
}

function yhxsonc(x){
if(1==x){document.getElementById("yhxsul").style.display="none";}	
else if(2==x){document.getElementById("yhxsul").style.display="";}	
}

function fhxsonc(x){
for(i=1;i<=4;i++){
d=document.getElementById("fhxs"+i);if(d){d.style.display="none";}
}
d=document.getElementById("fhxs"+x);if(d){d.style.display="";}
if(x==4){document.getElementById("kcuk").style.display="none";}else{document.getElementById("kcuk").style.display="";}
}
</script>
<script type="text/javascript" src="js/adddate.js" ></script> 
<script type="text/javascript" charset="gbk" src="../config/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/unit.js"></script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 商品编辑</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">

 <? include("rcap3.php");?>
 <script language="javascript">
 $("rcap2").className="l1 l2";
 </script>
 <? systs("恭喜您，操作成功!","product.php?bh=".$bh)?>

 <!--B-->
 <form name="f1" method="post" onsubmit="return tj()" enctype="multipart/form-data">
 <ul class="uk">
 <li class="l1"><span class="red">*</span> 所在分组：</li>
 <li class="l21"><strong><?=returntype(1,$row[ty1id])." - ".returntype(2,$row[ty2id])." - ".returntype(3,$row[ty3id])?></strong> [<a href="productlx.php?action=update&id=<?=$row[id]?>">修改</a>]</li>
 </ul>
 
 <div class="tysx">
 <input type="hidden" value="<?=$row[tysx]?>" name="tysx" />
 <? while1("*","yjcode_typesx where admin=1 and typeid=".$row[ty1id]." order by xh asc");while($row1=mysql_fetch_array($res1)){?>
 <ul class="uk1">
 <li class="l1"><?=$row1[name1]?>：</li>
 <li class="l21">
 <? while2("*","yjcode_typesx where admin=2 and name1='".$row1[name1]."' and typeid=".$row1[typeid]." order by xh asc");while($row2=mysql_fetch_array($res2)){?>
 <input name="Csx" type="checkbox" value="<?=$row2[id]?>"<? if(strstr($row[tysx],"xcf".$row2[id]."xcf")){?>checked="checked"<? }?> /> <?=$row2[name2]?>&nbsp;&nbsp;
 <? }?>
 </li>
 </ul>
 <? }?>
 </div>
 
 <ul class="uk">
 <li class="l1"><span class="red">*</span> 标题：</li>
 <li class="l2"><input type="text" size="80" value="<?=$row[tit]?>" class="inp" name="ttit" /></li>
 <li class="l1">上架/下架：</li>
 <li class="l2">
 <span class="finp">
 <input name="Rifxj" type="radio" value="0" <? if(0==$row[ifxj]){?>checked="checked"<? }?> /> 上架 
 <input name="Rifxj" type="radio" value="1" <? if(1==$row[ifxj]){?>checked="checked"<? }?> /> 下架 
 </span>
 </ul>
 <ul class="uk">
 <li class="l1">更新时间：</li>
 <li class="l2"><input class="inp" name="tlastsj" value="<?=$row[lastsj]?>" size="20" type="text"/> 
 <li class="l1">演示网址：</li>
 <li class="l2"><input type="text" size="80" value="<?=$row[ysweb]?>" class="inp" name="tysweb" /></li>
 <li class="l1">自定义编码：</li>
 <li class="l2"><input type="text" size="10" value="<?=$row[mybh]?>" class="inp" name="tmybh" /></li>
 <li class="l1"><span class="red">*</span> 原价：</li>
 <li class="l2"><input class="inp" name="tmoney1" value="<?=$row[money1]?>" size="10" type="text"/></li>
 <li class="l1"><span class="red">*</span> 售 价：</li>
 <li class="l2"><input class="inp" name="tmoney2" value="<?=$row[money2]?>" size="10" type="text"/></li>
 <li class="l1"><span class="red">*</span> 优惠形式：</li>
 <li class="l2">
 <span class="finp">
 <input name="Ryhxs" type="radio" value="1" onclick="yhxsonc(1)" <? if(1==$row[yhxs]){?>checked="checked"<? }?> /> 长期优惠 &nbsp;&nbsp;
 <input name="Ryhxs" type="radio" value="2" onclick="yhxsonc(2)" <? if(2==$row[yhxs]){?>checked="checked"<? }?> /> 限时优惠 
 </span>
 </li>
 </ul>
 
 <ul class="uk" id="yhxsul" style="display:none;">
 <li class="l1"><span class="red">*</span> 限时优惠价：</li>
 <li class="l2"><input class="inp" name="tmoney3" value="<?=$row[money3]?>" size="10" type="text"/></li>
 <li class="l1"><span class="red">*</span> 限时优惠说明：</li>
 <li class="l2"><input type="text" size="80" value="<?=$row[yhsm]?>" class="inp" name="tyhsm" /></li>
 <li class="l1"><span class="red">*</span> 优惠时间：</li>
 <li class="l2">
 <input class="inp" name="tyhsj1" value="<?=$row[yhsj1]?>" readonly="readonly" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" size="20" type="text"/> 
 <span class="fd">到</span> 
 <input class="inp" name="tyhsj2" value="<?=$row[yhsj2]?>" readonly="readonly" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" size="20" type="text"/>
 </li>
 </ul>
 
 <ul class="uk1">
 <li class="l1">效果图：</li>
 <li class="l2">
 <ul class="tpupload">
 <li class="tl3">1.您最多可以上传 5 张效果图，最佳尺寸：800*800。</li>
 <li class="tl4">
 <? 
 while1("*","yjcode_tp where bh='".$bh."' order by iffm asc");
 for($i=1;$i<=7;$i++){
 $tpbh="";$tpid="";
 if($row1=mysql_fetch_array($res1)){$tp=preg_split("/\./",$row1[tp]);$tp1=preg_split("/\//",$tp[0]);$tpbh=$tp1[3];$tpid=$row1[id];}
 ?>
 <span class="tpf" onmouseover="tphover(<?=$i?>)" onmouseout="tphout(<?=$i?>)"><iframe src="tpupload.php?tpbh=<?=$tpbh?>&tpid=<?=$tpid?>&bh=<?=$bh?>" width="74" scrolling="no" height="91" id="tpf<?=$i?>" frameborder="0"></iframe></span>
 <? }?>
 </li>
 </ul>
 </li>
 </ul>
 
 <div class="upfile">
 <ul class="uk" id="kcuk">
 <li class="l1"><span class="red">*</span> 库存量：</li>
 <li class="l2"><input class="inp" name="tkcnum" value="<?=returnjgdw($row[kcnum],"",0)?>" size="10" type="text"/> (如果是点卡交易类，库存值无需填写，将自动读取)</li>
 </ul>
 <ul class="uk">
 <li class="l1 red">* 发货形式：</li>
 <li class="l2">
 <span class="finp">
 <input name="Rfhxs" type="radio" value="1" onclick="fhxsonc(1)" <? if(1==$row[fhxs]){?>checked="checked"<? }?> /> 手动发货 &nbsp;&nbsp;
 <input name="Rfhxs" type="radio" value="2" onclick="fhxsonc(2)" <? if(2==$row[fhxs]){?>checked="checked"<? }?> /> 网盘下载 &nbsp;&nbsp;
 <input name="Rfhxs" type="radio" value="3" onclick="fhxsonc(3)" <? if(3==$row[fhxs]){?>checked="checked"<? }?> /> 网站直接下载&nbsp;&nbsp;
 <input name="Rfhxs" type="radio" value="4" onclick="fhxsonc(4)" <? if(4==$row[fhxs]){?>checked="checked"<? }?> /> 点卡交易&nbsp;&nbsp;
 </span>
 </li>
 </ul> 
 <ul class="uk" id="fhxs2" style="display:none;">
 <li class="l1">网盘地址：</li>
 <li class="l2"><input class="inp" name="twpurl" value="<?=$row[wpurl]?>" size="80" type="text"/></li>
 <li class="l1">网盘密码：</li>
 <li class="l2"><input class="inp" name="twppwd" value="<?=$row[wppwd]?>" size="20" type="text"/></li>
 </ul>
 <ul class="uk" id="fhxs3" style="display:none;">
 <li class="l1">上传文件：</li>
 <li class="l2"><input type="file" name="inp1" id="inp1" size="25"></li>
 <? if(!empty($row[upf])){?>
 <li class="l1">文件预览：</li>
 <li class="l21">【<a href="../upload/<?=$row[userid]?>/<?=$row[bh]?>/<?=$row[upf]?>" class="blue" target="_blank">点击预览</a>】</li>
 <? }?>
 </ul>
 <ul class="uk" id="fhxs4" style="display:none;">
 <li class="l1">库存：</li>
 <li class="l21"><strong class="red"><?=$row[kcnum]?>件</strong> [<a href="kclist.php?bh=<?=$bh?>" target="_blank" class="blue">管理库存</a>]</li>
 <li class="l1">选择文件：</li>
 <li class="l2"><input type="file" name="inp2" id="inp2" size="25"></li>
 <li class="l5"></li>
 <li class="l6">
 上传格式为xls文件，即excel，程序会自动识别，但必须保证符合规则，<strong class="red">第一列为卡号，第二列为密码</strong>，如下图<br>
 <img src="img/xls.gif" width="270" height="76" style="margin:10px 0 0 0;" />
 </li>
 </ul>
 </div>
 
 <ul class="uk">
 <li class="l7"><span class="red">*</span> 详细描述：</li>
 <li class="l8"><script id="editor" name="content" type="text/plain" style="width:640px;height:270px;"><?=$row[txt]?></script></li>
 <li class="l1">商品关键词：</li>
 <li class="l2"><input  name="twkey" value="<?=returnjgdw($row[wkey],"",源码交易平台、顺控源码交易网、网站模板、网站源码、免费源码、站长资讯、网站交易、源码下载、源码论坛、商业源码、顺控源码交易平台、hzskdz.com、www.hzskdz.com、免费空间、空包、微信、微商、广告联盟、)?>" size="60" type="text" class="inp" /></li>
 <li class="l9">商品描述：</li>
 <li class="l10"><textarea name="twdes"><?=$row[wdes]?></textarea></li>
 <li class="l3"></li>
 <li class="l4"><? tjbtnr("下一步","productlist.php")?></li>
 </ul>
 </form>

 <!--E-->
 
</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
<script type="text/javascript">
//实例化编辑器
yhxsonc(<?=$row[yhxs]?>);
fhxsonc(<?=$row[fhxs]?>);
var ue = UE.getEditor('editor');
</script>
</body>
</html>