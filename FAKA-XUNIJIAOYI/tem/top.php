<?
include("../config/conn.php");
include("../config/function.php");
?>
<div class="bfb bfbtop">
<div class="yjcode">

 <div class="top">
  <ul class="u1">
  <li class="l1">
   <span id="notlogin" style="display:none">
    <span class="s1">���ã���ӭ��<?=webname?>��[<a href="<?=weburl?>reg/">��¼</a> | <a href="<?=weburl?>reg/reg.php">���ע��</a> | <a class="feng" href="<?=weburl?>user/qiandao.php">ÿ��ǩ��</a>]</span>
    <span class="s2"><a href="<?=weburl?>config/qq/oauth/index.php"><img border="0" src="<?=weburl?>img/qq_login.png" /></a></span>
   </span>
   <span id="yeslogin" style="display:none">��ӭ����<span id="yesuid"></span>&nbsp;&nbsp;[<a class="feng" href="<?=weburl?>user/qiandao.php" id="needqd" style="display:none;">ÿ��ǩ��</a><a class="blue" id="dontqd" style="display:none;" href="<?=weburl?>user/qiandao.php">������ǩ��</a>]&nbsp;&nbsp;<a href="<?=weburl?>user/un.php">�˳�</a></span>
  </li>
  <li class="l2"><a href="<?=weburl?>">��վ��ҳ</a></li>
  <li class="l2"><a href="<?=weburl?>user/order.php">�ҵĶ���</a></li>
  <li class="l3" onmouseover="lover(3)" onmouseout="lout(3)" id="topu1l3">
  <a href="<?=weburl?>user/" class="a1">��Ա����</a>
  <div class="umenu" id="umenu3" style="display:none;">
  <a href="<?=weburl?>user/">�����¼</a>
  <a href="<?=weburl?>user/pay.php">���߳�ֵ</a>
  <a href="<?=weburl?>user/paylog.php">�ʽ���ϸ</a>
  <a href="<?=weburl?>user/favpro.php">�ҵ��ղ�</a>
  <a href="<?=weburl?>user/inf.php">������Ϣ</a>
  </div>
  </li>
  <li class="l0"></li>
  <li class="l2 l21"><a href="<?=weburl?>user/pay.php" class="feng">��ֵ</a></li>
  <li class="l2 l21"><a href="<?=weburl?>user/tixian.php" class="green">����</a></li>
  <li class="l2"><a href="<?=weburl?>help/">���ְ���</a></li>
  <li class="l2"><a href="<?=weburl?>user/gdlx.php" target="_blank" class="red">���ʱش�</a></li>
  </ul>
 </div> 
 
</div>
</div>
<span id="webhttp" style="display:none"><?=weburl?></span>
<script language="javascript">
userCheckses();
</script>