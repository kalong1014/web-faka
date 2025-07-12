<?php 
include("../config/config.php");
mysql_connect(sqlhost,sqluid,sqlpwd) or die("database connection failure");
mysql_select_db(sqltable);
mysql_query("set names utf8");
$id = $_GET['id'];
$str = mb_convert_encoding($_GET['str'], "UTF-8", "GBK"); 
mysql_query("update yjcode_car set msg='$str' where id=$id");
?>