 <!--TOP B-->
 <div class="top">
  <ul class="u1">
  <li class="l1">��ӭ����<?=webname?>��<?=$_SESSION["SHOPUSER"]?></li>
  <li class="l2"><a href="gdlx.php">�ύ����</a> | <a href="./">��Ա����</a> | <a href="pwd.php">�޸�����</a> | <a href="un.php">��ȫ�˳�</a></li>
  </ul>
  <ul class="u2">
  <li class="l1"><a href="../"><img border="0" src="../img/logo.png" /></a></li>
  <li class="l2">
  <a href="../">��ҳ</a>
  <? while1("*","yjcode_ad where adbh='ADI02' and type1='����' order by xh asc limit 7");while($row1=mysql_fetch_array($res1)){?>
  <a href="<?=$row1[aurl]?>"><?=$row1[tit]?></a>
  <? }?>
  </li>
  </ul>
 </div>
 <!--TOP E-->