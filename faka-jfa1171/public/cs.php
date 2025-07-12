<?php
$servername = "localhost";
$username = "d_0v7_cn";
$password = "hYihZZ7bDGZHwEWs";
$dbname = "d_0v7_cn";
// 创建连接
$conn = mysqli_connect($servername, $username, $password, $dbname);
// 检查连接是否成功
if (!$conn) {
    die('Connection failed: ' . mysqli_connect_error());
}
// 获取要删除的行的 id
$id = $_GET["url"];
// 删除指定的行
$sql = "DELETE FROM dwz_url WHERE url = '$id'";

if (mysqli_query($conn, $sql)) {
     echo "Record deleted successfully";
} else {
     echo "Error deleting record: " . mysqli_error($conn);
}
// 关闭连接
mysqli_close($conn);
?>