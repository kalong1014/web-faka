<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>����ϵͳ</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu5").className="l51";
</script>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_ad.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0602,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>������</strong></li><li class="l2">&nbsp;</li>
 </ul>
 
 <? include("rightcap2.php");?>
 <script language="javascript">$("rtit2").className="l1";</script>

 <!--begin-->
 <div class="listkuan">
 <ul class="typecap">
 <li class="l2">&nbsp;��涨λ���</li>
 <li class="l2">&nbsp;˵��</li>
 <li class="l9">����</li>
 </ul>
 
 <?
 $adbh=array("ADO01","ADU01","ADS01","ADTASK01");
 $adtit=array("��¼�������","��Ա�����Ҳ���","�̼��б�ҳ���Ϲ��","����������Ϲ��");
 $adsize=array("598*344","210*?","200*?","280*?");
 $admust=array("","","","");
 
 for($i=0;$i<count($adbh);$i++){
 $adurl="adlist.php?bh=".$adbh[$i]."&sm=".urlencode($adtit[$i]."-".$adsize[$i])."&must=".$admust[$i];
 ?>
 <ul class="typelist1" onMouseOver="this.className='typelist1 typelist11';" onMouseOut="this.className='typelist1';">
 <li class="l2" onclick="gourl('<?=$adurl?>')">&nbsp;<?=$adbh[$i]?></li>
 <li class="l2">&nbsp;<?=$adtit[$i]." ".$adsize[$i]?></li>
 <li class="l9">
 <a href="<?=$adurl?>">�б�</a> | 
 <a href="ad.php?bh=<?=$adbh[$i]?>&sm=<?=urlencode($adtit[$i]."-".$adsize[$i])?>&must=<?=$admust[$i]?>">����</a>
 </li>
 </ul>
 <?
 }
 ?>

 </div>
 <!--end-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>