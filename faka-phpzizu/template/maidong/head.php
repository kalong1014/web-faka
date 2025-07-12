<?php
if (!defined('IN_CRONLITE')) exit();
?>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0"/>
    <title>
        <?php echo $conf['sitename'] ?> - <?php echo $conf['title'] ?>
    </title>
    <meta name="keywords" content="<?php echo $conf['keywords'] ?>">
    <meta name="description" content="<?php echo $conf['description'] ?>">
    <link href="//lib.baomitu.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="//lib.baomitu.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<?php echo $cdnserver?>assets/maidong/css/main.css">
    <link rel="stylesheet" href="<?php echo $cdnserver?>assets/maidong/css/themes.css">
    <link rel="stylesheet" href="//lib.baomitu.com/modernizr/2.8.3/modernizr.min.js">
    <link href="<?php echo $cdnserver?>assets/maidong/css/select2.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
        <script src="//lib.baomitu.com/html5shiv/3.7.3/html5shiv.min.js">
        </script>
        <script src="//lib.baomitu.com/respond.js/1.4.2/respond.min.js">
        </script>
    <![endif]-->
    <style>
img.logo{width:14px;height:14px;margin:0 5px 0 3px;}
.onclick{cursor: pointer;touch-action: manipulation;}
    </style>
</head>
<body>
