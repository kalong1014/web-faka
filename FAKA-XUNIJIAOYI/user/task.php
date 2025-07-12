<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$id=$_GET[id];
$userid=returnuserid($_SESSION[SHOPUSER]);
while0("*","yjcode_task where id=".$id." and userid=".$userid);if(!$row=mysql_fetch_array($res)){php_toheader("tasklist.php");}

if($_GET[control]=="add"){
 $money1=$_POST[tmoney1];if(!is_numeric($money1)){$money1=0;}
 if(empty($rowcontrol[taskok])){$zt=1;}else{$zt=0;}
 updatetable("yjcode_task","tit='".sqlzhuru($_POST[ttit])."',txt='".sqlzhuru($_POST[content])."',type1id=".$_POST[d1].",money1=".$money1.",uqq='".sqlzhuru($_POST[tuqq])."',zt=".$zt.",endsj='".$_POST[tendsj]."' where userid=".$userid." and id=".$id);
 php_toheader("task.php?t=suc&id=".$id);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户管理面板 - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script type="text/javascript" charset="utf-8" src="../ckeditor/kindeditor.js"></script>
<script type="text/javascript">
KE.show({
      id : 'content',
       resizeMode : 1,
       cssPath : '../ckeditor/examples/index.css',
       items : [
       'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
       'removeformat', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
       'insertunorderedlist']
});
function tj(){
 if((document.f1.ttit.value).replace(/\s/,"")==""){alert("请输入标题");document.f1.ttit.focus();return false;}	
 if((document.f1.tmoney1.value).replace(/\s/,"")==""){alert("请输入预算");document.f1.tmoney1.focus();return false;}	
 if((document.f1.tendsj.value).replace(/\s/,"")==""){alert("请输入QQ号码");document.f1.tendsj.focus();return false;}
 if((document.f1.tuqq.value).replace(/\s/,"")==""){alert("请输入QQ号码");document.f1.tuqq.focus();return false;}
 tjwait();
 f1.action="task.php?control=add&id=<?=$id?>";
}
</script>
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
 <? systs("恭喜您，操作成功!","task.php?id=".$id)?>
 
 <!--B-->
 <form name="f1" method="post" onsubmit="return tj()">
 <ul class="uk">
 <li class="l1">审核状态：</li>
 <li class="l21"><?=returnztv($row[zt])?></li>
 <li class="l1"><span class="red">*</span> 所在分组：</li>
 <li class="l2">
 <select name="d1">
 <option value="0">==不限==</option>
 <? while1("*","yjcode_tasktype order by xh asc");while($row1=mysql_fetch_array($res1)){?>
 <option value="<?=$row1[id]?>"<? if($row1[id]==$row[type1id]){?> selected="selected"<? }?>><?=$row1[name1]?></option>
 <? }?>
 </select>
 </li>
 <li class="l1"><span class="red">*</span> 任务主题：</li>
 <li class="l2"><input type="text" size="80" value="<?=$row[tit]?>" class="inp" name="ttit" /></li>
 <li class="l1"><span class="red">*</span> 预算费用：</li>
 <li class="l2"><input type="text" size="20" value="<?=$row[money1]?>" class="inp" name="tmoney1" /></li>
 <li class="l1"><span class="red">*</span> 截止时间：</li>
 <li class="l2"><input type="text" size="20" value="<?=$row[endsj]?>" class="inp" name="tendsj" /></li>
 <li class="l1"><span class="red">*</span> 联系QQ：</li>
 <li class="l2"><input type="text" size="20" value="<?=$row[uqq]?>" class="inp" name="tuqq" /></li>
 <li class="l7">详细内容：</li>
 <li class="l8"><textarea id="content" name="content" style="width:640px;height:450px;visibility:hidden;"><?=$row[txt]?></textarea></li>
 <li class="l3"></li>
 <li class="l4"><? tjbtnr("下一步","tasklist.php")?></li>
 </ul>
 </form>
 <!--E-->

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>