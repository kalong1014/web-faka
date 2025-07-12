function codetj(x){
	    var isOK = true;
	    var cstr=",";
        $("select[name='sxd']").each(function(){     
	    if($(this).val()==''){
			        $("html, body").animate({scrollTop: $(this).offset().top});
					layer.tips('亲，不要忘记选择【'+$(this).next().html()+'】哦！',this,{guide: 1, time: 5}); isOK = false; return false;
					}else{cstr=cstr+$(this).val()+",";}
	   });
	   if(isOK){ 
       var tit = $('#tit').val();
	   var money1 = $('#money1').val();
	   var codemb = $('#codemb').val();
	   var ctp = $(window.frames["tpf0"].document).find("#zt").val();
       if(tit==""){
	   $("html, body").animate({scrollTop: $('#tit').offset().top});
       layer.tips('亲，不要忘记填写【标题】哦！', '#tit',{guide: 1, time: 5});$('#tit').focus(); return false;
       }
	   if(money1<10 || !(/^(\+|-)?\d+$/.test(money1))){
	   $("html, body").animate({scrollTop: $('#money1').offset().top});
       layer.tips('亲，【售价】必须填写，且只能为大于10元的整价！', '#money1',{guide: 1, time: 5});$('#money1').focus(); return false;
       }
	   if(codemb<=0 || isNaN(codemb)){
	   $("html, body").animate({scrollTop: $('#codemb').offset().top});
       layer.tips('亲，【源码大小】哦,且只能为数字', '#codemb',{guide: 1, time: 5});$('#codemb').focus(); return false;
       }
	   if(ctp!=1){
       layer.tips('亲，不要忘记上传【缩略图】哦，最佳尺寸：350x280', '.tpf1',{guide:2, time: 5});$('.tpf1').focus(); return false;
       }
	   $("form[name='code']").attr('action', 'code.html?bh='+x+'&cstr='+cstr).submit();
       }else{return false;}
}

function sendinfo(x){
	var str = $('#'+x).val();
	if(x=='mobile'){
	if (!mobilejudge(str)){
	layer.tips('亲，您输入手机号码不正确，请重新输入', '#'+x,{guide: 0, time: 5});$('#'+x).focus(); 
	return false;
	}
	}else if(x=='email'){
	if (!isEmail(str)){
	layer.tips('亲，您输入邮箱不正确，请重新输入', '#'+x,{guide: 0, time: 5});$('#'+x).focus(); 
	return false;
	}
	}
  　 curCount = count;
　　//设置button效果，开始计时
     $("#Sendbtn").attr("disabled", "true");
     $("#Sendbtn").val(curCount + "秒后可以重新发送");
     InterValObj = window.setInterval(mobiletimer, 1000); //启动计时器，1秒执行一次
　　  //向后台发送处理数据

     var data="sendinfo&type1="+x+"&"+x+"="+str;
     layer.check(data,function(is){	
	 if(is==false){
	 layer.tips('发送成功！请在此输入验证码，若一直无法收到验证信息请联系管理客服', '#yzm', {
     style: ['background-color:#78BA32; color:#fff', '#78BA32'],
     maxWidth:500,
     time: 20,
     guide: 1,
	 isGuide: true,
     closeBtn:[0, true]
     }); 
	 }else{
   	 layer.tips(is,$('#'+x),{guide: 0, time: 5});$('#'+x); return false;
	 }
 });  
}


//mobiletimer处理函数
function mobiletimer() {
            if (curCount == 0) {                
                window.clearInterval(InterValObj);//停止计时器
                $("#Sendbtn").removeAttr("disabled");//启用按钮
                $("#Sendbtn").val("重新发送");
            }
            else {
                curCount--;    
				$("#Sendbtn").val(curCount + "秒后可以重新发送");
            }
        }



