<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:88:"/www/wwwroot/www.811192.xyz/application/templates/mobile/merchant/default/user/link.html";i:1646323578;s:90:"/www/wwwroot/www.811192.xyz/application/templates/mobile/merchant/default/simple_base.html";i:1687275162;}*/ ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="theme-color" content="#0134d4">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags-->
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
            .page-content-wrapper{
                margin-bottom: 15px;
            }
        </style>
        
<link href="/static/merchant/default/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

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
                        <h6 class="mb-0"><?php echo (isset($_title) && ($_title !== '')?$_title:''); ?></h6>
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
                    <a https://qm.qq.com/cgi-bin/qm/qr?k=AqfNxCDD_KMonvTB8zZaa6gLhQOKxvi6&noverify=0&personal_qrcode_source=3"></i>平台客服
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

        <div class="page-content-wrapper pt-2">
            

<div class="container">
    <div class="card">
        <div class="card-body  p-3">

            <div class="d-flex justify-content-between">
                <div class="mb-2">
                    <?php if($_user['link_status']==1): ?>
                    <span class="badge mb-2 rounded-pill bg-success">已开启</span>
                    <?php else: ?>
                    <span class="badge mb-2 rounded-pill bg-danger">已关闭</span>
                    <?php endif; ?>
                </div>
                <div class="mb-2">
                    <i class="bx bx-link-alt"></i>
                </div>
            </div>

            <?php if(sysconf('site_domain_short')!=""): ?>
            <p class="mb-2">短链接: <a href="<?php echo $_user['short_link']; ?>"  target="_blank"><?php echo $_user['short_link']; ?></a>  <button onclick="reset_link(0)" class="btn btn-primary  btn-sm waves-effect waves-light">单独重置</button></p>
            <?php endif; if(plugconf('subdomain','status')=='1'&&plugconf('subdomain','top_domain')!=""): ?>
            <p class="mb-2">二级域名： <a href="<?php echo $_user['full_subdomain']; ?>"  target="_blank"><?php echo $_user['full_subdomain']; ?></a> <button onclick="editsubdomain()"  class="btn btn-primary  waves-effect waves-light btn-sm  ml-2">自定义</button></p>
            <?php endif; ?>

            <p class="mb-2">商品购买地址: <a href="<?php echo $_user['link']; ?>"  target="_blank"><?php echo $_user['link']; ?></a></p>
            <p class="mb-2">二维码地址（长按可保存）：<img src="<?php echo generate_qrcode_link($_user['link'],10,150); ?>" alt=""></p>
            <div>
                <button onclick="reset_link(1)" class="btn btn-warning  btn-sm waves-effect waves-light">链接重置</button>
                <?php if($_user['link_status']==1): ?>
                <button onclick="close_link('links', 0)" class="btn btn-danger btn-sm waves-effect waves-light">关闭链接</button>
                <?php else: ?>
                <button onclick="close_link('links', 1)"  class="btn btn-success btn-sm waves-effect waves-light">开启链接</button>
                <?php endif; ?>
            </div>

        </div>
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
        <script src="/static/merchant/mobile_default/js/active.js"></script>
        <script src="/static/merchant/mobile_default/js/clipboard.js"></script>
        
<script src="/static/app/js/clipboard.js"></script>
<script src="/static/merchant/default/libs/sweetalert2/sweetalert2.min.js"></script>
<script>
                    var clipboard = new ClipboardJS('.btn');
                    clipboard.on('success', function (e) {
                        layer.msg('链接复制成功！', {
                            icon: 1
                        });
                    });

                    clipboard.on('error', function (e) {
                        layer.msg('链接复制失败，请手动复制！', {
                            icon: 2
                        });
                    });

                    function close_link(type, status)
                    {
                        var loading = layer.load(1, {shade: [0.1, '#fff']});
                        $.post(
                                "<?php echo url('user/closelink'); ?>", {type: type, status: status},
                                function (data) {
                                    if (data.code == 1) {
                                        layer.msg(data.msg, {time: 1000, icon: 6}, function () {
                                            location.reload();
                                        });
                                    } else {
                                        layer.msg(data.msg, {time: 1000, icon: 5});
                                    }
                                }, "json");
                    }

                    function reset_link(target) {

                        $.confirm({
                            title: '温馨提示',
                            content: '确定要重置链接吗，重置链接后，之前的链接将不能访问！',
                            type: 'red',
                            typeAnimated: true,
                            buttons: {
                                tryAgain: {
                                    text: '确定',
                                    btnClass: 'btn-red',
                                    action: function () {
                                        var loading = layer.load(1, {shade: [0.1, '#fff']});
                                        $.post(
                                                "<?php echo url('user/relink'); ?>", {type: "links", target: target},
                                                function (data) {
                                                    if (data.code == 1) {
                                                        layer.msg(data.msg, {time: 1000, icon: 6}, function () {
                                                            location.reload();
                                                        });
                                                    } else {
                                                        layer.msg(data.msg, {time: 1000, icon: 5});
                                                    }
                                                }, "json");
                                    }
                                },
                                cancel: {
                                    text: '取消',
                                }
                            }
                        });

                    }
                    function editsubdomain()
                    {
                        Swal.fire({
                            title: '请输入自定义二级',
                            input: 'text',
                            showCancelButton: true,
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            showLoaderOnConfirm: true,
                            confirmButtonColor: "#556ee6",
                            cancelButtonColor: "#f46a6a",
                        }).then(function (res) {
                            if (res.isConfirmed)
                            {
                                var loading = layer.load(1, {shade: [0.1, '#fff']});
                                $.post("<?php echo url('user/editSubdomain'); ?>", {subdomain: res.value}, function (res) {
                                    layer.closeAll();
                                    if (res.code != 1) {
                                        $.alert(res.msg);
                                    } else {
                                        $.alert("设置成功");
                                        setTimeout(function () {
                                            location.reload();
                                        }, 200);
                                    }
                                });
                            }

                        })
                    }
</script>

    </body>
</html>