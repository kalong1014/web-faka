<?
include("../config/conn.php");
include("../config/function.php");
sesCheck();
$sqluser="select * from yjcode_user where uid='".$_SESSION[SHOPUSER]."'";mysql_query("SET NAMES 'GBK'");$resuser=mysql_query($sqluser);
if(!$rowuser=mysql_fetch_array($resuser)){php_toheader("../reg/");}
$sj=date("Y-m-d H:i:s");
include("buycheck.php");

//����B
if($_GET[control]=="jf" && !empty($rowcontrol[jfmoney])){
 $jf=$_GET[jf];
 if(!is_numeric($jf)){Audit_alert("������ֵ����","carpay.php?carid=".$carid);}
 if($jf<=0){Audit_alert("������ֵ����","carpay.php?carid=".$carid);exit;}
 if($jf>$rowuser[jf]){$jf=$rowuser[jf];}
 $m=sprintf("%.2f",$jf/$rowcontrol[jfmoney]);
 PointIntoM($rowuser[id],"���ֶһ���Ǯ",$m);PointUpdateM($rowuser[id],$m);
 PointInto($rowuser[id],"���ֶһ���Ǯ",$jf);PointUpdate($rowuser[id],$jf*(-1));
 php_toheader("carpay.php?t=suc&carid=".$carid);
}
//����E

