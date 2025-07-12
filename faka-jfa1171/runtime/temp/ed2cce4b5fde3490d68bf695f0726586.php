<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:84:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3//index/faq.html";i:1575165824;s:88:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3/default_header.html";i:1575947310;s:88:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3/default_footer.html";i:1575165824;}*/ ?>
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
    <link rel="stylesheet" href="/static/app/default/vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="/static/app/default/vendors/themify-icon/themify-icons.css">
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
    <section class="shop_banner">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 hero_text">
                    <h2 class="hero_title">常见问题</h2>
                    <p> 常见问题解答，一次扫清所有疑问 / FAQ. </p>
                </div>
            </div>
        </div>
    </section>
    <section class="blog_area">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="blog-section-left">
                        <?php foreach($articles as $v): ?>
                        <article class="blog-items">
                            <div class="blog-content">
                              <h2><?php echo $v['title']; ?></h2>
                                <p><?php echo htmlspecialchars_decode($v['content']); ?></p>

                            </div>
                        </article>
                        <?php endforeach; ?>

                    </div>
                </div>
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


    <script src="/static/app/default/js/jquery-2.2.1.min.js"></script>

    <script src="/static/plugs/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/app/default/vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="/static/app/default/js/wow.js"></script>
    <script type="text/javascript" src="/static/app/default/js/custom.js"></script>
  </body>
</html>