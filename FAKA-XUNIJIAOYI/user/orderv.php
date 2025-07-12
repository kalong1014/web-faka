 <? 
 $au="../product/view".returnproid($row[probh]).".html";
 ?>
 <ul class="typeuk1"><li class="l1">商品信息</li><li class="l2"><a href="<?=$au?>" target="_blank" class="blue"><strong><?=$row[tit]?></strong></a></li></ul>
 <ul class="typeuk">
 <li class="l1">订单编号</li><li class="l2"><?=$orderbh?></li>
 <li class="l1">下单时间</li><li class="l2"><?=$row[sj]?></li>
 <li class="l1">订单总额</li><li class="l2 feng">￥<strong><?=returnjgdian($row[money1]*$row[num])?></strong></li>
 <li class="l1">购买数量</li><li class="l2"><?=$row[num]?></li>
 <li class="l1">订单状态</li><li class="l2"><?=returnorderzt($row[ddzt])?></li>
 </ul>
 
 <? if($row[ddzt]=="db" || $row[ddzt]=="suc"){?>
 <ul class="typeuk1 typeuk11">
 <li class="l1">收货信息</li>
 <li class="l2 fontyh">
 <? while1("*","yjcode_pro where bh='".$row[probh]."'");if($row1=mysql_fetch_array($res1)){?>
 
  <? if(1==$row1[fhxs]){?><strong class="blue">该订单的商品由卖家手动发货，请联系卖家，顺控网-国内最优质的源码交易、域名交易、免费源码等站长服务平台-www.hzskdz.com</strong><? }?>
 
  <? if(2==$row1[fhxs]){?>
  <strong>该订单商品通过网盘下载，请根据以下信息下载：</strong><br>
  <strong class="blue">网盘地址：<?=$row1[wpurl]?><br>网盘密码：<?=$row1[wppwd]?></strong>
  <? }?>
 
  <? if(3==$row1[fhxs]){?>
  <strong>该订单的商品已经传至服务器，请点击以下图标进行下载</strong><br>
  <a href="../upload/<?=$row1[userid]?>/<?=$row1[bh]?>/<?=$row1[upf]?>" target="_blank"><img border="0" style="margin-top:5px;" src="img/down.jpg" /></a>
  <? }?>
 
  <? if(4==$row1[fhxs]){?>
  <strong>以下是您购买的卡密信息</strong><br>
  <?=$row[txt]?>
  <? }?>
 
 <? }else{?>
 <strong class="red">亲，很抱歉，无法提供该订单的发货信息（或已被卖家删除），请联系卖家</strong>
 <? }?>
 </li>
 </ul>
 <? }?>
 
 <? if($row[ddzt]=="backerr"){?>
 <ul class="typeuk1"><li class="l1">退款申请</li><li class="l2">您于 <?=$row[tksj]?> 申请了退款<br>退款理由：<?=$row[tkly]?></li></ul>
 <ul class="typeuk1"><li class="l1">退款申请回复</li><li class="l2">卖家于 <?=$row[tkoksj]?> 拒绝了本次退款申请<br>原因：<?=$row[tkjg]?></li></ul>
 
 <? }elseif($row[ddzt]=="backsuc"){?>
 <ul class="typeuk1"><li class="l1">退款申请</li><li class="l2">您于 <?=$row[tksj]?> 申请了退款<br>退款理由：<?=$row[tkly]?></li></ul>
 <ul class="typeuk1"><li class="l1">退款申请回复</li><li class="l2">卖家于 <?=$row[tkoksj]?> 同意了本次退款申请<br>回复：<?=$row[tkjg]?></li></ul>
 
 <? }?>
 
 <ul class="typeuk1"><li class="l1">卖家信息</li><li class="l2"><strong><?=returnnc($row[selluserid])?><br><a href="http://wpa.qq.com/msgrd?v=3&uin=<?=returnqq($row[selluserid])?>&site=<?=weburl?>&menu=yes" target="_blank"><img border="0" src="img/qq.png" /></a></strong></li></ul>