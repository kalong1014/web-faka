<?
include("../config/conn.php");
include("../config/function.php");
include("../config/xy.php");
$id=$_GET[id];
while0("*","yjcode_pro where zt<>99 and id=".$id);if(!$row=mysql_fetch_array($res)){php_toheader("../");}
$sj=date("Y-m-d H:i:s");

$nch="";
if(isset($_COOKIE['prohistoy'])){
$nch=$_COOKIE['prohistoy'];
if(check_in($row[id]."xcf",$nch)){$nch=str_replace($row[id]."xcf","",$nch);}
$a=split("xcf",$nch);
if(count($a)>6){$ni=6;}else{$ni=count($a);}
 $nch="";
 for($i=0;$i<=$ni;$i++){
 $nch=$nch.$a[$i]."xcf";
 }
}

$Month = 864000 + time();
setcookie(prohistoy,$row[id]."xcf".$nch, $Month,'/');
$nch=$_COOKIE['prohistoy'];
?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="<?=returnjgdw($row[wkey],"",$row[tit])?>">
<meta name="description" content="<?=returnjgdw($row[wdes],"",strgb2312(strip_tags($row[txt]),0,250))?>">
<title><?=$row[tit]?> - <?=webname?></title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<link href="index.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/basic.js"></script>
<script language="javascript" src="index.js"></script>
</head>
<body>
<? include("../tem/openwv.php");?>
<? include("../tem/top.html");?>
<? include("../tem/top1.html");?>

