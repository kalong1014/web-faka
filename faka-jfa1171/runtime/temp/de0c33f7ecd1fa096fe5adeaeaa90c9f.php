<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:90:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3//order/complaint.html";i:1575165824;s:78:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3/main.html";i:1575165824;s:80:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3/header.html";i:1575947310;s:80:"/www/wwwroot/www.811192.xyz/application/templates/mobile/index/land3/footer.html";i:1575165824;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title><?php echo sysconf('site_name'); ?><?php echo sysconf('site_subtitle'); ?></title>
    <meta name="keywords" content="<?php echo sysconf('site_keywords'); ?>" />
    <meta name="description" content="<?php echo sysconf('site_desc'); ?>" />
    <link rel="shortcut icon" href="<?php echo sysconf('browser_icon'); ?>" />
    <link rel="stylesheet" href="/static/app/css/main.css">
    <link rel="stylesheet" href="/static/app/css/main_mobile.css">
    <link rel="stylesheet" href="/static/app/css/iconfont.css">
    <link rel="stylesheet" href="/static/app/css/animate.min.css">
    <link rel="stylesheet" href="/static/app/css/swiper.min.css">
    <link rel="stylesheet" href="/static/plugs/layui/css/layui.css"></link>
    <script src="/static/app/js/jquery-2.2.1.min.js"></script>
    <script src="/static/app/js/swiper.min.js"></script>
    <script src="/static/app/js/formvalidator_min.js"></script>
    <script src="/static/app/js/formvalidatorregex.js"></script>
    <script src="/static/app/js/layer.js"></script>
    
<style>
    .ts_title{
        height:60px;
        text-align:center;
        line-height:60px;
        font-size:18px;
        background:#409ccf;
        border-top-left-radius:3px;
        border-top-right-radius:3px;
        color:#fff;
    }
    .ts_con {
        padding:30px 0;
        position:relative;
    }
    .ts_con p{
        height:40px;
        width: 100%;
        background:#fff;
        border:1px solid #eee;
        border-radius:2px;
        line-height:40px;
        margin-bottom:20px;
    }
    .ts_con p span{
        width:120px;
        font-size:16px;
        background:#409ccf;
        display:block;
        float:left;
        border-top-left-radius:2px;
        border-bottom-left-radius:2px;
        color:#fff;
        text-align:center;
        margin-right:10px;
    }
    .ts_con p input,.ts_con p select{
        width: calc(100% - 140px);
        width: -moz-calc(100% - 140px);
        width: -webkit-calc(100% - 140px);
        border:none;
        font-size:14px;
        outline:none;
        letter-spacing:1px;
    }
    @media (max-width: 780px){
        .ts_con p input,.ts_con p select{
            width: 160px;
            border:none;
            font-size:14px;
            outline:none;
            letter-spacing:1px;
        }
        .footer_bottom .footer-menu{
            text-align:center;
        }
    }
    .ts_con p textarea{
        width: calc(100% - 140px);
        width: -moz-calc(100% - 140px);
        width: -webkit-calc(100% - 140px);
        max-width:780px;
        height:195px;
        border:none;
        font-size:14px;
        line-height:35px;
        outline:none;
        letter-spacing:1px;
        resize: none;
    }
    .btn_ts{
        display:block;
        border:none;
        height:48px;
        width:200px;
        line-height:48px;
        background:#409ccf;
        color:#fff;
        margin:0 auto;
        border-radius:2px;
        font-weight:bold;
    }
    .file input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
    }
    .shili img{
        position:absolute;
        top:38px;
        left:0;
    }
</style>


</head>
<body>

<section class="page_top">
    <div class="container">
    <!--导航-->
