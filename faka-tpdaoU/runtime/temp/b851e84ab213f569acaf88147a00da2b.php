<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:60:"/www/wwwroot/103.147.12.248/content/shuiping/page/index.html";i:1739017968;s:69:"/www/wwwroot/103.147.12.248/content/shuiping/page/layout/default.html";i:1721749654;}*/ ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title><?php echo $is_main ? $options['title'] : $merchant['title']; ?></title>
    <meta name="keywords" content="<?php echo $options['keywords']; ?>">
    <meta name="description" content="<?php echo $options['description']; ?>">
    
    
    <!-- ~~~~~~~~~~~~~ Favicon icon ~~~~~~~~~~~~~ -->
    <link rel="shortcut icon" href="<?php echo (isset($options['icon']) && ($options['icon'] !== '')?$options['icon']:''); ?>" type="image/png">
    <!-- ~~~~~~~~~~~~~~~~~ Google Fonts ~~~~~~~~~~~~~~~~~ -->
    <link rel="stylesheet" href="/template/default/fonts/Inter/inter-fontfaces.css">

    <link href="/assets/css/frontend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo htmlentities(\think\Config::get('site.version')); ?>" rel="stylesheet">

    <link rel="stylesheet" href="/assets/libs/swiper/swiper-bundle.min.css" />

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <script src="/assets/js/html5shiv.js"></script>
    <script src="/assets/js/respond.min.js"></script>
    <![endif]-->




    <link rel="stylesheet" href="/template/default/css/main.min.css">

    <style>
        @media (min-width: 1200px){
            .container {
                width: 1300px;
            }
        }
        .mobile-hidden{
            display: block;
        }
        .pc-hidden{
            display: none;
        }
        @media (max-width: 1199.98px){
            .mobile-hidden{
                display: none;
            }
            .pc-hidden{
                display: block;
            }
            .goods-page-cover{
                margin-bottom: 20px;
            }
            .mobile-padding{
                padding-left: 15px!important;
                padding-right: 15px!important;
            }
        }


        .shadow{
            border-radius: 3px!important;
            -webkit-box-shadow: 0 1px 1px rgba(32,35,51,.04), 0 2px 4px rgba(32,35,51,.02);
            box-shadow: 0 1px 1px rgba(32,35,51,.04), 0 2px 4px rgba(32,35,51,.02);
            border: 1px solid #f4f4f4;
        }
        .col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12{
            padding-left: 7.5px;
            padding-right: 7.5px;
        }

        .goods-tag{
            border: 1px solid #18bc9c;
            font-size: 12px;
            margin-bottom: 10px;
            display: inline-block;
            margin-top: 1px;
            padding: 1px 7px;
            border-radius: 3px;
            color: #18bc9c;
            margin-right: 5px;
        }
        .goods-tag.text-info{
            color: #4397fd;
            border: 1px solid #4397fd;
        }
        .goods-tag.text-danger{
            color: #ed3c2b;
            border: 1px solid #ed3c2b;
        }
        .goods-tag.text-warning{
            color: #e08d09;
            border: 1px solid #e08d09;
        }
    </style>

</head>

<body>


<nav class="navbar navbar-white navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#header-navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<?php echo url('/'); ?>" style="padding: 17px 15px; height: 60px;"><img style="height: 100%;" src="<?php echo $options['logo']; ?>" alt="<?php echo $options['name']; ?>"></a>
        </div>
        <div class="collapse navbar-collapse" id="header-navbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<?php echo url('/'); ?>"><?php echo __('Home'); ?></a></li>
                <li><a href="<?php echo url('/find_order'); ?>">查找订单</a></li>
                <li class="dropdown">
                    <?php if($user): ?>
                    <a href="<?php echo url('/user'); ?>" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="avatar-img"><img src="<?php echo cdnurl(htmlentities($user['avatar'])); ?>" alt=""></span>
                        <span class="visible-xs-inline-block" style="padding:5px;"><?php echo $user['nickname']; ?> <b class="caret"></b></span>
                    </a>
                    <?php else: ?>
                    <a href="<?php echo url('/user'); ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo __('Member center'); ?> <b class="caret"></b></a>
                    <?php endif; ?>
                    <ul class="dropdown-menu">
                        <?php if($user): ?>
                        <li><a href="<?php echo url('/user'); ?>"><i class="fa fa-user-circle fa-fw"></i><?php echo __('User center'); ?></a></li>
                        <li><a href="<?php echo url('/profile'); ?>"><i class="fa fa-user-o fa-fw"></i><?php echo __('Profile'); ?></a></li>
                        <li><a href="<?php echo url('/changepwd'); ?>"><i class="fa fa-key fa-fw"></i><?php echo __('Change password'); ?></a></li>
                        <li><a href="<?php echo url('/logout'); ?>"><i class="fa fa-sign-out fa-fw"></i><?php echo __('Sign out'); ?></a></li>
                        <?php else: ?>
                        <li><a href="<?php echo url('/login'); ?>"><i class="fa fa-sign-in fa-fw"></i> <?php echo __('Sign in'); ?></a></li>
                        <li><a href="<?php echo url('/register'); ?>"><i class="fa fa-user-o fa-fw"></i> <?php echo __('Sign up'); ?></a></li>
                        <?php endif; ?>

                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="content container">
    
