 <!--LEFT B-->
 <div class="left">
  <ul class="u1">
  <li class="l1"><a href="./">��Ա�������</a></li>
  <li class="l2"></li>
  </ul>
  <span class="cap c1">��������</span>
  <ul class="u2">
  <? while1("id,uid,shopzt","yjcode_user where uid='".$_SESSION[SHOPUSER]."'");$row1=mysql_fetch_array($res1);if(2!=$row1[shopzt]){?>
  <li class="l1"><a href="openshop1.php" class="acy red">��Ҫ����</a></li><li class="l2"></li>
  <? }else{?>
  <li class="l1"><a href="shop.php" class="acy">��������</a></li><li class="l2">[<a href="../shop/view<?=$row1[id]?>.html" class="acy" target="_blank">Ԥ��</a>]</li>
  <li class="l1"><a href="productlist.php" class="acy">��Ʒ�б�</a></li><li class="l2">[<a href="productlx.php" class="acy">����</a>]</li>
  <li class="l1"><a href="productlist.php?ifxj=1" class="acy">�ֿ��еı���</a></li><li class="l2"></li>
  <li class="l1">
  <span class="s1"><?=returncount("yjcode_order where selluserid=".$row1[id]." and ddzt='wait'")?></span>
  <a href="sellorder.php" class="acy">��������</a>
  </li>
  <li class="l2">[<a href="sellorder.php?ddzt=wait" class="acy red">����</a>]</li>
  <? }?>
  </ul>
  <span class="cap c4">�������</span>
  <ul class="u2">
  <li class="l1"><a href="order.php" class="acy">�ҵĶ���</a></li><li class="l2">[<a href="order.php?ddzt=db" class="acy">�ջ�</a>]</li>
  <li class="l1"><a href="favpro.php" class="acy">�ҵ��ղ�</a></li><li class="l2">[<a href="favshop.php" class="acy">����</a>]</li>
  <li class="l1"><a href="car.php" class="acy">���ﳵ</a></li><li class="l2"></li>
  <li class="l1"><a href="tasklist.php" class="acy">�������</a></li><li class="l2"></li>
  <li class="l1"><a href="newslist.php" class="acy">�������</a></li><li class="l2">[<a href="newslx.php" class="acy">Ͷ��</a>]</li>
  </ul>
  <span class="cap c2">�������</span>
  <ul class="u2">
  <li class="l1"><a href="pay.php" class="acy">��Ҫ��ֵ</a></li><li class="l2">[<a href="paylog.php" class="acy">��ϸ</a>]</li>
  <li class="l1"><a href="tixian.php" class="acy">��Ҫ����</a></li><li class="l2">[<a href="tixianlog.php" class="acy">��ʷ</a>]</li>
  <li class="l1"><a href="jflog.php" class="acy">������ϸ</a></li><li class="l2"></li>
  <li class="l1"><a href="zfmm.php" class="acy">��ȫ��</a></li><li class="l2"></li>
  <li class="l1"><a href="tjuid.php" class="acy">���Ƽ��Ļ�Ա</a></li><li class="l2"></li>
  </ul>
  <span class="cap c3">�û�����</span>
  <ul class="u2">
  <li class="l1"><a href="inf.php" class="acy">��д��������</a></li><li class="l2"></li>
  <li class="l1"><a href="touxiang.php" class="acy">�����û�ͷ��</a></li><li class="l2"></li>
  <li class="l1"><a href="mobbd.php" class="acy">�ֻ���֤</a></li><li class="l2"></li>
  <li class="l1"><a href="emailbd.php" class="acy">������֤</a></li><li class="l2"></li>
  </ul>
  <span class="cap c5">����ϵͳ</span>
  <ul class="u2">
  <li class="l1"><a href="gdlist.php" class="acy">�ҵĹ���</a></li><li class="l2"></li>
  <li class="l1"><a href="gdlx.php" class="acy">�ύ����</a></li><li class="l2"></li>
  </ul>
 </div>
 <!--LEFT E-->
 <?
 $luserid=returnuserid($_SESSION[SHOPUSER]);
 createDir("../upload/".$luserid."/");
 sellmoneytj($luserid);
 include("auto.php");
 ?>