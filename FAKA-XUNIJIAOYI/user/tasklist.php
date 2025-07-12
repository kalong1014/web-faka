<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户管理面板 - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">您的位置：<a href="../" class="acy">首页</a> > <a href="./" class="acy">会员中心</a> > 任务大厅</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <? include("rcap9.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>

 <ul class="typecap">
 <li class="l1">&nbsp;&nbsp;&nbsp;标题</li>
 <li class="l4">预算</li>
 <li class="l4">审核状态</li>
 <li class="l4">发起时间</li>
 </ul>
 <ul class="listcap1">
 <li class="l1"><input name="C2" type="checkbox" onclick="xuan()" /> 全选</li>
 <li class="l2">
 <a href="javascript:NcheckDEL(3,'yjcode_task')" class="a2">删除</a>
 <a href="javascript:gourl('../task/taskadd.php')" class="a1">发布任务</a>
 </li>
 <li class="l3"></li>
 </ul>
  
 <?
 $ses=" where userid=".$luserid;
 $page=$_GET["page"];if($page==""){$page=1;}else{$page=intval($_GET["page"]);}
 pagef($ses,30,"yjcode_task","order by sj desc");while($row=mysql_fetch_array($res)){
 ?>
 <ul class="typelist2" onmouseover="this.className='typelist2 typelist21';" onmouseout="this.className='typelist2';">
 <li class="l0"><input name="C1" type="checkbox" value="<?=$row[bh]?>" /></li>
 <li class="l1"><a href="task.php?id=<?=$row[id]?>"><?=$row[tit]?></a> | 回复(<?=returncount("yjcode_taskhf where bh='".$row[bh]."' and userid=".$luserid)?>) [<a href="../task/view<?=$row[id]?>.html" target="_blank" class="feng">预览</a>]</li>
 <li class="l4"><strong class="feng"><?=$row[money1]?>元</strong></li>
 <li class="l4"><?=returnztv($row[zt])?></li>
 <li class="l4"><?=$row[sj]?></li>
 </ul>
 <? }?>

 <div class="npa">
 <?
 $nowurl="tasklist.php";
 $nowwd="";
 require("page.html");
 ?>
 </div>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>