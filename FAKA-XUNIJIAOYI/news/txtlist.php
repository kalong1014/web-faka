<?
include("../config/conn.php");
include("../config/function.php");
$getstr=$_GET[str];
$id=returnsx("i");
while0("*","yjcode_news where id=".$id);if(!$row=mysql_fetch_array($res)){php_toheader(weburl."404.html");exit;}

$sj=date("Y-m-d H:i:s");
while1("*","yjcode_news where type1id=".$row[type1id]." and type2id=".$row[type2id]." and zt=0 and lastsj>='".$row[lastsj]."' and id<>".$row[id]." order by sj asc");
if($row1=mysql_fetch_array($res1)){$pre="<a href='txtlist_i".$row1[id]."v.html'>".$row1[tit]."</a>";}
else{$pre="���ǵ�һƪ����";}
while1("*","yjcode_news where type1id=".$row[type1id]." and type2id=".$row[type2id]." and zt=0 and lastsj<='".$row[lastsj]."' and id<>".$row[id]." order by sj desc");
if($row1=mysql_fetch_array($res1)){$nex="<a href='txtlist_i".$row1[id]."v.html'>".$row1[tit]."</a>";}
else{$nex="�������һƪ����";}
checkdjl("c2",$row[id],"yjcode_news");
$t=preg_split("/_ueditor_page_break_tag_/",$row[txt]);
if(returnsx("p")==-1){$page=1;}else{$page=returnsx("p");}
$txt=$t[$page-1];
?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="<?=$row[wkey]?>">
<meta name="description" content="<?=$row[wdes]?>">
<title><?=$row[tit]?> - <?=webname?></title>
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
 <li class="l1">
 ��ǰλ�ã�<a href="<?=weburl?>">��ҳ</a> > <a href="./">��Ѷ</a> > <a href="newslist_j<?=$row[type1id]?>v.html"><?=returnnewstype(1,$row[type1id])?></a>
 <? if(0!=$row[type2id]){?> > <a href="newslist_j<?=$row[type1id]?>v_k<?=$row[type2id]?>v.html"><?=returnnewstype(2,$row[type2id])?></a><? }?>
 </li>
 </ul>
 </div>

<div class="newsmain">
 <!--��B-->
 <div class="left">
 <h1 class="titcap fontyh"><a name="tit"><?=$row[tit]?></a></h1>
 <ul class="u1">
 <li class="l1">ʱ�䣺<?=dateYMDHM($row[lastsj])?> �༭��<?=$row[zze]?> ��Դ��<a href="<?=returndw($row[lyurl],"","#")?>" class="blue" target="_blank"><?=$row[ly]?></a> �Ķ���<?=$row[djl]?></li>
 <li class="l2" onMouseOver="objdis(1,'newm')" onMouseOut="objdis(0,'newm')">ɨһɨ���ֻ�����</li>
 </ul>
 <div id="newm" style="display:none;"><? $uw=weburl."news/txtlist_i".$row[id]."v.html"; ?><img src="<?=weburl?>tem/getqr.php?u=<?=$uw?>&size=4" /></div>
 <div class="zytad"><? adwhile("ADNV03")?></div>
 <div class="zhaiy"><strong>ժҪ��</strong><?=$row[wdes]?></div>
 <div class="ntxt"><?=$txt?></div>
 <? if(count($t)>1){?>
 <div class="txtpage">
 <a href="<?=rentser('p',1,'','',"txtlist");?>#tit">��1ҳ</a>
 <? for($i=1;$i<=count($t);$i++){?>
 <? if($page!=$i){?><a href="<?=rentser('p',$i,'','',"txtlist");?>#tit"><?=$i?></a><? }else{?><strong><?=$i?></strong><? }?>
 <? }?>
 <a href="<?=rentser('p',count($t),'','',"txtlist");?>#tit">���1ҳ</a>
 </div>
 <? }?>
 <div class="nxg">
 ��һƪ��<?=$pre?><br>
 ��һƪ��<?=$nex?>
 </div>
 <div class="lad"><? adwhile("ADNV02");?></div>
 <div class="otherxg">
 <strong>���·�������Ѷ��Ϣ</strong><br>
 <? while1("*","yjcode_news where zt=0 order by lastsj desc limit 10");while($row1=mysql_fetch_array($res1)){?>
 ��<?=returnnewstype(1,$row1[type1id])."|".returnnewstype(2,$row1[type2id])?>��<a href="txtlist_i<?=$row1[id]?>v.html"><?=$row1[tit]?></a><span class="hui">(<?=dateYMDHM($row1[lastsj])?>)</span><br>
 <? }?>
 </div>
 </div>
 <!--��E-->
 
 <!--��B-->
 <div class="right">
 <div class="adf"><? adwhile("ADNV01");?></div>
 <? include("right.php");?>
 </div>
 <!--��E-->

</div>

</div>

<? include("../tem/bottom.html");?>
</body>
</html>