<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/index/land3//index/faq.html";i:1681998164;}*/ ?>

<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
  <!-- Meta Tags -->
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="ThemeMarch">
  <!-- Site Title -->
  <title>FAQ</title>
  <link rel="stylesheet" href="/moban/index5/maowang66/css/fontawesome.min.css">
  <link rel="stylesheet" href="/moban/index5/maowang66/css/bootstrap.min.css">
  <link rel="stylesheet" href="/moban/index5/maowang66/css/slick.css">
  <link rel="stylesheet" href="/moban/index5/maowang66/css/style.css">
</head>

<body class="cs-dark">

  <div class="cs-preloader cs-center">
    <div class="cs-preloader_in"></div>
    <span>Loading</span>
  </div>

  <!-- Start Header Section -->
  <header class="cs-site_header cs-style1 cs-sticky-header cs-white_bg">
    <div class="cs-main_header">
      <div class="container-fluid">
        <div class="cs-main_header_in">
          <div class="cs-main_header_left">
            <a href="/" rel="home" class="main-logo">
               <img id="logo_header" src="<?php echo sysconf('site_logo'); ?>" alt="nft-gaming" width="133" height="56" data-retina="<?php echo sysconf('site_logo'); ?>" data-width="133" data-height="56">
            </a>
          </div>
          <div class="cs-main_header_right">
            <div class="cs-search_wrap">
              <form action="/orderquery" class="cs-search">
                  <input type="hidden" name="querytype" value="2" />
                <input type="text" name="orderid" class="cs-search_input" placeholder="输入订单号">
                <button class="cs-search_btn">
                  <svg width="20" height="21" viewbox="0 0 20 21" fill="none" xmlns="https://www.w3.org/2000/svg">
                    <path d="M9.16667 16.3333C12.8486 16.3333 15.8333 13.3486 15.8333 9.66667C15.8333 5.98477 12.8486 3 9.16667 3C5.48477 3 2.5 5.98477 2.5 9.66667C2.5 13.3486 5.48477 16.3333 9.16667 16.3333Z" stroke="currentColor" stroke-opacity="0.5" stroke-linecap="round" stroke-linejoin="round"></path>
                    <path d="M17.5 18L13.875 14.375" stroke="currentColor" stroke-opacity="0.5" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>                  
                </button>
              </form>
            </div>
            <div class="cs-nav_wrap">
              <div class="cs-nav_out">
                <div class="cs-nav_in">
                  <div class="cs-nav">
                    <ul class="cs-nav_list">
                      <li class="menu-item-has-children">
                        <a href="/">平台首页</a>
                        
                      </li>
                      <li class="menu-item-has-children">
                        <a>订单处理</a>
                        <ul>
                          <li><a href="/orderquery">订单查询</a></li>
                          <li><a href="/complaint">订单投诉</a></li>
                          <li><a href="/complaintquery">投诉查询</a></li>
                          
                        </ul>
                      </li>
                      <li><a href="/company/faq">常见问题</a></li>
                      <li class="menu-item-has-children">
                        <a >官方动态</a>
                        <ul>
                          <li><a href="/company/notice">平台公告</a></li>
                          <li><a href="/company/news">新闻动态</a></li>
                          <li><a href="/company/settlement">平台结算</a></li>
                        </ul>
                      </li>
                      <li><a href="/company/contact">联系我们</a></li>
                      <li>
                        <a href="/qiye" >企业资质</a>
                      </li>
                      <li class="menu-item-has-children cs-mega-menu">
                        <a >服务协议</a>
                        <ul class="cs-mega-wrapper">
                          <li class="menu-item-has-children">
                            <a href="">商户协议</a>
                            <ul>
                              <li><a href="/index/index/content/id/20.html">注册协议</a></li>
                    
                            </ul>
                          </li>
                          <li class="menu-item-has-children">
                            <a href="">买家协议</a>
                            <ul>
                              <li><a href="/index/index/content/id/20.html">购买协议</a></li>
                            
                            </ul>
                          </li>
                        </ul>
                      </li>
                      
                      
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="cs-header_btns_wrap">
              <div class="cs-header_btns">
                <div class="cs-header_icon_btn cs-center cs-mobile_search_toggle">
                  <svg width="20" height="21" viewbox="0 0 20 21" fill="none" xmlns="https://www.w3.org/2000/svg">
                    <path d="M9.16667 16.3333C12.8486 16.3333 15.8333 13.3486 15.8333 9.66667C15.8333 5.98477 12.8486 3 9.16667 3C5.48477 3 2.5 5.98477 2.5 9.66667C2.5 13.3486 5.48477 16.3333 9.16667 16.3333Z" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
                    <path d="M17.5 18L13.875 14.375" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>  
                </div>
                <div class="cs-toggle_box cs-notification_box">
                  <div class="cs-toggle_btn cs-header_icon_btn cs-center">
                    <svg width="19" height="19" viewbox="0 0 19 19" fill="none" xmlns="https://www.w3.org/2000/svg">
                      <path d="M14 6.63916C14 5.44569 13.5259 4.30109 12.682 3.45718C11.8381 2.61327 10.6935 2.13916 9.5 2.13916C8.30653 2.13916 7.16193 2.61327 6.31802 3.45718C5.47411 4.30109 5 5.44569 5 6.63916C5 11.8892 2.75 13.3892 2.75 13.3892H16.25C16.25 13.3892 14 11.8892 14 6.63916Z" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
                      <path d="M10.7981 16.3887C10.6663 16.616 10.477 16.8047 10.2493 16.9358C10.0216 17.067 9.76341 17.136 9.50063 17.136C9.23784 17.136 8.97967 17.067 8.75196 16.9358C8.52424 16.8047 8.33498 16.616 8.20312 16.3887" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>                  
                    <span class="cs-btn_badge"></span>
                  </div>
                  <div class="cs-toggle_body">
                    <h3 class="cs-notification_title">平台紧急通知</h3>
                    <ul class="cs-notification_list">
                      <li>
                        <a href="#" class="cs-notification_item">
                          <div class="cs-notification_thumb"><img src="/moban/index5/maowang66/picture/notificaiton_1.jpeg" alt="Image"></div>
                          <div class="cs-notification_right">
                            <p>CoCo企业云寄售维护1-2点</p>
                            <h4>日期：22.09.19</h4>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="#" class="cs-notification_item">
                          <div class="cs-notification_thumb"><img src="/moban/index5/maowang66/picture/notificaiton_2.jpeg" alt="Image"></div>
                          <div class="cs-notification_right">
                            <p>CoCo企业云寄售升级维护1-2点</p>
                            <h4>日期：22.05.18</h4>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="#" class="cs-notification_item">
                          <div class="cs-notification_thumb"><img src="/moban/index5/maowang66/picture/notificaiton_3.jpeg" alt="Image"></div>
                          <div class="cs-notification_right">
                            <p>CoCo企业云寄售紧急通知</p>
                            <h4>日期：22.02.17</h4>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="#" class="cs-notification_item">
                          <div class="cs-notification_thumb"><img src="/moban/index5/maowang66/picture/notificaiton_4.jpeg" alt="Image"></div>
                          <div class="cs-notification_right">
                            <p>CoCo企业云寄售紧急通知</p>
                            <h4>日期：21.11.03</h4>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="#" class="cs-notification_item">
                          <div class="cs-notification_thumb"><img src="/moban/index5/maowang66/picture/notificaiton_5.jpeg" alt="Image"></div>
                          <div class="cs-notification_right">
                            <p>CoCo企业云寄售紧急通知</p>
                            <h4>日期：21.10.14</h4>
                          </div>
                        </a>
                      </li>
                    </ul>
                    <div class="text-center">
                      <a href="#" class="cs-btn cs-style1">
                        <span>
                          查看更多
                          <svg width="14" height="13" viewbox="0 0 14 13" fill="none" xmlns="https://www.w3.org/2000/svg">
                            <path d="M13.4366 7.01471C13.7295 6.72181 13.7295 6.24694 13.4366 5.95404L8.66361 1.18107C8.37072 0.888181 7.89584 0.888181 7.60295 1.18107C7.31006 1.47397 7.31006 1.94884 7.60295 2.24173L11.8456 6.48438L7.60295 10.727C7.31006 11.0199 7.31006 11.4948 7.60295 11.7877C7.89584 12.0806 8.37072 12.0806 8.66361 11.7877L13.4366 7.01471ZM0.90625 7.23438H12.9062V5.73438H0.90625V7.23438Z" fill="currentColor"></path>
                          </svg> 
                        </span>                         
                      </a>
                    </div>
                  </div>
                </div>
               
                <a href="/login" class="cs-btn cs-style1"><span>商户中心</span></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- End Header Section -->

  <div class="cs-height_90 cs-height_lg_80"></div>
  <!-- Start Page Head -->
  <section class="cs-page_head cs-bg" data-src="/moban/index5/maowang66/img/page_head_bg.svg">
    <div class="container">
      <div class="text-center">
        <h1 class="cs-page_title">常见问题在线解答</h1>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/">Home</a></li>
          <li class="breadcrumb-item active">FAQ</li>
        </ol>
      </div>
    </div>
  </section>
  <!-- End Page Head -->
  <div class="cs-height_100 cs-height_lg_70"></div>
  <div class="container">
    <div class="row cs-col_reverse_lg">
      <div class="col-lg-6">
        <div class="cs-faq">
          <div class="cs-section_heading cs-style3">
            <h2 class="cs-section_title">平台商户常见问题</h2>
            <div class="cs-section_seperator"></div>
          </div>
          <div class="cs-height_30 cs-height_lg_30"></div>
          <div class="cs-accordians">
		  
		  
		  
		  <?php foreach($articles as $v): ?>
		  	<div class="cs-accordian">
              <div class="cs-accordian_head">
                <h2 class="cs-accordian_title"  id="c<?php echo $v['id']; ?>" onclick="showitem(<?php echo $v['id']; ?>)"> <?php echo $v['title']; ?></h2>
                <span class="cs-accordian_toggle">
                  <svg width="13" height="7" viewbox="0 0 13 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1.62109 0.750977L6.95443 6.08431L12.2878 0.750977" stroke="currentColor" stroke-width="1.33333" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>                  
                </span>
              </div>
              <div class="cs-accordian-body">
                <p><p><?php echo removeXSS(htmlspecialchars_decode($v['content'])); ?></p></p>
              </div>
            </div><!-- .cs-accordian -->
		   <?php endforeach; ?>
		  
		  
		  
		  
		  
		  
		  
			
			
						
			
			
			
			
			
          </div><!-- .cs-accordians -->
        </div>
      </div>
      <div class="col-lg-6">
        <div class="text-center">
          <img src="/moban/index5/maowang66/picture/faq_1.svg" alt="faq">
        </div>
        <div class="cs-height_0 cs-height_lg_30"></div>
      </div>
    </div>
  </div>
  <div class="cs-height_80 cs-height_lg_70"></div>
  <div class="container">
    <div class="row">
      <div class="col-lg-6">
        <div class="text-center">
          <img src="/moban/index5/maowang66/picture/faq_2.svg" alt="faq">
        </div>
        <div class="cs-height_0 cs-height_lg_30"></div>
      </div>
      <div class="col-lg-6">
        <div class="cs-faq">
          <div class="cs-section_heading cs-style3">
            <h2 class="cs-section_title">买家使用常见问题</h2>
            <div class="cs-section_seperator"></div>
          </div>
          <div class="cs-height_30 cs-height_lg_30"></div>
          <div class="cs-accordians">
		  
            <div class="cs-accordian ">
              <div class="cs-accordian_head">
                <h2 class="cs-accordian_title">How do I get started in NFT?</h2>
                <span class="cs-accordian_toggle">
                  <svg width="13" height="7" viewbox="0 0 13 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1.62109 0.750977L6.95443 6.08431L12.2878 0.750977" stroke="currentColor" stroke-width="1.33333" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>                  
                </span>
              </div>
              <div class="cs-accordian-body">
                <b>Step 1:</b> Decide on the concept.
                <b>Step 2:</b> Decide on the platform. <br>
                <b>Step 3:</b> Connect and build community.
                <b>Step 4:</b> Create your art. <br>
                <b>Step 5:</b> Mint and share.
                <b>The final step:</b> Selling your NFT.
              </div>
            </div><!-- .cs-accordian -->
			
            <div class="cs-accordian">
              <div class="cs-accordian_head">
                <h2 class="cs-accordian_title">How much does the average NFT sell for?</h2>
                <span class="cs-accordian_toggle">
                  <svg width="13" height="7" viewbox="0 0 13 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1.62109 0.750977L6.95443 6.08431L12.2878 0.750977" stroke="currentColor" stroke-width="1.33333" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>                  
                </span>
              </div>
              <div class="cs-accordian-body">
                <p>Once you have minted a piece of artwork on a marketplace as an <br>NFT, you should never mint it on another platform. If you ever decide <br>to do so, note that most platforms reserve</p>
              </div>
            </div><!-- .cs-accordian -->
            <div class="cs-accordian">
              <div class="cs-accordian_head">
                <h2 class="cs-accordian_title">What kind of NFTs sell best?</h2>
                <span class="cs-accordian_toggle">
                  <svg width="13" height="7" viewbox="0 0 13 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1.62109 0.750977L6.95443 6.08431L12.2878 0.750977" stroke="currentColor" stroke-width="1.33333" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>                  
                </span>
              </div>
              <div class="cs-accordian-body">
                <p>Once you have minted a piece of artwork on a marketplace as an <br>NFT, you should never mint it on another platform. If you ever decide <br>to do so, note that most platforms reserve</p>
              </div>
            </div><!-- .cs-accordian -->
            <div class="cs-accordian">
              <div class="cs-accordian_head">
                <h2 class="cs-accordian_title">How to make money with NFTs as a beginner?</h2>
                <span class="cs-accordian_toggle">
                  <svg width="13" height="7" viewbox="0 0 13 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1.62109 0.750977L6.95443 6.08431L12.2878 0.750977" stroke="currentColor" stroke-width="1.33333" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>                  
                </span>
              </div>
              <div class="cs-accordian-body">
                <p>Once you have minted a piece of artwork on a marketplace as an <br>NFT, you should never mint it on another platform. If you ever decide <br>to do so, note that most platforms reserve</p>
              </div>
            </div><!-- .cs-accordian -->
            <div class="cs-accordian">
              <div class="cs-accordian_head">
                <h2 class="cs-accordian_title">Who owns the most expensive NFT?</h2>
                <span class="cs-accordian_toggle">
                  <svg width="13" height="7" viewbox="0 0 13 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1.62109 0.750977L6.95443 6.08431L12.2878 0.750977" stroke="currentColor" stroke-width="1.33333" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>                  
                </span>
              </div>
              <div class="cs-accordian-body">
                <p>Once you have minted a piece of artwork on a marketplace as an <br>NFT, you should never mint it on another platform. If you ever decide <br>to do so, note that most platforms reserve</p>
              </div>
            </div><!-- .cs-accordian -->
          </div><!-- .cs-accordians -->
        </div>
      </div>
    </div>
  </div>
  <div class="cs-height_90 cs-height_lg_70"></div>

  <!-- Start CTA -->
  <div class="container">
    <div class="cs-cta cs-style2 text-center cs-accent_bg">
      <h2 class="cs-cta_title cs-white_color_8">其他问题请联系平台客服 为您解答</h2>
      <div class="cs-cta_subtitle cs-white_color_8">平台客服QQ:<?php echo sysconf('site_info_qq'); ?> <br>企业邮箱：<?php echo sysconf('site_info_email'); ?></div>
      <a href="register.html" class="cs-btn cs-style1 cs-btn_lg cs-color2"><span>联系我们</span></a>
    </div>
  </div>
  <!-- End CTA -->
  <div class="cs-height_100 cs-height_lg_70"></div>

  <!-- Start Footer -->
 <footer class="cs-footer cs-style1">
    <div class="cs-footer_bg"></div>
    <div class="cs-height_100 cs-height_lg_60"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <div class="row">
            <div class="col-lg-4 col-sm-4">
              <div class="cs-footer_widget">
                <h2 class="cs-widget_title">快速通道</h2>
                <ul class="cs-widget_nav">
                  <li><a href="/merchant">个人中心</a></li>
                  <li><a href="/register">快速开店
