//��$���м�д
function $(objectId) { 
if(document.getElementById && document.getElementById(objectId)) { // W3C DOM 
return document.getElementById(objectId); 
} 
else if (document.all && document.all(objectId)) { // MSIE 4 DOM 
return document.all(objectId); 
} 
else if (document.layers && document.layers[objectId]) { // NN 4 DOM.. note: this won't find nested layers 
return document.layers[objectId]; 
} 
else { 
return false; 
} 
}

//�������С�����λ�����
function addNum(num1,num2){
var sq1,sq2,m;
try{sq1=num1.toString().split(".")[1].length;} catch(e){sq1=0;}
try{sq2=num2.toString().split(".")[1].length;} catch(e){sq2=0;}
m=Math.pow(10,Math.max(sq1,sq2));
return ( num1 * m + num2 * m ) / m;
}

function accMul(arg1,arg2){
 var m=0,s1=arg1.toString(),s2=arg2.toString();
 try{m+=s1.split(".")[1].length}catch(e){}
 try{m+=s2.split(".")[1].length}catch(e){}
 return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);
}

function tjwait(){
document.getElementById("tjbtn").style.display="none";
document.getElementById("tjing").style.display="";	
}

function gourl(x){location.href=x;	}

//ͼƬ��궯��
function tphover(x){
 try{$("tpf"+x).tover();    //����FF��ie8
 }catch(e){
 window.frames["tpf"+x].tover();    //����IE6��7
 }
}
function tphout(x){
 try{$("tpf"+x).tout();    //����FF��ie8
 }catch(e){
 window.frames["tpf"+x].tout();    //����IE6��7
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
//ɾ������
function NcheckDEL(x,y){
	var c=document.getElementsByName("C1");
	str="";
	for(i=0;i<c.length;i++){
		if(c[i].checked){
			if(str==""){
				str=c[i].value;
				}else{
					str=str+","+c[i].value;
					}
			}
		}
	if(str==""){alert("������ѡ��һ������");return false;}
	if(confirm("ȷ��Ҫִ�иò�����?")){noRefresh(x,str,y);}else{return false;}
}
var xmlHttpdel = false;
try {
  xmlHttpdel = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttpdel = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttpdel = false;
  }
}
if (!xmlHttpdel && typeof XMLHttpRequest != 'undefined') {
  xmlHttpdel = new XMLHttpRequest();
}
function noRefresh(admin,bhid,tablename) {
  if(bhid==""){alert("����������");return false;}
  var url = "noRefresh.php?admin="+admin+"&idbh="+bhid+"&tab="+tablename;
  xmlHttpdel.open("post", url, true);
  xmlHttpdel.onreadystatechange = updatePagedel;
  xmlHttpdel.send(null);  
}

function updatePagedel() {
  if (xmlHttpdel.readyState == 4) {
  var response = xmlHttpdel.responseText;
  a=response.replace(/[\r\n]/g,'');
  if(a=="ERR074"){alert("����ʧ�ܣ�������");return false;}
  else if(a=="True"){location.reload();return false;}
  }
}
