<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
switch($_GET["admin"])
{
 case "0":
 case "":
 $nstr="&nbsp;&nbsp;1���ճ�����ͨ�����滺��������";
 $nwz="&nbsp;&nbsp;���滺������";
 break;
 }
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>����ϵͳ</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script language="javascript">
<!--
var xmlHttp = false;
try {
  xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttp = false;
  }
}
if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
  xmlHttp = new XMLHttpRequest();
}
function callServer(url) {
  xmlHttp.open("post", url, true);
  xmlHttp.onreadystatechange = updatePage;
  xmlHttp.send(null);  
}

function updatePage() {
  if (xmlHttp.readyState == 4) {
   var response = xmlHttp.responseText;
   response=response.replace(/[\r\n]/g,'');
   if(response=="ok"){
   <? if($_GET[bkpage]!=""){?>
   location.href="<?=$_GET[bkpage]?>?t=suc";
   <? }else{?>
   location.href="tohtml.php?t=suc&backadmin="+document.getElementById("nadmin").innerHTML;return false;
   <? }?>
   }else{alert("����ʧ�ܣ����¼�ۺ����www.yjcode.com���ҽ������\n"+response);window.location.reload();return false;}
  }
}


function startHTML(adminnum){
$("htmlbtn").style.display="none";
$("tsdiv").style.display="";
callServer("after_html.php?admin="+adminnum);
}
//-->
</script>
</head>
<body>

<?php include("top.html");?>
<script language="javascript">
$("menu1").className="l11";
</script>

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_quanju.html");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>������վ����</strong></li><li class="l2"></li>
 </ul>
 
 <!--begin-->
<? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���","tohtml.php?backadmin=".$_GET[backadmin]);}?>
<div class="control"><strong><?=$nwz?></strong></div>
<div class="htmlnts"><?=$nstr?></div>
<div class="control">
<input type="button" class="btn1" id="htmlbtn"  onmouseover="this.className='btn2';" onclick="startHTML(<?=$_GET[admin]?>)" onmouseout="this.className='btn1';" value="��ʼ����" />
</div>
<div class="htmlOK" id="tsdiv" style="display:none;">
&nbsp;&nbsp;&nbsp;<img src="img/ajax_loader.gif" width="208" height="13" /><br />
&nbsp;&nbsp;&nbsp;ϵͳ��ʾ����������������Ҫ�ر�ҳ�棬Ҳ��Ҫ����ˢ�¡������ĵȴ���
</div>
</div>
<span id="nadmin" style="display:none"><?=$_GET[admin]?></span>
 <!--end-->
 
</div>

<?php include("bottom.html");?>
<? if($_GET[action]=="gx"){?>
<script language="javascript">
startHTML(<?=$_GET[admin]?>);
</script>
<? }?>

</body>
</html>