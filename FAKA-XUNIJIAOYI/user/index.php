<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
while0("*","yjcode_user where uid='".$_SESSION[SHOPUSER]."'");if(!$row=mysql_fetch_array($res)){php_toheader("un.php");}
$usertx="../upload/".$row[id]."/user.jpg";if(!is_file($usertx)){$usertx="img/nonetx.gif";}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û�������� - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a></li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="iright">

 <!--����B-->
 <div class="jb">
 <ul class="ircap">
 <li class="l1">�ҵĻ�����Ϣ</li>
 </ul>
 <div class="tx"><a href="touxiang.php"><img border="0" src="<?=$usertx?>" width="100" height="100" /></a><br>[<a href="touxiang.php">����ͷ��</a>]</div>
 <ul class="u1">
 <li class="l1">�û�����<strong class="blue"><?=$_SESSION["SHOPUSER"]?></strong></li>
 <li class="l2">��֤��</li>
 <li class="l3">
 <a href="mobbd.php"><? if(1==$row[ifmot]){?><img src="img/sj1.gif" title="�ֻ���ͨ����֤" /><? }else{?><img src="img/sj0.gif" title="�ֻ�δ��֤" /><? }?></a>
 <a href="emailbd.php"><? if(1==$row[ifemail]){?><img src="img/yx1.gif" title="������ͨ����֤" /><? }else{?><img src="img/yx0.gif" title="����δ��֤" /><? }?></a>
 </li>
 <li class="l1">
 �ϴε�¼��<?
 while1("*","yjcode_loginlog where userid=".$row[id]." and admin=1 order by id desc limit 2");$row1=mysql_fetch_array($res1);$psj=$row1[sj];$puip=$row1[uip];
 if($row1=mysql_fetch_array($res1)){$psj=$row1[sj];$puip=$row1[uip];}
 ?>
 <?=$psj?> <a href="http://www.baidu.com/s?wd=<?=$puip?>" title="<?=$puip?>" target="_blank">[�鿴��ַ]</a>
 </li>
 </ul>
 <ul class="u2">
 <li class="l0">���û���<br><strong><?=$row[jf]?></strong></li>
 <li class="l1">�������<br><strong><?=sprintf("%.2f",$row[money1])?></strong></li>
 <li class="l2"><input type="button" value="��ֵ" onclick="gourl('pay.php')" /></li>
 </ul>
 </div>
 <!--����E-->
 
 <!--�ƹ�B-->
 <div class="tuig">
 <ul class="u1">
 <li class="l1">�����������ӵ���̳��QQȺ������Ȧ�ȣ�ͨ��������ע���˳������Ա���׺��������ÿ�ʽ��׶�<strong><? if(empty($rowcontrol[tjmoney])){echo 0;}else{echo $rowcontrol[tjmoney]*100;}?>%</strong>��ΪӶ������㣬����׬Ǯ^_^</li>
 <li class="l2"><input type="text" onclick="this.select();" value="<?=weburl?>reg/reg.php?tid=<?=$row[id]?>" /></li>
 </ul>
 </div>
 <!--�ƹ�E-->
 
 <!--��ʾB-->
 <div class="rzts">
 <ul class="ircap">
 <li class="l1">��ȫ����</li>
 </ul>
 
 <? if(1==$row[sfzrz]){$a="ok";}else{$a="err";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">ʵ����֤</li>
 <li class="l2">ͨ��ʵ����֤������������Ϊ���ṩ���õķ���</li>
 <li class="l3"><a href="smrz.php">�鿴</a></li>
 </ul>

 <? if(1==$row[ifmot]){$a="ok";}else{$a="err";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">�ֻ���</li>
 <li class="l2">�������ֻ�������ע��ʱ���ʺ��ϣ�����ʻ����ʽ�ȫ��</li>
 <li class="l3"><a href="mobbd.php">�鿴</a></li>
 </ul>
 
 <? if(empty($row[txyh]) || empty($row[txname]) || empty($row[txzh])){$a="err";}else{$a="ok";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">�տ��ʺ�����</li>
 <li class="l2">���ڱ�վ���ʽ�����ʱ�����ǽ�ͨ������տ��ʺŻ�����</li>
 <li class="l3"><a href="txsz.php">�鿴</a></li>
 </ul>
 
 <? if(1==$row[ifemail]){$a="ok";}else{$a="err";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">���������</li>
 <li class="l2">�������ǵ�¼����ʱ������ͨ�������һ�����</li>
 <li class="l3"><a href="emailbd.php">�鿴</a></li>
 </ul>
  
 <? if(strcmp(sha1("admin"),$row[pwd])==0 || strcmp(sha1("123456"),$row[pwd])==0 || strcmp(sha1("admin888"),$row[pwd])==0){$a="err";}else{$a="ok";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">��¼����</li>
 <li class="l2">Ӣ�ļ����ֻ���ŵ�������룬��ȫ�Ը��ߣ����鶨�ڸ�������</li>
 <li class="l3"><a href="pwd.php">�鿴</a></li>
 </ul>
 
 <? if(1==$row[ifqq]){$a="ok";}else{$a="err";}?>
 <ul class="u1">
 <li class="l1 <?=$a?>">QQ��</li>
 <li class="l2">��QQ���Ժ������QQһ����¼�������������ʺ�����</li>
 <li class="l3"><a href="qq.php">�鿴</a></li>
 </ul>
  
 <? if(!empty($row[uqq]) && !empty($row[weixin])){$a="ok";}else{$a="err";}?>
 <ul class="u1 u0">
 <li class="l1 <?=$a?>">��ϵ��ʽ</li>
 <li class="l2">�����������ĸ��˻������ϣ����������Ǹ���Ϊ���ṩ����</li>
 <li class="l3"><a href="inf<?=$_SESSION[FCWuserID]?>.php">�鿴</a></li>
 </ul>

 </div>
 <!--��ʾE-->

</div> 
<!--RE-->

<!--RRB-->
<div class="icb">
 <div class="kf">
 <ul class="icbcap">
 <li class="l1">��վ�ͷ�����</li>
 <li class="l2"></li>
 </ul>
 <ul class="u1">
 <li class="l1">�ͷ�QQ:</li>
 <li class="l2">
 <?
 $qq=preg_split("/,/",$rowcontrol[webqqv]);
 for($qqi=0;$qqi<count($qq);$qqi++){
 $qv=preg_split("/\*/",$qq[$qqi]);
 if($qv[0]!=""){
 if($qv[1]==""){$qtit="��վ�ͷ�";}else{$qtit=$qv[1];}
 ?>
 <a href="http://wpa.qq.com/msgrd?v=3&uin=<?=$qv[0]?>&site=<?=weburl?>&menu=yes" target="_blank"><?=$qtit?></a>
 <?
 }
 }
 ?>
 </li>
 <li class="l1">�绰��<?=$rowcontrol[webtelv]?></li>
 </ul>
 </div>
 
 <div class="icbad">
 <? adwhile("ADU01");?>
 </div>
</div>
<!--RRE-->

</div>
<? include("bottom.php");?>
</body>
</html>