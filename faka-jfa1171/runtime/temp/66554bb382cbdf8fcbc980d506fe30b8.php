<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:86:"/www/wwwroot/www.811192.xyz/application/templates/pc/index/land3//order/complaint.html";i:1682005378;}*/ ?>

<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
  <!-- Meta Tags -->
        <meta charset="utf-8" />
        <title>投诉订单 - <?php echo sysconf('site_name'); ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta name="keywords" content="<?php echo sysconf('site_keywords'); ?>" />
        <meta name="description" content="<?php echo sysconf('site_desc'); ?>" />
        <link rel="shortcut icon" href="<?php echo sysconf('browser_icon'); ?>" />
        <!-- Bootstrap -->
        <link href="/static/theme/landrick/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="/static/theme/landrick/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Slider -->               
        <link rel="stylesheet" href="/static/theme/landrick/css/owl.carousel.min.css"/> 
        <link rel="stylesheet" href="/static/theme/landrick/css/owl.theme.default.min.css"/> 
        <!-- Main Css -->
        <link href="/static/theme/landrick/css/land1.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link href="/static/theme/landrick/css/colors/default.css" rel="stylesheet" id="color-opt">
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

  <div class="cs-height_90 cs-height_lg_80"></div>
  <!-- Start Collection Details -->
  <div class="cs-bg" data-src="/moban/index5/maowang66/img/page_head_bg.svg">
    <div class="cs-height_100 cs-height_lg_70"></div>
    <div class="container">
      <div class="cs-collection_card">
        <div class="cs-collection_img"><img src="/moban/index5/maowang66/picture/collection_details.jpeg" alt="Collection Details"></div>
        <div class="cs-collection_bottom">
          <div class="cs-collection_avatar"><img src="/moban/index5/maowang66/picture/avatar_20.png" alt="Avatar"></div>
          <div class="cs-collection_info">
            <div class="cs-collection_info_in cs-white_bg">
              <div class="cs-collection_info_left">
                <h2 class="cs-collection_avatar_name">在线投诉订单</h2>
                <div class="cs-collection_user">有问题请联系平台客服</div>
                <a href="#" class="cs-btn cs-style1">
                  <span><i class="far fa-star"></i> 联系客服</span>
                </a>
                
              </div>
              <div class="cs-collection_right">
                <div class="cs-collection_list_wrap">
                  <ul class="cs-collection_list cs-white_bg cs-mp0">
                    <li>
                      <div class="cs-collection_list_title">客服QQ：</div>
                      <div class="cs-collection_list_number"><?php echo sysconf('site_info_qq'); ?></div>
                    </li>
                    <li>
                      <div class="cs-collection_list_title">客服邮箱</div>
                      <div class="cs-collection_list_number"><?php echo sysconf('site_info_email'); ?></div>
                    </li>
                    <li>
                      <div class="cs-collection_list_title">在线时间</div>
                      <div class="cs-collection_list_number">10:00-24:00</div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Collection Details -->
  <div class="cs-height_100 cs-height_lg_70"></div>
  <div class="container">
    <div class="cs-profile_right">
        
        <form class="row" name='report'  action='' method='post' enctype="multipart/form-data">
         
          <div class="col-lg-6">
           <span class="cs-btn cs-style2 cs-btn_lg w-100">
              <span class="text-left">
                <i class="fab fa-facebook-f"></i>
                <span>订单编号</span> 
                <input name="trade_no" type="text" value="">
              </span>
            </span>
            <div class="cs-height_25 cs-height_lg_25"></div>
            <span class="cs-btn cs-style2 cs-btn_lg w-100">
              <span class="text-left">
                <i class="fab fa-facebook-f"></i>
                <span>联系QQ</span> 
                <input name="qq" type="text" placeholder="先将常用QQ设置为任何人可以添加，卖家会主动联系你解决">
              </span>
            </span>
            <div class="cs-height_25 cs-height_lg_25"></div>
            <span class="cs-btn cs-style2 cs-btn_lg w-100">
              <span class="text-left">
                <i class="fab fa-facebook-f"></i>
                <span>选择售后卡密</span> 
                <input name="select_cards" type="hidden" value="">
                <input readonly="readonly" name="select_text" type="text" placeholder="请选择售后卡密">
                <button class="cs-btn cs-style1" type="button" value="获取邀请码" id="selectBtn" >
                <span>选卡密</span>                
              </button>
              </span>
            </span>



            
   
            
            


            <div class="cs-height_25 cs-height_lg_25"></div>
          </div>
          
          
          
          <div class="col-lg-6">
             
              <div class="cs-form_field_wrap cs-select_arrow">
              <select name="type" class="cs-form_field">
                <option value="无效卡密">投诉原因: 无效卡密</option>
                                                            <option value="虚假商品">投诉原因: 虚假商品</option>
                                                            <option value="非法商品">投诉原因: 非法商品</option>
                                                            <option value="侵权商品">投诉原因: 侵权商品</option>
                                                            <option value="不能购买">投诉原因: 不能购买</option>
                                                            <option value="恐怖色情">投诉原因: 恐怖色情</option>
                                                            <option value="其他投诉">投诉原因: 其他投诉</option>
              </select>
            </div>
            <div class="cs-height_25 cs-height_lg_25"></div>
            <span class="cs-btn cs-style2 cs-btn_lg w-100">
              <span class="text-left">
                <i class="fab fa-facebook-f"></i>
                <span>手机号</span> 
                <input name="mobile" type="text" placeholder="用于接收撤诉查看进度短信密码，填错将无法查看投诉处理进度，后果自负" >
              </span>
            </span>
            
            
            <?php if(sysconf('complaint_qrcode')==1): ?>
            <div class="cs-height_25 cs-height_lg_25"></div>
            <span class="cs-btn cs-style2 cs-btn_lg w-100">
              <span class="text-left">
                <i class="fab fa-facebook-f"></i>
                <span>收款二维码</span> 
                <input name="select_cards" type="hidden" value="">
                <input readonly="readonly" name="buyer_qrcode" type="file" placeholder="胜诉将会把资金退回此收款账号">
              </span>
            </span>
            <?php endif; ?>
            
            
            
              <div class="cs-height_25 cs-height_lg_25"></div>
          </div>
          
          <div class="col-lg-12">
                <div class="cs-form_field_wrap">
               
                  
                  
                  <textarea class="cs-form_field" cols="30" name="desc" rows="4" placeholder="订单有问题请第一时间联系卡密页面的卖家客服QQ，卖家客服QQ长时间不回复联系卡密下方的平台客服QQ，平台为24点解冻卖家资金，卡密有问题的请在24点前点击投诉按钮，否则我们将打款给卖家。防骗提醒：1.卡密内容为联系QQ的 2.以各种理由推脱到第二天发货 3.商品有问题，卖家不售后 4.承诺充值返现 5.购买的商品为实物，需要快递发货的。以上问题请在此处投诉订单。（卖家会在24小时内联系你解决，超过24小时没联系解决的请联系平台客服QQ退款"></textarea>
                  
                  
                </div>
                <div class="cs-height_20 cs-height_lg_20"></div>
              </div>
          <div class="col-lg-12">
            
            <div class="cs-height_30 cs-height_lg_30"></div>
            
             <input type="hidden" name="token" value=<?php echo htmlentities($token); ?>>
                                                    <button type="submit" class="cs-btn cs-style1 cs-btn_lg w-100"><span>提 交 投 诉</span></button>
            
            
            
            
            
            
            
            
        
            
            
            
          </div>
        </form>
      </div>
  </div>

  <div class="cs-height_100 cs-height_lg_70"></div>
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

  <!-- Script -->
 <script src="/moban/index5/maowang66/js/jquery-3.6.0.min.js"></script>


  <script src="/moban/index5/maowang66/js/main.js"></script>
  <script src="/static/theme/landrick/js/jquery-3.5.1.min.js"></script>
        <script src="/static/theme/landrick/js/bootstrap.bundle.min.js"></script>
        <script src="/static/theme/landrick/js/jquery.easing.min.js"></script>
        <script src="/static/theme/landrick/js/scrollspy.min.js"></script>
        <!-- SLIDER -->
        <script src="/static/theme/landrick/js/owl.carousel.min.js "></script>
        <script src="/static/theme/landrick/js/owl.init.js "></script>
        <!-- Icons -->
        <script src="/static/theme/landrick/js/feather.min.js"></script>
        <script src="/static/theme/landrick/js/bundle.js"></script>
        <!-- Main Js -->
        <script src="/static/theme/landrick/js/app.js"></script>
        <script src="/static/app/js/layer.js"></script>
        <script>

            var select_card_form;

            function closeSelectForm()
            {
                layer.close(select_card_form);
            }

            $("#selectBtn").click(function ()
            {
                var trade_no='';
                if(''!='')
                {
                    trade_no='';
                }else if($("input[name='trade_no']").val()!='')
                {
                    trade_no=$("input[name='trade_no']").val();
                }
                select_card_form = layer.open({
                    type: 2,
                    fix: false,
                    maxmin: true,
                    shadeClose: false,
                    area: ['420px', 'auto'],
                    shade: 0.4,
                    title: "请选择需要售后的卡密",
                    content: '/index/plugin/complaintCard?trade_no=' +trade_no,
                    success: function (layero, index) {
                        layer.iframeAuto(index);
                    }
                });
                return false;
            });

            var select_lable;
            function selectLable(ids, num)
            {
                $("[name=select_cards]").val(ids);
                $("[name=select_text]").val("已选择" + num + "张");
            }
        </script>

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