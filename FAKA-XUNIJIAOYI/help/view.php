<?
include("../config/conn.php");
include("../config/function.php");
while0("*","yjcode_help where id=".$_GET[id]);if(!$row=mysql_fetch_array($res)){php_toheader("./");}

while1("*","yjcode_help where sj>='".$row[sj]."' and id<>".$row[id]." order by sj asc");
if($row1=mysql_fetch_array($res1)){$pre="<a href='view".$row1[id].".html'>".$row1[tit]."</a>";}else{$pre="���Ǹ÷����µ�һƪ";}

while1("*","yjcode_help where sj<='".$row[sj]."' and id<>".$row[id]." order by sj desc");
if($row1=mysql_fetch_array($res1)){$nex="<a href='view".$row1[id].".html'>".$row1[tit]."</a>";}else{$nex="���Ǹ÷��������һƪ";}
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

<div class="yjcode">

<? include("top.php");?>
<script language="javascript">$("mtm2").className="a1";</script>

<? include("left.php");?>
<!--��ʼ-->
<div class="helpright">
 <div class="wz">
 ����ǰ��λ�ã�<a href="../">��ҳ</a> <span>>></span> 
 <a href="./">��������</a> <span>>></span> 
 <a href="search_j<?=$row[ty1id]?>v.html"><?=returnhelptype(1,$row[ty1id])?></a>
 <? if($row[ty2id]!=0){?><span>>></span> <a href="search_j<?=$row[ty1id]?>v_k<?=$row[ty2id]?>v.html"><?=returnhelptype(2,$row[ty2id])?></a><? }?> <span>>></span> 
 <?=$row[tit]?>
 </div>

 <h1 class="titcap fontyh"><a name="tit"><?=$row[tit]?></a></h1>
 <ul class="u1">
 <li class="l1">����ʱ�䣺<?=dateYMDHM($row[sj])?> �Ķ�������<?=$row[djl]?></li>
 <li class="l2" onMouseOver="objdis(1,'newm')" onMouseOut="objdis(0,'newm')">ɨһɨ���ֻ�����</li>
 </ul>
 <div id="newm" style="display:none;"><? $uw=weburl."help/view".$row[id].".html"; ?><img src="<?=weburl?>tem/getqr.php?u=<?=$uw?>&size=4" /></div>
 <div class="ntxt"><?=$row[txt]?></div>
 <div class="nxg">
 ��һƪ��<?=$pre?><br>
 ��һƪ��<?=$nex?>
 </div>

</div>
<!--����-->

</div>
<? include("../tem/bottom.html");?>
</body>
</html>