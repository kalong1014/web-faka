//�����濪ʼ
function slideUp(){
if($("toplsad").offsetHeight>0){
if($("toplsad").offsetHeight>10){
$("toplsad").style.height=$("toplsad").offsetHeight-10+"px"
setTimeout("slideUp();",30);
}else{
$("toplsad").style.display="none";
$("toplsimg").src=$("toplsimg").innerHTML;
$("toplsad").style.display="block";
slideDown();
}
}
}
function slideDown(){
if($("toplsad").offsetHeight<80){
if($("toplsad").offsetHeight<70){
$("toplsad").style.height=$("toplsad").offsetHeight+10+"px";
setTimeout("slideDown();",30);
}else{
$("toplsad").style.height="80px";
}
}
}
//���������

//¥���л�
function lcapover(x,y){
 for(i=1;i<6;i++){
 lc=document.getElementById("lcap"+x+"-"+i);if(lc){lc.className="l3";}	 
 lm=document.getElementById("lmain"+x+"-"+i);if(lm){lm.style.display="none";}
 }
 lc=document.getElementById("lcap"+x+"-"+y);if(lc){lc.className="l3 l31";}	 
 lm=document.getElementById("lmain"+x+"-"+y);if(lm){lm.style.display="";}
}

function listover(x){
if(x % 5==0){nu="u11 u12";}else{nu="u11";}
$("list"+x).className="u1 "+nu;
}
function listout(x){
if(x % 5==0){nu="u1 u12";}else{nu="u1";}
$("list"+x).className=nu;
}

//�л����뿪ʼ
var $ = function (id) {
	return "string" == typeof id ? document.getElementById(id) : id;
};

var Class = {
  create: function() {
	return function() {
	  this.initialize.apply(this, arguments);
	}
  }
}

Object.extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
	return destination;
}

var TransformView = Class.create();
TransformView.prototype = {
  //��������,��������,�л�����,�л�����
  initialize: function(container, slider, parameter, count, options) {
	if(parameter <= 0 || count <= 0) return;
	var oContainer = $(container), oSlider = $(slider), oThis = this;

	this.Index = 0;//��ǰ����
	
	this._timer = null;//��ʱ��
	this._slider = oSlider;//��������
	this._parameter = parameter;//�л�����
	this._count = count || 0;//�л�����
	this._target = 0;//Ŀ�����
	
	this.SetOptions(options);
	
	this.Up = !!this.options.Up;
	this.Step = Math.abs(this.options.Step);
	this.Time = Math.abs(this.options.Time);
	this.Auto = !!this.options.Auto;
	this.Pause = Math.abs(this.options.Pause);
	this.onStart = this.options.onStart;
	this.onFinish = this.options.onFinish;
	
	oContainer.style.overflow = "hidden";
	oContainer.style.position = "relative";
	
	oSlider.style.position = "absolute";
	oSlider.style.top = oSlider.style.left = 0;
  },
  //����Ĭ������
  SetOptions: function(options) {
	this.options = {//Ĭ��ֵ
		Up:			true,//�Ƿ�����(��������)
		Step:		5,//�����仯��
		Time:		10,//������ʱ
		Auto:		true,//�Ƿ��Զ�ת��
		Pause:		2000,//ͣ��ʱ��(AutoΪtrueʱ��Ч)
		onStart:	function(){},//��ʼת��ʱִ��
		onFinish:	function(){}//���ת��ʱִ��
	};
	Object.extend(this.options, options || {});
  },
  //��ʼ�л�����
  Start: function() {
	if(this.Index < 0){
		this.Index = this._count - 1;
	} else if (this.Index >= this._count){ this.Index = 0; }
	
	this._target = -1 * this._parameter * this.Index;
	this.onStart();
	this.Move();
  },
  //�ƶ�
  Move: function() {
	clearTimeout(this._timer);
	var oThis = this, style = this.Up ? "top" : "left", iNow = parseInt(this._slider.style[style]) || 0, iStep = this.GetStep(this._target, iNow);
	
	if (iStep != 0) {
		this._slider.style[style] = (iNow + iStep) + "px";
		this._timer = setTimeout(function(){ oThis.Move(); }, this.Time);
	} else {
		this._slider.style[style] = this._target + "px";
		this.onFinish();
		if (this.Auto) { this._timer = setTimeout(function(){ oThis.Index++; oThis.Start(); }, this.Pause); }
	}
  },
  //��ȡ����
  GetStep: function(iTarget, iNow) {
	var iStep = (iTarget - iNow) / this.Step;
	if (iStep == 0) return 0;
	if (Math.abs(iStep) < 1) return (iStep > 0 ? 1 : -1);
	return iStep;
  },
  //ֹͣ
  Stop: function(iTarget, iNow) {
	clearTimeout(this._timer);
	this._slider.style[this.Up ? "top" : "left"] = this._target + "px";
  }
};

