<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$bh=$_GET[bh];

//������ʼ
if($_GET[control]=="update"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0201,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 $sj=date("Y-m-d H:i:s");
 $tyid=preg_split("/xcf/",sqlzhuru($_POST[d1]));
 $txt=sqlzhuru($_POST[content]);
 $wdes=sqlzhuru($_POST[twdes]);if(empty($wdes)){$wdes=strgb2312(strip_tags($txt),0,220);}
 $tit=sqlzhuru($_POST[ttit]);
 $wkey=sqlzhuru($_POST[twkey]);if(empty($wkey)){$wkey=$tit;}$wkey=str_replace("��",",",strtolower($wkey));
 updatetable("yjcode_gg","
			 sj='".sqlzhuru($_POST[tsj])."',
			 djl=".sqlzhuru($_POST[tdjl]).",
			 tit='".$tit."',
			 txt='".$txt."',
			 zt=".$_POST[Rzt].",
			 wkey='".$wkey."',
			 wdes='".$wdes."' where bh='".$bh."'");
 php_toheader("gg.php?t=suc&bh=".$bh);

}
//�������

while0("*","yjcode_gg where bh='".$bh."'");if(!$row=mysql_fetch_array($res)){php_toheader("gglist.php");}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><?=webname?>����ϵͳ</title>
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
document.getElementById("menu4").className="l41";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0202,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_news.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>��վ����</strong> - [<a href="gglist.php">����</a>]</li><li class="l2"></li>
 </ul>
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���[<a href='gglx.php'>�������������</a>]","gg.php?bh=".$bh);}?>
 <!--B-->
 <script language="javascript">
 function tj(){
 if((document.f1.ttit.value).replace(/\s/,"")==""){alert("���������");document.f1.ttit.focus();return false;}
 r=document.getElementsByName("Rzt");rr="";for(i=0;i<r.length;i++){if(r[i].checked==true){rr=r[i].value;}}if(rr==""){alert("��ѡ�����״̬��");return false;}
 tjwait();
 f1.action="gg.php?bh=<?=$bh?>&control=update";
 }
 </script>
 <form name="f1" method="post" onsubmit="return tj()">
 <ul class="uk">
 <li class="l1"><span class="red">*</span> ���⣺</li>
 <li class="l2"><input type="text" size="100" value="<?=$row[tit]?>" class="inp" name="ttit" /></li>
 <li class="l10"><span class="red">*</span> ��ϸ������</li>
 <li class="l11"><script id="editor" name="content" type="text/plain" style="width:710px;height:330px;"><?=$row[txt]?></script></li>
 <li class="l1">SEO�ؼ��ʣ�</li>
 <li class="l2"><input type="text" value="<?=$row[wkey]?>" class="inp" size="70" name="twkey" onfocus="inpf(this)" onblur="inpb(this)" /> �����,���Ÿ���</li>
 <li class="l4">SEO������</li>
 <li class="l5"><textarea name="twdes"><?=$row[wdes]?></textarea></li>
 </ul>
 
 <ul class="rightcap">
 <li class="l1 red">����Ա����</li>
 </ul>
 <ul class="uk">
 <li class="l1">����ʱ�䣺</li>
 <li class="l2"><input class="inp" name="tsj" value="<?=$row[sj]?>" size="20" type="text"/> ��ȷ��ʱ���ʽ�磺2012-12-12 12:12:12</li>
 <li class="l1">����ʣ�</li>
 <li class="l2"><input class="inp" name="tdjl" value="<?=$row[djl]?>" size="10" type="text"/></li>
 <li class="l1">���״̬��</li>
 <li class="l2">
 <span class="finp">
 <input name="Rzt" type="radio" value="0" <? if(0==$row[zt]){?>checked="checked"<? }?> /><strong>����չʾ</strong> 
 <input name="Rzt" type="radio" value="1" <? if(1==$row[zt]){?>checked="checked"<? }?> /><strong>�������</strong> 
 <input name="Rzt" type="radio" value="2" <? if(2==$row[zt]){?>checked="checked"<? }?> /><strong>��˲�ͨ��</strong> 
 </span>
 </li>
 <li class="l3"><? tjbtnr("��һ��","gglist.php")?></li>
 </ul>
 </form>


 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
<script type="text/javascript">
//ʵ�����༭��
var ue = UE.getEditor('editor');
</script>
</body>
</html>