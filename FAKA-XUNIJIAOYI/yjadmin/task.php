<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$id=$_GET[id];
while0("*","yjcode_task where id=".$id);if(!$row=mysql_fetch_array($res)){php_toheader("tasklist.php");}
if($_GET[control]=="update"){
 $money1=$_POST[tmoney1];if(!is_numeric($money1)){$money1=0;}
 updatetable("yjcode_task","tit='".sqlzhuru($_POST[ttit])."',txt='".sqlzhuru($_POST[content])."',type1id=".$_POST[d1].",money1=".$money1.",uqq='".sqlzhuru($_POST[tuqq])."',zt=".$_POST[Rzt].",ifok=".$_POST[Rifok].",sj='".$_POST[tsj]."',endsj='".$_POST[tendsj]."',djl=".$_POST[tdjl]." where id=".$id);
 php_toheader("task.php?t=suc&id=".$id);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>管理系统</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>

<script type="text/javascript" charset="gbk" src="../config/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/unit.js"></script>

</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu5").className="l51";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0602,")){echo "<div class='noneqx'>无权限</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_ad.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">当前位置：后台首页 - <strong>任务大厅</strong> [<a href="tasklist.php">返回</a>]</li><li class="l2"></li>
 </ul>

 <? if($_GET[t]=="suc"){systs("恭喜您，操作成功！","task.php?id=".$id);}?>
 <!--B-->
 <script language="javascript">
 function tj(){
 if((document.f1.ttit.value).replace(/\s/,"")==""){alert("请输入标题");document.f1.ttit.focus();return false;}	
 if((document.f1.tmoney1.value).replace(/\s/,"")==""){alert("请输入预算");document.f1.tmoney1.focus();return false;}	
 if((document.f1.tendsj.value).replace(/\s/,"")==""){alert("请输入QQ号码");document.f1.tendsj.focus();return false;}
 if((document.f1.tuqq.value).replace(/\s/,"")==""){alert("请输入QQ号码");document.f1.tuqq.focus();return false;}
 r=document.getElementsByName("Rzt");rr="";for(i=0;i<r.length;i++){if(r[i].checked==true){rr=r[i].value;}}if(rr==""){alert("请选择审核状态！");return false;}
 tjwait();
 f1.action="task.php?id=<?=$id?>&control=update";
 }
 </script>
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
 <li class="l10"><span class="red">*</span> 详细描述：</li>
 <li class="l11"><script id="editor" name="content" type="text/plain" style="width:710px;height:330px;"><?=$row[txt]?></script></li>
 <li class="l1">是否结束：</li>
 <li class="l2">
 <span class="finp">
 <input name="Rifok" type="radio" value="0" <? if(empty($row[ifok])){?>checked="checked"<? }?> /><strong>正在进行</strong> 
 <input name="Rifok" type="radio" value="1" <? if(1==$row[ifok]){?>checked="checked"<? }?> /><strong>已结束</strong> 
 </span>
 </li>
 </ul>
 
 <ul class="rightcap">
 <li class="l1 red">管理员操作</li>
 </ul>
 <ul class="uk">
 <li class="l1">发布时间：</li>
 <li class="l2"><input class="inp" name="tsj" value="<?=$row[sj]?>" size="20" type="text"/> 正确的时间格式如：2012-12-12 12:12:12</li>
 <li class="l1">点击率：</li>
 <li class="l2"><input class="inp" name="tdjl" value="<?=$row[djl]?>" size="10" type="text"/></li>
 <li class="l1">审核状态：</li>
 <li class="l2">
 <span class="finp">
 <input name="Rzt" type="radio" value="0" <? if(0==$row[zt]){?>checked="checked"<? }?> /><strong>正常展示</strong> 
 <input name="Rzt" type="radio" value="1" <? if(1==$row[zt]){?>checked="checked"<? }?> /><strong>正在审核</strong> 
 <input name="Rzt" type="radio" value="2" <? if(2==$row[zt]){?>checked="checked"<? }?> /><strong>审核不通过</strong> 
 </span>
 </li>
 <li class="l3"><? tjbtnr("下一步","tasklist.php")?></li>
 </ul>
 </form>
 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
<script type="text/javascript">
//实例化编辑器
var ue = UE.getEditor('editor');
</script>

</body>
</html>