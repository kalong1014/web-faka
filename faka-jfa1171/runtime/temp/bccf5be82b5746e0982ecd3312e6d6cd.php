<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:90:"/www/wwwroot/www.811192.xyz/application/templates/mobile/merchant/default/index/index.html";i:1695544838;s:83:"/www/wwwroot/www.811192.xyz/application/templates/mobile/merchant/default/base.html";i:1687275226;}*/ ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="theme-color" content="#0134d4">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <!-- Title-->
        <title>商户面板 - <?php echo sysconf('site_name'); ?></title>
        <meta name="keywords" content="<?php echo sysconf('site_keywords'); ?>" />
        <meta name="description" content="<?php echo sysconf('site_desc'); ?>" />
        <link rel="shortcut icon" href="<?php echo sysconf('browser_icon'); ?>" />

        <!-- CSS Libraries-->
        <link rel="stylesheet" href="/static/merchant/mobile_default/css/bootstrap.min.css">
        <link rel="stylesheet" href="/static/merchant/default/libs/jquery-confirm/css/jquery-confirm.css">
        <link rel="stylesheet" href="/static/merchant/mobile_default/css/animate.css">
        <link rel="stylesheet" href="/static/merchant/mobile_default/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/static/merchant/default/css/icons.min.css">
        <link rel="stylesheet" href="/static/merchant/mobile_default/css/magnific-popup.css">
        <link rel="stylesheet" href="/static/merchant/mobile_default/css/ion.rangeSlider.min.css">
        <link rel="stylesheet" href="/static/merchant/mobile_default/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="/static/merchant/mobile_default/css/apexcharts.css">
        <link rel="stylesheet" href="/static/merchant/mobile_default/css/style.css">
        <link rel="stylesheet" href="/static/merchant/mobile_default/layer/theme/default/layer.css" id="layuicss-layer">
        
<style>
    body{
        background: #fff;
    }
    .page-content-wrapper{
        margin-top: 0px !important;
        padding-top: 0px !important;
        padding-bottom: 0px !important;
    }
    #headerArea{
        display:none
    }
</style>

        <script>
            document.onkeydown = function () {
                if (window.event && window.event.keyCode == 123) {
                    event.keyCode = 0;
                    event.returnValue = false;
                }
            }
        </script>
    </head>
    <body>
        <!-- Preloader-->
        <div class="preloader d-flex align-items-center justify-content-center" id="preloader">
            <div class="spinner-grow text-primary" role="status">
                <div class="sr-only">Loading...</div>
            </div>
        </div>
        <!-- Header Area-->
        <div class="header-area" id="headerArea">
            <div class="container">
                <!-- Paste your Header Content from here-->
                <!-- Header Content-->
                <div class="header-content header-style-two  position-relative d-flex align-items-center justify-content-between">
                    <!-- Back Button-->
                    <div class="back-button">
                        <a href="javascript:history.go(-1)">
                            <svg width="32" height="32" viewbox="0 0 16 16" class="bi bi-arrow-left-short" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z"></path>
                            </svg>
                        </a>
                    </div>
                    <!-- Page Title-->
                    <div class="page-heading">
                        <h6 class="mb-0"><?php echo $_title; ?></h6>
                    </div>
                    <!-- Navbar Toggler-->
                    <div class="navbar--toggler affanNavbarToggler">
                        <div class="span-wrap"><span class="d-block"></span><span class="d-block"></span><span class="d-block"></span></div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Sidenav Black Overlay-->
        <div class="sidenav-black-overlay"></div>

        <!-- Side Nav Wrapper-->
        <div class="sidenav-wrapper" id="sidenavWrapper">
            <!-- Go Back Button-->
            <div class="go-back-btn" id="goBack">
                <svg class="bi bi-x" width="24" height="24" viewbox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"></path>
                <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"></path>
                </svg>
            </div>
            <!-- Sidenav Profile-->
            <div class="sidenav-profile">
                <div class="sidenav-style1"></div>
                <!-- User Thumbnail-->
                <div class="user-profile"><img src="//q1.qlogo.cn/g?b=qq&nk=<?php echo $_user['qq']; ?>&s=100&t=" alt=""></div>
                <!-- User Info-->
                <div class="user-info">
                    <h6 class="user-name mb-0"><?php echo $_user['username']; ?></h6><span><?php echo $_user['mobile']; ?></span>
                </div>
            </div>
            <!-- Sidenav Nav-->
            <ul class="sidenav-nav ps-0">
                <li>
                    <a href="<?php echo url('index/index'); ?>">
                        <i class="bx bx-home-alt fs-4 me-3"></i>主页
                    </a>
                </li>

                <li> 
                    <a href="<?php echo url('user/loginlog'); ?>">
                        <i class="bx bx-shield fs-4 me-3"></i>登录日志
                    </a>
                </li>

                <li> 
                    <a href="<?php echo url('user/moneylog'); ?>">
                        <i class="bx bx-dollar-circle fs-4 me-3"></i>流水日志
                    </a>
                </li>

                <li> 
                    <a href="<?php echo url('user/password'); ?>">
                        <i class="bx bx-edit-alt fs-4 me-3"></i>修改密码
                    </a>
                </li>

                <li> 
                    <a href="https://qm.qq.com/cgi-bin/qm/qr?k=AqfNxCDD_KMonvTB8zZaa6gLhQOKxvi6&noverify=0&personal_qrcode_source=3"></i>平台客服
                    </a>
                </li>

                <li> 
                    <a href="/logout">
                        <i class="bx bx-log-out fs-4 me-3"></i>退出登录
                    </a>
                </li>
            </ul>
            <!-- Social Info-->
            <div class="social-info-wrap">
                <a href="#"><i class="bx bx-bulb"></i></a>
                <a href="#"><i class="bx bx-bookmark-minus"></i></a>
                <a href="#"><i class="bx bx-heart"></i></a>
            </div>
            <!-- Copyright Info-->
            <div class="copyright-info">
                <p>&copy; <?php echo sysconf('site_info_copyright'); ?></p>
            </div>
        </div>

        <div class="page-content-wrapper py-3">
            
