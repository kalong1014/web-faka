<?php
include("../config/conn.php");
include("../config/function.php");
AdminSes_audit();
$bh=$_GET[bh];
while0("*","yjcode_pro where bh='".$bh."'");if(!$row=mysql_fetch_array($res)){php_toheader("productlist.php");}

//������ʼ
if($_GET[control]=="update"){
 if(!strstr($adminqx,",0,") && !strstr($adminqx,",0101,")){Audit_alert("Ȩ�޲���","default.php");}
 zwzr();
 $txt=sqlzhuru($_POST[content]);
 $tit=sqlzhuru($_POST[ttit]);
 $wkey=strgb2312(sqlzhuru($_POST[twkey]),0,240);
 $wdes=strgb2312(sqlzhuru($_POST[twdes]),0,240);
 $yhsj1=sqlzhuru($_POST[tyhsj1]);if(!empty($yhsj1)){$ses="yhsj1='".$yhsj1."',";}
 $yhsj2=sqlzhuru($_POST[tyhsj2]);if(!empty($yhsj1)){$ses=$ses."yhsj2='".$yhsj2."',";}
 $money3=sqlzhuru($_POST[tmoney3]);if(!is_numeric($money3)){$money3=0;}
 $kcnum=sqlzhuru($_POST[tkcnum]);if(!is_numeric($kcnum)){$kcnum=0;}
 $fhxs=intval(sqlzhuru($_POST[Rfhxs]));
 updatetable("yjcode_pro",$ses."
			 mybh='".sqlzhuru($_POST[tmybh])."',
			 lastsj='".sqlzhuru($_POST[tlastsj])."',
			 tysx='".sqlzhuru($_POST[tysx])."',
			 zt=".$_POST[Rzt].",
			 tit='".$tit."',
			 wkey='".$wkey."',
			 wdes='".$wdes."',
			 txt='".$txt."',
			 djl=".sqlzhuru($_POST[tdjl]).",
			 xsnum=".sqlzhuru($_POST[txsnum]).", 
			 kcnum=".$kcnum.", 
			 money1=".sqlzhuru($_POST[tmoney1]).", 
			 money2=".sqlzhuru($_POST[tmoney2]).",
			 money3=".$money3.",
			 yhxs=".sqlzhuru($_POST[Ryhxs]).",
			 yhsm='".sqlzhuru($_POST[tyhsm])."',
			 ifxj=".sqlzhuru($_POST[Rifxj]).",
			 iftuan=".sqlzhuru($_POST[Riftuan]).",
			 iftj=".sqlzhuru($_POST[tiftj]).",
			 fhxs=".$fhxs.",
			 wpurl='".sqlzhuru($_POST[twpurl])."',
			 wppwd='".sqlzhuru($_POST[twppwd])."',
			 ysweb='".sqlzhuru($_POST[tysweb])."'
			 where bh='".$bh."'");
 uploadtp($bh,"��Ʒ",$row[userid]);
 //�ϴ�B
 if(3==$fhxs){
  $up1=$_FILES["inp1"]["name"];
  if(!empty($up1)){
  $mc=MakePassAll(15)."-".time()."-".$row[userid].".".returnhz($up1);
  $lj="../upload/".$row[userid]."/".$bh."/";
  move_uploaded_file($_FILES["inp1"]['tmp_name'],$lj.$mc);
  delFile($lj.$row[upf]);
  updatetable("yjcode_pro","upf='".$mc."' where bh='".$bh."'");
  }
 }
 //�ϴ�E
 if(4==$fhxs){kamikc($bh);}
 php_toheader("product.php?t=suc&bh=".$bh);

}
//�������

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
function tj(){
if((document.f1.ttit.value).replace(/\s/,"")==""){alert("���������");document.f1.ttit.focus();return false;}
a=document.f1.tkcnum.value;if(a.replace("/\s/","")=="" || isNaN(a)){alert("��������Ч�Ŀ��");document.f1.tkcnum.focus();return false;}
a=document.f1.tmoney1.value;if(a.replace("/\s/","")=="" || isNaN(a)){alert("��������Ч�ļ۸�");document.f1.tmoney1.focus();return false;}
a=document.f1.tmoney2.value;if(a.replace("/\s/","")=="" || isNaN(a)){alert("��������Ч�ļ۸�");document.f1.tmoney2.focus();return false;}
a=document.f1.tdjl.value;if(a.replace("/\s/","")=="" || isNaN(a)){alert("��������Ч�ĵ����");document.f1.tdjl.focus();return false;}
a=document.f1.txsnum.value;if(a.replace("/\s/","")=="" || isNaN(a)){alert("��������Ч��������");document.f1.txsnum.focus();return false;}
r=document.getElementsByName("Rzt");rr="";for(i=0;i<r.length;i++){if(r[i].checked==true){rr=r[i].value;}}if(rr==""){alert("��ѡ�����״̬��");return false;}
cstr="xcf";
c=document.getElementsByName("Csx");
for(i=0;i<c.length;i++){if(c[i].checked==true){cstr=cstr+c[i].value+"xcf";}}
document.f1.tysx.value=cstr;
tjwait();
f1.action="product.php?bh=<?=$bh?>&control=update";
}

function yhxsonc(x){
if(1==x){document.getElementById("yhxsul").style.display="none";}	
else if(2==x){document.getElementById("yhxsul").style.display="";}	
}

function fhxsonc(x){
for(i=1;i<=4;i++){
d=document.getElementById("fhxs"+i);if(d){d.style.display="none";}
}
d=document.getElementById("fhxs"+x);if(d){d.style.display="";}
}
</script>
<script type="text/javascript" src="js/adddate.js" ></script> 

<script type="text/javascript" charset="gbk" src="../config/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="gbk" src="../config/ueditor/unit.js"></script>

</head>
<body>
<?php include("top.html");?>
<script language="javascript">
document.getElementById("menu3").className="l31";
</script>
<? if(!strstr($adminqx,",0,") && !strstr($adminqx,",0102,")){echo "<div class='noneqx'>��Ȩ��</div>";exit;}?>

<div class="adminmain">

<div class="left">
 <div class="lefttop"></div>
 <div class="leftmain">
 <?php include("menu_product.php");?>
 </div>
 <div class="lefttop"></div>
</div>

<div class="right" id="right">
 <ul class="wz">
 <li class="l1">��ǰλ�ã���̨��ҳ - <strong>������Ʒ��Ϣ</strong> - [<a href="productlist.php">����</a>]</li><li class="l2"></li>
 </ul>
 <? if($_GET[t]=="suc"){systs("��ϲ���������ɹ���[<a href='productlx.php'>�����������Ʒ</a>]","product.php?bh=".$bh);}?>
 <!--B-->
 <form name="f1" method="post" onsubmit="return tj()" enctype="multipart/form-data">
 <ul class="uk">
 <li class="l1"><span class="red">*</span> ���ڷ��飺</li>
 <li class="l21"><strong><?=returntype(1,$row[ty1id])." - ".returntype(2,$row[ty2id])." - ".returntype(3,$row[ty3id])?></strong> [<a href="productlx.php?action=update&id=<?=$row[id]?>">�޸�</a>]</li>
 </ul>
 
 <div class="tysx">
 <input type="hidden" value="<?=$row[tysx]?>" name="tysx" />
 <? while1("*","yjcode_typesx where admin=1 and typeid=".$row[ty1id]." order by xh asc");while($row1=mysql_fetch_array($res1)){?>
 <ul class="uk1">
 <li class="l1"><?=$row1[name1]?>��</li>
 <li class="l21">
 <? while2("*","yjcode_typesx where admin=2 and name1='".$row1[name1]."' and typeid=".$row1[typeid]." order by xh asc");while($row2=mysql_fetch_array($res2)){?>
 <input name="Csx" type="checkbox" value="<?=$row2[id]?>"<? if(strstr($row[tysx],"xcf".$row2[id]."xcf")){?>checked="checked"<? }?> /> <?=$row2[name2]?>&nbsp;&nbsp;
 <? }?>
 </li>
 </ul>
 <? }?>
 </div>
 
 <ul class="uk">
 <li class="l1"><span class="red">*</span> ���⣺</li>
 <li class="l2"><input type="text" size="80" value="<?=$row[tit]?>" class="inp" name="ttit" /></li>
 <li class="l1">�ϼ�/�¼ܣ�</li>
 <li class="l2">
 <span class="finp">
 <input name="Rifxj" type="radio" value="0" <? if(0==$row[ifxj]){?>checked="checked"<? }?> /> �ϼ� 
 <input name="Rifxj" type="radio" value="1" <? if(1==$row[ifxj]){?>checked="checked"<? }?> /> �¼� 
 </span>
 </li>
 <li class="l1">��ʾ��ַ��</li>
 <li class="l2"><input type="text" size="80" value="<?=$row[ysweb]?>" class="inp" name="tysweb" /></li>
 <li class="l1">�Զ�����룺</li>
 <li class="l2"><input type="text" size="10" value="<?=$row[mybh]?>" class="inp" name="tmybh" /></li>
 <li class="l1"><span class="red">*</span> ԭ�ۣ�</li>
 <li class="l2"><input class="inp" name="tmoney1" value="<?=$row[money1]?>" size="10" type="text"/></li>
 <li class="l1"><span class="red">*</span> �Żݼۣ�</li>
 <li class="l2"><input class="inp" name="tmoney2" value="<?=$row[money2]?>" size="10" type="text"/></li>
 <li class="l1"><span class="red">*</span> �Ż���ʽ��</li>
 <li class="l2">
 <span class="finp">
 <input name="Ryhxs" type="radio" value="1" onclick="yhxsonc(1)" <? if(1==$row[yhxs]){?>checked="checked"<? }?> /> �����Ż� 
 <input name="Ryhxs" type="radio" value="2" onclick="yhxsonc(2)" <? if(2==$row[yhxs]){?>checked="checked"<? }?> /> ��ʱ�Ż� 
 </span>
 </li>
 </ul>
 
 <ul class="uk" id="yhxsul" style="display:none;">
 <li class="l1"><span class="red">*</span> ��ʱ�Żݼۣ�</li>
 <li class="l2"><input class="inp" name="tmoney3" value="<?=$row[money3]?>" size="10" type="text"/></li>
 <li class="l1"><span class="red">*</span> ��ʱ�Ż�˵����</li>
 <li class="l2"><input type="text" size="80" value="<?=$row[yhsm]?>" class="inp" name="tyhsm" /></li>
 <li class="l1"><span class="red">*</span> �Ż�ʱ�䣺</li>
 <li class="l2">
 <input class="inp" name="tyhsj1" value="<?=$row[yhsj1]?>" readonly="readonly" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" size="20" type="text"/> 
 �� 
 <input class="inp" name="tyhsj2" value="<?=$row[yhsj2]?>" readonly="readonly" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" size="20" type="text"/>
 </li>
 </ul>
 
 <ul class="uk1">
 <li class="l1">Ч��ͼ��</li>
 <li class="l2">
 <ul class="tpupload">
 <li class="tl3">1.���������ϴ� 5 ��Ч��ͼ����ѳߴ磺800*800��</li>
 <li class="tl4">
 <? 
 while1("*","yjcode_tp where bh='".$bh."' order by iffm asc");
 for($i=1;$i<=7;$i++){
 $tpbh="";$tpid="";
 if($row1=mysql_fetch_array($res1)){$tp=preg_split("/\./",$row1[tp]);$tp1=preg_split("/\//",$tp[0]);$tpbh=$tp1[3];$tpid=$row1[id];}
 ?>
 <span class="tpf" onmouseover="tphover(<?=$i?>)" onmouseout="tphout(<?=$i?>)"><iframe src="tpupload.php?tpbh=<?=$tpbh?>&tpid=<?=$tpid?>&bh=<?=$bh?>" width="74" scrolling="no" height="91" id="tpf<?=$i?>" frameborder="0"></iframe></span>
 <? }?>
 </li>
 </ul>
 </li>
 </ul>
 
 <div class="upfile">
 <ul class="uk">
 <li class="l1"><span class="red">*</span> �������</li>
 <li class="l2"><input class="inp" name="tkcnum" value="<?=$row[kcnum]?>" size="10" type="text"/> (����ǵ㿨�����࣬���ֵ������д�����Զ���ȡ)</li>
 <li class="l1 red">* ������ʽ��</li>
 <li class="l2">
 <span class="finp">
 <input name="Rfhxs" type="radio" value="1" onclick="fhxsonc(1)" <? if(1==$row[fhxs]){?>checked="checked"<? }?> /> �ֶ����� &nbsp;&nbsp;
 <input name="Rfhxs" type="radio" value="2" onclick="fhxsonc(2)" <? if(2==$row[fhxs]){?>checked="checked"<? }?> /> �������� &nbsp;&nbsp;
 <input name="Rfhxs" type="radio" value="3" onclick="fhxsonc(3)" <? if(3==$row[fhxs]){?>checked="checked"<? }?> /> ��վֱ������&nbsp;&nbsp;
 <input name="Rfhxs" type="radio" value="4" onclick="fhxsonc(4)" <? if(4==$row[fhxs]){?>checked="checked"<? }?> /> �㿨����&nbsp;&nbsp;
 </span>
 </li>
 </ul> 
 <ul class="uk" id="fhxs2" style="display:none;">
 <li class="l1">���̵�ַ��</li>
 <li class="l2"><input class="inp" name="twpurl" value="<?=$row[wpurl]?>" size="80" type="text"/></li>
 <li class="l1">�������룺</li>
 <li class="l2"><input class="inp" name="twppwd" value="<?=$row[wppwd]?>" size="20" type="text"/></li>
 </ul>
 <ul class="uk" id="fhxs3" style="display:none;">
 <li class="l1">�ϴ��ļ���</li>
 <li class="l2"><input type="file" name="inp1" id="inp1" size="25"></li>
 <? if(!empty($row[upf])){?>
 <li class="l1">�ļ�Ԥ����</li>
 <li class="l21">��<a href="../upload/<?=$row[userid]?>/<?=$row[bh]?>/<?=$row[upf]?>" class="blue" target="_blank">���Ԥ��</a>��</li>
 <? }?>
 </ul>
 </div>
 
 <ul class="uk">
 <li class="l10"><span class="red">*</span> ��ϸ������</li>
 <li class="l11"><script id="editor" name="content" type="text/plain" style="width:710px;height:330px;"><?=$row[txt]?></script></li>
 <li class="l1">��Ʒ�ؼ��ʣ�</li>
 <li class="l2"><input  name="twkey" value="<?=$row[wkey]?>" size="60" type="text" class="inp" onfocus="inpf(this)" onblur="inpb(this)" /></li>
 <li class="l4">��Ʒ������</li>
 <li class="l5"><textarea name="twdes"><?=$row[wdes]?></textarea></li>
 </ul>
 
 <ul class="rightcap">
 <li class="l1 red">����Ա����</li>
 </ul>
 <ul class="uk">
 <li class="l1">����ʱ�䣺</li>
 <li class="l2"><input class="inp" name="tlastsj" value="<?=$row[lastsj]?>" size="20" type="text"/>
 <li class="l1">��������</li>
 <li class="l2"><input class="inp" name="txsnum" value="<?=$row[xsnum]?>" size="10" type="text"/></li>
 <li class="l1">�Ƽ���ţ�</li>
 <li class="l2"><input class="inp" name="tiftj" value="<?=$row[iftj]?>" size="10" type="text"/></li>
 <li class="l1">��ҳ�Ź���</li>
 <li class="l2">
 <span class="finp">
 <input name="Riftuan" type="radio" value="0" <? if(empty($row[iftuan])){?>checked="checked"<? }?> /><strong>��</strong> 
 <input name="Riftuan" type="radio" value="1" <? if(1==$row[iftuan]){?>checked="checked"<? }?> /><strong>��</strong> 
 </span>
 </li>
 <li class="l1">���״̬��</li>
 <li class="l2">
 <span class="finp">
 <input name="Rzt" type="radio" value="0" <? if(0==$row[zt]){?>checked="checked"<? }?> /><strong>����չʾ</strong> 
 <input name="Rzt" type="radio" value="1" <? if(1==$row[zt]){?>checked="checked"<? }?> /><strong>�������</strong> 
 <input name="Rzt" type="radio" value="2" <? if(2==$row[zt]){?>checked="checked"<? }?> /><strong>��˲�ͨ��</strong> 
 </span>
 </li>
 <li class="l1">������Ա��</li>
 <li class="l2"><input class="inp redony" value="<?=returnuser($row[userid])?>" size="20" type="text"/> [<a href="user_ses.php?uid=<?=returnuser($row[userid])?>" target="_blank">����̨</a>]</li>
 <li class="l3"><? tjbtnr("��һ��","productlist.php")?></li>
 </ul>
 </form>

 <!--E-->
 
</div>

</div>

<?php include("bottom.html");?>
<script type="text/javascript">
//ʵ�����༭��
yhxsonc(<?=$row[yhxs]?>);
fhxsonc(<?=$row[fhxs]?>);
var ue = UE.getEditor('editor');
</script>
</body>
</html>