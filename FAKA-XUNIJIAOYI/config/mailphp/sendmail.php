<?
function yjsendmail($fname,$tmail,$str){
 global $rowcontrol;
 require("../config/mailphp/class.phpmailer.php"); //下载的文件必须放在该文件所在目录 
 $mail1=$rowcontrol[mailname]; //发件邮件
 $mailsmtp=$rowcontrol[mailsmtp];
 $mailpwd=$rowcontrol[mailpwd];
 $maildk=$rowcontrol[maildk]; //端口
 $mail = new PHPMailer(); //建立邮件发送类  
 $mail->IsHTML() ;//
 $address =$mail1;  
 $mail->IsSMTP(); // 使用SMTP方式发送  
 $mail->Host = $mailsmtp; // 您的企业邮局域名  
 $mail->SMTPAuth = true; // 启用SMTP验证功能  
 $mail->Username = $mail1; // 邮局用户名(请填写完整的email地址)  
 $mail->Password = $mailpwd; // 邮局密码  
 $mail->Port=$maildk;  
 $mail->From = $mail1; //邮件发送者email地址  
 $mail->FromName = $fname;  
 $mail->CharSet = "gb2312";                    	// 指定字符集
 $mail->AddAddress($tmail,$tmail);//收件人地址，可以替换成任何想要接收邮件的email信箱,格式是AddAddress("收件人email","收件人姓名")  
 $mail->Subject = $fname; //邮件标题  
 $mail->Body = $str; //邮件内容  
 $mail->AltBody = "顺控网-国内最优质的源码交易、域名交易、免费源码等站长服务平台-www.hzskdz.com"; //附加信息，可以省略  
 $mail->Send();
}
?>