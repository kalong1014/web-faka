<?
include("config/conn.php");
include("config/function.php");
$sj=date("Y-m-d H:i:s");
?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="<?=$rowcontrol[webkey]?>">
<meta name="description" content="<?=$rowcontrol[webdes]?>">
<title><?=$rowcontrol[webtit]?> - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script language="javascript" src="js/index.js"></script>
</head>
<body>
<? include("tem/top.html");?>
<div class="yjcode">
<? adwhile("ADI00");?>
<? while1("*","yjcode_ad where adbh='ADLP' order by xh asc limit 1");if($row1=mysql_fetch_array($res1)){?>
<div id="toplsad" onMouseOver="rels()"><a href="<?=$row1[aurl]?>" target="_blank"><img border="0" src="<?=weburl?>ad/<?=$row1[bh]?>.<?=$row1[jpggif]?>" /></a></div>
<span id="toplsimg" style="display:none;"><?=weburl?>ad/<?=$row1[bh]?>.<?=$row1[jpggif]?></span>
<? }?>
</div>
<? include("tem/top1.html");?>

<!--��������жϿ�ʼ-->
<? while1("*","yjcode_ad where adbh='ADDL' order by xh asc limit 1");if($row1=mysql_fetch_array($res1)){?>
<script language="JavaScript" src="js/dlad.js"></script>
<script language="javascript">
 var theFloaters= new floaters();
 //����
 theFloaters.addItem('followDiv1','document.body.clientWidth-106',80,'<?=adwhile("ADDL",1)?><span class="dlclo" onclick="dlonc()">�ر�</span>');
 //����
 theFloaters.addItem('followDiv2',6,80,'<?=adwhile("ADDL",1)?><span class="dlclo" onclick="dlonc()">�ر�</span>');
 theFloaters.play();
</script>
<? }?>
<!--��������жϽ���-->


<div class="yjcode">

<!--��ർ����ʼ-->
<div class="left">
<span id="leftnone" style="display:none">0</span>
<script language="javascript">
leftmenuover();
</script>
</div>
<!--��ർ������-->

