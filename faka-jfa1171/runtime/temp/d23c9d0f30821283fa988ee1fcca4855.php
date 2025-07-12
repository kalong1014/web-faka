<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:90:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3//index/agreement.html";i:1575165824;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title><?php echo sysconf('site_name'); ?><?php echo sysconf('site_subtitle'); ?></title>
    <meta name="keywords" content="<?php echo sysconf('site_keywords'); ?>" />
    <meta name="description" content="<?php echo sysconf('site_desc'); ?>" />
    <link rel="shortcut icon" href="<?php echo sysconf('browser_icon'); ?>" />
    <link rel="stylesheet" href="/static/app/t3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/app/t3/css/reset.css">
    <link rel="stylesheet" href="/static/app/t3/css/common.css">
    <link rel="stylesheet" href="/static/app/t3/css/friendlyprompt.css">
    <script src="/static/app/t3/js/friendlyprompt.js"></script>
    <script src="/static/app/t3/js/jquery.min.js"></script>
    <script src='/static/app/t3/js/bootstrap.min.js'></script>
    <script src='/static/app/t3/js/public.js'></script>
    <link rel="stylesheet" href="/static/app/t3/css/head_footer.css">
    <link rel="stylesheet" href="/static/app/t3/css/numscroll.css">
    <link rel="stylesheet" href="/static/app/t3/css/ymmindex.css">
    <link rel="stylesheet" href="/static/app/t3/css/swiper.min.css">
    <link rel="stylesheet" href="/static/app/t3/css/newbanner.css">

    <link rel="stylesheet" href="/static/app/t3/css/consulting.css">
    <link rel="stylesheet" href="/static/app/t3/css/contatusFooter.css">
    <link rel="stylesheet" href="/static/app/css/iconfont.css">
    <script src='/static/app/t3/js/main.js'></script>
    <script src='/static/app/t3/js/proconsulting.js'></script>

    <script src='/static/app/t3/js/swiper.min.js'></script>
    <script src="/static/app/js/formvalidator_min.js"></script>
    <script src="/static/app/js/formvalidatorregex.js"></script>
    <script src="/static/app/js/layer.js"></script>

</head>
<body>

<!--中间内容start-->
<div class="newmianboady" style="margin-top:20px;">

    <style>

        a.trench {
            text-decoration: none;
        }

        .newmianboady {
            background-color: transparent;
        }
    </style>

    <div class="dzz-main-content" style="width: 90%">
        <dl class="contatus-main">
            <?php echo htmlspecialchars_decode($data['content']); ?>
        </dl>
    </div>

</div>

</body>
</html>