//B
if(sqlzhuru($_POST[jvs])=="carpay" && sqlzhuru($_POST[R1])=="alipay"){
if($needmoney<=$usermoney){Audit_alert("���Ŀ��������㣬�������ֱ��֧����","carpay.php?carid=".$carid);}
zwzr();
updatetable("yjcode_user","uqq='".sqlzhuru($_POST[tuqq])."' where uid='".$_SESSION[SHOPUSER]."'");
$bh=time();
$uip=$_SERVER["REMOTE_ADDR"];
$ddbh=time()."|".$rowuser[id];	
$money1=($needmoney*10-$usermoney*10)/10;
intotable("yjcode_dingdang","bh,ddbh,userid,sj,uip,money1,ddzt,alipayzt,bz,ifok,probh,pronum","'".$bh."','".$ddbh."',".$rowuser[id].",'".$sj."','".$uip."',".$money1.",'�ȴ���Ҹ���','','',0,'".$bharr."','".$numarr."'");

require_once("alipay.config.php");
$payment_type = "1";
$notify_url = weburl."user/notify_carpay.php"; //�������첽֪ͨҳ��·��
$return_url = weburl."user/order.php";//ҳ����תͬ��֪ͨҳ��·��
$seller_email = $rowcontrol[seller_email];//����֧�����ʻ�
$out_trade_no = $ddbh;//�̻�������
$subject = webname."����̨����";//��������
$body =  webname."����̨����";
$show_url = weburl;//��Ʒչʾ��ַ

//��ʼ��ʱ����
if(0==$rowcontrol[zftype]){ 
$alipay_config['cacert']    = getcwd().'\\cacert.pem';
require_once("lib/alipay_submit.class.php");
$total_fee = $money1;//������
$anti_phishing_key = "";//������ʱ���
$exter_invoke_ip = "";//�ͻ��˵�IP��ַ
$parameter = array(
		"service" => "create_direct_pay_by_user",
		"partner" => trim($alipay_config['partner']),
		"payment_type"	=> $payment_type,
		"notify_url"	=> $notify_url,
		"return_url"	=> $return_url,
		"seller_email"	=> $seller_email,
		"out_trade_no"	=> $out_trade_no,
		"subject"	=> $subject,
		"total_fee"	=> $total_fee,
		"body"	=> $body,
		"show_url"	=> $show_url,
		"anti_phishing_key"	=> $anti_phishing_key,
		"exter_invoke_ip"	=> $exter_invoke_ip,
		"_input_charset"	=> trim(strtolower($alipay_config['input_charset'])));
//������ʱ����

//��ʼ��������
}elseif(1==$rowcontrol[zftype]){ 
$alipay_config['cacert']    = getcwd().'\\db_cacert.pem';
require_once("lib/alipay_submit.class.php");
$price = $money1;
$quantity = "1";//��Ʒ����
$logistics_fee = "0.00";//��������
$logistics_type = "EXPRESS";//��������
$logistics_payment = "SELLER_PAY";//����֧����ʽ
$receive_name = $_SESSION[codeuser];//�ջ�������
$receive_address = $_POST['WIDreceive_address'];//�ջ��˵�ַ
$receive_zip = "";//�ջ����ʱ�
$receive_phone = "";//�ջ��˵绰����
$receive_mobile = "";//�ջ����ֻ�����
$parameter = array(
		"service" => "create_partner_trade_by_buyer",
		"partner" => trim($alipay_config['partner']),
		"payment_type"	=> $payment_type,
		"notify_url"	=> $notify_url,
		"return_url"	=> $return_url,
		"seller_email"	=> $seller_email,
		"out_trade_no"	=> $out_trade_no,
		"subject"	=> $subject,
		"price"	=> $price,
		"quantity"	=> $quantity,
		"logistics_fee"	=> $logistics_fee,
		"logistics_type"	=> $logistics_type,
		"logistics_payment"	=> $logistics_payment,
		"body"	=> $body,
		"show_url"	=> $show_url,
		"receive_name"	=> $receive_name,
		"receive_address"	=> $receive_address,
		"receive_zip"	=> $receive_zip,
		"receive_phone"	=> $receive_phone,
		"receive_mobile"	=> $receive_mobile,
		"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
);
//������������

//��ʼ˫����
}elseif(2==$rowcontrol[zftype]){ 
$alipay_config['cacert']    = getcwd().'\\t_cacert.pem';
require_once("lib/alipay_submit.class.php");
$price = $money1;
$payment_type = "1";
$quantity = "1";
$logistics_fee = "0.00";
$logistics_type = "EXPRESS";
$logistics_payment = "SELLER_PAY";
$receive_name = $_SESSION[codeuser];//�ջ�������
$receive_address = $_POST['WIDreceive_address'];//�ջ��˵�ַ
$receive_zip = "";//�ջ����ʱ�
$receive_phone = "";//�ջ��˵绰����
$receive_mobile = "";//�ջ����ֻ�����
$parameter = array(
		"service" => "trade_create_by_buyer",
		"partner" => trim($alipay_config['partner']),
		"payment_type"	=> $payment_type,
		"notify_url"	=> $notify_url,
		"return_url"	=> $return_url,
		"seller_email"	=> $seller_email,
		"out_trade_no"	=> $out_trade_no,
		"subject"	=> $subject,
		"price"	=> $price,
		"quantity"	=> $quantity,
		"logistics_fee"	=> $logistics_fee,
		"logistics_type"	=> $logistics_type,
		"logistics_payment"	=> $logistics_payment,
		"body"	=> $body,
		"show_url"	=> $show_url,
		"receive_name"	=> $receive_name,
		"receive_address"	=> $receive_address,
		"receive_zip"	=> $receive_zip,
		"receive_phone"	=> $receive_phone,
		"receive_mobile"	=> $receive_mobile,
		"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
);
//����˫����


}

//��������
$alipaySubmit = new AlipaySubmit($alipay_config);
$html_text = $alipaySubmit->buildRequestForm($parameter,"get", "������ת�����Ժ�");
echo $html_text;


}elseif(sqlzhuru($_POST[jvs])=="carmypay"){//���֧��
 if($needmoney>$usermoney){Audit_alert("���Ŀ������㣬�������ԡ�","carpay.php?carid=".$carid);}
 zwzr();
 updatetable("yjcode_user","uqq='".sqlzhuru($_POST[tuqq])."' where uid='".$_SESSION[SHOPUSER]."'");
 $buyuserid=$rowuser[id];
 include("buy.php");
 php_toheader("ordersuc.php?orderbh=".$orderbh);

}
//E
?>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û�������� - <?=webname?></title>
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/basic.js"></script>
<script language="javascript">
function xz(x){
$(x).checked=true;	
}

