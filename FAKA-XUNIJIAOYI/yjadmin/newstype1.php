<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$sj=date("Y-m-d H:i:s");
//函数开始
if($_GET[control]=="add"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){Audit_alert("权限不够","default.php");}
 zwzr();
 if(panduan("*","yjcode_newstype where admin=2 and name1='".sqlzhuru($_POST[t0])."' and name2='".sqlzhuru($_POST[t1])."'")==1){Audit_alert("该资讯分类已存在！","newstype1.php?ty1id=".$_GET[ty1id]);}
 intotable("yjcode_newstype","name1,name2,sj,xh,admin","'".sqlzhuru($_POST[t0])."','".sqlzhuru($_POST[t1])."','".$sj."',".sqlzhuru($_POST[t2]).",2");
 php_toheader("newstype1.php?t=suc&ty1id=".$_GET[ty1id]);
 
}elseif($_GET[control]=="update"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0301,")){Audit_alert("权限不够","default.php");}
 zwzr();
 if(panduan("*","yjcode_newstype where admin=2 and name1='".sqlzhuru($_POST[t0])."' and name2='".sqlzhuru($_POST[t1])."' and id<>".$_GET[id])==1){Audit_alert("该资讯分类已存在！","newstype1.php?action=update&id=".$_GET[id]."&ty1id=".$_GET[ty1id]);}
 updatetable("yjcode_newstype","name2='".sqlzhuru($_POST[t1])."',sj='".$sj."',xh=".sqlzhuru($_POST[t2])." where id=".$_GET[id]);
 php_toheader("newstype1.php?t=suc&action=update&id=".$_GET[id]."&ty1id=".$_GET[ty1id]);

}
//函数结果

while0("*","yjcode_newstype where id=".$_GET[ty1id]);$row=mysql_fetch_array($res);

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>管理后台</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
</head>
<body>
<?php include("top.html");?>
<script language="javascript">
$("menu1").className="l11";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0302,")){echo "<div class='noneqx'>无权限</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_quanju.html");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz"><li class="l1">当前位置：<a href="./" class="a2">后台首页</a> - <strong class="red"><?=$row[name1]?></strong> - <strong>编辑二级资讯分类</strong> [<a href="newstypelist.php">返回</a>]</li><li class="l2"></li></ul>
 
 <? if($_GET[t]=="suc"){systs("恭喜您，操作成功！","newstype1.php?action=".$_GET[action]."&ty1id=".$_GET[ty1id]."&id=".$_GET[id]);}?>
 
 <!--begin-->
 <? if($_GET[action]!="update"){?>
 <script language="javascript">
 function tj(){
 if((document.f1.t1.value).replace(/\s/,"")==""){alert("请输入资讯分类名称！");document.f1.t1.focus();return false;}
 if((document.f1.t2.value).replace(/\s/,"")=="" || isNaN(document.f1.t2.value)){alert("请输入有效的排序号！");document.f1.t2.focus();return false;}
 tjwait();
 f1.action="newstype1.php?control=add&ty1id=<?=$_GET[ty1id]?>";
 }
 </script>
 <form name="f1" method="post" onsubmit="return tj()">
 <ul class="uk">
 <li class="l1">大分类：</li>
 <li class="l2"><input type="text" class="inp redony" value="<?=$row[name1]?>" name="t0" readonly="readonly" /></li>
 <li class="l1">小分类：</li>
 <li class="l2"><input type="text" class="inp" name="t1" onfocus="inpf(this)" onblur="inpb(this)" /></li>
 <li class="l1">排序：</li>
 <li class="l2"><input type="text" class="inp" name="t2" onfocus="inpf(this)" onblur="inpb(this)" value="<?=returnxh("yjcode_newstype"," and admin=2 and name1='".$row[name1]."'")?>" /> <span class="hui">序号越小，越靠前</span></li>
 <li class="l3"><? tjbtnr("保存修改","newstypelist.php");?></li>
 </ul>
 </form>
 
 <? 
 }elseif($_GET[action]=="update"){
 while1("*","yjcode_newstype where id=".$_GET[id]);if(!$row1=mysql_fetch_array($res1)){php_toheader("newstypelist.php");}
 ?>
 <script language="javascript">
 function tj(){
 if((document.f1.t1.value).replace(/\s/,"")==""){alert("请输入资讯分类名称！");document.f1.t1.focus();return false;}
 if((document.f1.t2.value).replace(/\s/,"")=="" || isNaN(document.f1.t2.value)){alert("请输入有效的排序号！");document.f1.t2.focus();return false;}
 tjwait();
 f1.action="newstype1.php?control=update&id=<?=$row1[id]?>&ty1id=<?=$_GET[ty1id]?>";
 }
 </script>
 <form name="f1" method="post" onsubmit="return tj()">
 <input type="hidden" value="<?=$row[name1]?>" name="oldty1" />
 <ul class="uk">
 <li class="l1">大名称：</li>
 <li class="l2"><input type="text" class="inp redony" value="<?=$row[name1]?>" name="t0" readonly="readonly" /></li>
 <li class="l1">小分类：</li>
 <li class="l2"><input type="text" value="<?=$row1[name2]?>" class="inp" name="t1" onfocus="inpf(this)" onblur="inpb(this)" /></li>
 <li class="l1">排序：</li>
 <li class="l2"><input type="text" class="inp" name="t2" onfocus="inpf(this)" onblur="inpb(this)" value="<?=$row1[xh]?>" /> <span class="hui">序号越小，越靠前</span></li>
 <li class="l3"><? tjbtnr("保存修改","newstypelist.php");?></li>
 </ul>
 </form>
 
 <? }?>
 <!--end-->
 
</div>

</div>

<?php include("bottom.html");?>
</body>
</html>