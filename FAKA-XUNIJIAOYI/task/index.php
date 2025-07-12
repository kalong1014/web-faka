<?
include("../config/conn.php");
include("../config/function.php");
$ses=" where zt=0";
if(returnsx("j")!=-1){$ses=$ses." and type1id=".returnsx("j");}
if(returnsx("m")==0){$ses=$ses." and ifok=0";}elseif(returnsx("m")==1){$ses=$ses." and ifok=1";}
if(returnsx("p")!=-1){$page=returnsx("p");}else{$page=1;}
?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>任务大厅 - <?=webname?></title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<link href="index.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/basic.js"></script>
<script language="javascript" src="index.js"></script>
</head>
<body>
<? include("../tem/top.html");?>
<? include("../tem/top1.html");?>
<div class="yjcode">
 <div class="dqwz">
 <ul class="u1">
 <li class="l1">当前位置：<a href="<?=weburl?>">首页</a> > 任务大厅</li></ul>
 </div>
</div>

<div class="bfb bfbtask fontyh">
<div class="yjcode">
 
 <!--左B-->
 <div class="listleft">
 <ul class="listcap">
 <li class="l1">任务类型：</li>
 <li class="l2">
 <a href="<?=rentser('j','','p','1')?>"<? if(returnsx("j")==-1){?> class="a1"<? }?>>全部</a>
 <? while1("*","yjcode_tasktype order by xh asc");while($row1=mysql_fetch_array($res1)){?>
 <a href="<?=rentser('j',$row1[id],'p','1')?>"<? if(returnsx("j")==$row1[id]){?> class="a1"<? }?>><?=$row1[name1]?></a>
 <? }?>
 </li>
 </ul>
 <ul class="listcap">
 <li class="l1">任务状态：</li>
 <li class="l2">
 <a href="<?=rentser('m','','p','1')?>"<? if(returnsx("m")==-1){?> class="a1"<? }?>>全部</a>
 <a href="<?=rentser('m','0','p','1')?>"<? if(returnsx("m")==0){?> class="a1"<? }?>>正在招标</a>
 <a href="<?=rentser('m','1','p','1')?>"<? if(returnsx("m")==1){?> class="a1"<? }?>>已结帖</a>
 </li>
 </ul>
 
 <ul class="rwcap">
 <li class="l1">任务列表</li>
 <li class="l2"><a href="taskadd.php">我要发任务</a></li>
 </ul>
 
 <?
 pagef($ses,30,"yjcode_task","order by sj desc");while($row=mysql_fetch_array($res)){
 taskok($row[endsj],$row[id]);
 ?>
 <ul class="ulist fontyh" onMouseOver="this.className='ulist ulist1 fontyh';" onMouseOut="this.className='ulist fontyh';">
 <li class="l1">
 <strong class="red">￥<?=$row[money1]?></strong> <a href="view<?=$row[id]?>.html" target="_blank" class="a1"><?=$row[tit]?></a> <br>
 <span class="hui"><?=strgb2312(strip_tags($row[txt]),0,60)?></span>
 </li>
 <li class="l2"><?=returntasktype($row[type1id])?></li>
 <li class="l3"><? if(0==$row[ifok]){?><span class="blue">正在招标</span><? }else{?><span class="red">已结帖</span><? }?></li>
 <li class="l4">回复:<?=returncount("yjcode_taskhf where bh='".$row[bh]."'")?><br>更新:<?=dateYMD($row[sj])?></li>
 </ul>
 <? }?>
 <div class="npa">
 <?
 $nowurl="search";
 $nowwd="";
 require("../tem/page.html");
 ?>
 </div>
 </div>
 <!--左E-->
 
 <!--右B-->
 <div class="listright">
  <? adwhile("ADTASK01")?>
  <div class="d1">
  <ul class="u1"><li class="l1">最新任务</li><li class="l2"></li></ul>
  <? while1("*","yjcode_task where zt=0 and ifok=0 order by sj desc limit 10");while($row1=mysql_fetch_array($res1)){?>
  <ul class="u2">
  <li class="l1"><span class="red">￥<?=$row1[money1]?></span> <a href="view<?=$row1[id]?>.html" target="_blank" class="a1"><?=$row1[tit]?></a></li>
  <li class="l2"><?=dateYMD($row1[sj])?></li>
  <li class="l3"><span class="red"><?=returncount("yjcode_taskhf where bh='".$row[bh]."'")?></span>个回复</li>
  </ul>
  <? }?>
  </div>
 </div>
 <!--右E-->

</div>
</div>
<? include("../tem/bottom.html");?>
</body>
</html>