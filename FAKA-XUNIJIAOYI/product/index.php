<?
include("../config/conn.php");
include("../config/function.php");
include("../config/xy.php");
$sj=date("Y-m-d H:i:s");
$getstr=$_GET[str];
$tit="��Ʒ";
$ses=" where zt=0 and ifxj=0";
$ty1id=returnsx("j");if($ty1id!=-1){$ty1name=returntype(1,$ty1id);$ses=$ses." and ty1id=".$ty1id;$tit=$tit.$ty1name;}
$ty2id=returnsx("k");if($ty2id!=-1){$ty2name=returntype(2,$ty2id);$ses=$ses." and ty2id=".$ty2id;$tit=$tit."/".$ty2name;}
$ty3id=returnsx("m");if($ty3id!=-1){$ty3name=returntype(3,$ty3id);$ses=$ses." and ty3id=".$ty3id;$tit=$tit."/".$ty3name;}
if(returnsx("s")!=-1){$skey=safeEncoding(returnsx("s"));$ses=$ses." and tit like '%".$skey."%'";$tit=$tit."/".$skey;}
if(returnsx("b")!=-1){$mon1=returnsx("b");$ses=$ses." and money2>=".$mon1;}
if(returnsx("c")!=-1){$mon2=returnsx("c");$ses=$ses." and money2<=".$mon2;}
if(returnsx("a")!=-1){$ifys=returnsx("a");$ses=$ses." and ysweb<>''";}
if(returnsx("d")!=-1){$ifzdfh=returnsx("d");$ses=$ses." and (fhxs=2 or fhxs=3 or fhxs=4)";}

