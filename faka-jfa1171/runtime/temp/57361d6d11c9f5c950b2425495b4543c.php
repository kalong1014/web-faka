<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:93:"/www/wwwroot/www.811192.xyz/application/templates/mobile/merchant/default/plugin/shopdiy.html";i:1646323578;s:90:"/www/wwwroot/www.811192.xyz/application/templates/mobile/merchant/default/simple_base.html";i:1687275162;}*/ ?>
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
        <div class="card-body p-3">

            <div class="row mb-2">

                <div class="col-lg-12">
                    <div class="alert alert-warning" role="alert">
                        店铺风格、分类风格、商品风格设置为“★动态DIY★”，以下设置才会生效。
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="alert alert-success" role="alert">
                        注意部分视频自带音频，如果没有声音可与店铺设置【支付页背景音乐】搭配使用。
                    </div>
                </div>


                <div class="col-sm-auto">
                    <button  onclick="$.x_show('自定义素材', '<?php echo url('plugin/shopdiyThemeEdit'); ?>', '90%')" class="btn btn-primary glow invoice-create" role="button" aria-pressed="true"><i class="bx bx-plus mr-1"></i>自定义素材</button>
                </div>
            </div>
            <div class="row">
                <table class="table m-0">
                    <thead>
                        <tr>
                            <th>素材名称</th>
                            <th class="text-center">状态</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($shopdiyTheme as $k=> $v): ?>
                        <tr>
                            <td>
                                <?php if($v['resource_type']==0): ?>
                                <i class="bx bx-movie mr-1"></i>
                                <?php elseif($v['resource_type']==1): ?>
                                <i class="bx bx-image mr-1"></i>
                                <?php endif; ?>

                                <b><?php echo $v['name']; ?></b>
                                <?php if($v['user_id']==$_user['id']): ?>
                                <span class="badge badge-pill bg-warning  font-weight-bold">自定义</span>
                                <?php else: ?>
                                <span class="badge badge-pill bg-success  font-weight-bold">官方</span>
                                <?php endif; if($v['status']==0): ?>
                                <span class="badge badge-pill bg-danger font-weight-bold">已被禁用</span>
                                <?php endif; ?>
                            </td>
                            <td class="text-center">
                                <?php if($shopdiy['theme_id']==$v['id']): ?>
                                <span class="badge badge-pill bg-success  font-weight-bold">正在使用</span>
                                <?php else: ?>
                                -
                                <?php endif; ?>
                            </td>
                            <td class="text-center">
                                <div class="btn-group btn-group-sm " role="group" aria-label="Basic group">

                                    <?php if($v['id']!=$shopdiy['theme_id']): ?>
                                    <button onclick="usetheme('<?php echo $v['id']; ?>')"  class="btn btn-light waves-effect waves-light text-success">使用</button>
                                    <?php endif; ?>

                                    <a target="_blank" href="<?php echo $_user->link; ?>?dev=1&theme_id=<?php echo $v['id']; ?>&go=1" class="btn btn-light waves-effect text-primary">预览</a>
                                    <?php if($v['user_id']==$_user['id']): ?>
                                    <button onclick="$.x_show('编辑', '<?php echo url('plugin/shopdiyThemeEdit',['id'=>$v['id']]); ?>', '90%')" class="btn btn-light waves-effect text-primary" role="button" aria-pressed="true">编辑</button>
                                    <button onclick="del('<?php echo $v['id']; ?>')" class="btn btn-light waves-effect text-danger" role="button" aria-pressed="true">删除</button>
                                    <?php endif; ?>
                                </div>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>

            </div>
            <nav aria-label="...">
                <?php echo $page; ?>
            </nav>

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
        
<script src="/static/merchant/default/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
                                        function usetheme(id)
                                        {
                                            var loading = layer.load(1, {shade: [0.1, '#fff']});
                                            $.post("<?php echo url('plugin/shopdiy'); ?>", {
                                                act: "settheme",
                                                id: id
                                            }, function (res) {
                                                layer.closeAll();
                                                $.alert(res.msg);
                                                if (res.code == 1) {
                                                    setTimeout(function () {
                                                        location.reload();
                                                    }, 200);
                                                }
                                            });
                                        }

                                        function del(id)
                                        {

                                            $.confirm({
                                                title: '温馨提示',
                                                content: '确定删除吗？',
                                                type: 'red',
                                                typeAnimated: true,
                                                buttons: {
                                                    tryAgain: {
                                                        text: '确定',
                                                        btnClass: 'btn-red',
                                                        action: function () {
                                                            var loading = layer.load(1, {shade: [0.1, '#fff']});
                                                            $.post("<?php echo url('plugin/shopdiy'); ?>", {
                                                                act: "del",
                                                                id: id
                                                            }, function (res) {
                                                                layer.closeAll();
                                                                $.alert(res.msg);
                                                                if (res.code == 1) {
                                                                    setTimeout(function () {
                                                                        location.reload();
                                                                    }, 200);
                                                                }
                                                            });
                                                        }
                                                    },
                                                    cancel: {
                                                        text: '取消'
                                                    }
                                                }
                                            });
                                        }


</script>

    </body>
</html>