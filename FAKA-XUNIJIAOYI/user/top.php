 <!--TOP B-->
 <div class="top">
  <ul class="u1">
  <li class="l1">欢迎来到<?=webname?>，<?=$_SESSION["SHOPUSER"]?></li>
  <li class="l2"><a href="gdlx.php">提交工单</a> | <a href="./">会员中心</a> | <a href="pwd.php">修改密码</a> | <a href="un.php">安全退出</a></li>
  </ul>
  <ul class="u2">
  <li class="l1"><a href="../"><img border="0" src="../img/logo.png" /></a></li>
  <li class="l2">
  <a href="../">首页</a>
  <? while1("*","yjcode_ad where adbh='ADI02' and type1='文字' order by xh asc limit 7");while($row1=mysql_fetch_array($res1)){?>
  <a href="<?=$row1[aurl]?>"><?=$row1[tit]?></a>
  <? }?>
  </li>
  </ul>
 </div>
 <!--TOP E-->