<div class="complaint_toast">
    <a href='<?php echo url("merchant/complaint/index"); ?>'>
        <div class="toast toast-autohide toast-auto custom-toast-1" style="position: fixed;bottom: 100px;right: 15px;z-index: 1000;max-width: 18.5rem;" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="5000" data-bs-autohide="true">
            <div class="toast-body">
                <svg width="30" height="30" viewbox="0 0 16 16" class="bi bi-bookmark-check text-primary" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"></path>
                    <path fill-rule="evenodd" d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"></path>
                </svg>
                <div class="toast-text ms-3 me-2">
                    <p class="mb-1">您有投诉订单待回复，请及时查看！</p>
                </div>
            </div>
        </div>
    </a>
</div>

<div id="home_header" class="card bg-header-primary  shadow-sm page-card wow fadeInUp" data-wow-duration="1s">
    <div class="card-body px-3 py-4">

        <div class="d-flex justify-content-between" >
            <div class="d-flex align-items-center">
                <img class="header-avatar" alt="" src="//q1.qlogo.cn/g?b=qq&nk=<?php echo $_user['qq']; ?>&s=100&t=">
                    <span class="header-username text-white"><?php echo $_user['username']; ?></span>
            </div>

            <div class="d-flex header-info-wrap">
                <a href="/"><i class="bx bx-home-alt"></i></a>
                <a href="<?php echo url('message/index'); ?>" class="message_box"><i class="bx bx-bell"></i>
                    <?php if($_messages_count!=0): ?>
                    <span class="message_count badge bg-danger rounded-pill"><?php echo $_messages_count; ?></span>
                    <?php endif; ?>
                </a>
                <a href="javascript:void(0);"  class='affanNavbarToggler'><i class="bx bx-cog"></i></a>
            </div>
        </div>

        <div class="d-flex justify-content-between mt-4">
            <div class="">
                <p class="text-white fs-7 mb-1">账号余额（元）</p>
                <h3 class="text-white"><?php echo sprintf("%.2f",$_user['money'] + 0); ?></h3>
            </div>
            <div class="d-block">
                <a class="btn m-1 btn-round btn-white border-0 px-4 py-1 mt-2" href="<?php echo url('cash/apply'); ?>">提现</a>
            </div>
        </div>
        <div class=" row mt-2">

            <div class="col-3">
                <div class="text-center header-data">
                    <h6 class="mb-1 text-white"><?php echo $today['count'] + 0; ?></h6>
                    <p class="mb-0 text-white">今日订单</p>
                </div>
            </div>

            <div class="col-3">
                <div class="text-center header-data">
                    <h6 class="mb-1 text-white"><?php echo sprintf("%.2f",$today['profit']); ?></h6>
                    <p class="mb-0 text-white">今日利润</p>
                </div>
            </div>

            <div class="col-3">
                <div class="text-center header-data">
                    <h6 class="mb-1 text-white"><?php echo $ip_analysis['today_pv']; ?></h6>
                    <p  class="mb-0  text-white">今日流量</p>
                </div>
            </div>

            <div class="col-3">
                <div class="text-center header-data">
                    <h6 class="mb-1 text-white"><?php echo sprintf("%.2f",$_user['freeze_money']); ?></h6>
                    <p class="mb-0 text-white ">待结算</p>
                </div>
            </div>
        </div>
    </div>