if(returnsx("p")!=-1){$page=returnsx("p");}else{$page=1;}
$px="order by lastsj desc";
if(returnsx("f")==1){$px="order by xsnum desc";}
elseif(returnsx("f")==2){$px="order by djl desc";}
elseif(returnsx("f")==3){$px="order by money2 desc";}
elseif(returnsx("f")==4){$px="order by money2 asc";}
?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=$tit?> - <?=webname?></title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<link href="index.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/basic.js"></script>
<script language="javascript" src="index.js"></script>
</head>
<body>
<? include("../tem/top.html");?>
<? include("../tem/top1.html");?>
<script language="javascript">topjconc(1,'��Ʒ');document.getElementById("topt").value="<?=$skey?>";</script>
<div class="yjcode">
 <div class="dqwz">
 <ul class="u1">
 <li class="l1">
 ��ǰλ�ã�<a href="<?=weburl?>">��ҳ</a> > ��Ʒ�б� > 
 <? if($ty1id!=-1){?><a href="search_j<?=$ty1id?>v.html"><?=$ty1name?></a> > <? }?>
 <? if($ty2id!=-1){?><a href="search_j<?=$ty1id?>v_k<?=$ty2id?>v.html"><?=$ty2name?></a> > <? }?>
 <? if($ty3id!=-1){?><a href="search_j<?=$ty1id?>v_k<?=$ty2id?>v_m<?=$ty3id?>v.html"><?=$ty3name?></a> > <? }?>
 </ul>
 </div>

 <!--selB-->
 <div class="psel fontyh">
 <ul class="u1">
 <li class="l1">��Ʒɸѡ</li>
 <li class="l2"><a href="search.html" class="acy">����ɸѡ����</a></li>
 </ul>
 
 <ul class="u2">
 <li class="l1">��Ʒ���ࣺ</li>
 <li class="l2">
 <a href="<?=rentser('j','','e','','search','k','','m','');?>"<? if($ty1id==-1){?> class="ax"<? }?>>����</a>
 </li>
 <li class="l3">
 <? while1("*","yjcode_type where admin=1 order by xh asc");while($row1=mysql_fetch_array($res1)){?>
 <a href="<?=rentser("j",$row1[id],'e','','search','k','','m','');?>" <? if(check_in("_j".$row1[id]."v",$getstr)){?> class="ax"<? }?>><?=$row1[type1]?></a>
 <? }?>
 </li>
 </ul>
 
 <? if($ty1id!=-1){?>
 <ul class="u2">
 <li class="l1"><?=$ty1name?>��</li>
 <li class="l2">
 <a href="<?=rentser('k','','e','','search','m','');?>"<? if($ty2id==-1){?> class="ax"<? }?>>����</a>
 </li>
 <li class="l3">
 <? while1("*","yjcode_type where admin=2 and type1='".$ty1name."' order by xh asc");while($row1=mysql_fetch_array($res1)){?>
 <a href="<?=rentser("k",$row1[id],'e','','search','m','');?>" <? if(check_in("_k".$row1[id]."v",$getstr) && check_in("_k".$row1[id]."v",$getstr)){?> class="ax"<? }?>><?=$row1[type2]?></a>
 <? }?>
 </li>
 </ul>
 <? }?>
 
 <? if($ty2id!=-1){if(panduan("*","yjcode_type where admin=3 and type1='".$ty1name."' and type2='".$ty2name."'")==1){?>
 <ul class="u2">
 <li class="l1"><?=$ty2name?>��</li>
 <li class="l2">
 <a href="<?=rentser('m','','e','');?>"<? if($ty3id==-1){?> class="ax"<? }?>>����</a>
 </li>
 <li class="l3">
 <? while3("*","yjcode_type where admin=3 and type1='".$ty1name."' and type2='".$ty2name."' order by xh asc");while($row3=mysql_fetch_array($res3)){?>
 <a href="<?=rentser("m",$row3[id],'e','');?>" <? if(check_in("_m".$row3[id]."v",$getstr)){?> class="ax"<? }?>><?=$row3[type3]?></a>
 <? }?>
 </li>
 </ul>
 <? }}?>

 <? 
 $si=0;
 $sbarr=array();
 while1("*","yjcode_typesx where admin=1 and typeid=".$ty1id." order by xh asc");while($row1=mysql_fetch_array($res1)){
 $ev="e".$row1[id]."_";
 $sbarr[$si]=$ev;
 ?>
 <ul class="u2">
 <li class="l1"><?=$row1[name1]?>��</li>
 <li class="l2">
 <a href="<?=rentser($ev,'','','');?>" <? if(check_in("_".$ev."_v",$getstr) || !check_in("_".$ev,$getstr)){?> class="ax"<? }?>>����</a>
 </li>
 <li class="l3">
 <? while2("*","yjcode_typesx where admin=2 and name1='".$row1[name1]."' and typeid=".$row1[typeid]." order by xh asc");while($row2=mysql_fetch_array($res2)){?>
 <a href="<?=rentser($ev,$row2[id],'','');?>" <? if(check_in("_".$ev.$row2[id]."v",$getstr)){?> class="ax"<? }?>><?=$row2[name2]?></a>
 <? }?>
 </li>
 </ul>
 <? 
 $si++;
 }
 for($si=0;$si<count($sbarr);$si++){if(returnsx($sbarr[$si])!=-1){$nsx="xcf".returnsx($sbarr[$si])."xcf";$ses=$ses." and tysx like '%".$nsx."%'";}}
 ?>
 </div>
 <!--selE-->

 <!--��ѡ����B-->
 <div class="nser fontyh">
 <ul class="u1">
 <li class="l1">��ѡ������</li>
 <li class="l2">
 <? if($ty1id!=-1){?>
 <span class="s1" onMouseOver="this.className='s2';" onMouseOut="this.className='s1';"><a title="ȡ��" href="<?=rentser('j','','e','','search','k','','m','');?>"><?=$ty1name?></a></span>
 <? }?>
 
 <? if($ty2id!=-1){?>
 <span class="s1" onMouseOver="this.className='s2';" onMouseOut="this.className='s1';"><a title="ȡ��" href="<?=rentser('k','','e','','search','m','');?>"><?=$ty2name?></a></span>
 <? }?>
 
 <? if($ty3id!=-1){?>
 <span class="s1" onMouseOver="this.className='s2';" onMouseOut="this.className='s1';"><a title="ȡ��" href="<?=rentser('m','','k','','search');?>"><?=$ty3name?></a></span>
 <? }?>
 
 <? 
 for($si=0;$si<count($sbarr);$si++){
  $tsx=returnsx($sbarr[$si]);
  if($tsx!=-1){
   while1("*","yjcode_typesx where id=".$tsx);if($row1=mysql_fetch_array($res1)){
   if($row1[admin]==2){
 ?>
 <span class="s1" onMouseOver="this.className='s2';" onMouseOut="this.className='s1';"><a title="ȡ��" href="<?=rentser($sbarr[$si],'','','','search');?>"><?=$row1[name1]."��".$row1[name2]?></a></span>
 <? }}}}?>
 
 <? 
 if(returnsx("b")!=-1 || returnsx("c")!=-1){ 
  if(returnsx("c")!=-1 && returnsx("b")!=-1){$tjv=returnsx("b")."-".returnsx("c")."Ԫ";}
  elseif(returnsx("c")==-1){$tjv=returnsx("b")."Ԫ����";}
  elseif(returnsx("b")==-1){$tjv=returnsx("c")."Ԫ����";}
 ?>
 <span class="s1" onMouseOver="this.className='s2';" onMouseOut="this.className='s1';"><a title="ȡ��" href="<?=rentser('b','','c','','search');?>"><?=$tjv?></a></span>
 <? }?>
 
 <? if($skey!=""){?>
 <span class="s1" onMouseOver="this.className='s2';" onMouseOut="this.className='s1';"><a title="ȡ��" href="<?=rentser('s','','','','search');?>"><?=$skey?></a></span>
 <? }?>
 
 <? if($ifys==1){?>
 <span class="s1" onMouseOver="this.className='s2';" onMouseOut="this.className='s1';"><a title="ȡ��" href="<?=rentser('a','','','','search');?>">����ʾվ</a></span>
 <? }?>
 
 <? if($ifzdfh==1){?>
 <span class="s1" onMouseOver="this.className='s2';" onMouseOut="this.className='s1';"><a title="ȡ��" href="<?=rentser('d','','','','search');?>">�Զ�����</a></span>
 <? }?>
  
 </li>
 </ul>
 </div>
 <!--��ѡ����E-->

 <div class="listr">
  <? pagef($ses,30,"yjcode_pro",$px);?>
  <!--ɸѡB-->
  <form name="f1" method="post" onSubmit="return psear()">
  <div class="propx fontyh">
  <ul class="u1">
  <li class="l1"><a href="./" class="a1">��Ʒ�б�</a><a href="../task" target="_blank">�������</a></li>
  <li class="l2"><a href="../user/productlx.php" target="_blank">��ҲҪ������Ʒ</a></li>
  </ul>
  <ul class="u2">
  <li class="l1">
  <a href="<?=rentser('f','','','');?>"<? if(returnsx("f")==-1){?> class="a1"<? }?>>����</a>
  <a href="<?=rentser('f','1','','');?>"<? if(returnsx("f")==1){?> class="a1"<? }?>>����</a>
  <a href="<?=rentser('f','2','','');?>"<? if(returnsx("f")==2){?> class="a1"<? }?>>����</a>
  <a href="<?=rentser('f','3','','');?>"<? if(returnsx("f")==3 || returnsx("f")==4){?> class="a1"<? }?>>�۸�</a>
  </li>
  <li class="l2"><input id="C1" type="checkbox" value="1"<? if($ifys==1){?> checked<? }?>></li>
  <li class="l3">����ʾվ</li>
  <li class="l2"><input id="C2" type="checkbox" value="1"<? if($ifzdfh==1){?> checked<? }?>></li>
  <li class="l3">�Զ�����</li>
  <li class="l4">�۸�</li>
  <li class="l5"><input name="money1" id="money1" value="<?=$mon1?>" type="text" /></li>
  <li class="l6">-</li>
  <li class="l5"><input name="money2" id="money2" value="<?=$mon2?>" type="text" /></li>
  <li class="l7">�ؼ��֣�</li>
  <li class="l8"><input name="ink1" value="<?=$skey?>" id="ink1" type="text" /></li>
  <li class="l9"><input name="" value="ȷ��" type="submit" /></li>
  <li class="l11">��<strong class="feng"><?=$count?></strong>������</li>
  <li class="l10">
  <a href="<?=rentser('h','2','','');?>"<? if(returnsx("h")==2){?> class="a1"<? }?>>�б�</a>
  <a href="<?=rentser('h','1','','');?>"<? if(returnsx("h")==1 || returnsx("h")==-1){?> class="a1"<? }?>>��ͼ</a>
  </li>
  </ul>
  </div>
  </form>
  <!--ɸѡE-->
  
  <? if(returnsx("h")==1 || (0==$rowcontrol[propx] && returnsx("h")==-1)){?>
  <!--ͼƬB-->
  <div class="l">
  <?
  $i=1;
  while($row=mysql_fetch_array($res)){
  $au="view".$row[id].".html";
  while1("id,uqq,shopname","yjcode_user where id=".$row[userid]);$row1=mysql_fetch_array($res1);
  $tit=strgb2312($row[tit],0,50);
  if(!empty($skey)){$tit=str_replace($skey,"<span class='red'>".$skey."</span>",$tit);}
  $tp="../".returntp("bh='".$row[bh]."' order by iffm asc","-2");
  ?>
  <div class="lv<? if($i % 5==0){echo " lv0";}?>" onMouseOver="this.className='lv lv1<? if($i % 5==0){echo " lv0";}?>';" onMouseOut="this.className='lv<? if($i % 5==0){echo " lv0";}?>';">
  <ul class="u1 fontyh">
  <li class="l1"><a href="<?=$au?>" target="_blank"><img alt="<?=$row[tit]?>" border="0" src="<?=returntppd($tp,"../img/none180x180.gif")?>" width="210" height="210" /></a></li>
  <li class="l2">��<strong><?=returnjgdian(returnyhmoney($row[yhxs],$row[money2],$row[money3],$sj,$row[yhsj1],$row[yhsj2],$row[id]))?></strong></li>
  <li class="l3"><a href="<?=$au?>" title="<?=$row[tit]?>" target="_blank"><?=$tit?></a></li>
  <li class="l4"><a href="../shop/view<?=$row1[id]?>.html" target="_blank" class="hui"><?=returntitdian($row1[shopname],20)?></a></li>
  <li class="l5">����<span class="red"><?=$row[xsnum]?></span>��</li>
  <li class="l6">����<span class="green"><?=returncount("yjcode_propj where probh='".$row[bh]."'")?></span></li>
  <li class="l7"><a href="http://wpa.qq.com/msgrd?v=3&uin=<?=$row1[uqq]?>&site=<?=weburl?>&menu=yes" target=_blank><img src="../img/qq2.gif" border="0" width="25" height="25" /></a></li>
  </ul>
  </div>
  <? $i++;}?>
  </div>
  <!--ͼƬE-->
  <? }else{?>
  <!--�б�B-->
  <ul class="listcap">
  <li class="l0">����ͼ</li>
  <li class="l1">��Ʒ��Ϣ</li>
  <li class="l2">�۸�</li>
  <li class="l3">���</li>
  <li class="l4">����</li>
  </ul>
  <?
  $i=1;
  while($row=mysql_fetch_array($res)){
  $au="view".$row[id].".html";
  while1("id,uqq,shopname,xinyong","yjcode_user where id=".$row[userid]);$row1=mysql_fetch_array($res1);
  $tit=strgb2312($row[tit],0,50);
  if(!empty($skey)){$tit=str_replace($skey,"<span class='red'>".$skey."</span>",$tit);}
  $tp="../".returntp("bh='".$row[bh]."' order by iffm asc","-2");
  $xy=returnjgdw($row1[xinyong],"",returnxy($row[userid],1));
  ?>
  <ul class="list" onMouseOver="this.className='list list1';" onMouseOut="this.className='list';">
  <li class="l0"><a href="<?=$au?>" target="_blank"><img alt="<?=$row[tit]?>" border="0" src="<?=returntppd($tp,"../img/none180x180.gif")?>" width="100" height="100" /></a></li>
  <li class="l1">
  <a href="view<?=$row[id]?>.html" target="_blank" class="a1" title="<?=$row[tit]?>"><?=returntitdian($row[tit],90)?></a><br>
  <? if(1!=$row[fhxs]){?><img src="../img/auto.gif" width="81" style="margin:6px 0 5px 0;" height="17" /><br><? }?>
  �������ã�<img src="../img/dj/<?=returnxytp($xy)?>" /><br>
  <a href="../shop/view<?=$row1[id]?>.html" target="_blank" class="hui"><?=returntitdian($row1[shopname],20)?></a>
  </li>
  <li class="l2">
  <strong>��<?=returnjgdian(returnyhmoney($row[yhxs],$row[money2],$row[money3],$sj,$row[yhsj1],$row[yhsj2],$row[id]))?></strong><br>
  <s class="hui"><?=$row[money1]?>Ԫ</s>
  </li>
  <li class="l3"><?=$row[kcnum]?></li>
  <li class="l4">
  <input type="button" value="�鿴����" onClick="javascript:location.href='<?=$au?>';" class="inp1" onMouseOver="this.className='inp1 inp11';" onMouseOut="this.className='inp1';" />
  </li>
  </ul>
  <? }?>
  <!--�б�B-->
  <? }?>
  
  <div class="npa">
  <?
  $nowurl="search";
  $nowwd="";
  require("../tem/page.html");
  ?>
  </div>
 </div>

</div>

<? include("../tem/bottom.html");?>
</body>
</html>