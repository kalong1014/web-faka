 <? 
 $au="../product/view".returnproid($row[probh]).".html";
 ?>
 <ul class="typeuk1"><li class="l1">��Ʒ��Ϣ</li><li class="l2"><a href="<?=$au?>" target="_blank" class="blue"><strong><?=$row[tit]?></strong></a></li></ul>
 <ul class="typeuk">
 <li class="l1">�������</li><li class="l2"><?=$orderbh?></li>
 <li class="l1">�µ�ʱ��</li><li class="l2"><?=$row[sj]?></li>
 <li class="l1">�����ܶ�</li><li class="l2 feng">��<strong><?=returnjgdian($row[money1]*$row[num])?></strong></li>
 <li class="l1">��������</li><li class="l2"><?=$row[num]?></li>
 <li class="l1">����״̬</li><li class="l2"><?=returnorderzt($row[ddzt])?></li>
 </ul>
 
 <? if($row[ddzt]=="db" || $row[ddzt]=="suc"){?>
 <ul class="typeuk1 typeuk11">
 <li class="l1">�ջ���Ϣ</li>
 <li class="l2 fontyh">
 <? while1("*","yjcode_pro where bh='".$row[probh]."'");if($row1=mysql_fetch_array($res1)){?>
 
  <? if(1==$row1[fhxs]){?><strong class="blue">�ö�������Ʒ�������ֶ�����������ϵ���ң�˳����-���������ʵ�Դ�뽻�ס��������ס����Դ���վ������ƽ̨-www.hzskdz.com</strong><? }?>
 
  <? if(2==$row1[fhxs]){?>
  <strong>�ö�����Ʒͨ���������أ������������Ϣ���أ�</strong><br>
  <strong class="blue">���̵�ַ��<?=$row1[wpurl]?><br>�������룺<?=$row1[wppwd]?></strong>
  <? }?>
 
  <? if(3==$row1[fhxs]){?>
  <strong>�ö�������Ʒ�Ѿ���������������������ͼ���������</strong><br>
  <a href="../upload/<?=$row1[userid]?>/<?=$row1[bh]?>/<?=$row1[upf]?>" target="_blank"><img border="0" style="margin-top:5px;" src="img/down.jpg" /></a>
  <? }?>
 
  <? if(4==$row1[fhxs]){?>
  <strong>������������Ŀ�����Ϣ</strong><br>
  <?=$row[txt]?>
  <? }?>
 
 <? }else{?>
 <strong class="red">�ף��ܱ�Ǹ���޷��ṩ�ö����ķ�����Ϣ�����ѱ�����ɾ����������ϵ����</strong>
 <? }?>
 </li>
 </ul>
 <? }?>
 
 <? if($row[ddzt]=="backerr"){?>
 <ul class="typeuk1"><li class="l1">�˿�����</li><li class="l2">���� <?=$row[tksj]?> �������˿�<br>�˿����ɣ�<?=$row[tkly]?></li></ul>
 <ul class="typeuk1"><li class="l1">�˿�����ظ�</li><li class="l2">������ <?=$row[tkoksj]?> �ܾ��˱����˿�����<br>ԭ��<?=$row[tkjg]?></li></ul>
 
 <? }elseif($row[ddzt]=="backsuc"){?>
 <ul class="typeuk1"><li class="l1">�˿�����</li><li class="l2">���� <?=$row[tksj]?> �������˿�<br>�˿����ɣ�<?=$row[tkly]?></li></ul>
 <ul class="typeuk1"><li class="l1">�˿�����ظ�</li><li class="l2">������ <?=$row[tkoksj]?> ͬ���˱����˿�����<br>�ظ���<?=$row[tkjg]?></li></ul>
 
 <? }?>
 
 <ul class="typeuk1"><li class="l1">������Ϣ</li><li class="l2"><strong><?=returnnc($row[selluserid])?><br><a href="http://wpa.qq.com/msgrd?v=3&uin=<?=returnqq($row[selluserid])?>&site=<?=weburl?>&menu=yes" target="_blank"><img border="0" src="img/qq.png" /></a></strong></li></ul>