<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."' and shopzt=2";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("openshop3.php");}

$sqlinfo = "select * from yjcode_pro where id='".intval($_GET['id'])."' limit 1";
$rowinfo=mysql_fetch_array(mysql_query($sqlinfo),1);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0046)http://www.huzhan.com/member/content_list.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="x-ua-compatible" content="ie=7">

<title>选择内容</title>
<script language="javascript" src="./content_list/jquery.min.js"></script>
<script language="javascript" src="./content_list/layer.min.js"></script><link type="text/css" rel="stylesheet" href="./content_list/layer.css" id="skinlayercss">
<script language="javascript" src="./content_list/member.js"></script>
<script language="javascript">
function ser(){
	if(t1.value==""){layer.alert("请输入关键词",5);return false;}
	location.href="content_list.php?k="+escape(t1.value)+"&info=";
	}
function winBack() 
     { 
      if(window.opener) {
              fWindowinfo = window.opener.document.getElementById("info"); 
              fWindowText = window.opener.document.getElementById("text"); 
			  	info="";
				text=""
			    var cc=document.getElementsByName("C0");
				var c=document.getElementsByName("C1");
             	for(i=0;i<c.length;i++){
		        if(c[i].checked){
			    if(text==""){
				info=c[i].value;
				text=cc[i].value;
				}else{
					info=info+","+c[i].value;
					text=text+"\r\n"+cc[i].value;

					}
			}
		}
		if(fWindowinfo.value==""){
			  fWindowinfo.value = fWindowinfo.value + info;
			  }else{
				 fWindowinfo.value = fWindowinfo.value+","+info;
				  }
				fWindowText.value = fWindowText.value + text;

              window.close(); 
     } 
} 
function xuan(){
	c2=document.getElementsByName("C2");
	c=document.getElementsByName("C1");
	if(c2[0].checked){
		for(i=0;i<c.length;i++){
			c[i].checked="checked";
			}
		}else{
			for(i=0;i<c.length;i++){
			c[i].checked=false;
			}
			}
}
</script>
<style type="text/css"> 
<!--
body{font-size:12px;line-height:1.5;font-family:"宋体";background-color:#FFF;}
a{color:#000;text-decoration:none;}
li{list-style-type:none;padding:0 5px;float:left;}
.ohave{font-weight:700;text-decoration:underline;}
-->
</style>
</head>
<body leftmargin="0" topmargin="0" background="./content_list/allbg.gif">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
<tbody><tr> 
<td align="center" valign="top">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody><tr bgcolor="#FFFFFF"><td height="4"></td></tr>
</tbody></table>
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D6D6D6">
<tbody><tr bgcolor="#E7E7E7"> 
<td height="24" colspan="9" background="./content_list/tbg.gif">
<strong> §内容列表</strong>
</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22"> 
<td width="5%">选择</td>
<td width="50%">文章标题</td>
<td width="25%">更新时间</td>
<td width="20%">类目</td>
</tr>

<?
if($_GET[page]!=""){$page=$_GET[page];}else{$page=1;}
$ses=" where zt<>99 and ifxj=0 and userid=".$rowuser[id];
if($_GET['k']) {
	$ses.=" and tit like'%".$_GET['k']."%' ";
}
 pagef($ses,10,"yjcode_pro","order by lastsj desc");while($row=mysql_fetch_array($res)){
 $aurl="product.php?bh=".$row[bh];
 
 ?>
<tr align="center" bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor=&#39;#FCFDEE&#39;;" onmouseout="javascript:this.bgColor=&#39;#FFFFFF&#39;;" height="22"> 
<td>
<input name="C0" value="<?=$row["tit"]?>" type="hidden">
<input name="C1" type="checkbox" id="arcID" value="<?=$row["id"]?>">
</td>
<td align="left">
<a href="<?=$aurl?>" target="_blank"><u><?=$row["tit"]?></u></a>
</td>
<td><?=$row["sj"]?></td>
<td></td>
</tr>
<?php
}
?>



<tr bgcolor="#FAFAF1"> 
<td height="24" colspan="9">
&nbsp;
<input class="xuan" type="checkbox">全选
&nbsp;
&nbsp;
<input name="" type="button" onclick="javascript:winBack();" value="确定添加选中商品">

</td>
</tr>

<tr align="right" bgcolor="#EEF4EA"> 
<td height="20" colspan="9" align="center">
 
<div id="page">
<?php
$nowurl="content_list.php";
 $nowwd="k=".$_GET[k];
 include("page.html");
?>
</div>
 
</td>
</tr>
</tbody></table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr> 
<td height="4"></td>
</tr>
<tr bgcolor="#FFFFFF"> 
<td height="26">
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#CBD8AC">
   <tbody><tr bgcolor="#EEF4EA"> 
        <input type="hidden" name="f" value="form1.arcid1"> 
          <td background="./content_list/wbg.gif">
          	<table width="300" border="0" cellpadding="0" cellspacing="0">
          	<tbody><tr>
         
        <td width="60">
          关键字：
        </td>
          <td width="160">
          	<input type="text" name="t1" value="" id="t1" style="width:150">
          </td>
          <td>
          <input name="" onclick="ser()" type="image" src="./content_list/button_search.gif" width="60" height="22" border="0">
         </td>
        </tr>
        </tbody></table>
          </td>
        </tr>
      </tbody></table>
</td>
</tr>
<tr> 
<td colspan="2" height="4"></td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>


</body></html>