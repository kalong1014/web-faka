<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:86:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3//index/index.html";i:1575947310;s:88:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3/default_header.html";i:1575947310;s:88:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3/default_footer.html";i:1575165824;}*/ ?>
<!DOCTYPE html>
<html lang="cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo sysconf('site_name'); ?><?php echo sysconf('site_subtitle'); ?></title>
    <meta name="keywords" content="<?php echo sysconf('site_keywords'); ?>" />
    <meta name="description" content="<?php echo sysconf('site_desc'); ?>" />
    <link rel="shortcut icon" href="<?php echo sysconf('browser_icon'); ?>" />
    <!-- Bootstrap -->
    <link href="/static/app/default/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/app/default/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/app/default/vendors/themify-icon/themify-icons.css">
    <link rel="stylesheet" href="/static/app/default/vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="/static/app/default/vendors/owl-carousel/animate.css">
    <link rel="stylesheet" href="/static/app/default/vendors/linearicon/style.css">
    <!--custom css-->
    <link rel="stylesheet" href="/static/app/default/css/style.css">
    <link rel="stylesheet" href="/static/app/default/css/responsive.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body data-spy="scroll" data-target="#bs-example-navbar-collapse-1" data-offset="100">
  <style>
@media (max-width: 780px){
	.col-lg-3{
		float:left;
	}
	.main_menu_area_one.affix .menu_logo{    line-height: 61px;}
	.main_menu_area_one .menu_logo img{max-width: 115px;}
}
</style>
<header class="main_menu_area_one header" data-spy="affix" data-offset-top="100">
    <div class="col-md-3 col-lg-3">
        <div class="menu_logo">
            <a href="/"><img src="<?php echo sysconf('site_logo'); ?>" alt="logo"></a>
        </div>
    </div>
    <div class="col-md-7 col-lg-6">
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><img src="<?php echo sysconf('site_logo'); ?>" alt="logo" style="width:12rem;margin:0 auto"></a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav menu">

                    <?php if(is_array($nav) || $nav instanceof \think\Collection || $nav instanceof \think\Paginator): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <li class="dropdown submenu">
                        <a  class="dropdown-toggle" href="<?php echo $vo['url']; ?>" <?php if($vo['target'] == '1'): ?>target="_blank"<?php endif; ?>><?php echo $vo['title']; ?></a>
                    </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </nav>
    </div>
    <div class="col-md-2 col-lg-3">
        <div class="right-icon">
            <ul class="nav navbar-nav navbar-right">
                <?php if(session('?merchant.user')): ?>

                <li class="nav-item dropdown submenu mobile-shop logon-btn">
                    <a class="dropdown-toggle" href="/merchant/index"> <span class="btn thm-btn green_btn">商户中心</span></a>
                </li>
                <li  class="search_btnreg-btn"><a href="/logout"> <span>退出</span></a></li>
                <?php else: ?>
                <li class="nav-item dropdown submenu mobile-shop logon-btn">
                    <a class="dropdown-toggle" href="/login"> <span class="btn thm-btn green_btn">登录</span></a>
                </li>
                <li class="search_btn reg-btn"><a class="dropdown-toggle" href="/register"> <span>注册</span></a></li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
