<? checkdjl("c1",$uid,"yjcode_user");?>
<? include("../tem/top.html");?>
<div class="bfbtopm">
 <div class="yjcode">
 <ul class="shopmenu fontyh">
 <li class="l1">
 <a href="view<?=$uid?>.html">��ҳ</a>
 <a href="aboutview<?=$uid?>.html">��������</a>
 <a href="prolist_i<?=$uid?>v.html">����չʾ</a>
 </li>
 <li class="l2"><a href="<?=weburl?>">������վ��ҳ</a></li>
 </ul>
 </div>
</div>
<div class="yjcode">
<? $t="../upload/".$uid."/bannar.jpg";if(is_file($t)){?><div class="topbannar"><a href="view<?=$uid?>.html"><img src="<?=$t?>" border="0" /></a></div><? }?>
</div>