<div class="yjcode">
 <div class="dqwz">
 <ul class="u1">
 <li class="l1">
 ��ǰλ�ã�<a href="<?=weburl?>">��ҳ</a> > <a href="search_j<?=$row[ty1id]?>v.html"><?=returntype(1,$row[ty1id])?></a>
 <? if(0!=$row[ty2id]){?> > <a href="search_j<?=$row[ty1id]?>v_k<?=$row[ty2id]?>v.html"><?=returntype(2,$row[ty2id])?></a><? }?>
 <? if(0!=$row[ty3id]){?> > <a href="search_j<?=$row[ty1id]?>v_k<?=$row[ty2id]?>v_m<?=$row[ty3id]?>v.html"><?=returntype(3,$row[ty3id])?></a><? }?>
 </li>
 </ul>
 </div>

 <!--��������B-->
 <div class="jbzl">
  <!-- ͼƬ��ʼ -->
  <div class="tpleft">
  <div class="d1">
  <?
  $tparr=array("","","","","");
  $i=0;
  while1("*","yjcode_tp where bh='".$row[bh]."' order by iffm asc limit 5");while($row1=mysql_fetch_array($res1)){
  $tpa=preg_split("/\//",$row1[tp]);
  $ti=preg_split("/\./",$tpa[3]);
  $tparr[$i]=$ti[0];
  $i++;
  }
  $lj="../upload/".$row[userid]."/".$row[bh]."/";
  $tp=$lj.$tparr[0]."-1.jpg";
  ?>
  <div class="bigtp"><a href="../tp/showpic.php?bh=<?=$row[bh]?>" target="_blank"><img id="bimg" src="<?=returntppd($tp,"../img/none300x300.gif")?>" width="280" height="280" /></a></div>
  <ul class="u1">
  <li class="l1">
  <? for($j=0;$j<$i;$j++){?>
  <a href="javascript:void(0)" onMouseOver="simgover('<?=$lj.$tparr[$j]?>-1.jpg')"><img id="simg<?=$j?>" width="48" height="48" src="<?=$lj.$tparr[$j]?>-2.jpg" /></a>   
  <? }?>
  </li>
  </ul>
  </div>
  <ul class="u2">
  <? 
  $a1="none";$a2="none";
  if($_SESSION["SHOPUSER"]==""){$a1="";}else{
   $nuid=returnuserid($_SESSION["SHOPUSER"]);
   if(panduan("probh,userid","yjcode_profav where probh='".$row[bh]."' and userid=".$nuid)==1){$a2="";}else{$a1="";}
  }
  ?>
  <li class="l1" id="favpno" style="display:<?=$a1?>;"><a href="javascript:profavInto('<?=$row[bh]?>')">�����ղ�</a></li>
  <li class="l1" id="favpyes" style="display:<?=$a2?>;"><a href="../user/favpro.php">���ղ�</a></li>
  </ul>
  </div>
  <!-- ͼƬ���� -->
  <!--�м俪ʼ-->
  <div class="jbright">
  <ul class="u1">
  <li class="l1"><?=$row[tit]?></li>
  <li class="l2">
  ���ӱ�ǩ��
  <?
  $a=preg_split("/xcf/",$row[tysx]);for($i=0;$i<=count($a);$i++){if($a[$i]!=""){while1("*","yjcode_typesx where id=".$a[$i]);if($row1=mysql_fetch_array($res1)){
  echo $row1[name2]."&nbsp;&nbsp;";
  }}}
  ?>
  </li>
  </ul>
  <ul class="u2">
  <li class="l1">�� �ۣ�</li>
  <li class="l2">��<span id="nowmoney"><?=returnjgdian(returnyhmoney($row[yhxs],$row[money2],$row[money3],$sj,$row[yhsj1],$row[yhsj2],$row[id]))?></span></li>
  <li class="l3"></s></li>
  </ul>
  <? 
  if(2==$row[yhxs] && $sj<=$row[yhsj2]){
  if($sj<$row[yhsj1]){$a=1;}else{$a=2;}
  ?>
  <span id="nyhsj1" style="display:none;"><?=str_replace("-","/",$row[yhsj1])?></span>
  <span id="nyhsj2" style="display:none;"><?=str_replace("-","/",$row[yhsj2])?></span>
  <span id="nmoney2" style="display:none;"><?=returnjgdian($row[money2])?></span>
  <span id="nmoney3" style="display:none;"><?=returnjgdian($row[money3])?></span>
  <span id="nowsj" style="display:none;"><?=str_replace("-","/",$sj)?></span>
  <ul class="u5" id="xsyh">
  <li class="l1">��ʱ������</li>
  <li class="l2"><span class="s1"><?=$row[yhsm]?></span><span class="s2">��<?=$row[money3]?></span></li>
  <li class="l3">
  (��������<span id="yhsjv"></span>)
  </li>
  </ul>
  <script language="javascript" src="yhsj.js"></script>
  <script language="javascript">yhsj(<?=$a?>);</script>
  <? }?>
  <ul class="u0">
  <li class="l1">��Ʒ��ţ�</li><li class="l2"><?=$row[bh]?></li>
  </ul>
  <ul class="u3">
  <li class="l1">��Ʒ���֣�</li>
  <li class="l2">
  <img src="../img/x1.png" class="img1" width="76" height="15" />
  <? $pf=round(($row[pf1]+$row[pf2]+$row[pf3])/3,2);?>
  <div class="pf" style="width:<?=$pf/5*76?>px;"><img src="../img/x2.png" title="<?=$pf?>��" width="76" height="15" /></div>
  </li>
  <li class="l3"><a href="">(��<?=returncount("yjcode_propj where probh='".$row[bh]."'")?>������)</a></li>
  </ul>
  <ul class="uts">
  <li class="l2">���Ϸ���</li>
  <li class="l3" id="cserdb" onMouseOver="serover('serdb')"><img src="../img/bao.gif" width="28" height="28"></li>
  <? $w=520;if(1!=$row[fhxs]){$w=$w-30;?>
  <li class="l3 l31" id="cserfh" onMouseOver="serover('serfh')"><img src="../img/fh.gif" width="28" height="28"></li>
  <? }?>
  <li class="l30" style="width:<?=$w?>px;"></li>
  <li class="l4" id="serdb">�������ף���ȫ��֤�������ⲻ����������˿</li>
  <li class="l4" id="serfh" style="display:none;">�Զ�������Ʒ����ʱ���Թ�����ȴ���</li>
  </ul>
  <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="����QQ�ռ�"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="��������΢��"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="������Ѷ΢��"></a><a href="#" class="bds_renren" data-cmd="renren" title="����������"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="����΢��"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"������","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>������ѣ����о�ϲ�������Ŷ��
  <ul class="u6">
  <li class="l1">����������</li>
  <li class="l2"><input type="text" id="tkcnum" value="1" /></li>
  <li class="l3">���<?=$row[kcnum]?></li>
  </ul>
  <ul class="u4">
  <li class="l1">
  <a href="javascript:buyInto('<?=$row[bh]?>')" class="buy"></a>
  <? 
  $a1="none";$a2="none";
  if($_SESSION["SHOPUSER"]==""){$a1="";}else{
   if(panduan("probh,userid","yjcode_car where probh='".$row[bh]."' and userid=".$nuid)==1){$a2="";}else{$a1="";}
  }
  ?>
  <a href="javascript:carInto('<?=$row[bh]?>')" id="cara1" style="display:<?=$a1?>;" class="car"></a>
  <a href="../user/car.php" id="cara2" style="display:<?=$a2?>;" class="carok"></a>
  <? if(!empty($row[ysweb])){?><a href="../tem/gotourl.php?u=<?=$row[ysweb]?>" target="_blank" class="ysweb"></a><? }?>
  </li>
  </ul>
  </div>
  <!--�м����-->
  <!--����B-->
  <? while1("*","yjcode_user where id=".$row[userid]);$row1=mysql_fetch_array($res1);$xy=returnjgdw($row1[xinyong],"",returnxy($row[userid],1));?>
  <div class="jbuser">
  <ul class="u1">
  <li class="l1"><img src="../img/userbao.gif" width="200" height="72" /></li>
  </ul>
  <div class="d1">
  <h3><?=$row1[shopname]?></h3>
  <ul class="du0"><li class="l1">������</li><li class="l2"><img title="����ֵ<?=$xy?>" src="../img/dj/<?=returnxytp($xy)?>" /></li></ul>
  <ul class="du1"><li class="l1">�ƹ�</li><li class="l2"><?=$row1[nc]?></li></ul>
  <ul class="du1"><li class="l1">������</li><li class="l2"><?=returncount("yjcode_pro where userid=".$row1[id]." and zt=0")?>��</li></ul>
  <ul class="du1"><li class="l1">���꣺</li><li class="l2"><?=dateYMD($row1[sj])?></li></ul>
  <ul class="du2"><li class="l1">��ϵ��</li><li class="l2"><a href="http://wpa.qq.com/msgrd?v=3&uin=<?=returnqq($row[userid])?>&site=<?=weburl?>&menu=yes" target=_blank><img src="../img/qq.png" width="77" height="22" border="0" /></a></li></ul>
  <ul class="du3">
  <li class="l1">����<br><span class="red"><?=returnjgdian($row[pf1])?></span></li>
  <li class="l1">����<br><span class="red"><?=returnjgdian($row[pf2])?></span></li>
  <li class="l0">�ۺ�<br><span class="red"><?=returnjgdian($row[pf3])?></span></li>
  </ul>
  <ul class="du4">
  <li class="l1"><a href="../shop/view<?=$row[userid]?>.html" target="_blank">�������</a></li>
  <? 
  $a1="none";$a2="none";
  if($_SESSION["SHOPUSER"]==""){$a1="";}else{
  if(panduan("*","yjcode_shopfav where shopid=".$row[userid]." and userid=".$nuid."")==1){$a2="";}else{$a1="";}
  }
  ?>
  <li class="l2" id="favsno" style="display:<?=$a1?>;"><a href="javascript:shopfavInto(<?=$row[userid]?>)">�ղص���</a></li>
  <li class="l2" id="favsyes" style="display:<?=$a2?>;"><a href="../user/favshop.php">���ղ�</a></li>
  </ul>
  </div>
  </div>
  <!--����E-->
 </div>
 <!--��������E-->

 <!--���B-->
 <div class="left">
 <? adwhile("ADP01")?>
 <ul class="u1">
 <li class="l1">�������۰�</li>
 <? while1("*","yjcode_pro where userid=".$row[userid]." and zt=0 and ifxj=0 order by xsnum desc limit 10");while($row1=mysql_fetch_array($res1)){$tp="../".returntp("bh='".$row1[bh]."' order by iffm asc","-2");?>
 <li class="l2"><a href="view<?=$row1[id]?>.html"><img alt="<?=$row1[tit]?>" src="<?=returntppd($tp,"../img/none60x60.gif")?>" width="50" height="50" align="left"></a><a href="view<?=$row1[id]?>.html" title="<?=$row1[tit]?>"><?=returntitdian($row1[tit],37)?></a><br><strong class="feng">��<?=returnjgdian(returnyhmoney($row1[yhxs],$row1[money2],$row1[money3],$sj,$row1[yhsj1],$row1[yhsj2],$row1[id]))?></strong></li>
 <? }?>
 </ul>
 <ul class="u1">
 <li class="l1">���������¼</li>
 <? 
 $a=split("xcf",$nch);
 for($i=0;$i<=count($a);$i++){
 if($a[$i]!=""){
  while1("*","yjcode_pro where id=".$a[$i]);if($row1=mysql_fetch_array($res1)){$tp="../".returntp("bh='".$row1[bh]."' order by iffm asc","-2");
 ?>
 <li class="l2"><a href="view<?=$row1[id]?>.html"><img alt="<?=$row1[tit]?>" src="<?=returntppd($tp,"../img/none60x60.gif")?>" width="50" height="50" align="left"></a><a href="view<?=$row1[id]?>.html" title="<?=$row1[tit]?>"><?=returntitdian($row1[tit],37)?></a><br><strong class="feng">��<?=returnjgdian(returnyhmoney($row1[yhxs],$row1[money2],$row1[money3],$sj,$row1[yhsj1],$row1[yhsj2],$row1[id]))?></strong></li>
 <?
  }
 }
 }
 ?>
 </ul>
 </div>
 <!--���E-->
 
 <!--�Ҳ�B-->
 <div class="right">
 <ul class="ucap">
 <li class="l1">��Ʒ����</li>
 <li class="l0"><a href="#pj">�ۼ�����<strong class="feng"><? $allpj=returncount("yjcode_propj where probh='".$row[bh]."'");echo $allpj;?></strong></a></li>
 <li class="l2"></li>
 </ul>
 <div class="viewtxt"><?=$row[txt]?></div>
 
 <a name="pj"></a>
 <ul class="pjcap">
 <li class="l1">��Ʒ����</li>
 <li class="l2">�������<br><strong><?=$row[pf1]?></strong></li>
 <li class="l2">�����ٶ�<br><strong><?=$row[pf2]?></strong></li>
 <li class="l2">����̬��<br><strong><?=$row[pf3]?></strong></li>
 <li class="l2">�ۺ�����<br><strong><?=round(($row[pf1]+$row[pf2]+$row[pf3])/3,2)?></strong></li>
 <li class="l3"><a href="../user/order.php?ddzt=suc">д����׬����</a></li>
 </ul>
 <? 
 while1("*","yjcode_propj where probh='".$row[bh]."' order by sj desc limit 10");while($row1=mysql_fetch_array($res1)){
 $usertx="../upload/".$row1[userid]."/user.jpg";
 if(!is_file($usertx)){$usertx="../user/img/nonetx.gif";}else{$usertx=$usertx."?id=".rnd_num(1000);} 
 ?>
 <div class="pj">
  <div class="pjleft"><ul class="u1"><li class="l1"><img src="<?=$usertx?>" width="50" height="50" /></li><li class="l2"><?=returnnc($row1[userid])?></li></ul></div>
  <div class="pjright">
  <ul class="u1">
  <li class="l1">
  <img src="../img/x1.png" class="img1" width="76" height="15" />
  <? $pf=round(($row1[pf1]+$row1[pf2]+$row1[pf3])/3,2);?>
  <div class="pf" style="width:<?=$pf/5*76?>px;"><img src="../img/x2.png" title="<?=$pf?>��" width="76" height="15" /></div>
  </li>
  <li class="l2"><?=dateYMDHM($row1[sj])?></li>
  </ul>
  <ul class="u2"><li class="l1"><?=$row1[txt]?></li><? if(!empty($row1[hf])){?><li class="l2">���һظ���<?=$row1[hf]?></li><? }?></ul>
  </div> 
 </div>
 <? }?>
 <div class="allpj">[<a href="pjlist_i<?=$row[id]?>v.html" target="_blank">�鿴ȫ������</a>]</div>
 
 </div>
 <!--�Ҳ�E-->

</div>

<? include("../tem/bottom.html");?>
</body>
</html>