<!--�л���ʼ-->
<div class="qh">
 <div class="container" id="idTransformView">
  <ul class="slider" id="idSlider">
  <?
  $i=1;
  while1("*","yjcode_ad where adbh='ADI04' order by xh asc");while($row1=mysql_fetch_array($res1)){
  ?>
    <li><a href="<?=$row1[aurl]?>"><img src="ad/<?=$row1[bh]?>.<?=$row1[jpggif]?>" width="680" height="221" border="0" /></a></li>
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

<!--������ÿ�ʼ-->
<div class="iright">
 <ul class="ksdl">
 <li class="l1"><a href="reg/" class="a1"></a><a href="reg/reg.php" class="a2"></a></li>
 <li class="l2">�������ʺŵ�¼��</li>
 <li class="l3"><a href="config/qq/oauth/index.php"><img border="0" src="img/qq5.gif" width="15" height="16" /></a></li>
 </ul>
 <ul class="u1">
 <li class="cap"><a href="http://www.5ufxw.com/" target="_blank">���Ƿ�������վ����</a></li>
 <li class="mo"><a href="help/gglist.html" target="_blank">����>></a></li>
 <? while0("*","yjcode_gg where zt=0 order by sj desc limit 3");while($row=mysql_fetch_array($res)){?>
 <li class="l1">��<a href="help/ggview<?=$row[id]?>.html" title="<?=$row[tit]?>" target="_blank"><?=strgb2312($row[tit],0,26)?></a></li>
 <li class="l2">[<?=dateMD($row[sj])?>]</li>
 <? }?>
 </ul>
 <ul class="u2">
 <li class="l1">��Ա <strong><?=returncount("yjcode_user")?></strong> λ</li>
 <li class="l2">��Ʒ <strong><?=returncount("yjcode_pro where zt=0 and ifxj=0")?></strong> ��</li>
 <li class="l3">���� <strong><?=returncount("yjcode_order where (ddzt='wait' or ddzt='db' or ddzt='back' or ddzt='suc')")?></strong> ��</li>
 <li class="l4">���� <strong><?=returncount("yjcode_task where zt=0")?></strong> ��</li>
 <li class="l5">�ɽ� <strong><?=sprintf("%.0f",returnsum("money1*num","yjcode_order where ddzt<>'backsuc' and ddzt<>'close'"))?></strong> Ԫ</li>
 <li class="l6">�̼� <strong><?=returncount("yjcode_user where shopzt=2")?></strong> ��</li>
 </ul>
</div>
<!--������ý���-->

<!--���½��׿�ʼ-->
<div class="newjy">
<span class="s1"><a href="http://www.5ufxw.com/" target="_blank">���Ƿ��������½���</a></span>
<span class="s2"></span>
 <ul id="rolltxt">
 <? $i=0;while1("*","yjcode_order where (ddzt='wait' or ddzt='db' or ddzt='suc') order by sj desc limit 20");while($row1=mysql_fetch_array($res1)){?>
 <li><?=returnnc($row1[userid])?> ������ <span class="blue"><?=returntitdian($row1[tit],40)?></span> ���ۣ�<strong>��<?=$row1[money1]?></strong> [<?=returnorderzt($row1[ddzt])?>]</li>
 <? $i++;}?>
 </ul>
</div>
<span id="jynum" style="display:none;"><?=$i?></span>
<script language="javascript" src="js/jy.js"> </script>
<!--���½��׽���-->


<!--��B-->
<div class="tuancap fontyh">
<ul class="u1">
<li class="l1"><a href="http://www.5ufxw.com/" target="_blank">���Ƿ�������ʱ�ؼ�</a></li>
<li class="l2">��<a href="help/aboutview3.html" target="_blank">�ҵĲ�ƷҲҪ����������</a>��</li>
</ul>
</div>
<div class="tuan">
<? 
$i=1;
while1("*","yjcode_pro where zt=0 and ifxj=0 and iftuan=1 and yhxs=2 and yhsj2>'".$sj."' order by yhsj2 asc limit 4");while($row1=mysql_fetch_array($res1)){
$money1=returnyhmoney($row1[yhxs],$row1[money2],$row1[money3],$sj,$row1[yhsj1],$row1[yhsj2],$row1[id]);
$au="product/view".$row1[id].".html";
$dqsj=str_replace("-","/",$row1[yhsj2]);
while2("*","yjcode_user where id=".$row1[userid]);$row2=mysql_fetch_array($res2);
?>
<span id="dqsj<?=$i?>" style="display:none;"><?=$dqsj?></span>
<ul class="u1" onMouseOver="this.className='u1 u11';" onMouseOut="this.className='u1';">
<li class="l1">
<span class="djs" id="djs<?=$i?>">˳��Դ��</span>
<a href="<?=$au?>" target="_blank"><img class="tp" border="0" src="<?=returntppd(returntp("bh='".$row1[bh]."'","-1"),"img/none200x200.gif")?>" width="256" height="256" /></a>
</li>
<li class="l2 fontyh"><a href="<?=$au?>" title="<?=$row1[tit]?>" target="_blank"><?=strgb2312($row1[tit],0,56)?></a></li>
<li class="l3">��<strong><?=$money1?></strong> <s class="hui">��<?=$row1[money1]?></s></li>
<li class="l4"><?=strgb2312(($money1/$row1[money1]*10),0,3)?>��</li>
<li class="l5"><a href="shop/view<?=$row2[id]?>.html"><?=$row2[shopname]?></a></li>
<li class="l6">����<?=$row1[xsnum]?>��</li>
</ul>
<? $i++;}?>
</div>
<script language="javascript">
userChecksj();
</script>
<!--��E-->

<!--�б�ʼ-->
<?
$ni=1;
while1("*","yjcode_type where admin=1 and (iftj is null or iftj=0) order by xh asc");while($row1=mysql_fetch_array($res1)){
$nj=1;
?>
<div class="ilistcap fontyh" style="border-top:<?=$row1[col]?> solid 3px;">
<ul class="u1 ucap<?=$ni?>">
<li class="l1" style="background:url(homeimg/listcap.png) center bottom no-repeat;background-color:<?=$row1[col]?>;"><?=$ni?>F</li>
<li class="l2"><font style="color:<?=$row1[col]?>"><?=$row1[type1]?></font></li>
<li class="l3<? if(1==$nj){?> l31<? }?>" id="lcap<?=$ni?>-<?=$nj?>" onMouseOver="lcapover(<?=$ni?>,<?=$nj?>)"><a href="http://www.5ufxw.com/" target="_blank">���Ƿ�������Ʒ�Ƽ�</a></li>
<?
$ty2idarr=array();
while2("*","yjcode_type where type1='".$row1[type1]."' and admin=2 order by xh asc limit 4");while($row2=mysql_fetch_array($res2)){
$ty2idarr[$nj-1]=$row2[id];
$nj++;
?>
<li class="l3" id="lcap<?=$ni?>-<?=$nj?>" onMouseOver="lcapover(<?=$ni?>,<?=$nj?>)"><a href="product/search_j<?=$row1[id]?>v_k<?=$row2[id]?>v.html"><?=$row2[type2]?></a></li>
<?
}
?>
<li class="l4"><a href="product/search_j<?=$row1[id]?>v.html">�鿴����</a></li>
</ul>
</div>

<div class="yjplist" id="lmain<?=$ni?>-1">
<?
$i=1+($ni-1)*25;
while0("*","yjcode_pro where ifxj=0 and zt=0 and iftj>0 and ty1id=".$row1[id]." order by iftj asc limit 15");while($row=mysql_fetch_array($res)){
$au="product/view".$row[id].".html";
include("tem/plist.php");
$i++;
}
?>
</div>

<? for($mi=2;$mi<=$nj;$mi++){?>
<div class="yjplist" id="lmain<?=$ni?>-<?=$mi?>" style="display:none;">
<? 
$i=1+($ni-1)*25+($mi-1)*5;
while0("*","yjcode_pro where ifxj=0 and zt=0 and ty1id=".$row1[id]." and ty2id=".$ty2idarr[$mi-2]." order by lastsj desc limit 5");while($row=mysql_fetch_array($res)){
$au="product/view".$row[id].".html";
include("tem/plist.php");
$i++;
}
?>
</div>
<? }?>

<?
$ni++;
}
?>
<!--�б����-->

<!--����B-->
<div class="pl">

<div class="gdmain">
<ul class="u1"><li class="l1"><a href="http://www.5ufxw.com/" target="_blank">���Ƿ�������������</a></li><li class="l2"></li></ul>
<div class="igd" id="Marquee">
<!--������ʼ-->
<?
while1("*","yjcode_propj order by sj desc limit 30");while($row1=mysql_fetch_array($res1)){
while2("*","yjcode_pro where bh='".$row1[probh]."'");$row2=mysql_fetch_array($res2);
$au="product/view".$row2[id].".html";
?>
<div class="gd">
<table align="left" width="358">
<tr>
<td width="65" valign="middle"><a href="<?=$au?>" target="_blank"><img alt="<?=$row1[tit]?>" src="<?=returntp("bh='".$row2[bh]."' order by iffm asc","-2")?>" width="58" height="58" class="tp" /></a></td>
<td width="293" style="line-height:20px;">
<span class="hui"><?=strgb2312($row2[tit],0,44)?><br><?=dateYMDHM($row1[sj])?></span><br><?=returntitdian($row1[txt],40)?>
</td>
</tr>
</table>
</div>
<? }?>
<script>
var Mar = document.getElementById("Marquee");
var child_div=Mar.getElementsByTagName("div")
var picH = 67;//�ƶ��߶�
var scrollstep=3;//�ƶ�����,Խ��Խ��
var scrolltime=20;//�ƶ�Ƶ��(����)Խ��Խ��
var stoptime=3000;//���ʱ��(����)
var tmpH = 0;
Mar.innerHTML += Mar.innerHTML;
function start(){
if(tmpH < picH){
tmpH += scrollstep;
if(tmpH > picH )tmpH = picH ;
Mar.scrollTop = tmpH;
setTimeout(start,scrolltime);
}else{
tmpH = 0;
Mar.appendChild(child_div[0]);
Mar.scrollTop = 0;
setTimeout(start,stoptime);
}
}
</script>
<!--��������-->
</div>
</div>

<? while1("*","yjcode_newstype where admin=1 order by xh asc limit 2");while($row1=mysql_fetch_array($res1)){?>
<ul class="u2">
<li class="l1"><?=$row1[name1]?></li><li class="l2"><a href="news/newslist_j<?=$row1[id]?>v.html" target="_blank">����</a></li>
<? while2("*","yjcode_news where type1id=".$row1[id]." and zt=0 order by lastsj desc limit 8");while($row2=mysql_fetch_array($res2)){?>
<li class="l3"><a href="news/txtlist_i<?=$row2[id]?>v.html" title="<?=$row2[tit]?>" target="_blank"><?=returntitcss(strgb2312($row2[tit],0,53),$row2[ifjc],$row2[titys])?></a></li>
<? }?>
</ul>
<? }?>
</div>
<!--����E-->

<!--�̼�B-->
<div class="isj">
<ul class="u1">
<li class="l1">��<br>��<br>��<br>��<br>��<br>��</li>
<? while1("*","yjcode_user where zt=1 and shopzt=2 and shopname<>'' and pm>0 order by pm asc limit 7");while($row1=mysql_fetch_array($res1)){?>
<li class="l2"><a href="shop/view<?=$row1[id]?>.html" target="_blank"><img width="110" height="110" src="<?=returntppd("upload/".$row1[id]."/shop.jpg","img/none180x180.gif")?>" /><br><?=strgb2312($row1[shopname],0,17)?></a></li>
<? }?>
</ul>
<ul class="u2">
<li class="l1"><a href="http://www.5ufxw.com/" target="_blank">���Ƿ�����������פ�̼�</a></li>
<? $i=1;while1("*","yjcode_user where zt=1 and shopzt=2 and shopname<>'' order by sj desc limit 5");while($row1=mysql_fetch_array($res1)){$i++;?>
<li class="l2<? if($i % 2==0){echo " l21";}?>">����: <a href="shop/view<?=$row1[id]?>.html" target="_blank"><?=$row1[shopname]?></a> ��פ�ɹ�</li>
<? }?>
</ul>
</div>
<!--�̼�E-->

 <!--����B-->
 <div class="bolink">
 <ul class="u1">
 <li class="l1 fontyh"><?=webname?><a href="http://www.5ufxw.com/" target="_blank">���Ƿ������������</a></li>
 <li class="l2">
 <? while0("*","yjcode_ad where adbh='ADI13' order by xh asc");while($row=mysql_fetch_array($res)){?>
 <a href="<?=$row[aurl]?>" target="_blank"><img alt="<?=$row[tit]?>" border=0 src="ad/<?=$row[bh]?>.<?=$row[jpggif]?>" width="100" height="35"></a>
 <? }?>
 </li>
 </ul>
 <ul class="u1">
 <li class="l1 fontyh"><?=webname?><a href="http://www.5ufxw.com/" target="_blank">���Ƿ�������������</a></li>
 <li class="l3">
 <? while0("*","yjcode_ad where adbh='ADI14' and type1='����' order by xh asc");while($row=mysql_fetch_array($res)){?>
 <a href="<?=$row[aurl]?>" target="_blank"><?=$row[tit]?></a>
 <? }?>
 </li>
 </ul>
 </div>
 <!--����E-->

</div>

<? include("tem/bottom.html");?>
</body>
</html>