</header>
    <section class="social_banner ripples banner_pad" id="home">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-12  hero_text">
                    <h2 class="hero_title wow fadeInRight" data-wow-delay="350ms">全新的售卡体验</h2>
					  <h2 class="hero_title wow fadeInRight" data-wow-delay="550ms">New Experience</h2>
                    <p>致力于解决虚拟商品的快捷寄售服务，为商户及其买家提供便捷、绿色、安全、快速的销售和购买体验</p>
                    <a href="/merchant/index" class="btn pro_btn social-btn">立即入驻</a>
                </div>
            </div>
        </div>
    </section>
    <section class="clients_logo_area">
        <div class="container">
            <div class="clients_logo_s owl-carousel">
                <div class="item">
                    <img src="/static/app/t3blue/image/icon/p-logo-1.png" alt="c_logo">
                </div>
                <div class="item">
                    <img src="/static/app/t3blue/image/icon/p-logo-2.png" alt="c_logo">
                </div>
                <div class="item">
                    <img src="/static/app/t3blue/image/icon/p-logo-3.png" alt="c_logo">
                </div>
                <div class="item">
                    <img src="/static/app/t3blue/image/icon/p-logo-4.png" alt="c_logo">
                </div>
                <div class="item">
                    <img src="/static/app/t3blue/image/icon/p-logo-5.png" alt="c_logo">
                </div>
                <div class="item">
                    <img src="/static/app/t3blue/image/icon/p-logo-6.png" alt="c_logo">
                </div>
            </div>
        </div>
    </section>
    
    <section class="easy_steps" id="service">
        <div class="container">
            <div class="section-title wow fadeInUp" data-wow-delay="350ms">
                <h2 class="title">核心优势&技术实力</h2>
                <p>数十万用户的信赖之选，提供便捷、绿色、安全、快速的销售和购买体验</p>
            </div>
            <div class="row">
                <div class="easy_slider owl-carousel">
                    <div class="item wow fadeInLeft" data-wow-delay="350ms">
                        <div class="service_item">
                            <img src="/static/app/t3blue/image/software/steps1.jpg" alt="steps">
                            <h2>极速响应</h2>
                            <p>全天候10秒响应服务</p>
                            <a href="/merchant/index">立即入驻<i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                    <div class="item wow fadeInLeft" data-wow-delay="450ms">
                        <div class="service_item">
                            <img src="/static/app/t3blue/image/software/steps2.jpg" alt="steps">
                            <h2>资金保障</h2>
                            <p>次日即可结算，资金安全充分保障</p>
                            <a href="/merchant/index">立即入驻<i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                    <div class="item wow fadeInLeft" data-wow-delay="550ms">
                        <div class="service_item">
                            <img src="/static/app/t3blue/image/software/steps3.jpg" alt="steps">
                            <h2>服务全球</h2>
                            <p>	业务范围覆盖全国用户遥遥领先</p>
                            <a href="/merchant/index">立即入驻<i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="service_two_area first_f social_f bg-color">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-4 wow fadeInLeft" data-wow-delay="250ms">
                    <img class="service_img" src="/static/app/t3blue/image/software/social-seo.png" alt="seo">
                </div>
                <div class="col-md-6 col-sm-8 wow fadeInRight" data-wow-delay="350ms">
                    <div class="features-content">
                        <h2 class="title">终身陪伴</h2>
                        <p>服务器集群部署，多重安全保证，是您创业路上的好帮手！ 系统持续更新，功能持续完善，让商户以及客户的体验不断接近完美是我们一直不变的追求</p>
                        <ul>
                            <li>
                                <i class="fa fa-check" aria-hidden="true"></i>标准的代码写法，系统安全。
                            </li>
                            <li>
                                <i class="fa fa-check" aria-hidden="true"></i>极速售后响应，无后顾之忧
                            </li>
                            <li>
                                <i class="fa fa-check" aria-hidden="true"></i>不断的迭代更新，功能更全
                            </li>
                        </ul>
                        <a href="/merchant/index" class="btn pro_btn green_btn">商户中心</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="seo-features-bg social-analyzing sec-pad" id="feature">
        <div class="container">
            <div class="row wow fadeInUp" data-wow-delay="250ms">
                <div class="col-sm-6">
                    <div class="features-content">
                        <h2 class="title">服务器安全</h2>
                        <p> 采用群集服务器，防御高，故障率低，无论用户身在何处，均能获得流畅安全可靠的体验，全天候10秒响应服务 打造强悍性能防御 技术服务支撑极速响应.</p>
                        <a href="/merchant/index" class="btn pro_btn social-btn">商户中心</a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <img class="img-responsive" src="/static/app/t3blue/image/features/analyzing-img.png" alt="power">
                </div>
            </div>
        </div>
    </section>
    <section class="faq_area sec-pad" id="faq">
        <div class="container">
            <div class="section-title wow fadeInUp" data-wow-delay="250ms">
                <h2 class="title">常见问题</h2>
                <p>常见问题整理，一次扫清使用前障碍</p>
            </div>
            <div class="row">
                <div class="col-md-6 faq_img pull-right">
                    <img src="/static/app/t3blue/image/features/faq.png" alt="faq">
                </div>
                <div class="col-md-6 pull-left">
                    <div class="panel-group faq-inner-accordion" id="accordion" role="tablist">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="btn-accordion" aria-expanded="true" role="button">
                                       平台可以卖些什么？<i class="lnr lnr-chevron-up"></i><i class="lnr lnr-chevron-down"></i>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse in" aria-expanded="true" role="tabpanel">
                                <div class="panel-body">虚拟商品(例如软件注册码，论坛帐号等等)，不可以卖实物（例如衣服，水果等等）。</div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="btn-accordion collapsed" aria-expanded="false">
                                      平台安全吗？<i class="lnr lnr-chevron-up"></i><i class="lnr lnr-chevron-down"></i>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse" aria-expanded="false" role="tabpanel">
                                <div class="panel-body">非常安全，平台运用先进的安全技术保护用户在平台账户中存储的个人信息、账户信息以及交易记录的安全。平台拥有完善的全监测系统，可以及时发现网站的非正常访问并做相应的安全响应。</div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse3" class="btn-accordion collapsed" aria-expanded="false">
                                       怎么用平台销售虚拟商品？<i class="lnr lnr-chevron-up"></i><i class="lnr lnr-chevron-down"></i>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse" aria-expanded="false" role="tabpanel">
                                <div class="panel-body"> 商户通过后台可以添加商品，每个商品平台都会分配一个购买链接，商户只要将这个链接发送给买家，买家付款后平台自动发货，即可完成交易。</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="sec-border">
            
        </div>
    </section>
    <section class="subcribe_area bg-transition sec-pad">
        <div class="container">
            <img class="img-responsive" src="/static/app/t3blue/image/features/subcribe-img.png" alt="sub">
            <div class="section-title title-w">
                <h2 class="title">卡密销售一站式服务平台</h2>
                <p>为您提供一站式虚拟商品在线购买以及全自动发货服务!采用群集式服务器，防御高，故障率低，无论用户身在何处，均能获得100%流畅安全可靠的体验。</p>
            </div>
            
        </div>
    </section>
 