//手机认证提交
function sack(x) { 
var str = $('#'+x).val();
var yzm = $('#yzm').val();
     if(yzm.length!=6){
     layer.tips('验证码错误，请重新输入', '#yzm',{guide: 0, time: 2});$('#yzm').focus();return false;
     }
     var data=x+"yz&"+x+"="+str+"&yzm="+yzm;
     layer.check(data,function(is){	
	 if(is!=false){
	 $("form[name='check']").submit();
	 }else{
     layer.tips('验证码错误，请重新输入', '#yzm',{guide: 0, time: 2});$('#yzm').focus();return false;
	 }
 });  
}
//安全码验证
function aqmtj() { 
var aqmcc = $('#aqmcc').val();
    if(aqmcc.length<6 || /^\d+$/g.test(aqmcc) || /^[a-zA-Z]+$/g.test(aqmcc)){
       layer.tips('安全码需同时包含数字和字母，且不少于6位', '#aqmcc',{guide: 1, time: 2});$('#aqmcc').focus(); return false;
       }
     var data="aqm&aqm="+aqmcc;
     layer.check(data,function(is){	
	 if(is!=false){
	 $("form[name='aqmcc']").submit();
	 }else{
     layer.tips('安全码错误，请重新输入', '#aqmcc',{guide: 0, time: 2});$('#aqmcc').focus();return false;
	 }
 });  
}

//广告
function adstj(){ 
	var id = $("input[name='a']:checked").val();
	var cd = $("input[name='cd']:checked").val();
    var data="ads&bh="+readmeta('Item-Number')+"&id="+id+"&cd="+cd;
     layer.check(data,function(is){	
		 	var arr =is.split('|');
			if(arr[0]!=0){
		    var tips=1;
			}else{
		    var tips=5;
			}
			layer.alert(arr[1], tips, '购买结果', function(){location.reload();});
 });  
}

//注册提交
function reg_tj(str){
         var isOK = true;
        $("#"+str+" div").each(function(){ 
           var cs = $(this).attr("class"); 
           if(cs!='ok'){
		    $(this).prev().focus();
            isOK = false;
		    return false; 
		   }
        }) 

		return isOK;
}
function chk(){  
		  var chk_value =[];//定义一个数组      
            $('input[name="C1"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数      
            chk_value.push($(this).val());//将选中的值添加到数组chk_value中      
            });  
			return chk_value;
    }
 
//注册
$(document).ready(function() {

$('#ipay img').click(function(){
		$(this).prev().attr("checked","checked");

});

$('.delivery').click(function(){
  if($(this).attr("value")=="1"){
   $('#Automatic').show();$('#Manual').hide();
  }else{
   $('#Automatic').hide();$('#Manual').show();
  }
});

$('.login_btn').on('click', function(){
            var data = {
                username: $('#login_name').val(), 
                password: $('#login_pass').val()
            }
            if(!isEmail(data.username)){
            layer.tips('请输入正确的帐号(邮箱)', '#login_name',{guide: 0, time: 2});$('#login_name').focus();return false;
            }
            if(data.password.length<6){
            layer.tips('请输入正确的密码(6-20位)', '#login_pass',{guide: 0, time: 2});$('#login_pass').focus();return false;
            }
	        var data="login&login_name="+data.username+"&login_pass="+data.password;
            layer.check(data,function(is){	
	        if(is!=false){
	        location.href='/member/';
	        }else{
   		    layer.tips('密码错误，请重输入', '#login_pass',{guide: 0, time: 2});$('#login_pass').focus(); return false;
	        }
	        });     


   });

$(".xuan").click(function(){  
        $("input[name='C1']").attr("checked",$(this).get(0).checked);  
		if($(this).val()=='car'){carmoney();};
    });  
 

$('.emailtg').on('click', function(){
	$.layer({
    shade: [0],
    area: ['420px','auto'],
    dialog: {
        msg: '未验证将限制部分<strong style="color:#ff0000">卖家</strong>功能，若只为<strong style="color:#ff6600">买家</strong>可忽略验证；<br>当然也可进入会员中心后在<strong style="color:#6ab644">认证管理</strong>中继续完成验证。',
        btns: 2,                    
        type: 4,
        btn: ['验证吧','先跳过'],
        yes: function(index){
        layer.close(index);
        }, no: function(){
            location.href='/member/';
        }
    }
	});
  });
var $reg_list = $('.reg_start .txt');
$reg_list.focus(function(){	    
		$(this).next().removeClass().addClass("in");

}).blur(function(){ 
  var vid = $(this).attr("id");
  var val = trim($(this).val());
  var vhtm =$(this).prev().html().replace(/&nbsp;/ig, "").replace(/：/ig, "");
  var vlen = val.length;
  if (val=='') {
		  errorSign(vid,"亲，请输入正确的"+vhtm);
		  return false;
	}
  switch (vid){
  case 'nickname': 
  if(vlen > 14) {
	errorSign(vid, '昵称最长不可超过7个字符');
	return false;
	}

  var t = "nick&bh="+val;
  layer.check(t,function(is){
  if(is!=false){
	successSign(vid);
	}else{
	errorSign(vid, '此昵称已被占用');
	return false;
	}
    })

    break;
  case 'email': 
	if (!isEmail(val)){
   errorSign(vid, "请输入正确的"+vhtm);
	return false;
    }
   var t = "email&bh="+val;
   layer.check(t,function(is){
   if(is!=false){
	successSign(vid);
	}else{
	errorSign(vid, '此邮箱已注册过帐号，请使用其他邮箱');
	return false;
	}
    })
    break;
   case 'bemail': 
   if (!isEmail(val)){
   errorSign(vid, "请输入正确的"+vhtm);
	return false;
    }
    break;
    case 'password':
    if (vlen < 6 || vlen > 20) {
	errorSign(vid, '密码长度必须在6~32位之间');
	return false;
	}
	if (!checkLegalPwd(val)) {
		errorSign(vid, '密码不可包含 &amp; &lt; &gt; &quot; &#039;等字符');
		return false;
	}
    if (trim($("#repassword").val())!="" && val != trim($("#repassword").val())) {
	      errorSign("repassword", '两次输入的密码不一致');
	}
	

    break;
   case 'repassword': 
	  	if (val != trim($("#password").val())) {
	      errorSign(vid, '两次输入的密码不一致');
		  return false;
	}
    break;
   case 'myqq':

   if (vlen < 5 || vlen > 11 || isNaN(val)) {
	errorSign(vid, 'QQ号必须是5~11位之间的纯数字');
	return false;
	}
    break;


  case 'mytel':
  if (!mobilejudge(val)){
	errorSign(vid, '亲，您输入手机号码不正确，请重新输入');
	return false;
	}
    break;
    }

if (vid!='nickname' && vid!='email' ) {
	successSign(vid);
	 }
    })

});