</a></li>
                  <li><a href="/orderquery">订单查询</a></li>
                  <li><a href="/complaintquery">投诉查询</a></li>
                  
                </ul>
              </div>
            </div><!-- .col -->
            <div class="col-lg-4 col-sm-4">
              <div class="cs-footer_widget">
                <h2 class="cs-widget_title">帮助中心</h2>
                <ul class="cs-widget_nav">
                  <li><a href="/company/notice">最新公告</a></li>
                  <li><a href="/index/index/content/id/20.html">免责声明</a></li>
                  <li><a href="/company/faq">使用帮助</a></li>
                  <li><a href="/index/index/content/id/13.html">用户协议</a></li>
                  
                </ul>
              </div>
            </div><!-- .col -->
            <div class="col-lg-4 col-sm-4">
              <div class="cs-footer_widget">
                <h2 class="cs-widget_title">联系我们</h2>
                <ul class="cs-widget_nav">
                  <li><a href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo sysconf('site_info_qq'); ?>&site=qq&menu=yes">QQ客服：<?php echo sysconf('site_info_qq'); ?></a></li>
                  <li><a href="how-it-works.html">企业邮箱：<?php echo sysconf('site_info_email'); ?></a></li>
                  <li><a href="about.html">工作时间：8:30 ~ 23:00</a></li>
                  
                 
                </ul>
              </div>
            </div><!-- .col -->
          </div>
        </div>
        <div class="col-lg-4 col-sm-12">
          <div class="cs-footer_widget">
            <h2 class="cs-widget_title">平台商业合作</h2>
            <form class="cs-footer_newsletter">
              <input type="text" placeholder="<?php echo sysconf('site_info_email'); ?>" class="cs-newsletter_input">
              <button class="cs-newsletter_btn">
                <svg width="25" height="16" viewbox="0 0 25 16" fill="none" xmlns="https://www.w3.org/2000/svg">
                  <path d="M24.7014 9.03523C25.0919 8.64471 25.0919 8.01154 24.7014 7.62102L18.3374 1.25706C17.9469 0.866533 17.3137 0.866533 16.9232 1.25706C16.5327 1.64758 16.5327 2.28075 16.9232 2.67127L22.5801 8.32812L16.9232 13.985C16.5327 14.3755 16.5327 15.0087 16.9232 15.3992C17.3137 15.7897 17.9469 15.7897 18.3374 15.3992L24.7014 9.03523ZM0.806641 9.32812H23.9943V7.32812H0.806641V9.32812Z" fill="white"></path>
                </svg>                  
              </button>
            </form>
            <div class="cs-footer_social_btns">
              <a href="#"><i class="fab fa-facebook-f fa-fw"></i></a>
              <a href="#"><i class="fab fa-twitter fa-fw"></i></a>
              <a href="#"><i class="fab fa-linkedin-in fa-fw"></i></a>
              <a href="#"><i class="fab fa-instagram fa-fw"></i></a>
              <a href="#"><i class="fab fa-whatsapp fa-fw"></i></a>
              <a href="#"><i class="fab fa-github fa-fw"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="cs-height_60 cs-height_lg_20"></div>
    <div class="links">
                   <center>  友情链接：
                    <a target="_blank" href="https://vvqi.cn/">QI文档网</a> <span class="split">|</span> 
                    <a target="_blank" href="https://mp.qpay.tenpay.com/index.shtml">QQ钱包</a> <span class="split">|</span> 
                    <a target="_blank" href="https://pay.weixin.qq.com/">微信支付</a> <span class="split">|</span> 
                    <a target="_blank" href="https://b.alipay.com/">支付宝</a> <span class="split">|</span> 
                    <a target="_blank" href="https://www.chinaums.com/">银联商务</a> <span class="split">|</span>
                    <a target="_blank" href="https://aliyun.com/">阿里云</a> <span class="split">|</span>
                    <a target="_blank" href="https://cloud.tencent.com/">腾讯云</a> <span class="split">|</span>
                    <a target="_blank" href="https://vfevv.com/">VV诗词社</a> <span class="split">|</span>
                    <a target="_blank" href="https://www.chinaz.com/">站长之家</a> <span class="split">|</span>
                    <a target="_blank" href="https://1rsc.com/">町子素材</a> <span class="split">|</span>
                    <a target="_blank" href="https://uuth.cn/">海图阁</a> <span class="split">|</span>
                    <a target="_blank" href="https://uekk.cn/">町子百科</a> </center>
                    
        </div>
    <div class="cs-footer_bottom">
      <div class="container">
        <div class="cs-footer_separetor"></div>
        <div class="cs-footer_bottom_in">
          <div class="cs-copyright"><?php echo sysconf('site_info_copyright'); ?>所有，盗版必究！
          
          <a class="text-muted" href="https://beian.miit.gov.cn/">备案号：<?php echo sysconf('site_info_icp'); ?></a></div>
          <ul class="cs-footer_menu">
            <li><a href="/register">商户注册</a></li>
            <li><a href="/login">商户登录</a></li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
  <!-- End Footer -->
  <script src="/moban/index5/maowang66/js/jquery-3.6.0.min.js"></script>
  <script src="/moban/index5/maowang66/js/isotope.pkg.min.js"></script>
  <script src="/moban/index5/maowang66/js/jquery.slick.min.js"></script>
  <script src="/moban/index5/maowang66/js/main.js"></script>

<!-- 百度统计 开始 -->
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?7ccfa32bb30708516be5b671cdfd22bc";
        var s = document.getElementsByTagName("script")[0]; 
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<!-- 百度统计 结束 -->

</body>
</html>