function carpaytj(x){
 if((document.f1.tuqq.value).replace("/\s/","")==""){alert("���������ĳ���QQ");document.f1.tuqq.focus();return false;}
 r=document.getElementsByName("R1");
 rv="";
 for(i=0;i<r.length;i++){
 if(r[i].checked==true){rv=r[i].value;}
 }
 <? if($usermoney<$needmoney){?>if(rv==""){alert("��ѡ��֧����ʽ");return false;}<? }?>
 tjwait();
 if(rv=="alipay" || rv==""){fu="carpay.php?carid="+x;}
 else if(rv=="tenpay"){fu="tenpay/buy_index.php?carid="+x;}
 else if(rv=="ips"){fu="ips/buy_OrderPay.php?carid="+x;}
 else if(rv=="bank"){fu="bank/buy_Send.php?carid="+x;}
 else{fu="tenpay/buy_index.php?carid="+x;}
 f1.action=fu;
 bghuionc(1);
}

function bghuionc(x){
 if(x==1){
 $("tang").style.display="";
 $("bghui").style.display="block";
 }else if(x==0){
 $("bghui").style.display="none";
 }
}

function jfonc(x){
if(1==x){document.getElementById("bghui").style.display="";document.getElementById("jfmoney").style.display="";}
else if(0==x){document.getElementById("bghui").style.display="none";document.getElementById("jfmoney").style.display="none";}
document.getElementById("bghui").style.width="100%";
st=Math.max(document.documentElement.scrollTop,document.body.scrollTop);
if(!+[1,]){
document.getElementById("bghui").style.height=document.body.clientHeight;
document.getElementById("jfmoney").style.left=document.body.clientWidth/2-151;
document.getElementById("jfmoney").style.top=st+200;
}else{
document.getElementById("bghui").style.height=document.documentElement.clientHeight;
document.getElementById("jfmoney").style.left=document.documentElement.clientWidth/2-151;
document.getElementById("jfmoney").style.top=window.document.body.offsetHeight/2-170+st;
}
}

function jftom(){
<? if(!empty($rowcontrol[jfmoney])){?>
nm=parseInt(document.getElementById("jftxt").value);
if(nm><?=$rowuser[jf]?>){nm=<?=$rowuser[jf]?>;}
if(isNaN(nm)){nm=0;}
document.getElementById("canmoney").innerHTML=nm/<?=$rowcontrol[jfmoney]?>;
<? }?>
}

function jmok(){
tjwait();
location.href="carpay.php?carid=<?=$carid?>&control=jf&jf="+document.getElementById("jftxt").value;
}
</script>
</head>
<body>
<div id="bghui" style="width:100%;height:100%;position:absolute;top:0px;filter:alpha(Opacity=60);-moz-opacity:0.6;opacity: 0.6;background-color:#777;z-index:199;left:0px;display:none;"></div>
<!--����B-->
<div id="jfmoney" style="display:none;">
<ul class="u0">
<li class="l1">�һ�����</li>
<li class="l2"><img src="../img/err1.png" width="11" height="11" style="cursor:pointer;" onClick="jfonc(0);" /></li>
</ul>
<ul class="u1">
<li class="l1">���û��֣�</li>
<li class="l21"><strong class="blue"><?=$rowuser[jf]?></strong></li>
<li class="l1">�һ����֣�</li>
<li class="l2"><input type="text" value="<?=$rowuser[jf]?>" onKeyUp="value=value.replace(/[^\d]/g,'');jftom();" id="jftxt" /></li>
<li class="l1">�ɻ���Ǯ��</li>
<li class="l21"><strong id="canmoney" class="feng">0</strong>Ԫ</li>
<li class="l3">
<div id="tjbtn"><input type="button" onClick="jmok()" value="����һ�" /></div>
<div id="tjing" style="display:none;"><img src="../img/ajax_loader.gif" width="208" height="13" /></div>
</li>
</ul>
</div>
<script language="javascript">jftom();</script>
<!--����E-->
<div class="yjcode">
<? include("top.php");?>
<ul class="dqwz">
<li class="l1">����λ�ã�<a href="../" class="acy">��ҳ</a> > <a href="./" class="acy">��Ա����</a> > ����̨����</li>
</ul>
<? include("left.php");?>

