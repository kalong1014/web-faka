<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:78:"/www/wwwroot/www.811192.xyz/public/../application/extra/view/handler/jump.html";i:1646323578;}*/ ?>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>跳转提示</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap Css -->
        <link href="/static/merchant/default/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="/static/merchant/default/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="/static/merchant/default/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
        <style>
            .content-icon {
                width: 96px;
                height: 96px;
                background-color: rgba(240, 64, 55, 0.1);
                border-radius: 15px;
                display: -webkit-inline-box;
                display: inline-flex;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                margin-bottom: 20px;
                margin-top: 100px;
            }
            .content-icon.error {
                background-color: rgba(240, 64, 55, 0.1);
            }
            .content-icon.success{
                background-color:rgba(33, 202, 51, 0.1);

            }
        </style>
    </head>
    <body style="background-image: url('/static/theme/default/img/404-bg.jpg'); visibility: visible; animation-name: fadeIn;">
        <div class="account-pages" >
            <div class="container">
                <div class="row mt-5">
                    <div class="col-lg-12">
                        <div class="text-center mb-5">

                            <?php switch ($code) {case 1:?>
                            <div class="content-icon success">
                                <i class="bx bx-message-square-dots display-4 text-success"></i>
                            </div>
                            <h3 class='text-success font-weight-bold mt-5'><?php echo(strip_tags($msg));?></h3>
                            <?php break;case 0:?>
                            <div class="content-icon error">
                                <i class="bx bx-message-square-dots display-4 text-danger"></i>
                            </div>
                            <h3 class='text-danger font-weight-bold mt-5'><?php echo(strip_tags($msg));?></h3>
                            <?php break;} ?>

                            <p class="mt-4">页面自动 <a id="href" href="<?php echo($url);?>">跳转</a> 等待时间： <b id="wait"><?php echo($wait);?></b></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- JAVASCRIPT -->
        <script src="/static/merchant/default/libs/jquery/jquery.min.js"></script>
        <script src="/static/merchant/default/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="/static/merchant/default/libs/metismenu/metisMenu.min.js"></script>
        <script src="/static/merchant/default/libs/simplebar/simplebar.min.js"></script>
        <script src="/static/merchant/default/libs/node-waves/waves.min.js"></script>
        <script src="/static/merchant/default/assets/js/app.js"></script>
        <script type="text/javascript">
            (function () {
                var wait = document.getElementById('wait'),
                        href = document.getElementById('href').href;
                var interval = setInterval(function () {
                    var time = --wait.innerHTML;
                    if (time <= 0) {
                        location.replace(href);
                        clearInterval(interval);
                    }
                    ;
                }, 1000);
            })();
        </script>
    </body>
</html>
