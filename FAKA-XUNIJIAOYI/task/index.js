//�Ź�����ʱ��ʼ
var responsesj;
var time_server_client,timerID,xs,time_end1,timerID1;

function show_time(djsid)
{
 var time_now,time_distance,str_time;
 var int_day,int_hour,int_minute,int_second;
 var time_now=new Date();
 time_now=time_now.getTime()+time_server_client;
 time_end=time_end1;timerID=timerID1;
 
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
   document.getElementById("djs").innerHTML=tv;
   setTimeout("show_time("+djsid+")",100);
  }
  else
 {
  tv="<span class='feng'>�ѽ���</span>";
  document.getElementById("djs").innerHTML=tv;
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


function userChecksj() {
   responsesj = document.getElementById("nowsj").innerHTML;
   if($("dqsj")){dsj1=document.getElementById("dqsj").innerHTML;time_end1=new Date(dsj1);time_end1=time_end1.getTime();}//������ʱ��
   time_now_server=new Date(responsesj);time_now_server=time_now_server.getTime();
   time_now_client=new Date();time_now_client=time_now_client.getTime();
   time_server_client=time_now_server-time_now_client;
   if($("dqsj")){timerID1=setTimeout("show_time(1)",100);}
}
//�Ź�����ʱ����