<?
include("../config/conn.php");
include("../config/function.php");
?>
<div class="bfb bfbbot">
<div class="yjcode">
 <div class="bottom">
 <ul class="u1">
 <? while1("*","yjcode_helptype where admin=1 order by xh asc limit 5");while($row1=mysql_fetch_array($res1)){?>
 <li>
 <span class="fontyh"><a href="<?=weburl?>help/search_j<?=$row1[id]?>v.html"><?=$row1[name1]?></a></span>
 <? 
 while2("*","yjcode_helptype where admin=2 and name1='".$row1[name1]."' order by xh asc limit 5");while($row2=mysql_fetch_array($res2)){
 $aurl="search_j".$row1[id]."v_k".$row2[id]."v.html";
 if(returncount("yjcode_help where ty1id=".$row1[id]." and ty2id=".$row2[id])==1){
 while3("id,ty1id,ty2id","yjcode_help where ty1id=".$row1[id]." and ty2id=".$row2[id]);$row3=mysql_fetch_array($res3);
 $aurl="view".$row3[id].".html";
 }
 ?>
 <a href="<?=weburl?>help/<?=$aurl?>" class="a1"><?=$row2[name2]?></a><br>
 <? }?>
 </li>
 <? }?>
 </ul>
 <div class="ad"><? adwhile("ADI01");?></div>
 <div class="bq">
 <a href="<?=weburl?>">��վ��ҳ</a> | 
 <a href="<?=weburl?>help/aboutview2.html">��������</a> | 
 <a href="<?=weburl?>help/aboutview3.html">������</a> | 
 <a href="<?=weburl?>help/aboutview4.html">��ϵ����</a> | 
 <a href="<?=weburl?>help/aboutview5.html">��˽����</a> | 
 <a href="<?=weburl?>help/aboutview6.html">��������</a><br>
 CopyRight 2014-2016 <?=webname?> | <?=$rowcontrol[beian]?><br /><script type="text/javascript" src="http://links.webscan.360.cn/index/index/0a8178af405fbd03182aa373357daa2c"></script><br><?=$rowcontrol[webtj]?>
 </div>
 </div>
 
</div>
</div>

<!--***********�Ҳม����ʼ*************-->
<div id="floatTips" class="floatTips" style="display:<? if($rowcontrol[ifkf]=="off"){?>none<? }?>;">

<div id="gdqqh" style="display:none;">
<ul class="uqq">
<li class="l1"><img src="<?=weburl?>img/qqr1.gif" style="cursor:pointer;" onclick="gdqqhout()" width="16" height="16" /></li>
<?
$qq=preg_split("/,/",$rowcontrol[webqqv]);
for($qqi=0;$qqi<count($qq);$qqi++){
$qv=preg_split("/\*/",$qq[$qqi]);
if($qv[0]!=""){
if($qv[1]==""){$qtit="��վ�ͷ�";}else{$qtit=$qv[1];}
?>
<li class="l2"><a href="http://wpa.qq.com/msgrd?v=3&uin=<?=$qv[0]?>&site=<?=weburl?>&menu=yes" target="_blank"><?=$qtit?></a></li>
<?
}
}
?>
<li class="l4">Ͷ������</li>
<li class="l5"><?=$rowcontrol[webtelv]?></li>
<li class="l6"><a href="#"><img src="<?=weburl?>img/qq3.gif" width="113" height="15" border="0" /></a></li>
</ul>
</div>

<div class="gdqqn" id="gdqqn" onclick="gdqqnover()"><img src="<?=weburl?>img/qqy1.jpg" width="53" height="200" /></div>

</div>
<script type="text/javascript">
initFloatTips();
</script>
<!--**********�Ҳม������***************-->
