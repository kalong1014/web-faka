<?
include("../config/conn.php");
include("../config/function.php");
$id=$_GET[id];
$sj=date("Y-m-d H:i:s");
while0("*","yjcode_task where id=".$id);if(!$row=mysql_fetch_array($res)){php_toheader("./");}
if($_GET[control]=="add"){
 $sj=date("Y-m-d H:i:s");
 $uip=$_SERVER["REMOTE_ADDR"];
 $userid=returnuserid($_SESSION[SHOPUSER]);
 $txt=sqlzhuru($_POST[content]);
 if(empty($txt)){php_toheader("view".$id.".html");}
 if(empty($rowcontrol[taskhfok])){$zt=1;}else{$zt=0;}
 intotable("yjcode_taskhf","bh,uip,userid,useridhf,sj,zt,txt","'".$row[bh]."','".$uip."',".$row[userid].",".$userid.",'".$sj."',".$zt.",'".$txt."'");
 php_toheader("view".$id.".html#hf");
}
if($row[endsj]<=$sj){updatetable("yjcode_task","ifok=1 where id=".$id);}
checkdjl("c2",$row[id],"yjcode_task");

?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=$row[tit]?> - <?=webname?></title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<link href="index.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/basic.js"></script>
<script language="javascript" src="index.js"></script>
<script type="text/javascript" charset="utf-8" src="../ckeditor/kindeditor.js"></script>
<script type="text/javascript">
KE.show({
      id : 'content',
       resizeMode : 1,
       cssPath : '../ckeditor/examples/index.css',
       items : [
       'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
       'removeformat','image', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
       'insertunorderedlist']
});
function tj(){
 tjwait();
 f1.action="view.php?control=add&id=<?=$id?>";
}
</script>
</head>
<body>
<? include("../tem/top.html");?>
<? include("../tem/top1.html");?>
<div class="yjcode">
 <div class="dqwz">
 <ul class="u1">
 <li class="l1">当前位置：<a href="<?=weburl?>">首页</a> > <a href="./">任务大厅</a> > 任务详情</li></ul>
 </div>
 
 <div class="taskcap">
 <ul class="u1">
 <li class="l1 fontyh"><strong class="red">￥<?=$row[money1]?></strong> &nbsp;&nbsp;<strong><?=$row[tit]?></strong></li>
 <li class="l2">编号：<?=$row[bh]?> | 分类：<?=returntasktype($row[type1id])?> | 发起：<?=$row[sj]?> | 发起者：<?=returnnc($row[userid])?> | QQ：<?=$row[uqq]?></li>
 </ul>
 </div>
 
 <div class="taskm">
 
  <!--左B-->
  <div class="left">
   <div class="tmtxt"><?=$row[txt]?></div>
   <a name="hf"></a>
   <? if(!empty($_SESSION[SHOPUSER])){$userid=returnuserid($_SESSION[SHOPUSER]);?>
   <? while1("*","yjcode_taskhf where bh='".$row[bh]."' and zt=1 and useridhf=".$userid." order by sj desc");while($row1=mysql_fetch_array($res1)){?>
   <ul class="uhf" onMouseOver="this.className='uhf uhf1';" onMouseOut="this.className='uhf';">
   <li class="l1">
   <img src="<?=returntppd("../upload/".$row1[useridhf]."/user.jpg","../img/none180x180.gif")?>" width="100" height="100" /><br><?=returnnc($row1[useridhf])?>
   </li>
   <li class="l2"><span class="red">[正在审核]</span><br><?=$row1[txt]?><br><span class="sjv">发表于 <?=$row1[sj]?></span></li>
   </ul>
   <? }}?>
   <? while1("*","yjcode_taskhf where bh='".$row[bh]."' and zt=0 order by sj desc limit 10");while($row1=mysql_fetch_array($res1)){?>
   <ul class="uhf" onMouseOver="this.className='uhf uhf1';" onMouseOut="this.className='uhf';">
   <li class="l1">
   <img src="<?=returntppd("../upload/".$row1[useridhf]."/user.jpg","../img/none180x180.gif")?>" width="100" height="100" /><br><?=returnnc($row1[useridhf])?>
   </li>
   <li class="l2"><?=$row1[txt]?><br><span class="sjv">回复于 <?=$row1[sj]?></span></li>
   </ul>
   <? }?>
   <? if(empty($_SESSION[SHOPUSER])){?>
   <div class="nlog">请“<a href="../reg/reg.php" target="_blank">注册</a>”或“<a href="../reg/" target="_blank">登录</a>”后再回复<br><span class="hui">(如已登录，按F5刷新)</span></div>
   <? }else{?>
   <form name="f1" method="post" onSubmit="return tj()">
   <ul class="u1">
   <li class="l1">回复内容</li>
   <li class="l3"><textarea id="content" name="content" style="width:740px;height:200px;visibility:hidden;"></textarea></li>
   <li class="l6"><? tjbtnr("提交")?></li>
   </ul>
   </form>
   <? }?>
  </div>
  <!--左E-->
  
  <!--右B-->
  <div class="right">
   <ul class="u0">
   <li class="l1"><strong><?=$row[djl]?></strong><br>关注</li>
   <li class="l1 l0"><strong><?=returncount("yjcode_taskhf where zt=0 and bh='".$row[bh]."'")?></strong><br>留言回复</li>
   </ul>
   <ul class="u1">
   <li class="l1">距任务结束还剩余</li>
   <? if(empty($row[ifok])){$dqsj=str_replace("-","/",$row[endsj]);?>
   <li class="l2 fontyh">
   <span id="nowsj" style="display:none;"><?=str_replace("-","/",date("Y-m-d H:i:s"))?></span>
   <span id="dqsj" style="display:none;"><?=$dqsj?></span>
   <span class="djs" id="djs">正在加载</span>
   <script language="javascript">userChecksj();</script>
   </li>
   <? }else{?>
   <li class="l3 fontyh">已结束</li>
   <? }?>
   </ul>
   <div class="fb"><input type="button" onClick="gourl('taskadd.php')" value="发布任务" /></div>
   <ul class="u2">
   <li class="l1">你可能感兴趣的任务</li>
   <? while1("*","yjcode_task where zt=0 and ifok=0 order by sj desc limit 10");while($row1=mysql_fetch_array($res1)){?>
   <li class="l2">·<a href="view<?=$row1[id]?>.html" title="<?=$row1[tit]?>"><?=strgb2312($row1[tit],0,30)?></a></li>
   <li class="l3">￥<?=$row1[money1]?></li>
   <? }?>
   </ul>
  </div>
  <!--右E-->
    
 </div>

</div>
<? include("../tem/bottom.html");?>
</body>
</html>