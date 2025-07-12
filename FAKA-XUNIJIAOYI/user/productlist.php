<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."' and shopzt=2";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("openshop3.php");}
$ncapv=1;
$ses=" where zt<>99 and userid=".$rowuser[id];
if($_GET[zt]=="1"){$ses=$ses." and zt=1";}
elseif($_GET[zt]=="2"){$ses=$ses." and zt=2";}
if($_GET[st1]!=""){$ses=$ses." and tit like '%".$_GET[st1]."%'";}
if($_GET[st2]!=""){$ses=$ses." and mybh='".$_GET[st2]."'";}
if($_GET[sd1]!=""){$ses=$ses." and ty1id=".$_GET[sd1];}
if($_GET[ifxj]=="1"){$ses=$ses." and ifxj=1";$ncapv=3;}
if($_GET[page]!=""){$page=$_GET[page];}else{$page=1;}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户管理面板 - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 商品列表</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">

 <!--B-->
 <? include("rcap3.php");?>
 <script language="javascript">
 $("rcap<?=$ncapv?>").className="l1 l2";
 </script>
 <ul class="typecap">
 <li class="l1">商品信息</li>
 <li class="l2">售价</li>
 <li class="l3">库存</li>
 <li class="l4">已售</li>
 <li class="l5">操作</li>
 </ul>
 <ul class="listcap1">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /> 全选</li>
 <li class="l2">
 <a href="javascript:NcheckDEL(1,'yjcode_pro')" class="a1">上架/下架</a>
 <a href="javascript:NcheckDEL(2,'yjcode_pro')" class="a2">删除</a>
 <a href="javascript:gourl('productlx.php')" class="a1">发布商品</a>
 </li>
 <li class="l3"></li>
 </ul>
 <?
 pagef($ses,10,"yjcode_pro","order by lastsj desc");while($row=mysql_fetch_array($res)){
 $aurl="product.php?bh=".$row[bh];
 if(0==$row[ifxj]){$xjv="<span class='blue'>上架</span>";}else{$xjv="<span class='red'>已下架</span>";}
 ?>
 <ul class="listcap">
 <li class="l1"><input name="C1" type="checkbox" value="<?=$row[bh]?>" /></li>
 <li class="l2">最后更新：<?=$row[sj]?> | <?=returntype(1,$row[ty1id])." - ".returntype(2,$row[ty2id])." - ".returntype(3,$row[ty3id])?></li>
 </ul>
 <ul class="typelist" onmouseover="this.className='typelist typelist11';" onmouseout="this.className='typelist';">
 <li class="l0"></li>
 <li class="l1">
 <a href="<?=$aurl?>"><img border="0" class="tp" src="<?=returntppd("../".returntp("bh='".$row[bh]."'","-2"),"img/none60x60.gif")?>" width="60" height="60" align="left" /></a>
 <a title="<?=$row["tit"]?>" href="<?=$aurl?>" class="a1"><?=returntitdian($row["tit"],75)?></a><br>
 <?=$xjv." | ".returnztv($row[zt])?>
 </li>
 <li class="l2"><strong class="feng"><?=returnjgdian(returnyhmoney($row[yhxs],$row[money2],$row[money3],$sj,$row[yhsj1],$row[yhsj2],$row[id]))?></strong><br><s class="hui">原价<?=returnjgdw($row[money1],"元","暂无")?></s></li>
 <li class="l3"><?=$row[kcnum]?><? if(4==$row[fhxs]){?><br>【<a href="kclist.php?bh=<?=$row[bh]?>" class="blue">管理库存</a>】<? }?></li>
 <li class="l4"><?=$row[xsnum]?></li>
 <li class="l5">
 <a href="<?=$aurl?>">修改</a><br>
 <a href="../product/view<?=$row[id]?>.html" target="_blank">预览</a>
 </li>
 </ul>
 <? }?>
 <?
 $nowurl="productlist.php";
 $nowwd="zt=".$_GET[zt]."&st1=".$_GET[st1]."&st2=".$_GET[st2]."&sd1=".$_GET[sd1]."&ifxj=".$_GET[ifxj];
 include("page.html");
 ?>
 <!--E-->
 
</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>