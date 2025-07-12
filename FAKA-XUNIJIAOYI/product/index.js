//搜索
function psear(){
m1=document.f1.money1.value;
m2=document.f1.money2.value;
if(isNaN(m1)){alert("价格输入有误！");document.f1.money1.select();return false;}	
if(isNaN(m2)){alert("价格输入有误！");document.f1.money2.select();return false;}	
wz="_b"+m1+"v_c"+m2+"v";
if(document.getElementById("C1").checked){wz=wz+"_a1v";}
if(document.getElementById("C2").checked){wz=wz+"_d1v";}
f1.action="../search/index.php?admin=4&getv="+wz;
}

function simgover(x){
document.getElementById("bimg").src=x;
}

//担保图标
function serover(x){
document.getElementById("cserdb").className="l3 l31";;
document.getElementById("cserfh").className="l3 l31";;
document.getElementById("serdb").style.display="none";
document.getElementById("serfh").style.display="none";
document.getElementById("c"+x).className="l3";;
document.getElementById(x).style.display="";
}

//加入购物车
var xmlHttpcar = false;
try {
  xmlHttpcar = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttpcar = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttpcar = false;
  }
}
if (!xmlHttpcar && typeof XMLHttpRequest != 'undefined') {
  xmlHttpcar = new XMLHttpRequest();
}

function carInto(x){
url = "../tem/carInto.php?bh="+x+"&kcnum="+document.getElementById("tkcnum").value;
xmlHttpcar.open("get", url, true);
xmlHttpcar.onreadystatechange = updatePagecar;
xmlHttpcar.send(null);
}

function updatePagecar() {
 if(xmlHttpcar.readyState == 4) {
 response = xmlHttpcar.responseText;
 response=response.replace(/[\r\n]/g,'');
  if(response=="err1"){tangc(1);return false;}
  else if(response=="err2"){alert("亲~不能将自己的商品放入购物车哦");return false;}
  else if(response=="ok"){
  document.getElementById("cara2").style.display="";
  document.getElementById("cara1").style.display="none";
  }else{alert("未知错误，请刷新重试");return false;}
 }
}

//立即购买
var xmlHttpbuy = false;
try {
  xmlHttpbuy = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttpbuy = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttpbuy = false;
  }
}
if (!xmlHttpbuy && typeof XMLHttpRequest != 'undefined') {
  xmlHttpbuy = new XMLHttpRequest();
}

function buyInto(x){
url = "../tem/buyInto.php?bh="+x+"&kcnum="+document.getElementById("tkcnum").value;
xmlHttpbuy.open("get", url, true);
xmlHttpbuy.onreadystatechange = updatePagebuy;
xmlHttpbuy.send(null);
}

function updatePagebuy() {
 if(xmlHttpbuy.readyState == 4) {
 response = xmlHttpbuy.responseText;
 response=response.replace(/[\r\n]/g,'');
  if(response=="err1"){tangc(1);return false;}
  else if(response=="err2"){alert("亲~不能购买自己的商品哦");return false;}
  else if(response=="ok"){location.href="../user/car.php";}else{alert("未知错误，请刷新重试");return false;}
 }
}

//店铺收藏
var xmlHttpfavs = false;
try {
  xmlHttpfavs = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttpfavs = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttpfavs = false;
  }
}
if (!xmlHttpfavs && typeof XMLHttpRequest != 'undefined') {
  xmlHttpfavs = new XMLHttpRequest();
}

function shopfavInto(x){
url = "../tem/favshopInto.php?id="+x;
xmlHttpfavs.open("get", url, true);
xmlHttpfavs.onreadystatechange = updatePagefavs;
xmlHttpfavs.send(null);
}

function updatePagefavs() {
 if(xmlHttpfavs.readyState == 4) {
 response = xmlHttpfavs.responseText;
 response=response.replace(/[\r\n]/g,'');
  if(response=="err1"){tangc(1);return false;}
  else if(response=="err2"){alert("亲~不能收藏自己的店铺哦");return false;}
  else if(response=="ok"){
  document.getElementById("favsyes").style.display="";
  document.getElementById("favsno").style.display="none";
  }else{alert("未知错误，请刷新重试");return false;}
 }
}

//商品收藏
var xmlHttpfavp = false;
try {
  xmlHttpfavp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttpfavp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttpfavp = false;
  }
}
if (!xmlHttpfavp && typeof XMLHttpRequest != 'undefined') {
  xmlHttpfavp = new XMLHttpRequest();
}

function profavInto(x){
url = "../tem/favproInto.php?bh="+x;
xmlHttpfavp.open("get", url, true);
xmlHttpfavp.onreadystatechange = updatePagefavp;
xmlHttpfavp.send(null);
}

function updatePagefavp() {
 if(xmlHttpfavp.readyState == 4) {
 response = xmlHttpfavp.responseText;
 response=response.replace(/[\r\n]/g,'');
  if(response=="err1"){tangc(1);return false;}
  else if(response=="err2"){alert("亲~不能收藏自己的商品哦");return false;}
  else if(response=="ok"){
  document.getElementById("favpyes").style.display="";
  document.getElementById("favpno").style.display="none";
  }else{alert("未知错误，请刷新重试");return false;}
 }
}