<footer class="row footer-area">

    <div class="row m0 footer_bottom">
        <div class="container">
            <div class="row" style="padding: 0 20px;">
                <div class="col-sm-12 text-center">
                    <?php echo htmlspecialchars_decode(sysconf('site_info_copyright')); ?>
                    <a href="javascript:void(0)" onclick="window.open('http://www.miitbeian.gov.cn/');" >
                        <?php echo htmlspecialchars_decode(sysconf('site_info_icp')); ?></a> <?php echo htmlspecialchars_decode(sysconf('site_statistics')); ?>
                </div>
            </div>
        </div>
    </div>
</footer>

   
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="/static/app/default/js/jquery-2.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="/static/plugs/bootstrap/js/bootstrap.min.js"></script>
    <!-- counter js-->
    <script type="text/javascript" src="/static/app/default/vendors/waypoint/waypoints.min.js"></script>
    <script type="text/javascript" src="/static/app/default/vendors/couterup/jquery.counterup.min.js"></script>
    <script type="text/javascript" src="/static/app/default/vendors/circle-progress/circle-progress.js"></script>
    <script type="text/javascript" src="/static/app/default/vendors/owl-carousel/owl.carousel.min.js"></script>
    <script type="text/javascript" src="/static/app/default/js/ripples.js"></script>
 
    <script src="/static/app/default/js/wow.js"></script>
    <script type="text/javascript" src="/static/app/default/js/custom.js"></script>
  </body>
</html>