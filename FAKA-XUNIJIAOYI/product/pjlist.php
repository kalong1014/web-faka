<?
include("../config/conn.php");
include("../config/function.php");
$getstr=$_GET[str];
$id=returnsx("i");
while0("*","yjcode_pro where zt<>99 and id=".$id);if(!$row=mysql_fetch_array($res)){php_toheader("../");}
$sj=date("Y-m-d H:i:s");
$tp="../".returntp("bh='".$row[bh]."' order by iffm asc","-2");
?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=$row[tit]?>��ô���ò��á���ҹ����ĵ� - <?=webname?></title>
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
 ��ǰλ�ã�<a href="<?=weburl?>">��ҳ</a> > <a href="search_j<?=$row[ty1id]?>v.html"><?=returntype(1,$row[ty1id])?></a>
 <? if(0!=$row[ty2id]){?> > <a href="search_j<?=$row[ty1id]?>v_k<?=$row[ty2id]?>v.html"><?=returntype(2,$row[ty2id])?></a><? }?>
 <? if(0!=$row[ty3id]){?> > <a href="search_j<?=$row[ty1id]?>v_k<?=$row[ty2id]?>v_m<?=$row[ty3id]?>v.html"><?=returntype(3,$row[ty3id])?></a><? }?>
 > ����
 </li>
 </ul>
 </div>

 <!--��B-->
 <div class="pjvleft">
 <ul class="u1">
 <li class="l1 fontyh">��Ʒ��Ϣ</li>
 <li class="l2"><a href="view<?=$row[id]?>.html"><img border="0" src="<?=returntppd($tp,"../img/none180x180.gif")?>" width="178" height="178" /></a><br><a href="view<?=$row[id]?>.html"><?=$row[tit]?></a></li>
 <li class="l3">
 �Żݼۣ�<strong class="red">��<?=returnjgdian(returnyhmoney($row[yhxs],$row[money2],$row[money3],$sj,$row[yhsj1],$row[yhsj2],$row[id]))?></strong><br>
 �����ۣ�<?=$row[xsnum]?>
 </li>
 <li class="l4"><a href="view<?=$row[id]?>.html"></a></li>
 </ul>
 </div>
 <!--��E-->

 <!--��B-->
 <div class="right">
 <ul class="pjcap">
 <li class="l1">��Ʒ����</li>
 <li class="l2">�������<br><strong><?=$row[pf1]?></strong></li>
 <li class="l2">�����ٶ�<br><strong><?=$row[pf2]?></strong></li>
 <li class="l2">����̬��<br><strong><?=$row[pf3]?></strong></li>
 <li class="l2">�ۺ�����<br><strong><?=round(($row[pf1]+$row[pf2]+$row[pf3])/3,2)?></strong></li>
 <li class="l3"><a href="../user/order.php?ddzt=suc">д����׬����</a></li>
 </ul>
 <? 
 if(returnsx("p")!=-1){$page=returnsx("p");}else{$page=1;}
 pagef(" where probh='".$row[bh]."'",20,"yjcode_propj","order by sj desc");while($row=mysql_fetch_array($res)){
 $usertx="../upload/".$row[userid]."/user.jpg";
 if(!is_file($usertx)){$usertx="../user/img/nonetx.gif";}else{$usertx=$usertx."?id=".rnd_num(1000);} 
 ?>
 <div class="pj">
  <div class="pjleft"><ul class="u1"><li class="l1"><img src="<?=$usertx?>" width="50" height="50" /></li><li class="l2"><?=returnnc($row[userid])?></li></ul></div>
  <div class="pjright">
  <ul class="u1">
  <li class="l1">
  <img src="../img/x1.png" class="img1" width="76" height="15" />
  <? $pf=round(($row[pf1]+$row[pf2]+$row[pf3])/3,2);?>
  <div class="pf" style="width:<?=$pf/5*76?>px;"><img src="../img/x2.png" title="<?=$pf?>��" width="76" height="15" /></div>
  </li>
  <li class="l2"><?=dateYMDHM($row[sj])?></li>
  </ul>
  <ul class="u2"><li class="l1"><?=$row[txt]?></li><? if(!empty($row[hf])){?><li class="l2">���һظ���<?=$row[hf]?></li><? }?></ul>
  </div> 
 </div>
 <? }?>
 <div class="npa">
 <?
 $nowurl="pjlist";
 $nowwd="";
 require("../tem/page.html");
 ?>
 </div>
 </div>
 <!--��E-->

</div>

<? include("../tem/bottom.html");?>
</body>
</html>