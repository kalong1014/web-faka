<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>管理系统</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu5").className="l51";
</script>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_ad.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0602,")){echo "<div class='noneqx'>无权限</div>";exit;}?>
 <ul class="wz">
 <li class="l1">当前位置：后台首页 - <strong>广告管理</strong></li><li class="l2">&nbsp;</li>
 </ul>
 
 <? include("rightcap2.php");?>
 <script language="javascript">$("rtit4").className="l1";</script>

 <!--begin-->
 <div class="listkuan">
 <ul class="typecap">
 <li class="l2">&nbsp;广告定位编号</li>
 <li class="l2">&nbsp;说明</li>
 <li class="l9">管理</li>
 </ul>
 
 <?
 $adbh=array("ADN00","ADN01","ADNV01","ADNV02","ADNV03","ADNV04","ADN02");
 $adtit=array("资讯首页切换","资讯首页头条下方横幅","资讯正文页右侧广告","资讯详情页最新发布上方横幅","资讯详情页摘要上方横幅","资讯列表页右侧广告","资讯首页切换下方横幅");
 $adsize=array("290*200","850*?","290*?","828*?","828*?","290*?","1150*?");
 $admust=array("pic","","","","","","");
 
 for($i=0;$i<count($adbh);$i++){
 $adurl="adlist.php?bh=".$adbh[$i]."&sm=".urlencode($adtit[$i]."-".$adsize[$i])."&must=".$admust[$i];
 ?>
 <ul class="typelist1" onMouseOver="this.className='typelist1 typelist11';" onMouseOut="this.className='typelist1';">
 <li class="l2" onclick="gourl('<?=$adurl?>')">&nbsp;<?=$adbh[$i]?></li>
 <li class="l2">&nbsp;<?=$adtit[$i]." ".$adsize[$i]?></li>
 <li class="l9">
 <a href="<?=$adurl?>">列表</a> | 
 <a href="ad.php?bh=<?=$adbh[$i]?>&sm=<?=urlencode($adtit[$i]."-".$adsize[$i])?>&must=<?=$admust[$i]?>">新增</a>
 </li>
 </ul>
 <?
 }
 ?>

 </div>
 <!--end-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>