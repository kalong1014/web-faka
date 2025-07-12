<?php
$url = 'http://d.0v7.cn/api.php?url='.$_GET['url'];
$curl = curl_init();
curl_setopt_array($curl, array(
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'GET',
    CURLOPT_HTTPHEADER => array(
        'Host: d.0v7.cn',
        'Connection: keep-alive',
        'Content-Length: ',
        'User-Agent: Mozilla/5. (Linux; U; Android 12; zh-cn; 22081212C Build/SKQ1.220303.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4. Chrome/100..4896.127 Mobile Safari/537.36 XiaoMi/MiuiBrowser/17.5.100320 swan-mibrowser',
        'Content-Type: application/x-www-form-urlencoded',
        'Accept: */*',
        'Origin: http://d.0v7.cn',
        'Referer: http://d.0v7.cn/',
        'Accept-Encoding: gzip, deflate',
        'Accept-Language: zh-CN,zh;q=.9,en-US;q=.8,en;q=.7',
        'Cookie: PHPSESSID=snlrm1ftf839fe8fvqjrt8lgu'
    ),
));

$response = curl_exec($curl);
curl_close($curl);
$result = json_decode($response, true);
$msg = $result['dwz'];
echo $msg;
?>

