<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();

//函数开始
if($_GET[control]=="add"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0101,")){Audit_alert("权限不够","default.php");}
 zwzr();
 $sj=date("Y-m-d H:i:s");
 $uip=$_SERVER["REMOTE_ADDR"];
 $uid=sqlzhuru($_POST[t1]);
 while1("uid,zt,shopzt","yjcode_user where uid='".$uid."' and zt=1 and shopzt=2");if(!$row1=mysql_fetch_array($res1)){Audit_alert("会员不存在！","productlx.php");}
 $userid=returnuserid($uid);
 $bh=time()."-".$userid;
 createDir("../upload/".$userid."/".$bh."/");
 intotable("yjcode_pro","bh,userid,sj,lastsj,uip,ty1id,ty2id,ty3id,zt,djl,xsnum,yhxs,ifxj,pf1,pf2,pf3,iftj,fhxs","'".$bh."',".$userid.",'".$sj."','".$sj."','".$uip."',".sqlzhuru($_POST[type1id]).",".sqlzhuru($_POST[type2id]).",".sqlzhuru($_POST[type3id]).",99,0,0,1,0,5,5,5,0,1");
 php_toheader("product.php?bh=".$bh); 
 

}elseif($_GET[control]=="update"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0101,")){Audit_alert("权限不够","default.php");}
 zwzr();
 updatetable("yjcode_pro","ty1id=".sqlzhuru($_POST[type1id]).",ty2id=".sqlzhuru($_POST[type2id]).",ty3id=".sqlzhuru($_POST[type3id])." where id=".$_GET[id]);
 php_toheader("product.php?bh=".$_GET[bh]); 

}
//函数结束

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>管理系统</title>
<link href="../css/pty.css" rel="stylesheet" type="text/css" />
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script language="javascript" src="../js/pty.js"></script>
<script language="javascript">
function uidsel(){
document.f1.t1.value=document.f1.d1.value;	
}
</script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu3").className="l31";
</script>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_product.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">当前位置：后台首页 - 商品列表 - 商品编辑</li><li class="l2"></li>
 </ul>
 
 <!--begin-->
 <? if($_GET[action]==""){?>
 <form name="f1" method="post" onsubmit="return tjadd('productlx.php',1)">
 <input type="hidden" name="type1id" value="0" />
 <input type="hidden" name="type2id" value="0" />
 <input type="hidden" name="type3id" value="0" />
 <div class="productlx">
 
  <div class="ptype">
  <a href="javascript:void(0);" class="a1">选择分类 <img border="0" src="../img/jiandown.gif" width="7" height="4" /></a>
  <? while1("*","yjcode_type where admin=1 order by xh asc");while($row1=mysql_fetch_array($res1)){?>
  <a href="javascript:typeonc(<?=$row1[id]?>,'<?=$row1[type1]?>')" class="a2"><?=$row1[type1]?></a>
  <? }?>
  </div>
  
  <div class="ptype">
  <iframe name="ptype2" id="ptype2" marginwidth="1" scrolling="no" marginheight="1" height="100%" width="100%" border="0" frameborder="0"></iframe>
  </div>
  
  <div class="ptype">
  <iframe name="ptype3" id="ptype3" marginwidth="1" scrolling="no" marginheight="1" height="100%" width="100%" border="0" frameborder="0"></iframe>
  </div>
  
  <div class="sel">
  <strong>您当前选择的是：</strong>
  <span id="type1name"></span>
  <span id="type2name"></span>
  <span id="type3name"></span>
  </div>
  <ul class="uk">
  <li class="l1">输入会员帐号：</li>
  <li class="l2">
  <input type="text" class="inp" name="t1" onfocus="inpf(this)" onblur="inpb(this)" />
  <select name="d1" onchange="uidsel()">
  <option value="">最近使用</option>
  <? while1("uid,nc,zt,shopzt","yjcode_user where zt=1 and shopzt=2 order by sj desc limit 5");while($row1=mysql_fetch_array($res1)){?>
  <option value="<?=$row1[uid]?>"><?=$row1[uid]." ".$row1[nc]?></option>
  <? }?>
  </select>
  </li>
  </ul>
  <div class="fb"><input type="submit" value="我已阅读以下规则，现在发布商品" /></div>
  <div class="gz"><input id="C1" checked="checked" type="checkbox" value="1" /> 我已阅读《<a href="../help/aboutview8.html" class="feng" target="_blank">商品发布须知条款</a>》并同意</div>
  
 </div>
 </form>
 
 <? 
 }elseif($_GET[action]=="update"){
 while0("*","yjcode_pro where id=".$_GET[id]."");if(!$row=mysql_fetch_array($res)){php_toheader("productlist.php");}
 ?>
 <form name="f1" method="post" onsubmit="return tjupdate('productlx.php',<?=$_GET[id]?>,'<?=$row[bh]?>')">
 <input type="hidden" name="type1id" value="<?=$row[ty1id]?>" />
 <input type="hidden" name="type2id" value="<?=$row[ty2id]?>" />
 <input type="hidden" name="type3id" value="<?=$row[ty3id]?>" />
 <div class="productlx">
 
  <div class="ptype">
  <a href="javascript:void(0);" class="a1">选择分类 <img border="0" src="../img/jiandown.gif" width="7" height="4" /></a>
  <? while1("*","yjcode_type where admin=1 order by xh asc");while($row1=mysql_fetch_array($res1)){?>
  <a href="javascript:typeonc(<?=$row1[id]?>,'<?=$row1[type1]?>')" class="a2"><?=$row1[type1]?></a>
  <? }?>
  </div>
  
  <div class="ptype">
  <iframe name="ptype2" id="ptype2" marginwidth="1" scrolling="no" marginheight="1" height="100%" width="100%" border="0" frameborder="0" src="../tem/protype2.php?type1id=<?=$row[ty1id]?>"></iframe>
  </div>
  
  <div class="ptype">
  <iframe name="ptype3" id="ptype3" marginwidth="1" scrolling="no" marginheight="1" height="100%" width="100%" border="0" frameborder="0" src="../tem/protype3.php?type1id=<?=$row[ty1id]?>&type2id=<?=$row[ty2id]?>"></iframe>
  </div>
  
  <div class="sel">
  您当前选择的是：
  <span id="type1name"><?=returntype(1,$row[ty1id])?> >> </span>
  <span id="type2name"><?=returntype(2,$row[ty2id])?> >> </span>
  <span id="type3name"><?=returntype(3,$row[ty3id])?></span>
  </div>
  <div class="fb"><input type="submit" value="我已阅读以下规则，现在发布商品" /></div>
  <div class="gz"><input id="C1" checked="checked" type="checkbox" value="1" /> 我已阅读《<a href="../help/aboutview8.html" class="feng" target="_blank">商品发布须知条款</a>》并同意</div>

 </div>
 </form>
 
 <? }?>
 <!--end-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>