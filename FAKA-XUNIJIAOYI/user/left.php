 <!--LEFT B-->
 <div class="left">
  <ul class="u1">
  <li class="l1"><a href="./">会员管理面板</a></li>
  <li class="l2"></li>
  </ul>
  <span class="cap c1">我是卖家</span>
  <ul class="u2">
  <? while1("id,uid,shopzt","yjcode_user where uid='".$_SESSION[SHOPUSER]."'");$row1=mysql_fetch_array($res1);if(2!=$row1[shopzt]){?>
  <li class="l1"><a href="openshop1.php" class="acy red">我要开店</a></li><li class="l2"></li>
  <? }else{?>
  <li class="l1"><a href="shop.php" class="acy">店铺设置</a></li><li class="l2">[<a href="../shop/view<?=$row1[id]?>.html" class="acy" target="_blank">预览</a>]</li>
  <li class="l1"><a href="productlist.php" class="acy">商品列表</a></li><li class="l2">[<a href="productlx.php" class="acy">发布</a>]</li>
  <li class="l1"><a href="productlist.php?ifxj=1" class="acy">仓库中的宝贝</a></li><li class="l2"></li>
  <li class="l1">
  <span class="s1"><?=returncount("yjcode_order where selluserid=".$row1[id]." and ddzt='wait'")?></span>
  <a href="sellorder.php" class="acy">订单管理</a>
  </li>
  <li class="l2">[<a href="sellorder.php?ddzt=wait" class="acy red">发货</a>]</li>
  <? }?>
  </ul>
  <span class="cap c4">我是买家</span>
  <ul class="u2">
  <li class="l1"><a href="order.php" class="acy">我的订单</a></li><li class="l2">[<a href="order.php?ddzt=db" class="acy">收货</a>]</li>
  <li class="l1"><a href="favpro.php" class="acy">我的收藏</a></li><li class="l2">[<a href="favshop.php" class="acy">店铺</a>]</li>
  <li class="l1"><a href="car.php" class="acy">购物车</a></li><li class="l2"></li>
  <li class="l1"><a href="tasklist.php" class="acy">任务大厅</a></li><li class="l2"></li>
  <li class="l1"><a href="newslist.php" class="acy">稿件中心</a></li><li class="l2">[<a href="newslx.php" class="acy">投稿</a>]</li>
  </ul>
  <span class="cap c2">财务管理</span>
  <ul class="u2">
  <li class="l1"><a href="pay.php" class="acy">我要充值</a></li><li class="l2">[<a href="paylog.php" class="acy">明细</a>]</li>
  <li class="l1"><a href="tixian.php" class="acy">我要提现</a></li><li class="l2">[<a href="tixianlog.php" class="acy">历史</a>]</li>
  <li class="l1"><a href="jflog.php" class="acy">积分明细</a></li><li class="l2"></li>
  <li class="l1"><a href="zfmm.php" class="acy">安全码</a></li><li class="l2"></li>
  <li class="l1"><a href="tjuid.php" class="acy">我推荐的会员</a></li><li class="l2"></li>
  </ul>
  <span class="cap c3">用户管理</span>
  <ul class="u2">
  <li class="l1"><a href="inf.php" class="acy">填写个人资料</a></li><li class="l2"></li>
  <li class="l1"><a href="touxiang.php" class="acy">设置用户头像</a></li><li class="l2"></li>
  <li class="l1"><a href="mobbd.php" class="acy">手机认证</a></li><li class="l2"></li>
  <li class="l1"><a href="emailbd.php" class="acy">邮箱认证</a></li><li class="l2"></li>
  </ul>
  <span class="cap c5">工单系统</span>
  <ul class="u2">
  <li class="l1"><a href="gdlist.php" class="acy">我的工单</a></li><li class="l2"></li>
  <li class="l1"><a href="gdlx.php" class="acy">提交工单</a></li><li class="l2"></li>
  </ul>
 </div>
 <!--LEFT E-->
 <?
 $luserid=returnuserid($_SESSION[SHOPUSER]);
 createDir("../upload/".$luserid."/");
 sellmoneytj($luserid);
 include("auto.php");
 ?>