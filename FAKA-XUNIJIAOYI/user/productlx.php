<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."' and shopzt=2";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("openshop3.php");}
$userid=$rowuser[id];

//������ʼ
if($_GET[control]=="add"){
 zwzr();
 $sj=date("Y-m-d H:i:s");
 $uip=$_SERVER["REMOTE_ADDR"];
 $bh=time()."-".$userid;
 createDir("../upload/".$userid."/".$bh."/");
 intotable("yjcode_pro","bh,userid,sj,lastsj,uip,ty1id,ty2id,ty3id,zt,djl,xsnum,yhxs,ifxj,pf1,pf2,pf3,iftj,fhxs","'".$bh."',".$userid.",'".$sj."','".$sj."','".$uip."',".sqlzhuru($_POST[type1id]).",".sqlzhuru($_POST[type2id]).",".sqlzhuru($_POST[type3id]).",99,0,0,1,0,5,5,5,0,1");
 php_toheader("product.php?bh=".$bh); 
 

}elseif($_GET[control]=="update"){
 zwzr();
 updatetable("yjcode_pro","ty1id=".sqlzhuru($_POST[type1id]).",ty2id=".sqlzhuru($_POST[type2id]).",ty3id=".sqlzhuru($_POST[type3id])." where userid=".$userid." and id=".$_GET[id]);
 php_toheader("product.php?bh=".$_GET[bh]); 

}
//��������

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û�������� - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<link href="../css/pty.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script language="javascript" src="../js/pty.js"></script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ��Ʒ�༭</li>
</ul>
<? include("left.php");?>
<!--RB-->
<div class="right">
 <? systs("��ϲ���������ɹ�!","shop.php")?>
 
 <? include("rcap3.php");?>
 <script language="javascript">
 $("rcap2").className="l1 l2";
 </script>

 <!--begin-->
 <? if($_GET[action]==""){?>
 <form name="f1" method="post" onsubmit="return tjadd('productlx.php',0)">
 <input type="hidden" name="type1id" value="0" />
 <input type="hidden" name="type2id" value="0" />
 <input type="hidden" name="type3id" value="0" />
 <div class="productlx">
 
  <div class="ptype">
  <a href="javascript:void(0);" class="a1">ѡ����� <img border="0" src="../img/jiandown.gif" width="7" height="4" /></a>
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
  <strong>����ǰѡ����ǣ�</strong>
  <span id="type1name"></span>
  <span id="type2name"></span>
  <span id="type3name"></span>
  </div>
  <div class="fb"><input type="submit" value="�����Ķ����¹������ڷ�����Ʒ" /></div>
  <div class="gz"><input id="C1" checked="checked" type="checkbox" value="1" /> �����Ķ���<a href="../help/aboutview8.html" class="feng" target="_blank">��Ʒ������֪����</a>����ͬ��</div>
  
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
  <a href="javascript:void(0);" class="a1">ѡ����� <img border="0" src="../img/jiandown.gif" width="7" height="4" /></a>
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
  ����ǰѡ����ǣ�
  <span id="type1name"><?=returntype(1,$row[ty1id])?> >> </span>
  <span id="type2name"><?=returntype(2,$row[ty2id])?> >> </span>
  <span id="type3name"><?=returntype(3,$row[ty3id])?></span>
  </div>
  <div class="fb"><input type="submit" value="�����Ķ����¹������ڷ�����Ʒ" /></div>
  <div class="gz"><input id="C1" checked="checked" type="checkbox" value="1" /> �����Ķ���<a href="../help/aboutview8.html" class="feng" target="_blank">��Ʒ������֪����</a>����ͬ��</div>

 </div>
 </form>
 
 <? }?>
 <!--end-->
 
</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>