<?
$sj1=date("Y-m-d H:i:s");

//�˿��ж�
while1("*","yjcode_tk where (selluserid=".$luserid." or userid=".$luserid.")");while($row1=mysql_fetch_array($res1)){
$sjc=DateDiff($sj1,$row1[tkoksj],"s");
$myorderbh=$row1[orderbh];
 if($sjc>=0){  //��ʾ�Ѿ��ﵽ��Чʱ�䣬�Զ�ͬ���˿�
 $allmoney=$row1[money1];
 PointUpdateM($row1[userid],$allmoney);
 $tkjg="����δ��ָ��ʱ���ڴ����˿����룬ϵͳĬ��ͬ���˿�";
 PointIntoM($row1[userid],$tkjg,$allmoney);
 updatetable("yjcode_order","ddzt='backsuc',tksj='".$row1[sj]."',tkly='".$row1[tkly]."',tkjg='".$tkjg."',tkoksj='".$sj1."' where orderbh='".$myorderbh."'");
 deletetable("yjcode_tk where orderbh='".$myorderbh."'");
 deletetable("yjcode_db where orderbh='".$myorderbh."'");
 }
}

//�Զ�ȷ���ջ�
while1("*","yjcode_db where (selluserid=".$luserid." or userid=".$luserid.")");while($row1=mysql_fetch_array($res1)){
$sjc=DateDiff($sj1,$row1[dboksj],"s");
$myorderbh=$row1[orderbh];
 if($sjc>=0){  //��ʾ�Ѿ��ﵽ��Чʱ�䣬�Զ�ȷ���ջ�
 $allmoney=$row1[money1]; //�ܽ�� 
 $sellblm=returnsellbl($row1[selluserid])*$allmoney; //���ҿɵý��
 $ptyj=$allmoney-$sellblm;
 PointUpdateM($row1[selluserid],$sellblm);
 PointIntoM($row1[selluserid],"���δ����Чʱ����ȷ���ջ���ϵͳ�Զ�ȷ���ջ������Զ��۳�ƽ̨Ӷ��".$ptyj."Ԫ",$sellblm);
 //�Ƽ�B
 $v=returntjuserid($row1[userid]);
 if(!empty($v) && !empty($rowcontrol[tjmoney])){
 $tjm=$allmoney*$rowcontrol[tjmoney];
 PointUpdateM($v,$tjm);
 PointIntoM($v,"���Ƽ�����ҳɹ�������".$allmoney."Ԫ���������ӦӶ��",$tjm);
 PointUpdateM($row1[selluserid],$tjm*(-1));
 PointIntoM($row1[selluserid],"����������û��Ƽ�����(�Ƽ���ID:".$v.")���۳�Ӷ��",$tjm*(-1));
 }
 //�Ƽ�E
 updatetable("yjcode_order","ddzt='suc',oksj='".$sj1."' where orderbh='".$myorderbh."'");
 deletetable("yjcode_db where orderbh='".$myorderbh."'");
 deletetable("yjcode_tk where orderbh='".$myorderbh."'");
 }
}
 

?>