//判断是否含有特殊符号
function checkLegalPwd(pwd) {
	var pwdPreg = /^[^&<>'"]*$/;
	if(pwdPreg.test(pwd)) {
	return true;
	}
	return false;
}

function errorSign(obj, msg) {
	$("#"+obj).next().removeClass().addClass('no').html(msg);
}

function successSign(obj) {
	$("#"+obj).next().removeClass().addClass('ok').html('');
}

function trim(str) {
	return (str + '').replace(/(\s+)$/g, '').replace(/^\s+/g, '');
}


function toggle() {
	 $(".toggles").toggle();
}
function Dedit(x){
	$("#hf"+x).toggle();
	}


function CheckLength(txtObj,length) {
    var str = txtObj.value;
    var len = str.length;
    var temp="";
    var reLen = 0;

    for (var i = 0; i < len; i++) {    
        if (str.charCodeAt(i) >255 ) {
            // 全角   
            reLen += 2;
        } else {
           reLen++;
        }
        if (reLen < length+1){
           temp+=str.charAt(i);
        }else{
           txtObj.value= temp;
        }
        
    }
}

//订单备注

function btnclick(x){ 
        var bz = $('#beizhu'+x).html(); 
        var nr = $('#txttitle'+x).val();
	    if(bz!=nr){
		var t = 'ddbz&id='+x+'&bztxt='+nr;
        layer.check(t,function(is){	
        if(is!=false){
		Dedit(x);
		$('#beizhu'+x).html(nr);
	    }
	    });
		}else{
	    layer.alert("您没有做任何修改！",5);return false;
		}
} 


//订单管理
function protj(x,y){
var isOK = true;
if(y=="1"){
        var aqm = $('#aqm').val();
        if(aqm.length<6 || /^\d+$/g.test(aqm) || /^[a-zA-Z]+$/g.test(aqm)){
        layer.tips('安全码需同时包含数字和字母，且不少于6位', '#aqm',{guide: 1, time: 5});$('#aqm').val('');$('#aqm').focus();return false;}
        var t = 'aqm&aqm='+aqm;
        layer.check(t,function(is){	
        if(is==false){
        layer.tips('安全码错误，请重新输入', '#aqm',{guide: 1, time: 2});$('#aqm').val('');$('#aqm').focus();isOK = false;return false; 
	    }
	    });
}
if (isOK){ 
var acc = $('#acc').val();
if(x=="back"){
        if(acc=='' || acc.length<20){
        layer.tips('退款理由不少于20字', '#acc',{guide: 1, time: 5});$('#acc').focus();return false;
		}
}

if(x=="sellback"){
var rv = $("input[name='R1']:checked").val();
if(rv!="yes" && rv!="no"){layer.alert("请选择您的处理决定【同意】或【不同意】",5);return false;}
if(rv=="no"){
if(acc=='' || acc.length<20){
layer.tips('请输入您拒绝退款的原因,不少于20字', '#acc',{guide: 1, time: 5});$('#acc').focus();return false;
}
}else if(y=="0"){
if(acc=='' || acc.length<10){
layer.tips('请输入您执行操作的原因,不少于10字', '#acc',{guide: 1, time: 5});$('#acc').focus();return false;
}
}
}
layer.confirm("您确定要<strong>"+$("#strtit").html()+"</strong>吗？", function(){
    $('#tjbtn').hide();
    $('#tjing').show();
    $("form[name='pro']").submit();
    });
}
}

//明细时间转换
function transdate(endTime){ 
	if(endTime!=""){
var date=new Date(); 
date.setFullYear(endTime.substring(0,4)); 
date.setMonth(endTime.substring(5,7)-1); 
date.setDate(endTime.substring(8,10)); 
date.setHours(endTime.substring(11,13)); 
date.setMinutes(endTime.substring(14,16)); 
date.setSeconds(endTime.substring(17,19)); 
return Date.parse(date)/1000; 
	}else{
	return "";
	}
} 




function qkcar(){
	layer.confirm('确定<font color="#ff6600">清空购物车</font>中所有商品吗？', function(){
    location.href="car.html?action=qk";return false;
});
}

//left切换
function uleft(id,num,kg){ 
	 var menus=document.getElementById("e"+id);
     var traget=document.getElementById(id);
	 if(id=="q" || kg==1 ){
	   if(menus.className=="qcur"){   
		 us=1; 
		 menus.className=""; 
		 }else{  
			 us=0; 
		     menus.className="qcur"; 
			 }
        if(num==2){num=1;}else{num=2;}
		for(i=num;i<=5;i++){
		var menus = document.getElementById("e"+i);
        var traget = document.getElementById(+i);
	    if(us==1){   
	     setCookie("uleft","1","30");
		 traget.style.display="";   
		 menus.className="cur"; 
		 }else{  
             setCookie("uleft","0","30");
			 traget.style.display="none"; 
		     menus.className=""; 
			 }
         } 

	 }else{

	 if(traget.style.display=="none"){   
		 traget.style.display="";   
		 menus.className="cur"; 
		 }else{  
			 traget.style.display="none"; 
		     menus.className=""; 
			 }	
			 
			 }
 } 
			
			 
//购物车支付提交
function carpaytj(x){
var isOK = true;
var io = $('#aqmio').val();
if(io=="1"){
var aqm = $('#aqm').val();
if(aqm.length<6 || /^\d+$/g.test(aqm) || /^[a-zA-Z]+$/g.test(aqm)){
layer.tips('安全码需同时包含数字和字母，且不少于6位', '#aqm',{guide: 1, time: 5});$('#aqm').val('');$('#aqm').focus();return false;
}
var t = 'aqm&aqm='+aqm;
layer.check(t,function(is){	
if(is==false){
layer.tips('安全码错误，请重新输入', '#aqm',{guide: 1, time: 2});$('#aqm').val('');$('#aqm').focus(); isOK = false;return false; 
	}else{
	carpay.action="pay_handle_url.html?bh="+x;
	}
	});
 }
if (isOK){ 
carpaying();
$('#tjbtn').hide();
$('#tjing').show();
var rv = $("input[name='R1']:checked").val();
if(rv=="alipay" || rv=="yeepay"){carpay.action="pay_handle_url.html?bh="+x;}
else{return true;}
}
}
//充值提交
function paytj(){
 var isOK = true;
 var money = $('#money').val();
if(money=="" || isNaN(money) || money<1){layer.tips('充值金额最少为1元', '#money',{guide: 2, time: 3});$('#money').focus();isOK=false;
return false;}
if(isOK){
var rv = $("input[name='R1']:checked").val();
if(rv=="alipay"){pay.action="pay.html";}
else if(rv=="yeepay"){pay.action="yeepay/req.php";}
else{return true;}
}
}


//提现提交
function txtj(x){
var money = $('#money').val();
var bankid = $('#bankid').val();
var bankname = $('#zh').html();
var truename = $('#truename').val();
var aqm = $('#aqm').val();
if(money<30 || isNaN(money)){
layer.tips('提现金额不能低于30元', '#money',{guide: 1, time: 5});$('#money').val('');$('#money').focus();return false;
}
if(bankid==''){
layer.tips('请填写正确的【'+bankname+'账号】', '#bankid',{guide: 1, time: 5});$('#bankid').val('');$('#bankid').focus();return false;
}
if(truename=='' || truename==bankid){
layer.tips('请填写正确的【'+bankname+'姓名】', '#truename',{guide: 1, time: 5});$('#truename').val('');$('#truename').focus();return false;
}
if(aqm.length<6 || /^\d+$/g.test(aqm) || /^[a-zA-Z]+$/g.test(aqm)){
layer.tips('安全码需同时包含数字和字母，且不少于6位', '#aqm',{guide: 1, time: 5});$('#aqm').val('');$('#aqm').focus();return false;
}
var t = 'aqm&aqm='+aqm;
layer.check(t,function(is){	
if(is==false){
layer.tips('安全码错误，请重新输入', '#aqm',{guide: 1, time: 2});$('#aqm').val('');$('#aqm').focus(); return false; 
	}else{
	layer.confirm("本次提现信息如下，是否确认:<br>提现金额：<strong style='color:#ff6600'>"+money+"</strong><br>收款帐号："+bankid+"<br>收款姓名："+truename+"<br><font color='#999999'>手续费："+$('#txfees').html()+"<br>处理时间：1~3天，结果邮件告知</font>", function(){
	$('#tjbtn').hide();
    $('#tjing').show();
    $("form[name='tx']").submit();
    });
	}
	});
}
function canceltx(x){
	 	layer.confirm("确定要<strong style='color:red'>撤销提现</strong>吗？<br>撤销后提现金额将返回至您的账户", function(){
        var t = 'canceltx&txbh='+x;
        layer.check(t,function(is){	
        if(is!=false){
        layer.alert('撤销成功,提现金额已返回至您的账户',1,'操作结果',function(){location.reload();});return false; 
	    }else{
        layer.alert('撤销失败，请重试',5,'操作结果',function(){location.reload();});return false; 
	    }
	    });
        });
}
//域名提交
function domaintj(x){ 
if((document.f1.dmt1.value).replace(/\s/,"")==""){document.getElementById("count").innerHTML="<img src='../img/err.gif' width='14' height='15' /> <font color=#FF0000>标题不能为空!</font>";document.f1.dmt1.focus();return false;}else{document.getElementById("count").innerHTML="";}
cstr=",";
num=document.getElementById("sxnum").innerHTML;
f=document.f1.fash.value;
if(f==0){
	if((document.f1.ename.value).replace(/\s/,"")==""){document.getElementById("enamets").innerHTML="<img src='../img/err.gif' width='14' height='15' /> <font color=#FF0000>请填写您要出售的域名</font>";document.f1.ename.focus();return false;}
	var doname = /^([\w-]+\.)+((com)|(net)|(org)|(gov\.cn)|(info)|(cc)|(com\.cn)|(net\.cn)|(org\.cn)|(name)|(biz)|(tv)|(cn)|(mobi)|(name)|(sh)|(ac)|   (io)|(tw)|(com\.tw)|(hk)|(com\.hk)|(ws)|(travel)|(us)|(tm)|(la)|(me\.uk)|(org\.uk)|(ltd\.uk)|(plc\.uk)|(in)|(eu)|(it)|(jp))$/;
    var flag_domain = doname.test(document.f1.ename.value);
    if(!flag_domain){
    document.getElementById("enamets").innerHTML="<img src='../img/err.gif' width='14' height='15' /> <font color=#FF0000>域名格式不正确</font>";document.f1.ename.focus();return false;
    }else{
		document.getElementById("enamets").innerHTML="填写要售的域名(不含www)";
	}
    }
for(s=0;s<num;s++){
dnum=0;
c=document.getElementsByName("C"+f+s);
for(i=0;i<c.length;i++){if(c[i].checked==true){cstr=cstr+c[i].value+",";dnum++}
}
if(s!=3){
if(dnum==0){
	document.getElementById("typets").style.display="";
	document.getElementById("typets").innerHTML=document.getElementById("name"+f+s).innerHTML+"不能为空，最少选择一项！";
	return false;}else{document.getElementById("typets").style.display="none";}}
}
if(UE.getEditor('container').hasContents()==false){document.getElementById("containerts").style.display="";UE.getEditor('container').focus();return false;}else{document.getElementById("typets").style.display="none";}	
	f1.action="domain.html?bh="+x+"&cstr="+cstr+"&fash="+f;
}



function domainnum(str){
var sMax = 3;
//设置最多可选择数，该数必须小于或等于checkbox的数量。
var c=document.all("C1"+str); 
var sNum = 0;   
for(var i=0;i<c.length;i++){if(c[i].checked){sNum++}}   
	if(sNum >= 3){    
		for(var i=0;i<c.length;i++){
			if(! c[i].checked){c[i].disabled=true;}
			}
			} else {  
				for(var i=0;i<c.length;i++){
					if(c[i].disabled){c[i].disabled=false;
						}
					}    
					}
					}

//个人信息
function infotj(){  
  var vqq = $('#qq').val();
  var vnick= $('#username').val();
  if(vqq.length < 5) {layer.tips('QQ号必须是5~11位之间的纯数字', '#qq',{guide: 1, time: 5});$('#qq').focus();return false;}
  if(vnick.length > 14) {layer.tips('昵称最长不可超过7个字符', '#username',{guide: 1, time: 5});$('#username').focus();return false;}
  var t = "nick&bh="+vnick;
  layer.check(t,function(is){
  if(is!=false){
   $('#tjbtn').hide();
   $('#tjing').show();
   $("form[name='info']").submit();
  }else{
   layer.tips('此昵称已被占用', '#username',{guide: 1, time: 5});$('#username').focus();return false;}
  })
}
//解除登陆
function removes(x){
layer.confirm('确定要<strong style=color:#ff4400>'+$('#r'+x).html()+'</strong>吗?<br>解除后将无法使用该帐号快捷登陆', function(){
            var data="removes&tab="+x;
            layer.check(data,function(is){	
	        if(is!=false){
             location.reload();
	         }else{
             layer.msg($('#r'+x).html()+'失败，请重试');
			 return false; 
	         }
	         });    
			 });
}
//密码安全码修改
function upm(){
   var data = {
	   			type: $('#jvs').val(),
                p_old: $('#p_old').val(), 
                p_new: $('#p_new').val(),
				p_renew: $('#p_renew').val()
               }

			if(data.type=='aqm'){

			if(data.p_old.length<6 || /^\d+$/g.test(data.p_old) || /^[a-zA-Z]+$/g.test(data.p_old)){
            layer.tips($('#p_old').next().html(),'#p_old',{guide:1,time:3});$('#p_old').focus();return false;
            }
			if(data.p_new.length<6 || /^\d+$/g.test(data.p_new) || /^[a-zA-Z]+$/g.test(data.p_new)){
            layer.tips($('#p_new').next().html(),'#p_new',{guide:1,time:3});$('#p_new').focus();return false;
            }

			}else{

			if(data.p_old.length<6){
            layer.tips($('#p_old').next().html(),'#p_old',{guide:1,time:3});$('#p_old').focus();return false;
            }
            if(data.p_new.length<6){
            layer.tips($('#p_new').next().html(),'#p_new',{guide:1,time:3});$('#p_new').focus();return false;
            }

			}

			if(data.p_renew!=data.p_new){
            layer.tips($('#p_renew').next().html(),'#p_renew',{guide:1,time:3});$('#p_renew').focus();return false;
            }
	        var data=data.type+"&"+data.type+"="+data.p_old;
            layer.check(data,function(is){	
	        if(is!=false){
			 $("form[name='safa']").submit(); 
			 return false; 
	         }else{
   		     layer.tips($('#p_old').next().next().html(), '#p_old',{guide: 1, time: 3});$('#p_old').val('');$('#p_old').focus(); 
			 return false; 
	         }
	         });    
}


 //VIP设置
function govip(){ 
    if (document.getElementsByName('R0')[1].checked!=""){
for (var i=1;i<=4;i++){
    if (document.getElementsByName('R'+i)[1].checked!="")
       {
for (var j=1;j<=3;j++){
	var num = document.getElementById(i+"text"+j+"").value;
	document.getElementById(i+"ts").innerHTML="";
	document.getElementById(i+"ts2").innerHTML="";
           if(j==3){
			   if(!/^([1-9]){1,2}$/g.test( num ) || document.getElementById(i+"text"+j+"").value==""){
			    document.getElementById(i+"ts2").innerHTML="<font color=red>需填写1-99之间的整数</font>";
				return false;}
				   }else{
			if(!(/(^[1-9]\d*$)/.test(num)) || document.getElementById(i+"text"+j+"").value==""){ document.getElementById(i+"ts").innerHTML="需填写大于1的整数";return false;
			}
			}

			}
			
		} 
		}
		}
}
			




//设置安全码
layer.newaqm = function(){
    var space = {};
    space.layer = function(html){
        $.layer({
            type: 1,
            shade: [0.1, '#000'],
            closeBtn:false,
			shadeClose:false,
            title:false,
            area: ['340px', '265px'],
            page: {
                html: html
            }
        });
     $('.newaqm_btn').on('click', function(){
            var data = {
                newaqm: $('#newaqm').val(), 
                reaqm: $('#reaqm').val()
            }
            if(data.newaqm.length<6 || /^\d+$/g.test(data.newaqm) || /^[a-zA-Z]+$/g.test(data.newaqm)){
              layer.tips('安全码需同时包含数字和字母，且不少于6位', '#newaqm',{guide: 1, time: 2});$('#newaqm').focus(); return false;
            }
            if(data.newaqm!=data.reaqm){
              layer.tips('两次输入安全码不一致', '#reaqm',{guide: 1, time: 2});$('#reaqm').focus();return false;
            }
	        var data="newaqm&aqm="+data.newaqm;
            layer.check(data,function(is){	
	        if(is!=false){
             layer.msg('安全码设置成功',2,1, function(){
					layer.closeAll();
					});
	         }else{
   		            layer.tips('安全码设置失败，请重试', '#login_pass',{guide: 1, time: 2}); return false;
	         }
	         });     
      });
    }
		$.get('/check/newaqm.html', function(html){
            space.layer(html);
     });
}

//TAB切换
 function Change(thNum,toNum){ 
            for(i=1;i<=toNum;i++){ 
                if(i==thNum){ 
                    document.getElementById('m_'+i).className="cur"; 
                    document.getElementById('c_'+i).style.display="";; 
                }else{ 
                    document.getElementById('m_'+i).className=''; 
                    document.getElementById('c_'+i).style.display="none";; 
                } 
            } 
        } 





//购物车开始
function carmoney(){
am=0;
c=document.getElementsByName("C1");
for(i=0;i<c.length;i++){
 if(c[i].checked){a1=(c[i].value).split("xcf");am=am+parseFloat(a1[0]);}
 }
document.getElementById("moneyall").innerHTML=am;
}


function carjs(){
m=parseFloat(document.getElementById("moneyall").innerHTML);
if(m==0){alert("未选择任何结算商品");return false;}
c=document.getElementsByName("C1");
z=document.getElementsByName("jifens");
carid="";
carjf="";
for(i=0;i<c.length;i++){
 if(c[i].checked){a1=(c[i].value).split("xcf");carid=carid+a1[1]+"xcf";
 s1=z[i].value;carjf=carjf+s1+"xcf";}
}
location.href="car.html?action=up&id="+carid+"&a="+carjf;
}

function djjf(){ //积分设置
	if(chk().length<=0){layer.alert('至少选择一条操作对象',5);return false;}
	else{location.href="jifen.html?bh="+chk();return false;}
	}
function cmbulk(x,y,z){  
layer.confirm('确定要删除选中信息吗？删除后不可恢复！', function(){
	bulk(x,y,z)
    });
}
function bulk(x,y,z){  //批量操作
	if(x==0){
	if(chk().length<=0){layer.alert('至少选择一条操作对象',5);return false;}else{var b=chk();}
	}else{
    var b=x;
	}
	layer.execute(y,b,z,function(is){	
		    var arr =is.split('|');
			if(arr[0]!=0){
		    var tips=1;
			}else{
		    var tips=5;
			}
			layer.alert(arr[1], tips, '操作结果', function(){location.reload();});
	        });  
}

layer.execute = function(a,b,t,callback){
          $.ajax({
              type: "POST",
              url: "execute.php",
              async: true,      //异步
              data: "a="+a+"&b="+b+"&t="+t,
              success: function(datas){
              callback(datas);
              }, error: function(){
            layer.closeLoad();
            layer.msg('网络异常，请重试');
           return false;
		    }
          });
		   
}