<?php echo doAction('indexHead'); ?>

<style>
    .content.container{
        min-height: calc(100% - 60.4px);
    }
    .category-btn{
        font-size: 13px;
        line-height: 13px;
        border: 1.5px solid rgb(167 167 167 / 20%);
        -webkit-box-shadow: none;
        box-shadow: none;
        font-weight: 500;
        color: #010101;
        padding: 10px 26px;
        border-radius: 1px;
        margin-right: 10px;
        margin-bottom: 15px;
        border-radius: 3px;
        -webkit-box-shadow: 0 1px 1px rgba(32,35,51,.04), 0 2px 4px rgba(32,35,51,.02)!important;
        box-shadow: 4px 4px 1px -1px rgba(32,35,51,.04), 0 2px 4px rgba(32,35,51,.02)!important;
        display: inline-block;
        background: #fff;
        user-select: none;
    }
    .category-btn.active{
        border: 2px solid #4aadff;
        padding: 9px 25px!important;
        color: #fff;
        background: #4aadff;
    }
    .category-btn:hover{
        border: 2px solid #4aadff!important;
        padding: 9px 25px!important;
    }

    .col-lg-2dot4 {
        position: relative;
        min-height: 1px;
        padding-right: 15px;
        padding-left: 15px;
    }
    @media (min-width: 1200px) {
        .col-lg-2dot4 {
            float: left;
        }
        .col-lg-2dot4 {
            width: 20%;
        }
        .col-lg-pull-2dot4 {
            right: 20%;
        }
        .col-lg-push-2dot4 {
            left: 20%;
        }
        .col-lg-offset-2dot4 {
            margin-left: 20%;
        }
    }

    .panel-default > .panel-heading{
        padding: 7px 0;
    }



     .tb-recommend-content-item {
         position: relative;
         float: left;
         width: 100%;
         margin: 0 0 12px 0px;
         overflow: hidden;
         color: #333;
         border-bottom: 1px solid #f1f1f1;
         padding-bottom: 10px;
         cursor: pointer;
         -webkit-transition: all 0.5s;
         -o-transition: all 0.5s;
         -moz-transition: all 0.5s;
         transition: all 0.5s;
     }
    .tb-recommend.col3 .tb-recommend-content-item, .tb-recommend.col3 .skeleton-i {
        width: 372px;
        margin-left: 18px;
    }
    .tb-recommend-content-item .item-link {
        display: inline-block;
        width: 100%;
        height: 100%;
    }
    .tb-recommend-content-item .img-wrapper {
        position: absolute;
        width: 75px;
        height: 75px;
        overflow: hidden;
        background-color: rgba(27, 23, 67, 0.03);
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
    }


    .img-wrapper img {
        background: #fff;
        opacity: .9;
        filter: alpha(opacity=90);
        -webkit-transition: all .2s;
        -moz-transition: all .2s;
        -o-transition: all .2s;
        transition: all .2s;
    }
    .tb-recommend-content-item .img-wrapper img {
        display: block;
        width: 100%;
        height: 100%;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
    }
    .tb-recommend-content-item .info-wrapper {
        margin-left: 92px;
        overflow: hidden;
    }
    .tb-recommend-content-item .info-wrapper .title {
        display: inline-block;
        max-height: 46px;
        margin: 2px 0 2px 0;
        overflow: hidden;
        color: #333;
        font-size: 14px;
        line-height: 23px;
    }
    .tb-recommend-content-item .info-wrapper .title img {
        height: 16px;
        margin-top: 3px;
        margin-right: 6px;
        vertical-align: top;
    }
    .tb-recommend-content-item .info-wrapper .tag-list {
        height: 20px;
        overflow: hidden;
    }
    .tb-recommend-content-item .info-wrapper .tag-list .tag-item {
        display: inline-block;
        height: 20px;
        margin-right: 6px;
        padding: 0 4px;
        color: #ff5000;
        font-size: 12px;
        line-height: 18px;
        vertical-align: top;
        border: 1px solid #ff5000;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }

    .price-value {
        display: inline-block;
        font-size: 16px;
        color: #dc3545;
    }
    .price-value em {
        margin-right: 4px;
        font-size: 13px;
        font-family: "Microsoft Yahei";
        vertical-align: middle;
        font-style: normal;
    }
    .hot-goods .tb-recommend-content-item:last-child{
        margin-bottom: 0!important;
        border: unset;
        padding-bottom: 0;
    }
    .table-goods{
        background: #fdfdfd;
        margin-bottom: 15px;
        padding: 10px;
        border-color: #fff;
        padding-bottom: 5px;
    }
    .table-goods:hover{
        background: #f4f4f4;
    }

    .swiper {
        width: 100%;
        height: 100%;
    }

    .swiper-slide {
        text-align: center;
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }

    .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    z

    .swiper-horizontal>.swiper-scrollbar, .swiper-scrollbar.swiper-scrollbar-horizontal{
        bottom: 0;
        width: 30px;
        left: 50%;
        margin-left: -15px;
    }
    .category-section {
        margin-bottom: 18px;
    }
    .category-container {
        display: flex;
        flex-wrap: wrap;
        margin: -5px;
    }
    .category-item {
        width: 33.3333%;
        padding: 5px;
        box-sizing: border-box;
    }
    .category-item a {
        display: block;
        background: #fff;
        border: 1px solid #eee;
        text-align: center;
        padding: 10px;
        border-radius: 4px;
        text-decoration: none;
        color: #333;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .category-item a.active {
        background: #428bca;
        color: #fff;
        border-color: #357ebd;
    }
    .show-more-btn {
        display: inline-block;
        margin-top: 10px;
        cursor: pointer;
        color: #428bca;
        text-decoration: underline;
    }
.show-more-btn-container {
    text-align: center;
    margin-top: 10px;
}

.show-more-btn {
    display: inline-block;
    padding: 8px 20px;
    font-size: 14px;
    color: #fff;
    background-color: #428bca;
    border: 1px solid #357ebd;
    border-radius: 4px;
    cursor: pointer;
    text-decoration: none;
    transition: all 0.3s ease;
}

.show-more-btn:hover {
    background-color: #357ebd;
    border-color: #2c6dab;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.show-more-btn:active {
    background-color: #2c6dab;
    box-shadow: inset 0px 2px 4px rgba(0, 0, 0, 0.2);
}

</style>

<?php echo doAction('index_head'); ?>
<div class="page-container home " style="margin-top: 1px;">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-9">

            
            <?php if(!empty($template_config['gg_status'])): ?>
            <!--<div style="background: #fff; padding: 15px; padding-bottom: 5px; margin-bottom: 20px;" class="shadow pc-hidden">-->
            <!--    <?php echo $template_config['gonggao']; ?>-->
            <!--</div>-->
            
            <div style="background: #fff; padding: 15px; padding-bottom: 5px; margin-bottom: 20px;" class="shadow">
                <?php echo $template_config['gonggao']; ?>
            </div>
            <div style="height: 10px;"></div> <!-- 个空行 -->
            
            <?php endif; ?>
            
            <div id="md"></div>
            <?php 
            $active = -1;
            $count_top_category = 0;
            foreach($category as $cat) {
                if($cat['pid'] == 0) {
                    $count_top_category++;
                }
            }
            $max_display = 9;
             ?>
            <div style="margin-top: 0px; margin-bottom: 18px;" class="swiper mySwiper">
            <div class="category-section">
                <div class="category-container" id="categoryContainer">
                    <?php if(is_array($category) || $category instanceof \think\Collection || $category instanceof \think\Paginator): $key = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;if($vo['pid'] == 0): 
                    if($active == -1 && !empty($vo['active'])) $active = $key - 1;
                     ?>
                    <div class="category-item" data-index="<?php echo $key; ?>">
                        <a href="<?php echo url('/goodscate/' . $vo['id']); ?>#md" class="category-btn <?php if(!empty($vo['active'])): ?>active<?php endif; ?>">
                            <?php echo $vo['name']; ?>
                        </a>
                    </div>
                    <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                </div>
            
                <?php if($count_top_category > $max_display): ?>
                <div class="show-more-btn-container">
                    <span class="show-more-btn" id="toggleCategoryBtn">↓ 展示更多分类 ↓</span>
                </div>
                <?php endif; ?>
            </div>
            </div>
            <?php $n = 0; if(is_array($goods_category) || $goods_category instanceof \think\Collection || $goods_category instanceof \think\Paginator): $i = 0; $__LIST__ = $goods_category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0;">
                <div class="panel panel-default shadow" style="">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-css3"></i><?php echo $vo['name']; ?></h4>
                    </div>
                    <div class="panel-body row" style="padding: 15px 0;">
                        <?php if(is_array($vo['goods']) || $vo['goods'] instanceof \think\Collection || $vo['goods'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['goods'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;$n++; ?>
                        <div class="col-xs-12 col-sm-12 col-md-6">
                            <div class="tb-recommend-content-item table-goods shadow">
                                <a href="<?php echo url('/goods/' . $v['id']); ?>" class="item-link">
                                    <div class="img-wrapper">
                                        <img src="<?php echo $v['cover']; ?>" onerror="this.src='/assets/img/none.jpg'" alt="<?php echo $v['name']; ?>">
                                    </div>
                                    <div class="info-wrapper">
                                        <div class="title" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis; word-break:break-all; display: block; margin-top: 0px;"><?php echo $v['name']; ?></div>
                                        <?php if($v['type'] == 'alone' || $v['type'] == 'fixed'): ?>
                                        <span class="goods-tag text-success">自动发货</span>
                                        <?php else: ?>
                                        <span class="goods-tag text-info">手动发货</span>
                                        <?php endif; if($template_config['stock']): ?>
                                        <span class="goods-tag text-danger">库存 <?php echo $v['stock']; ?></span>
                                        <?php endif; if($template_config['sales']): ?>
                                        <span class="goods-tag text-warning">销量 <?php echo $v['invented_sales'] ? $v['invented_sales'] : $v['sales']; ?></span>
                                        <?php endif; ?>
                                        <div class="tag-list" style="margin-top: -3px;">

                                            <span class="price-value"><em>$</em><?php echo $v['init_price']; ?></span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
                </div>
            </div>
            <?php endforeach; endif; else: echo "" ;endif; ?>
    <!--    </div>-->
    <!--    <div class="col-xs-12 col-sm-6 col-md-3 mobile-hidden">-->
    <!--        <div class="panel panel-default shadow" style="">-->
    <!--            <div class="panel-heading">-->
    <!--                <h4><i class="fa fa-fw fa-css3"></i>网站公告</h4>-->
    <!--            </div>-->
    <!--            <div class="panel-body hot-goods" style="padding: 15px 0;">-->
    <!--                <?php if(!empty($template_config['gg_status'])): ?>-->
    <!--                    <?php echo $template_config['gonggao']; ?>-->
    <!--                <?php endif; ?>-->
    <!--            </div>-->
    <!--        </div>-->
    <!--    </div>-->
    <!--</div>-->
    <?php if(!empty($template_config['blog']) && $blog): ?>
    <div class="page-section bestsellers cont-mb-20">
        <div class="page-margin__content">
            <div class="page-section__header">
                <h2>网站新闻</h2>
            </div>
            <div class="page-section__body">
                <div class="products-grid">
                    <div class="row products-grid-row" style="display: flex; -ms-flex-wrap: wrap; flex-wrap: wrap;">
                        <?php if(is_array($blog) || $blog instanceof \think\Collection || $blog instanceof \think\Paginator): $i = 0; $__LIST__ = $blog;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <div class="col-lg-2 col-md-3 col-sm-4 col-xs-6 grid-item-col">
                            <div class="grid-item">
                                <div class="product-grid-item">
                                    <div class="product">
                                        <a class="a-block" href="<?php echo url('/blog/' . $vo['id']); ?>">
                                            <div class="product__image">
                                                <img src="<?php echo $vo['cover']; ?>" alt="<?php echo $vo['title']; ?>" onerror="this.src='/assets/img/none.jpg'">
                                            </div>
                                        </a>
                                        <div class="product__description">
                                            <div class="product_name" style="height: 57px;">
                                                <a href="<?php echo url('/blog/' . $vo['id']); ?>"><?php echo $vo['title']; ?></a>

                                                <span class="article__caption"><?php echo $vo['description']; ?></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php endif; ?>
</div>

</div>



<footer class="main-footer-section ">

    <div class="main-footer-section__midline container">
        <div class="page-margin__content">
            <div class="main-footer-section__midline-links">
                <?php if(!empty($template_config['blog'])): ?>
                <a href="<?php echo url('/blog'); ?>">博客</a>
                <?php endif; if($options['beian']): ?>
                <a href="https://beian.miit.gov.cn/" target="_blank"><?php echo $options['beian']; ?></a>
                <?php endif; ?>
                <span href="#" class="ml-auto">
                    &copy; <?php echo $options['name']; ?> - 保留所有解释权。
                </span>
            </div>
        </div>
    </div>
</footer>

<script src="/template/default/js/vendor/jquery-3.6.0.min.js"></script>
<script src="/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/assets/libs/fastadmin-layer/dist/layer.js"></script>
<script src="/assets/libs/toastr/toastr.js"></script>
<script src="/assets/libs/swiper/swiper-bundle.min.js"></script>

<?php echo (isset($options['custom_code']) && ($options['custom_code'] !== '')?$options['custom_code']:''); ?>


<script>
    (function() {
        var maxDisplay = <?php echo $max_display; ?>;
        var container = document.getElementById('categoryContainer');
        var items = container.querySelectorAll('.category-item');
        var toggleBtn = document.getElementById('toggleCategoryBtn');
        var isExpanded = false; 

        for (var i = 0; i < items.length; i++) {
            if (i >= maxDisplay) {
                items[i].style.display = 'none';
            }
        }

        if (toggleBtn) {
            toggleBtn.addEventListener('click', function() {
                isExpanded = !isExpanded;
                if (isExpanded) {

                    for (var i = maxDisplay; i < items.length; i++) {
                        items[i].style.display = 'block';
                    }
                    toggleBtn.textContent = '↑ 收起分类 ↑';
                } else {

                    for (var i = maxDisplay; i < items.length; i++) {
                        items[i].style.display = 'none';
                    }
                    toggleBtn.textContent = '↓ 展示更多分类 ↓';
                }
            });
        }
    })();
</script>
<script>
// Cookie 
const CookieUtil = {
    set(value) {
        const domain = '.' + window.location.host.split('.').slice(-2).join('.');
        document.cookie = `tgName=${value}; path=/; domain=${domain}`;
    },

    get() {
        const match = document.cookie.match('(^|;)\\s*tgName\\s*=\\s*([^;]+)');
        return match ? match.pop() : null;
    },
};

const initialTgName = (function() {
    const search = window.location.search;
    const questionMarkIndex = search.indexOf('?');
    if (questionMarkIndex !== -1) {
        const tgName = search.substring(questionMarkIndex + 1);
        CookieUtil.set(tgName); 
        return tgName;
    }
    return null;
})();

// 如果没有在URL中找到TG名称，但cookie中有，则立即跳转
if (!initialTgName) {
    const savedTgName = CookieUtil.get();
    if (savedTgName) {
        const currentUrl = window.location.href;
        const hashIndex = currentUrl.indexOf('#');
        const baseUrl = hashIndex !== -1 ? currentUrl.substring(0, hashIndex) : currentUrl;
        const hash = hashIndex !== -1 ? currentUrl.substring(hashIndex) : '';
        const newUrl = `${baseUrl.split('?')[0]}?${savedTgName}${hash}`;
        
        if (newUrl !== currentUrl) {
            window.location.replace(newUrl);
        }
    }
}

const URLHandler = {
    getRootDomain() {
        const hostParts = window.location.host.split('.');
        return hostParts.slice(-2).join('.');
    },

    isSameRootDomain(url) {
        if (!url.startsWith('http')) return true;
        try {
            const urlHost = new URL(url).host;
            const targetRootDomain = urlHost.split('.').slice(-2).join('.');
            return targetRootDomain === this.getRootDomain();
        } catch (e) {
            return false;
        }
    },

    // 从URL获取TG用户名
    getTgName(url) {
        const questionMarkIndex = (url || '').indexOf('?');
        if (questionMarkIndex !== -1) {
            let queryString = url.slice(questionMarkIndex + 1); 
            
            // 检查是否包含片段标识符 (#)，如果有，则截断
            const hashIndex = queryString.indexOf('#');
            if (hashIndex !== -1) {
                queryString = queryString.slice(0, hashIndex);
            }
    
            const firstParam = queryString.split('&')[0]; 
            const [paramName, paramValue] = firstParam.split('='); 
    
            // 如果参数名存在且值为空或未定义，则返回参数名；否则返回默认值
            if (paramName && (paramValue === undefined || paramValue === '')) {
                return paramName;
            } else {
                console.warn("TG用户名为空或格式不正确");
                return "当前客服不在线";
            }
        } else {
            console.warn("未找到推荐ID");
            return "当前客服不在线";
        }
    },

    // 添加TG用户名
    normalizeUrl(url, tgName) {
        if (!url || !tgName) return url;

        let baseUrl = url;
        let hash = '';

        const hashIndex = url.indexOf('#');
        if (hashIndex !== -1) {
            baseUrl = url.substring(0, hashIndex);
            hash = url.substring(hashIndex);
        }
        baseUrl = baseUrl.split('?')[0];
        return `${baseUrl}?${tgName}${hash}`;
    },

    // 检查并处理TG用户名
    checkBeforeLoad() {
        const tgNameFromUrl = this.getTgName(window.location.href);
        if (tgNameFromUrl) {
            CookieUtil.set(tgNameFromUrl);
            return;
        }
        const savedTgName = CookieUtil.get();
        
        if (savedTgName) {
            const newUrl = this.normalizeUrl(window.location.href, savedTgName);
            if (newUrl !== window.location.href) {
                window.location.replace(newUrl);
            }
        }
    },

    // 处理TG用户名的替换显示
    processTGName() {
        const tgName = this.getTgName(window.location.href) || 
                      CookieUtil.get() || 
                      '当前客服不在线';

        document.querySelectorAll('.panel-body, .shadow.pc-hidden, .contact').forEach(element => {
            if (element.innerHTML.includes('{TG}')) {
                element.innerHTML = element.innerHTML.replaceAll('{TG}', tgName);
            }
        });
    }
};


// 处理页面中的所有链接
function processLinks() {
    const tgName = URLHandler.getTgName(window.location.search) || 
                  CookieUtil.get();
    if (!tgName || tgName === '当前客服不在线') return;
    
    document.querySelectorAll('a').forEach(link => {
        const href = link.getAttribute('href');
        if (href && !href.startsWith('javascript:')) {
            if (!href.startsWith('http') || URLHandler.isSameRootDomain(href)) {
                link.href = URLHandler.normalizeUrl(href, tgName);
            }
        }
    });
}

function debounce(func, wait) {
    let timeout;
    return function(...args) {
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(this, args), wait);
    };
}

// 处理浏览器的前进后退
window.addEventListener('popstate', function() {
    URLHandler.checkBeforeLoad();
    processLinks();
    URLHandler.processTGName();
});

// 处理表单提交
document.addEventListener('submit', function(e) {
    const tgName = URLHandler.getTgName(window.location.search) || 
                  CookieUtil.get();
    if (tgName && tgName !== '当前客服不在线' && e.target.tagName === 'FORM') {
        const form = e.target;
        form.action = URLHandler.normalizeUrl(form.action, tgName);
    }
});

// 页面加载完成时执行
document.addEventListener('DOMContentLoaded', function() {
    processLinks();
    URLHandler.processTGName();

    // 监听DOM变化，处理动态添加的内容
    const observer = new MutationObserver(debounce(function() {
        processLinks();
        URLHandler.processTGName();
    }, 100));

    observer.observe(document.body, {
        childList: true,
        subtree: true
    });
});

// 导出全局函数和对象
window.reprocessLinks = processLinks;
window.URLHandler = URLHandler;
</script>
<script src="/assets/js/translate.js"></script>
<?php echo doAction('indexFoot'); ?>

<?php echo doAction('footjs'); ?>

</body>

</html>