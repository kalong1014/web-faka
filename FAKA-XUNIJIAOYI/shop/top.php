<? checkdjl("c1",$uid,"yjcode_user");?>
<? include("../tem/top.html");?>
<div class="bfbtopm">
 <div class="yjcode">
 <ul class="shopmenu fontyh">
 <li class="l1">
 <a href="view<?=$uid?>.html">首页</a>
 <a href="aboutview<?=$uid?>.html">关于我们</a>
 <a href="prolist_i<?=$uid?>v.html">宝贝展示</a>
 </li>
 <li class="l2"><a href="<?=weburl?>">返回网站首页</a></li>
 </ul>
 </div>
</div>
<div class="yjcode">
<? $t="../upload/".$uid."/bannar.jpg";if(is_file($t)){?><div class="topbannar"><a href="view<?=$uid?>.html"><img src="<?=$t?>" border="0" /></a></div><? }?>
</div>