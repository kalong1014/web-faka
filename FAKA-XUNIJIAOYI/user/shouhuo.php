<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$userid=returnuserid($_SESSION["SHOPUSER"]);
$orderbh=$_GET[orderbh];
while0("*","yjcode_order where orderbh='".$orderbh."' and (ddzt='db' or ddzt='backerr') and userid=".$userid);if(!$row=mysql_fetch_array($res)){php_toheader("order.php");}


if(sqlzhuru($_POST[jvs])=="sh"){
 zwzr();
 $zfmm=sha1(sqlzhuru($_POST[t1]));
 if($row[ddzt]!="db" && $row[ddzt]!="backerr"){Audit_alert("δ֪����","orderview.php?orderbh=".$orderbh);}
 $allmoney=$row[money1]*$row[num];
 $sellblm=returnsellbl($row[selluserid])*$allmoney; //���ҿɵý��
 $ptyj=$allmoney-$sellblm;
 PointUpdateM($row[selluserid],$sellblm);
 PointIntoM($row[selluserid],"�ɹ�������Ʒ������ȷ���ջ������Զ��۳�ƽ̨Ӷ��".$ptyj."Ԫ",$sellblm);
 //�Ƽ�B
 $v=returntjuserid($userid);
 if(!empty($v) && !empty($rowcontrol[tjmoney])){
 $tjm=$allmoney*$rowcontrol[tjmoney];
 PointUpdateM($v,$tjm);
 PointIntoM($v,"���Ƽ�����ҳɹ�������".$allmoney."Ԫ���������ӦӶ��",$tjm);
 PointUpdateM($row[selluserid],$tjm*(-1));
 PointIntoM($row[selluserid],"����������û��Ƽ�����(�Ƽ���ID:".$v.")���۳�Ӷ��",$tjm*(-1));
 }
 //�Ƽ�E
 $sj=date("Y-m-d H:i:s");
 updatetable("yjcode_order","ddzt='suc',oksj='".$sj."' where userid=".$userid." and id=".$row[id]);
 deletetable("yjcode_db where userid=".$userid." and orderbh='".$orderbh."'");
 php_toheader("orderview.php?orderbh=".$orderbh); 

}

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
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ȷ���ջ�</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <ul class="wz">
 <li class="l0"></li>
 <li class="l1 l2">��������</li>
 <li class="l1"><a href="order.php">�ҵĶ���</a></li>
 <li class="l3" style="width:594px;"></li>
 </ul>
 <? include("orderv.php");?>
 
 <? if($row[ddzt]=="db" || $row[ddzt]=="backerr"){?>
 <script language="javascript">
 function tj(){
 if(!confirm("ȷ���ջ���")){return false;}
 tjwait();
 f1.action="shouhuo.php?orderbh=<?=$orderbh?>";
 }
 </script>
 <form name="f1" method="post" onsubmit="return tj()">
 <ul class="ordercz">
 <li class="l1">
 <strong>* վ����ʾ��</strong><br>
 * �������ú�������������Ʒ����ȷ���ջ�<br>
 * �����Ʒ�����⣬���ۺ��޷���ɹ�ʶ��������<a href="ordertk.php?orderbh=<?=$orderbh?>">�����˿�</a>
 </li>
 <li class="l4"><?=tjbtnr("ȷ���ջ�")?></li>
 </ul>
 <input type="hidden" value="sh" name="jvs" />
 <input type="hidden" value="<?=$orderbh?>" name="orderbh" />
 </form>
 <? }?>

</div> 
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>