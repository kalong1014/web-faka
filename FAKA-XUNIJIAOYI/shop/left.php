 <? 
 $sucnum=returnjgdw($rowuser[xinyong],"",returnxy($uid,1));
 ?>
 <div class="left">
 <ul class="u1">
 <li class="l1"><a href="view<?=$rowuser[id]?>.html"><img border="0" src="<?=returntppd("../upload/".$rowuser[id]."/shop.jpg","../img/none200x200.gif")?>" width="160" height="160" /></a></li>
 <li class="l2"><?=$rowuser[shopname]?><br><img src="../img/dj/<?=returnxytp($sucnum)?>" /></li>
 <li class="l3">
 <span class="s1"><?=returncount("yjcode_pro where zt=0 and ifxj=0 and userid=".$uid)?><br><strong>商品</strong></span>
 <span class="s1"><?=$rowuser[sellmyue]?><br><strong>月销量</strong></span>
 <span class="s1 s0"><?=$rowuser[djl]?><br><strong>人气</strong></span>
 </li>
 <li class="l4"><a href="view<?=$rowuser[id]?>.html">掌柜：<?=$rowuser[nc]?></a></li>
 <li class="l5"><a href="http://wpa.qq.com/msgrd?v=3&uin=<?=$rowuser[uqq]?>&site=<?=weburl?>&menu=yes" target=_blank><img src="../img/qq.png" width="77" height="22" border="0" /></a></li>
 </ul>
 <ul class="u2">
 <li class="l1">最新上架商品</li>
 <? 
 while1("*","yjcode_pro where userid=".$uid." and zt=0 and ifxj=0 order by lastsj desc limit 5");while($row1=mysql_fetch_array($res1)){
 $au="../product/view".$row1[id].".html";
 $tp="../".returntp("bh='".$row1[bh]."' order by iffm asc","-2");
 ?>
 <li class="l2">
 <a href="<?=$au?>" target="_blank"><img border="0" src="<?=returntppd($tp,"../img/none60x60.gif")?>" width="60" height="60" align="left" /></a>
 <a href="<?=$au?>" target="_blank" class="a1" title="<?=$row1[tit]?>"><?=strgb2312($row1[tit],0,30)?></a><br><span>￥<?=returnjgdian(returnyhmoney($row1[yhxs],$row1[money2],$row1[money3],$sj,$row1[yhsj1],$row1[yhsj2],$row1[id]))?></span>
 </li>
 <? }?>
 </ul>
 </div>