<div class="top">
    <div class="logo"><a href="/"><img src="<?php echo sysconf('site_logo'); ?>" alt="" height="44"></a></div>
    <div class="nav_btn"><i></i></div>
    <div class="user_btns">
        <?php if(session('?merchant.user')): ?>
        <a href="/merchant/index" class="login_btn" >商户中心</a><a  href="/logout" class="reg_btn">退出登录</a>
        <?php else: ?>
        <a href="/login" class="login_btn">登录</a><a href="/register" class="reg_btn">注册</a>
        <?php endif; ?>
    </div>
    <div class="nav">
        <ul>
            <?php if(is_array($nav) || $nav instanceof \think\Collection || $nav instanceof \think\Paginator): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <li><a href="<?php echo $vo['url']; ?>" <?php if($vo['target'] == '1'): ?>target="_blank"<?php endif; ?>><?php echo $vo['title']; ?></a></li>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </div>
    <div class="main_shadow">
        <ul>
            <?php if(is_array($nav) || $nav instanceof \think\Collection || $nav instanceof \think\Paginator): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <li><a href="<?php echo $vo['url']; ?>" <?php if($vo['target'] == '1'): ?>target="_blank"<?php endif; ?>><?php echo $vo['title']; ?></a></li>
            <?php endforeach; endif; else: echo "" ;endif; if(session('?merchant.user')): ?>
            <li><a href="/merchant/index">商户中心</a></li>
            <li><a href="/logout">退出登录</a></li>
            <?php else: ?>
            <li><a href="/login">登录</a></li>
            <li><a href="/register">快速注册</a></li>
            <?php endif; ?>
        </ul>
    </div>
</div>

    </div>
</section>



<div class="order_form">
    <div class="ts_title">
        订 单 投 诉
    </div>
    <div class="ts_con">
        <form name='report' action='' method='post' style="padding: 0 20px;">
            <input type="hidden" name="token" value="<?php echo $token; ?>">
            <p><span>订单编号</span><input name="trade_no" type="text" value="<?php echo \think\Request::instance()->get('trade_no'); ?>"></p>
            <p><span>举报原因</span>
                <select name="type">
                    <option value="">--请选择投诉原因--</option>
                    <option value="无效卡密">无效卡密</option>
                    <option value="虚假商品">虚假商品</option>
                    <option value="非法商品">非法商品</option>
                    <option value="侵权商品">侵权商品</option>
                    <option value="不能购买">不能购买</option>
                    <option value="恐怖色情">恐怖色情</option>
                    <option value="其他投诉">其他投诉</option>
                </select>
            </p>
            <p><span>联系QQ</span><input name="qq" type="text" placeholder="请填写您的QQ号"></p>
            <p><span>手机号码</span><input name="mobile" type="text" placeholder="用于接收短信，请认真填写"></p>
            <p style="height:200px;">
                <span style="height:200px; line-height:200px;">详情说明</span>
                <textarea name="desc" placeholder="请具体说明问题，如：无法正常充值，卖家不处理等"></textarea>
            </p>
            <button type="submit" class="btn_ts">提交投诉</button>
        </form>
    </div>
</div>

<!--返回顶部-->
<div class="toTop"><i class="iconfont icon-angle-up"></i>TOP</div>

<footer class="row footer-area">

    <div class="row m0 footer_bottom">
        <div class="container">
            <div class="row" style="padding:0 20px">
                <div class="col-sm-6 col-md-6">
                    <?php echo sysconf('site_info_copyright'); ?>
                </div>
                <div class="right col-sm-6 col-md-6">
                    <ul class="footer-menu">
                        <?php if(is_array($nav) || $nav instanceof \think\Collection || $nav instanceof \think\Paginator): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <li><a href="<?php echo $vo['url']; ?>" <?php if($vo['target'] == '1'): ?>target="_blank"<?php endif; ?>><?php echo $vo['title']; ?></a></li>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<script src="/static/app/js/main.js"></script>
<script src="/static/app/js/main_mobile.js"></script>
<script>
    var mySwiper = new Swiper ('.swiper-container', {
        slidesPerView : 'auto',
        autoplay : 3000,
        direction: 'horizontal',
        loop: true,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
    })
</script>


</body>
</html>
