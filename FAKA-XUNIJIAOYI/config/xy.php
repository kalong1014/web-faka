<?
//֮���Զ�������������Ϊ��������Ķ��壬�����û���̫һ��
function returnxytp($xynum){
 if($xynum>=0 && $xynum<6){ //��ʾ���ô��ڵ�0��С��10
  return "s-star-1.gif";
 }elseif($xynum>=6 && $xynum<20){ 
  return "s-star-2.gif";
 }elseif($xynum>=20 && $xynum<50){ 
  return "s-star-3.gif";
 }elseif($xynum>=50 && $xynum<100){ 
  return "s-star-4.gif";
 }elseif($xynum>=100 && $xynum<200){ 
  return "s-star-5.gif";
 }elseif($xynum>=200 && $xynum<350){ 
  return "s-Diamond-1.gif";
 }elseif($xynum>=350 && $xynum<600){ 
  return "s-Diamond-2.gif";
 }elseif($xynum>=600 && $xynum<1000){ 
  return "s-Diamond-3.gif";
 }elseif($xynum>=1000 && $xynum<1500){ 
  return "s-Diamond-4.gif";
 }elseif($xynum>=1500 && $xynum<2500){ 
  return "s-Diamond-5.gif";
 }elseif($xynum>=2500 && $xynum<4000){ 
  return "s-crown-1.gif";
 }elseif($xynum>=4000 && $xynum<6000){ 
  return "s-crown-2.gif";
 }elseif($xynum>=6000 && $xynum<10000){ 
  return "s-crown-3.gif";
 }elseif($xynum>=10000 && $xynum<15000){ 
  return "s-crown-4.gif";
 }elseif($xynum>=15000 && $xynum<30000){ 
  return "s-crown-5.gif";
 }
}

function returnxych($xynum){
 if($xynum>=0 && $xynum<6){ //��ʾ���ô��ڵ�0��С��10
  return "һ������(1 - 5�����û���)";
 }elseif($xynum>=6 && $xynum<21){ 
  return "��������(5 - 20�����û���)";
 }elseif($xynum>=21 && $xynum<51){ 
  return "��������(21 - 50�����û���)";
 }elseif($xynum>=51 && $xynum<101){ 
  return "��������(51 - 100�����û���)";
 }elseif($xynum>=101 && $xynum<201){ 
  return "��������(101 - 200�����û���)";
 }elseif($xynum>=201 && $xynum<351){ 
  return "һ������(201 - 350�����û���)";
 }elseif($xynum>=351 && $xynum<601){ 
  return "��������(351 - 600�����û���)";
 }elseif($xynum>=601 && $xynum<1001){ 
  return "��������(601 - 1000�����û���)";
 }elseif($xynum>=1001 && $xynum<1501){ 
  return "��������(1001 - 1500�����û���)";
 }elseif($xynum>=1501 && $xynum<2501){ 
  return "��������(1501 - 2500�����û���)";
 }elseif($xynum>=2501 && $xynum<4001){ 
  return "һ�ʹ�����(2501 - 4000�����û���)";
 }elseif($xynum>=4001 && $xynum<6001){ 
  return "���ʹ�����(4001 - 6000�����û���)";
 }elseif($xynum>=6001 && $xynum<10001){ 
  return "���ʹ�����(6001 - 10000�����û���)";
 }elseif($xynum>=10001 && $xynum<15001){ 
  return "�Ļʹ�����(10001 - 15000�����û���)";
 }elseif($xynum>=15001 && $xynum<100000){ 
  return "��ʹ�����(15001�����û���)";
 }
}

?>