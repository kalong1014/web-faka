<?
include("../config/conn.php");
include("../config/function.php");
?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>������Ѷ - <?=webname?></title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<link href="index.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/basic.js"></script>
<script language="javascript" src="indexqh.js"></script>
</head>
<body>
<? include("../tem/top.html");?>
<? include("../tem/top1.html");?>

<div class="bfb bfb1">
<div class="yjcode">
 <div class="dqwz">
 <ul class="u1">
 <li class="l1">
 ��ǰλ�ã�<a href="<?=weburl?>">��ҳ</a> > ��Ѷ
 </li>
 </ul>
 </div>

 <div class="ileft">
 <!--ͷ��B-->
 <? 
 while1("*","yjcode_news where indextop=1 and zt=0 order by lastsj desc limit 1");if($row1=mysql_fetch_array($res1)){
 $datev = explode("-" ,dateYMD($row1[sj]));
 ?>
 <div class="indextop">
 <ul class="u1">
 <li class="l1">
 <span class="s1"><?=$datev[0]?>-<?=$datev[1]?></span><span class="s2"><?=$datev[2]?></span>
 </li>
 <li class="l2">
 <a href="txtlist_i<?=$row1[id]?>v.html" title="<?=$row1[tit]?>" class="a1 fontyh" target="_blank"><?=strgb2312($row1[tit],0,43)?></a> <img src="../img/icon8.gif" /> <? if(1==$row1[iftp]){?><img src="../img/icon9.gif" /><? }?><br>
 <?=returntitdian($row1[wdes],90)?> <a href="txtlist_i<?=$row1[id]?>v.html" class="a2" target="_blank">[��ϸ]</a>
 </li>
 </ul>
 </div>
 <? }?>
 <!--ͷ��E-->
 <? adwhile("ADN01")?>
 <!--�б�B-->
 <? while1("*","yjcode_newstype where admin=1 order by xh asc");while($row1=mysql_fetch_array($res1)){?>
 <div class="ilist">
 <ul class="u1"><li class="l1 fontyh"><?=$row1[name1]?></li><li class="l2"><a href="newslist_j<?=$row1[id]?>v.html">����</a></li></ul>
 <div class="d1">
 <? 
 while0("*","yjcode_news where type1id=".$row1[id]." and zt=0 order by lastsj desc limit 9");while($row=mysql_fetch_array($res)){
 $au="txtlist_i".$row[id]."v.html";
 ?>
 ��<a href="<?=$au?>" target="_blank" title="<?=$row[tit]?>"><?=returntitcss(strgb2312($row[tit],0,55),$row[ifjc],$row[titys])?></a><br>
 <? }?>
 </div>
 <div class="d2">
 <? 
 while2("*","yjcode_news where type1id=".$row1[id]." and zt=0 and iftp=1 order by lastsj desc limit 1");while($row2=mysql_fetch_array($res2)){
 $au="txtlist_i".$row2[id]."v.html";
 ?>
 <a href="<?=$au?>" target="_blank"><img border="0" alt="<?=$row2[tit]?>" src="../<?=returntp("bh='".$row2[bh]."' order by xh asc","-1")?>" width=300 height="210" /></a><br>
 <a href="<?=$au?>" target="_blank" title="<?=$row2[tit]?>"><?=returntitcss(strgb2312($row2[tit],0,40),$row2[ifjc],$row2[titys])?></a>
 <? }?>
 </div>
 </div>
 <? }?>
 <!--�б�E-->
 </div>
 

<!--��B-->
<div class="iright">
<!--�л���ʼ-->
<div class="qh">
 <div class="container" id="idTransformView">
  <ul class="slider" id="idSlider">
  <?
  $i=1;
  while1("*","yjcode_ad where adbh='ADN00' order by xh asc");while($row1=mysql_fetch_array($res1)){
  ?>
  <li><a href="<?=$row1[aurl]?>"  target="_blank" title="<?=$row1[tit]?>"><img src="../ad/<?=$row1[bh]?>.<?=$row1[jpggif]?>" width="290" height="200" border="0" /></a></li>
  <?
  $i++;
  }
  ?>
  </ul>
  <span style="display:none" id="qhai"><?=$i-1?></span>
  <ul class="num" id="idNum">
   <? for($j=1;$j<$i;$j++){?><li><?=$j?></li><? }?>
  </ul>
 </div>  
</div>
<!--�л�����-->
<? include("right.php");?> 
<? adwhile("ADNV03")?>
</div>
<!--��E-->

</div>
</div>

<? include("../tem/bottom.html");?>
</body>
</html>