<!--RB-->
<div class="right">
 <? include("rcap11.php");?>
 <script language="javascript">
 $("rcap1").className="l1 l2";
 </script>
 <? systs("��ϲ�������ֳɹ��һ���Ǯ�������Լ�����ɽ���!","carpay.php?carid=".$carid)?>
 <div class="carpay">
  <form name="f1" method="post" target="_blank" onSubmit="return carpaytj('<?=$carid?>')">
  
  <ul class="uk uc">
  <li class="l1 red">���ĳ���QQ��</li>
  <li class="l2"><input type="text" class="inp1" name="tuqq" value="<?=$rowuser[uqq]?>" /> ����д���ĳ���QQ����վ������Ա���ܻ���Ҫ������ϵ</li>
  </ul>

  <ul class="u1">
  <li class="l1">������ʹ��<?=webname?>����̨����</li>
  <li class="l2">��Ʒ������<?=$pnum?></li>
  <li class="l3"><strong><?=$needmoney?></strong> Ԫ</li>
  </ul>
   
  <div class="pay">
  <ul class="pu1">
  <li class="l1">���ڱ�վ��֧����<strong><?=$usermoney?></strong> Ԫ</li>
  <li class="l2">֧�� <strong><? if($usermoney<$needmoney){echo $usermoney;}else{echo $needmoney;}?></strong> Ԫ</li>
  <? if($rowuser[jf]>0){?>
  <li class="l3">���ڱ�վ��ʹ�õĻ�����<?=$rowuser[jf]?>���ɶһ������<? if(empty($rowcontrol[jfmoney])){?>0Ԫ<? }else{echo sprintf("%.2f",$rowuser[jf]/$rowcontrol[jfmoney])."Ԫ";?>[<a href="#" onClick="jfonc(1)" class="red">�����һ�</a>]<? }?></li>
  <? }?>
  </ul>
  <? if($usermoney<$needmoney){?>
  <ul class="pu1">
  <li class="l1">���㣬��ͨ�����·�ʽ����֧��</li>
  <li class="l2">֧�� <strong><?=($needmoney*10-$usermoney*10)/10?></strong> Ԫ</li>
  </ul>
  <ul class="pay1">
  <li class="l1">������֧��ƽ̨��</li>
  
  <? if(!empty($rowcontrol[partner]) && !empty($rowcontrol[security_code]) && !empty($rowcontrol[seller_email])){?>
  <li class="l2"><input name="R1" id="alipay" checked="checked" type="radio" value="alipay" /><img onClick="xz('alipay')" src="img/pay/alipay.gif" /></li>
  <? }?>
  
  <? if(!empty($rowcontrol[tenpay1]) && !empty($rowcontrol[tenpay2])){?>
  <li class="l2">
  <input name="R1" id="tenpay" type="radio" value="tenpay" /><img src="img/pay/tenpay.gif" onClick="xz('tenpay')" />
  </li>
  <? }?>

  <? if(!empty($rowcontrol[ipsshh]) && !empty($rowcontrol[ipszs])){?>
  <li class="l2">
  <input name="R1" id="ips" type="radio" value="ips" /><img src="img/pay/ips.gif" onClick="xz('ips')" />
  </li>
  <? }?>
  
  <? if(!empty($rowcontrol[bankbh]) && !empty($rowcontrol[bankkey])){?>
  <li class="l2">
  <input name="R1" id="bank" type="radio" value="bank" /><img src="img/pay/bank.gif" onClick="xz('bank')" />
  </li>
  <? }?>

  </ul>
  <? if(!empty($rowcontrol[tenpay1]) && !empty($rowcontrol[tenpay2])){?>
  <ul class="pay2">
  <li class="l1">�������У�</li>
  <li class="l2"><input type='radio' name='R1' id="netbank1002" value='1002' /><img onClick="xz('netbank1002')" src="img/pay/p1.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1005" value='1005' /><img onClick="xz('netbank1005')" src="img/pay/p4.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1001" value='1001' /><img onClick="xz('netbank1001')" src="img/pay/p2.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1003" value='1003' /><img onClick="xz('netbank1003')" src="img/pay/p3.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1052" value='1052' /><img onClick="xz('netbank1052')" src="img/pay/p5.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1028" value='1028' /><img onClick="xz('netbank1028')" src="img/pay/p6.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1004" value='1004' /><img onClick="xz('netbank1004')" src="img/pay/p7.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1027" value='1027' /><img onClick="xz('netbank1027')" src="img/pay/p8.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1022" value='1022' /><img onClick="xz('netbank1022')" src="img/pay/p9.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1006" value='1006' /><img onClick="xz('netbank1006')" src="img/pay/p10.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1021" value='1021' /><img onClick="xz('netbank1021')" src="img/pay/p11.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1009" value='1009' /><img onClick="xz('netbank1009')" src="img/pay/p12.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1010" value='1010' /><img onClick="xz('netbank1010')" src="img/pay/p13.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1008" value='1008' /><img onClick="xz('netbank1008')" src="img/pay/p14.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1020" value='1020' /><img onClick="xz('netbank1020')" src="img/pay/p15.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1032" value='1032' /><img onClick="xz('netbank1032')" src="img/pay/p16.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1054" value='1054' /><img onClick="xz('netbank1054')" src="img/pay/p17.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1056" value='1056' /><img onClick="xz('netbank1056')" src="img/pay/p18.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1082" value='1082' /><img onClick="xz('netbank1082')" src="img/pay/p19.gif" /></li>
  <li class="l2"><input type='radio' name='R1' id="netbank1076" value='1076' /><img onClick="xz('netbank1076')" src="img/pay/p20.gif" /></li>
  </ul>
  <? }?>
  <? }?>
  
  <div id="tang" style="display:none;">
  <ul class="pay4">
  <li class="l1">����֧��ҳ����ɸ���!</li>
  <li class="l2">�������ǰ�벻Ҫ�رմ˴��ڡ�������ɺ���������������°�ť��</li>
  <li class="l3">
  <a href="order.php">��ɸ���</a>
  <a href="javascript:void(0);" onClick="javascript:alert('�����������⣿����ϵ�ͷ�');location.href='carpay.php?carid=<?=$carid?>';return false;">������������</a>
  </li>
  </ul>
  </div>
  
  <div class="carbtn">
   <div id="tjbtn"><input type="submit" value="ȷ�ϸ���" /></div>
   <div class="tjing" id="tjing" style="display:none;">
   <img style="margin:0 0 6px 0;" src="../img/ajax_loader.gif" width="208" height="13" /><br />���ڴ������ݣ��벻Ҫˢ��ҳ�棬Ҳ��Ҫ�ر�ҳ�� ^_^
   </div>
  </div>
  <? if($usermoney<$needmoney){?><input type="hidden" value="carpay" name="jvs" /><? }else{?><input type="hidden" value="carmypay" name="jvs" /><? }?>
  
  </div>
  </form>
 </div>

</div>
<!--RE-->

</div>
<? include("bottom.php");?>
</body>
</html>