window.onload=function(){
	setTimeout("slideUp();",3000);
	setTimeout(start,stoptime);
	function Each(list, fun){
		for (var i = 0, len = list.length; i < len; i++) { fun(list[i], i); }
	};
	
	var objs = $("idNum").getElementsByTagName("li");
	
	var tv = new TransformView("idTransformView", "idSlider", 221, document.getElementById("qhai").innerHTML, {
		onStart : function(){ Each(objs, function(o, i){ o.className = tv.Index == i ? "on" : ""; }) }//��ť��ʽ
	});
	
	tv.Start();
	
	Each(objs, function(o, i){
		o.onmouseover = function(){
			o.className = "on";
			tv.Auto = false;
			tv.Index = i;
			tv.Start();
		}
		o.onmouseout = function(){
			o.className = "";
			tv.Auto = true;
			tv.Start();
		}
	})
	
	
}
//�л��������





//�Ź�����ʱ��ʼ
var responsesj;
var time_server_client,timerID,xs,time_end1,time_end2,time_end3,time_end4,timerID1,timerID2,timerID3,timerID4;

function show_time(djsid)
{
 var time_now,time_distance,str_time;
 var int_day,int_hour,int_minute,int_second;
 var time_now=new Date();
 time_now=time_now.getTime()+time_server_client;
 if(djsid==1){time_end=time_end1;timerID=timerID1;}
 else if(djsid==2){time_end=time_end2;timerID=timerID2;}
 else if(djsid==3){time_end=time_end3;timerID=timerID3;}
 else if(djsid==4){time_end=time_end4;timerID=timerID4;}
 
 time_distance=time_end-time_now;
 if(time_distance>0)
 {
  int_day=parseInt(Math.floor(time_distance/86400000))
  time_distance-=int_day*86400000;
  int_hour=parseInt(Math.floor(time_distance/3600000))
  time_distance-=int_hour*3600000;
  int_minute=parseInt(Math.floor(time_distance/60000))
  time_distance-=int_minute*60000;
  int_second=parseInt(Math.floor(time_distance/1000))
  mm = Math.floor((time_distance % 1000)/100);
   tv=int_day+"<span class='s1'>��</span>";
   tv=tv+int_hour+"<span class='s1'>ʱ</span>";
   tv=tv+int_minute+"<span class='s1'>��</span>";
   tv=tv+int_second+"." + mm+"<span class='s1'>��</span>";
   document.getElementById("djs"+djsid).innerHTML=tv;
   setTimeout("show_time("+djsid+")",100);
  }
  else
 {
  tv="<span class='feng'>�ѽ���</span>";
  document.getElementById("djs"+djsid).innerHTML=tv;
  document.getElementById("s"+djsid+"sj1").innerHTML=0;
  document.getElementById("s"+djsid+"sj2").innerHTML=0;
  document.getElementById("s"+djsid+"sj3").innerHTML=0;
  clearTimeout(timerID)
 }
}

var xmlHttpsj = false;
try {
  xmlHttpsj = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttpsj = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttpsj = false;
  }
}
if (!xmlHttpsj && typeof XMLHttpRequest != 'undefined') {
  xmlHttpsj = new XMLHttpRequest();
}


function updatePagesj() {
  if (xmlHttpsj.readyState == 4) {
   responsesj = xmlHttpsj.responseText;
   if($("dqsj1")){dsj1=document.getElementById("dqsj1").innerHTML;time_end1=new Date(dsj1);time_end1=time_end1.getTime();}//������ʱ��
   if($("dqsj2")){dsj2=document.getElementById("dqsj2").innerHTML;time_end2=new Date(dsj2);time_end2=time_end2.getTime();}//������ʱ��
   if($("dqsj3")){dsj3=document.getElementById("dqsj3").innerHTML;time_end3=new Date(dsj3);time_end3=time_end3.getTime();}//������ʱ��
   if($("dqsj4")){dsj4=document.getElementById("dqsj4").innerHTML;time_end4=new Date(dsj4);time_end4=time_end4.getTime();}//������ʱ��

time_now_server=new Date(responsesj);time_now_server=time_now_server.getTime();
time_now_client=new Date();time_now_client=time_now_client.getTime();
time_server_client=time_now_server-time_now_client;

   if($("dqsj1")){timerID1=setTimeout("show_time(1)",100);}
   if($("dqsj2")){timerID2=setTimeout("show_time(2)",100);}
   if($("dqsj3")){timerID3=setTimeout("show_time(3)",100);}
   if($("dqsj4")){timerID4=setTimeout("show_time(4)",100);}
  }
}

function userChecksj(){
	if($("dqsj1")){
    var url = document.getElementById("webhttp").innerHTML+"tem/sjCheck.php";
    xmlHttpsj.open("post", url, true);
    xmlHttpsj.onreadystatechange = updatePagesj;
    xmlHttpsj.send(null);
	}
	}
//�Ź�����ʱ����