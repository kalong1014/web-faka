 <? 
 $au="../product/view".returnproid($row[probh]).".html";
 ?>
 <ul class="typeuk1"><li class="l1">��Ʒ��Ϣ</li><li class="l2"><a href="<?=$au?>" target="_blank" class="blue"><strong><?=$row[tit]?></strong></a></li></ul>
 <ul class="typeuk">
 <li class="l1">�����ܶ�</li><li class="l2 feng">��<strong><?=returnjgdian($row[money1]*$row[num])?></strong></li>
 <li class="l1">��������</li><li class="l2"><?=$row[num]?></li>
 <li class="l1">�������</li><li class="l2"><?=$orderbh?></li>
 <li class="l1">�µ�ʱ��</li><li class="l2"><?=$row[sj]?></li>
 <li class="l1">����״̬</li><li class="l2"><?=returnorderzt($row[ddzt])?></li>
 <li class="l1">�������</li><li class="l2"><?=$row[message]?></li>
 <? if($row[ddzt]=="backsuc"){?>
 <li class="l1">�˿�����ʱ��</li><li class="l2"><?=$row[tksj]?></li>
 <li class="l1">�˿�����</li><li class="l2"><?=$row[tkly]?></li>
 <li class="l1">�˿�ظ�����</li><li class="l2"><?=$row[tkjg]?></li>
 <li class="l1">�˿��ʱ��</li><li class="l2"><?=$row[tkoksj]?></li>
 <? }?>
 </ul>
 <? $qq=returnqq($row[userid]);?>
 <ul class="typeuk1"><li class="l1">�����Ϣ</li><li class="l2"><strong><?=returnnc($row[userid])?><br><a href="http://wpa.qq.com/msgrd?v=3&uin=<?=$qq?>&site=<?=weburl?>&menu=yes" target="_blank"><img border="0" src="img/qq.png" align="left" style="margin:0 10px 0 0;" /></a> (QQ:<?=$qq?>)</strong></li></ul>