</div>
  <div class="ico_clic wow fadeInUp">
            <i></i> 
            <span class="fw-bold">广告区</span>
        </div>
<div class="home-box-wrap py-3">
    <div class="container">
        <a target="_blank" class="btn btn-info" href="https://qm.qq.com/q/8sDFgox5rW"></i> 联系QQ客服</a >
<a target="_blank" class="btn btn-warning" href="http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=XqNZCKQtM77vd29o3kahgIIryy7Bwwm4&authKey=EeZkR3WoAJ2aiAMm19SEN68PjSR7aGTKa0wV4dMFoq5I6%2F%2F40OlX5dntAZooZGbZ&noverify=0&group_code=514295224"><i class="fa fa-users"></i> 官方Q群</a >
        <div class="ico_clic wow fadeInUp">
            <marquee direction=right>欢迎使用</marquee>
</br>
<br/>
小凡企业发卡源码
<br/>
<a href="这里写网站"</i>这里写名称</a>
<a href="这里写网站"</i>这里写名称</a>
<marquee   behavior="alternate"><marquee width="150" direction=right>本平台承诺 不圈钱 不吞钱 不跑路</marquee></marquee>
</br>
<p style="text-align:center">小凡工作室</p>
            <i></i> 
            
            
            
            
            <span class="fw-bold">商品管理</span>
        </div>

        <div class="row mt-2 gy-3">
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('goods_category/index'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-grid-alt"></i>
                            </div>
                            <h6 class="mt-2">商品分类</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('goods/index'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-archive "></i>
                            </div>
                            <h6 class="mt-2">商品列表</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('goods/add'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-duplicate "></i>
                            </div>
                            <h6 class="mt-2">添加商品</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('goods_card/add'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-customize "></i>
                            </div>
                            <h6 class="mt-2">添加库存</h6>
                        </div>
                    </a>
                </div>
            </div>


            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('goods_card/index'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-hive"></i>
                            </div>
                            <h6 class="mt-2">库存列表</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('goods_card/trash'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-trash"></i>
                            </div>
                            <h6 class="mt-2">卡密回收站</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('goods_coupon/index'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-purchase-tag-alt "></i>
                            </div>
                            <h6 class="mt-2">优惠券管理</h6>
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>


<div class="home-box-wrap py-3">
    <div class="container">

        <div class="ico_clic wow fadeInUp">
            <i></i> 
            <span class="fw-bold">交易管理</span>
        </div>

        <div class="row mt-2 gy-3">

            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('order/index'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-receipt"></i>
                            </div>
                            <h6 class="mt-2">我的订单</h6>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('charts/money'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-bar-chart-square"></i>
                            </div>
                            <h6 class="mt-2">交易统计</h6>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('cash/index'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-dollar-circle"></i>
                            </div>
                            <h6 class="mt-2">结算管理</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('complaint/index'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-conversation "></i>
                            </div>
                            <h6 class="mt-2">投诉管理</h6>
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>



<div class="home-box-wrap py-3">
    <div class="container">

        <div class="ico_clic wow fadeInUp">
            <i></i> 
            <span class="fw-bold">店铺管理</span>
        </div>

        <div class="row mt-2 gy-3">
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('user/link'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-link-alt"></i>
                            </div>
                            <h6 class="mt-2">店铺链接</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('user/settings'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-box  "></i>
                            </div>
                            <h6 class="mt-2">店铺设置</h6>
                        </div>
                    </a>
                </div>
            </div>


            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('user/collect'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-wallet-alt"></i>
                            </div>
                            <h6 class="mt-2">结算设置</h6>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('spread/index'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-share-alt"></i>
                            </div>
                            <h6 class="mt-2">推广返利</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('invite_code/index'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-user-plus"></i>
                            </div>
                            <h6 class="mt-2">邀请码</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('agent/setting'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-group"></i>
                            </div>
                            <h6 class="mt-2">供货和代理</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('cross/index'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-globe"></i>
                            </div>
                            <h6 class="mt-2">跨平台对接</h6>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url('user/wechat'); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="bx bx-message-alt-dots"></i>
                            </div>
                            <h6 class="mt-2">微信通知</h6>
                        </div>
                    </a>
                </div>
            </div>

            <?php foreach(include_once APP_PATH . DS . "common" . DS . "menu" . DS . "plugin_mobile" . EXT as $v): ?>
            <div class="col-3">
                <div class="box-item text-center wow fadeInUp" data-wow-duration="1s">
                    <a href="<?php echo url($v['url']); ?>">
                        <div class="d-flex align-items-center flex-column">
                            <div class="icon">
                                <i class="<?php echo $v['icon']; ?>"></i>
                            </div>
                            <h6 class="mt-2"><?php echo $v['title']; ?></h6>
                        </div>
                    </a>
                </div>
            </div>
            <?php endforeach; ?>

        </div>
    </div>
</div>

<div class="affan-notice-wrap py-3">
    <div class="container">
        <div class="card shadow-sm  wow fadeInUp " data-wow-duration="1s">
            <div class="card-body">
                <h5>系统公告</h5>
                <div class="testimonial-slide owl-carousel testimonial-style3">

                    <?php foreach($articles as $v): ?>
                    <div class="single-testimonial-slide">
                        <div class="text-content">
                            <span class="d-inline-block badge bg-danger mb-2 show-time"><?php echo date("m/d",$v['create_at']); ?></span>
                            <p class="mb-2"><?php echo $v['title']; ?> </p>
                            <span class="d-block show-more">
                                <a href="<?php echo url('merchant/index/notice',['article_id'=>$v['id']]); ?>" >查看详情<i class="bx bx-right-arrow-alt align-middle"></i></a>
                            </span>
                        </div>
                    </div>
                    <?php endforeach; ?>

                </div>
            </div>
        </div>
    </div>
</div>

        </div>
        <!-- Footer Nav-->
        <div class="footer-nav-area" id="footerNav">
            <div class="container px-0">
                <!-- Paste your Footer Content from here-->
                <!-- Footer Content-->
                <div class="footer-nav position-relative shadow-sm footer-style-two">
                    <ul class="h-100 d-flex align-items-center justify-content-between ps-0">
                        <li>
                            <a href="<?php echo url('order/index'); ?>">
                                <i class='bx bx-detail fs-2'></i>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo url('goods/index'); ?>">
                                <i class='bx bx-archive fs-2'></i>
                            </a>
                        </li>
                        <li class="active">
                            <a href="<?php echo url('index/index'); ?>">
                                <svg width="22" height="22" viewBox="0 0 16 16" class="bi bi-house" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"></path>
                                <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"></path>
                                </svg>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo url('complaint/index'); ?>">
                                <i class='bx bx-conversation fs-2'></i>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo url('cash/index'); ?>">
                                <i class='bx bx-wallet fs-2'></i>
                            </a>
                        </li>
                    </ul>
                    <!-- # Footer Two Layout End-->
                </div>
            </div>
        </div>
        <!-- All JavaScript Files-->
        <script src="/static/merchant/mobile_default/js/bootstrap.bundle.min.js"></script>
        <script src="/static/merchant/mobile_default/js/jquery.min.js"></script>
        <script src="/static/merchant/mobile_default/js/waypoints.min.js"></script>
        <script src="/static/merchant/mobile_default/js/jquery.easing.min.js"></script>
        <script src="/static/merchant/mobile_default/js/wow.min.js"></script>
        <script src="/static/merchant/mobile_default/js/owl.carousel.min.js"></script>
        <script src="/static/merchant/mobile_default/js/jquery.counterup.min.js"></script>
        <script src="/static/merchant/mobile_default/js/jquery.countdown.min.js"></script>
        <script src="/static/merchant/mobile_default/js/imagesloaded.pkgd.min.js"></script>
        <script src="/static/merchant/mobile_default/js/isotope.pkgd.min.js"></script>
        <script src="/static/merchant/mobile_default/js/jquery.magnific-popup.min.js"></script>
        <script src="/static/merchant/mobile_default/js/dark-mode-switch.js"></script>
        <script src="/static/merchant/mobile_default/js/ion.rangeSlider.min.js"></script>
        <script src="/static/merchant/mobile_default/js/jquery.dataTables.min.js"></script>
        <script src="/static/merchant/default/libs/layer/layer.js"></script>
        <script src="/static/merchant/default/libs/jquery-confirm/js/jquery-confirm.js"></script>
        <script src="/static/merchant/mobile_default/js/active.js?t=20210504"></script>
        <script src="/static/merchant/mobile_default/js/clipboard.js"></script>
        <!-- PWA-->
        <script>
            var menuflag = false;
            $(".footer-nav ul a").each(function () {
                if (window.location.href == this.href)
                {
                    menuflag = true;
                }
            });
            var menuflag = false;
            $(".footer-nav ul a").each(function () {
                if (menuflag)
                {
                    var e = window.location.href;
                } else {
                    var e = window.location.href.split(/[?#]/)[0];
                }
                this.href == e && ($(this).parent().addClass("on"));
            });
        </script>

        <?php if(!(empty($common_announce) || (($common_announce instanceof \think\Collection || $common_announce instanceof \think\Paginator ) && $common_announce->isEmpty()))): ?>
        <script>
            $(document).ready(function () {
                location.href = "<?php echo url('merchant/index/notice',['article_id'=>$common_announce['id']]); ?>";
            });
        </script>
        <?php endif; ?>
        
        
    </body>
</html>