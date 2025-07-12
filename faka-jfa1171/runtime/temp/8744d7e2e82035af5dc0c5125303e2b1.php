<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:84:"/www/wwwroot/www.811192.xyz/application/templates/pc/merchant/default/goods/add.html";i:1646323578;s:79:"/www/wwwroot/www.811192.xyz/application/templates/pc/merchant/default/base.html";i:1646323578;}*/ ?>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8">
        <title>商户面板 - <?php echo sysconf('site_name'); ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="keywords" content="<?php echo sysconf('site_keywords'); ?>" />
        <meta name="description" content="<?php echo sysconf('site_desc'); ?>" />
        <link rel="shortcut icon" href="<?php echo sysconf('browser_icon'); ?>" />
        <!-- App favicon -->
        
<link href="/static/merchant/default/libs/summernote/summernote-bs4.min.css" rel="stylesheet" type="text/css">

        <!-- Bootstrap Css -->
        <link href="/static/merchant/default/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css">
        <link href="/static/merchant/default/libs/jquery-confirm/css/jquery-confirm.css" rel="stylesheet" type="text/css">
        <link href="/static/merchant/default/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css">
        <link href="/static/merchant/default/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
        <link href="/static/merchant/default/libs/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/static/merchant/default/libs/toastr/build/toastr.min.css">
        <!-- Icons Css -->
        <link href="/static/merchant/default/css/icons.min.css" rel="stylesheet" type="text/css">
        <!-- App Css-->
        <link href="/static/merchant/default/css/app.min.css" id="app-style" rel="stylesheet" type="text/css">
        <link href="/static/merchant/default/css/custom.css" id="app-style" rel="stylesheet" type="text/css">
        <script>
            document.onkeydown = function () {
                if (window.event && window.event.keyCode == 123) {
                    event.keyCode = 0;
                    event.returnValue = false;
                }
            }
        </script>
    </head>


    <body data-sidebar="dark">

        <!-- <body data-layout="horizontal" data-topbar="dark"> -->

        <!-- Begin page -->
        <div id="layout-wrapper">

            <header id="page-topbar">
                <div class="navbar-header">
                    <div class="d-flex">
                        <!-- LOGO -->
                        <div class="navbar-brand-box">
                            <a href="" class="logo logo-dark">
                                <span class="logo-sm">
                                    <img src="<?php echo sysconf('merchant_logo_sm'); ?>" alt="" height="22">
                                </span>
                                <span class="logo-lg">
                                    <img src="<?php echo sysconf('merchant_logo'); ?>" alt="" height="28">
                                </span>
                            </a>

                            <a href="" class="logo logo-light">
                                <span class="logo-sm">
                                    <img src="<?php echo sysconf('merchant_logo_sm'); ?>" alt="" height="22">
                                </span>
                                <span class="logo-lg">
                                    <img src="<?php echo sysconf('merchant_logo'); ?>" alt="" height="28">
                                </span>
                            </a>
                        </div>

                        <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect" id="vertical-menu-btn">
                            <i class="fa fa-fw fa-bars"></i>
                        </button>

                        <!-- App Search-->
                        <form class="app-search d-none d-lg-block" action="<?php echo url('order/index'); ?>">
                            <div class="position-relative">
                                <input type="hidden" name='type' value='0'>

                                <input type="text" name="keywords" class="form-control" placeholder="输入订单编号...">
                                <span class="bx bx-search-alt"></span>
                            </div>
                        </form>
                    </div>

                    <div class="d-flex">

                        <div class="dropdown d-inline-block d-lg-none ml-2">
                            <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="mdi mdi-magnify"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0" aria-labelledby="page-header-search-dropdown">

                                <form class="p-3" action="<?php echo url('order/index'); ?>">
                                    <div class="form-group m-0">
                                        <div class="input-group">
                                            <input type="hidden" name='type' value='0'>
                                            <input type="text" class="form-control" placeholder="输入订单编号 ..." aria-label="Recipient's username">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="dropdown d-none d-lg-inline-block ml-1">
                            <button type="button" class="btn header-item noti-icon waves-effect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="bx bx-customize"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                                <div class="px-lg-2">
                                    <div class="row no-gutters">
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="<?php echo url('goods_card/add'); ?>">
                                                <img src="/static/merchant/default/images/brands/add_card.png" alt="添加卡密">
                                                <span>添加卡密</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="<?php echo url('goods_category/index'); ?>">
                                                <img src="/static/merchant/default/images/brands/category.png" alt="添加分类">
                                                <span>添加分类</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="<?php echo url('goods/add'); ?>">
                                                <img src="/static/merchant/default/images/brands/goods.png" alt="添加商品">
                                                <span>添加商品</span>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="row no-gutters">
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="<?php echo url('user/settings'); ?>">
                                                <img src="/static/merchant/default/images/brands/shop.png" alt="店铺设置">
                                                <span>店铺设置</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="<?php echo url('user/link'); ?>">
                                                <img src="/static/merchant/default/images/brands/link.png" alt="店铺链接">
                                                <span>店铺链接</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="<?php echo url('cash/index'); ?>">
                                                <img src="/static/merchant/default/images/brands/cash.png" alt="结算记录">
                                                <span>结算记录</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown d-none d-lg-inline-block ml-1">
                            <button type="button" class="btn header-item noti-icon waves-effect" data-toggle="fullscreen">
                                <i class="bx bx-fullscreen"></i>
                            </button>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-notifications-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <?php if($_messages_count==0): ?>
                                <i class="bx bx-bell"></i>
                                <?php else: ?>
                                <i class="bx bx-bell bx-tada"></i>
                                <span class="badge badge-danger badge-pill"><?php echo $_messages_count; ?></span>
                                <?php endif; ?>
                            </button>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0" aria-labelledby="page-header-notifications-dropdown">
                                <div class="p-3">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <h6 class="m-0" key="t-notifications"> 站内消息 </h6>
                                        </div>
                                        <div class="col-auto">
                                            <a href="#!" id="readAllMessage" class="small" key="t-view-all"> 全部已读</a>
                                        </div>
                                    </div>
                                </div>
                                <div data-simplebar="" style="max-height: 230px;">


                                    <?php foreach($_messages as $message): ?>
                                    <a href="<?php echo url('message/index'); ?>" class="text-reset notification-item">
                                        <div class="media">
                                            <div class="media-body">
                                                <h6 class="mt-0 mb-1"><?php echo $message['title']; ?></h6>
                                                <div class="font-size-12 text-muted">
                                                    <p class="mb-1"><?php echo $message['content']; ?></p>
                                                    <p class="mb-0"><i class="mdi mdi-clock-outline"></i><span key="t-min-ago"><?php echo date('Y-m-d H:i:s',$message['create_at']); ?></span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <?php endforeach; ?>

                                </div>
                                <div class="p-2 border-top">
                                    <a class="btn btn-sm btn-link font-size-14 btn-block text-center" href="<?php echo url('message/index'); ?>">
                                        <i class="mdi mdi-arrow-right-circle mr-1"></i> <span key="t-view-more">查看全部..</span> 
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="rounded-circle header-profile-user" src="//q1.qlogo.cn/g?b=qq&nk=<?php echo $_user['qq']; ?>&s=100&t=" alt="<?php echo $_user['username']; ?>">
                                <span class="d-none d-xl-inline-block ml-1" key="t-<?php echo $_user['username']; ?>"><?php echo $_user['username']; ?></span>
                                <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <!-- item-->
                                <a class="dropdown-item" href="<?php echo url('user/settings'); ?>"><i class="bx bx-user font-size-16 align-middle mr-1"></i> <span key="t-商户设置">商户设置</span></a>
                                <a class="dropdown-item d-block" href="<?php echo url('user/password'); ?>"><i class="bx bx-wrench font-size-16 align-middle mr-1"></i> <span key="t-修改密码">修改密码</span></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-danger" href="/logout"><i class="bx bx-power-off font-size-16 align-middle mr-1 text-danger"></i> <span key="t-退出登录">退出登录</span></a>
                            </div>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                                <i class="bx bx-cog bx-spin pt-1"></i>
                            </button>
                        </div>

                    </div>
                </div>
            </header>

            <!-- ========== Left Sidebar Start ========== -->
            <div class="vertical-menu">

                <div data-simplebar="" class="h-100">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <!-- Left Menu Start -->
                        <ul class="metismenu list-unstyled" id="side-menu">


                            <?php foreach($_navmenus as $menu): if($menu['is_link']==0): ?>
                            <li class="menu-title" key="t-<?php echo $menu['title']; ?>"><?php echo $menu['title']; ?></li>
                            <?php endif; foreach($menu['child'] as $child): if($child['is_link']==1): ?>
                            <li>
                                <a href="<?php echo url($child['url']); ?>" class="waves-effect">
                                    <i class="<?php echo $child['icon']; ?>"></i>
                                    <span key="t-<?php echo $child['title']; ?>"><?php echo $child['title']; ?></span>
                                </a>
                            </li>
                            <?php else: ?>
                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="<?php echo $child['icon']; ?>"></i>
                                    <span key="t-<?php echo $child['title']; ?>"><?php echo $child['title']; ?></span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <?php foreach($child['child'] as $childchild): ?>
                                    <li><a href="<?php echo url($childchild['url']); ?>" key="t-<?php echo $childchild['title']; ?>"><?php echo $childchild['title']; ?></a></li>
                                    <?php endforeach; ?>
                                </ul>
                            </li>
                            <?php endif; endforeach; endforeach; ?>

                        </ul>
                    </div>
                    <!-- Sidebar -->
                </div>
            </div>
            <!-- Left Sidebar End -->



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="main-content">

                

<div class="page-content">
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0 font-size-18"><?php echo $_title; ?></h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">后台管理</a></li>
                            <li class="breadcrumb-item active"><?php echo $_title; ?></li>
                        </ol>
                    </div>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">

                        <form id="form1" class="form-horizontal" role="form" action="" method="post">
                            <input type="hidden" name="id" value="<?php echo htmlentities((isset($goods['id']) && ($goods['id'] !== '')?$goods['id']:'')); ?>">
                            <div class="form-group row">
                                <label for="cate_id" class="col-md-2 col-form-label">商品分类</label>
                                <div class="col-md-4">
                                    <select id="cate_id" name="cate_id" class="form-control select2" required>
                                        <?php foreach($categorys as $v): ?>
                                        <option value="<?php echo htmlentities($v['id']); ?>" <?php if(isset($goods) && $goods['cate_id']==$v['id']): ?>selected<?php endif; ?>><?php echo $v['name']; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">请选择商品分类</p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="theme" class="col-md-2 col-form-label">页面风格</label>
                                <div class="col-md-4">
                                    <select id="theme" name="theme" class="form-control select2" required>
                                        <?php foreach(config('pay_themes') as $theme): ?>
                                        <option value="<?php echo htmlentities($theme['alias']); ?>" <?php if(isset($goods) && $goods['theme']==$theme['alias']): ?>selected<?php endif; ?>><?php echo $theme['name']; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">请选择购买时的页面风格</p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="name" class="col-md-2 col-form-label">商品名称</label>
                                <div class="col-md-4">
                                    <input id="name" name="name" type="text" class="form-control" placeholder="商品名称" value="<?php echo htmlentities((isset($goods['name']) && ($goods['name'] !== '')?$goods['name']:'')); ?>">
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">好的名字有利于销售哦！</p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="price" class="col-md-2 col-form-label">商品价格</label>
                                <div class="col-md-4">
                                    <input id="price" name="price" type="text" class="form-control" placeholder="商品价格" value="<?php echo htmlentities((isset($goods['price']) && ($goods['price'] !== '')?$goods['price']:'')); ?>">
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">商品对外出售的价格即零售价格！</p>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="can_proxy" class="col-md-2 col-form-label">开启代理销售</label>
                                <div class="col-md-4 d-flex align-items-center">

                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="0" type="radio" id="can_proxy0" name="can_proxy" class="custom-control-input" <?php if(isset($goods)): if($goods['can_proxy']==0): ?>checked<?php endif; else: ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="can_proxy0">关闭</label>
                                    </div>

                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input  value="1" type="radio" id="can_proxy1" name="can_proxy" class="custom-control-input" <?php if(isset($goods) && $goods['can_proxy']==1): ?>checked<?php endif; ?>>
                                                <label class="custom-control-label" for="can_proxy1">开启</label>
                                    </div>

                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">代理商品通过密钥或授权码完成对接。</p>
                                </div>
                            </div>

                            <div class="form-group row block-agent_type" <?php if(!isset($goods) || $goods['can_proxy']==0): ?>style="display:none"<?php endif; ?>>
                                 <label for="proxy_price" class="col-md-2 col-form-label">代理成本价</label>
                                <div class="col-md-4">
                                    <input id="proxy_price" name="proxy_price" type="text" class="form-control"  value="<?php echo htmlentities((isset($goods['proxy_price']) && ($goods['proxy_price'] !== '')?$goods['proxy_price']:'')); ?>" autocomplete="off">
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">代理成本价，修改会直接影响商家代理商品的价格，如5元改为6元，则代理该商品的所有代理的终端售价均增加1元。</p>
                                </div>
                            </div>
                            <div class="form-group row block-agent_type" <?php if(!isset($goods) || $goods['can_proxy']==0): ?>style="display:none"<?php endif; ?>>
                                 <label for="proxy_price_add" class="col-md-2 col-form-label">代理最低加价</label>
                                <div class="col-md-4">
                                    <input id="proxy_price_add" name="proxy_price_add" type="text" class="form-control"  value="<?php echo htmlentities((isset($goods['proxy_price_add']) && ($goods['proxy_price_add'] !== '')?$goods['proxy_price_add']:'')); ?>" autocomplete="off">
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">若设置为1, 代理则最低加价1块钱出售（控价）</p>
                                </div>
                            </div>

                            <div class="form-group row block_wholesale_discount">
                                <label for="wholesale_discount" class="col-md-2 col-form-label">批发优惠</label>
                                <div class="col-md-4 d-flex align-items-center">
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input  value="0" type="radio" id="wholesale_discount2" name="wholesale_discount" class="custom-control-input"  <?php if(isset($goods)): if($goods['wholesale_discount']==0): ?>checked<?php endif; else: ?>checked<?php endif; ?>>
                                                <label class="custom-control-label" for="wholesale_discount2">不使用</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="1" type="radio" id="wholesale_discount1" name="wholesale_discount" class="custom-control-input" <?php if(isset($goods) && $goods['wholesale_discount']==1): ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="wholesale_discount1">使用</label>
                                    </div>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">是否设置批发购买时使用批发价格！</p>
                                </div>
                            </div>
                            <div class="form-group row block-wholesale_discount" <?php if(!isset($goods) || $goods['wholesale_discount']==0): ?>style="display:none"<?php endif; ?>>
                                 <label for="block-discount_list" class="col-md-2 col-form-label"></label>
                                <div class="col-md-4">
                                    <div class="block-discount_list" id="block-discount_list">
                                        <?php if(isset($goods)): foreach($goods['wholesale_discount_list'] as $v): ?>
                                        <div class="form-group row discount_item">
                                            <div class="col-md-3">
                                                <input name="wholesale_discount_list[num][]" type="number" class="form-control" value="<?php echo htmlentities($v['num']); ?>" min=0>
                                            </div>
                                            <div class="col-md-1">
                                                张
                                            </div>
                                            <div class="col-md-3">
                                                <input name="wholesale_discount_list[price][]" type="text" class="form-control" value="<?php echo htmlentities($v['price']); ?>">
                                            </div>
                                            <div class="col-md-1">
                                                元
                                            </div>
                                            <div class="col-md-4">
                                                <button type="button" class="btn btn-danger waves-effect waves-light btn-sm" onclick="del_discount_item(this)">删除</button>
                                            </div>
                                        </div>
                                        <?php endforeach; endif; ?>
                                    </div>
                                    <button type="button" class="btn btn-primary waves-effect waves-light btn-sm" onclick="add_discount_item()"><i class="bx bx-plus-circle"></i> 添加优惠</button>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">优惠价格为单价，并不是商品总价哦！</p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="sms_payer" class="col-md-2 col-form-label">短信费用</label>

                                <div class="col-md-4 d-flex align-items-center">
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input  value="0" type="radio" id="sms_payer1" name="sms_payer" class="custom-control-input"  <?php if(isset($goods)): if($goods['sms_payer']==0): ?>checked<?php endif; else: ?>checked<?php endif; ?>>
                                                <label class="custom-control-label" for="sms_payer1">买家承担</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="1" type="radio" id="sms_payer2" name="sms_payer" class="custom-control-input" <?php if(isset($goods) && $goods['sms_payer']==1): ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="sms_payer2">商户承担</label>
                                    </div>
                                </div>

                            </div>

                            <div class="form-group row">
                                <label for="cost_price" class="col-md-2 col-form-label">成本价</label>
                                <div class="col-md-4">
                                    <input id="cost_price" name="cost_price" type="text" class="form-control" placeholder="成本价" value="<?php echo htmlentities((isset($goods['cost_price']) && ($goods['cost_price'] !== '')?$goods['cost_price']:0)); ?>">
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">成本价，方便统计！</p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="limit_quantity" class="col-md-2 col-form-label">起购数量</label>
                                <div class="col-md-4">
                                    <input id="limit_quantity" name="limit_quantity" type="number" class="form-control" placeholder="起购数量" value="<?php echo htmlentities((isset($goods['limit_quantity']) && ($goods['limit_quantity'] !== '')?$goods['limit_quantity']:1)); ?>" min=1>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">每次购买最少购买多少件！</p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="max_quantity" class="col-md-2 col-form-label">限购数量</label>
                                <div class="col-md-4">
                                    <input id="max_quantity" name="max_quantity" type="number" class="form-control" placeholder="限购数量，0不限制" value="<?php echo htmlentities((isset($goods['max_quantity']) && ($goods['max_quantity'] !== '')?$goods['max_quantity']:0)); ?>">
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">每次购买最多购买多少件，0不限制！</p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="inventory_notify" class="col-md-2 col-form-label">库存预警</label>
                                <div class="col-md-4">
                                    <input id="inventory_notify" name="inventory_notify" type="number" class="form-control" placeholder="库存预警" value="<?php echo htmlentities((isset($goods['inventory_notify']) && ($goods['inventory_notify'] !== '')?$goods['inventory_notify']:0)); ?>" min=0>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">为0表示不报警,设置后请确保邮箱正确，否则无法接收邮件</p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="card_order" class="col-md-2 col-form-label">售卡顺序</label>

                                <div class="col-md-4 d-flex align-items-center">
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input  value="0" type="radio" id="card_order1" name="card_order" class="custom-control-input" <?php if(isset($goods)): if($goods['card_order']==0): ?>checked<?php endif; else: ?>checked<?php endif; ?>>
                                                <label class="custom-control-label" for="card_order1">先售老卡</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="1" type="radio" id="card_order2" name="card_order" class="custom-control-input"  <?php if(isset($goods) && $goods['card_order']==1): ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="card_order2">先售新卡</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="2" type="radio" id="card_order3" name="card_order" class="custom-control-input"  <?php if(isset($goods) && $goods['card_order']==2): ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="card_order3">随机售卡</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="3" type="radio" id="card_order4" name="card_order" class="custom-control-input"  <?php if(isset($goods) && $goods['card_order']==3): ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="card_order4"><b>自助选号</b></label>
                                    </div>
                                </div>

                            </div>


                            <div class="form-group row block_selectcard_fee"  <?php if(!isset($goods) || $goods['card_order']!=3): ?>style="display:none"<?php endif; ?>>
                                 <label for="selectcard_fee" class="col-md-2 col-form-label">自助选号费</label>
                                <div class="col-md-4">
                                    <input id="limit_quantity" name="selectcard_fee" type="text" class="form-control" placeholder="选号费" value="<?php echo htmlentities((isset($goods['selectcard_fee']) && ($goods['selectcard_fee'] !== '')?$goods['selectcard_fee']:0)); ?>">
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">自助选号功能额外支出的费用，系统限制最低<?php echo plugconf('selectcard', 'selectcard_fee_min'); ?>元，平台需分成<?php echo plugconf('selectcard', 'selectcard_fee_platform_rate'); ?>%</p>
                                </div>
                            </div>


                            <div class="form-group row block_coupon_type" >
                                <label for="coupon_type" class="col-md-2 col-form-label">优惠券</label>

                                <div class="col-md-4 d-flex align-items-center">
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input  value="1" type="radio" id="coupon_type1" name="coupon_type" class="custom-control-input"  <?php if(isset($goods) && $goods['coupon_type']==1): ?>checked<?php endif; ?>>
                                                <label class="custom-control-label" for="coupon_type1">支持</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="0" type="radio" id="coupon_type2" name="coupon_type" class="custom-control-input"  <?php if(isset($goods)): if($goods['coupon_type']==0): ?>checked<?php endif; else: ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="coupon_type2">不支持</label>
                                    </div>
                                </div>

                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">是否支持优惠券</p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="sold_notify" class="col-md-2 col-form-label">售出通知</label>
                                <div class="col-md-4 d-flex align-items-center">
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="0" type="radio" id="sold_notify2" name="sold_notify" class="custom-control-input"  <?php if(isset($goods)): if($goods['sold_notify']==0): ?>checked<?php endif; else: ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="sold_notify2">关闭</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input  value="1" type="radio" id="sold_notify1" name="sold_notify" class="custom-control-input"  <?php if(isset($goods) && $goods['sold_notify']==1): ?>checked<?php endif; ?>>
                                                <label class="custom-control-label" for="sold_notify1">开启</label>
                                    </div>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">开启后，成功售卡将会发送邮件通知</p>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="inventory_notify_type" class="col-md-2 col-form-label">通知方式</label>

                                <div class="col-md-4 d-flex align-items-center">
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input  value="1" type="radio" id="inventory_notify_type1" name="inventory_notify_type" class="custom-control-input"  <?php if(isset($goods)): if($goods['inventory_notify_type']==1): ?>checked<?php endif; else: ?>checked<?php endif; ?>>
                                                <label class="custom-control-label" for="inventory_notify_type1">站内信</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="2" type="radio" id="inventory_notify_type2" name="inventory_notify_type" class="custom-control-input"   <?php if(isset($goods) && $goods['inventory_notify_type']==2): ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="inventory_notify_type2">邮件</label>
                                    </div>
                                </div>

                            </div>

                            <div class="form-group row">
                                <label for="take_card_type" class="col-md-2 col-form-label">提卡密码</label>
                                <div class="col-md-4 d-flex align-items-center">
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="0" type="radio" id="take_card_type3" name="take_card_type" class="custom-control-input"  <?php if(isset($goods)): if($goods['take_card_type']==0): ?>checked<?php endif; else: ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="take_card_type3">关闭</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="2" type="radio" id="take_card_type2" name="take_card_type" class="custom-control-input"  <?php if(isset($goods) && $goods['take_card_type']==2): ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="take_card_type2">选填</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input  value="1" type="radio" id="take_card_type1" name="take_card_type" class="custom-control-input"  <?php if(isset($goods) && $goods['take_card_type']==1): ?>checked<?php endif; ?>>
                                                <label class="custom-control-label" for="take_card_type1">必填</label>
                                    </div>
                                </div>

                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">开启后，购买页面会提示买家填写取卡密码</p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="visit_type" class="col-md-2 col-form-label">访问密码</label>
                                <div class="col-md-4 d-flex align-items-center">
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input value="0" type="radio" id="visit_type2" name="visit_type" class="custom-control-input"  <?php if(isset($goods)): if($goods['visit_type']==0): ?>checked<?php endif; else: ?>checked<?php endif; ?>>
                                               <label class="custom-control-label" for="visit_type2">关闭</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline mr-4">
                                        <input  value="1" type="radio" id="visit_type1" name="visit_type" class="custom-control-input" <?php if(isset($goods) && $goods['visit_type']==1): ?>checked<?php endif; ?>>
                                                <label class="custom-control-label" for="visit_type1">开启</label>
                                    </div>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">留空为不开启，若开启后商品购买页面将提示输入设置的密码才能继续访问</p>
                                </div>
                            </div>

                            <div class="form-group row block-visit_password" <?php if(!isset($goods) || $goods['visit_type']==0): ?>style="display:none"<?php endif; ?>>
                                 <label for="visit_password" class="col-md-2 col-form-label">设置密码</label>
                                <div class="col-md-4">
                                    <input id="visit_password" name="visit_password" type="text" class="form-control" placeholder="" value="<?php echo htmlentities((isset($goods['visit_password']) && ($goods['visit_password'] !== '')?$goods['visit_password']:'')); ?>">
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">设置密码后，请牢记该密码！</p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="contact_limit" class="col-md-2 col-form-label">客户信息</label>
                                <div class="col-md-4">
                                    <select id="contact_limit" name="contact_limit" class="form-control select2" required>
                                        <option value="default" <?php if(isset($goods) && $goods['contact_limit']==='default'): ?>selected<?php endif; ?>>默认</option>
                                        <option value="any" <?php if(isset($goods) && $goods['contact_limit']==='any'): ?>selected<?php endif; ?>>任意字符</option>
                                        <option value="qq" <?php if(isset($goods) && $goods['contact_limit']==='qq'): ?>selected<?php endif; ?>>QQ号码</option>
                                        <option value="email" <?php if(isset($goods) && $goods['contact_limit']==='email'): ?>selected<?php endif; ?>>邮箱账号</option>
                                        <option value="mobile" <?php if(isset($goods) && $goods['contact_limit']==='mobile'): ?>selected<?php endif; ?>>手机号码</option>
                                    </select>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">客户下单时输入的联系方式或充值账号格式限制</p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="content" class="col-md-2 col-form-label">商品说明</label>
                                <div class="col-md-4">
                                    <textarea class='d-none' id="content" name="content"></textarea>
                                    <div id="summernote-content"><?php echo removeXSS(htmlspecialchars_decode((isset($goods['content']) && ($goods['content'] !== '')?$goods['content']:''))); ?></div>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">商品说明将显示在商品购买页面</p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="remark" class="col-md-2 col-form-label">使用说明</label>
                                <div class="col-md-4">
                                    <textarea id="remark" name="remark" placeholder="建议填写该商品的使用方法，文字不超过200字" class="form-control" rows="5" maxlength="200"><?php echo (isset($goods['remark']) && ($goods['remark'] !== '')?$goods['remark']:''); ?></textarea>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">使用说明将显示在订单查询结果中，一般设置售后QQ群，或者下载地址类</p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="sort" class="col-md-2 col-form-label">商品排序</label>
                                <div class="col-md-4">
                                    <input id="sort" name="sort" type="number" class="form-control" placeholder="商品排序" value="<?php echo htmlentities((isset($goods['sort']) && ($goods['sort'] !== '')?$goods['sort']:0)); ?>" min=0>
                                </div>
                                <div class="col-md-6 d-flex align-items-center">
                                    <p class="text-muted mb-0">数字越大越靠前！</p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-2 col-form-label"></label>
                                <div class="col-md-4 text-center">
                                    <button   class="btn btn-primary waves-effect waves-light btn-submit"><i class="bx bx-check-square mr-1"></i>确认提交</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!-- container-fluid -->
</div>
<!-- End Page-content -->






                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <script>document.write(new Date().getFullYear())</script> © 当前网站使用【<?php echo sysconf('app_name'); ?>】强力驱动。
                            </div>
                            <div class="col-sm-6">
                                <div class="text-sm-right d-none d-sm-block">
                                    Design & Develop by Jingfaka
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- end main content-->

        </div>
        <!-- END layout-wrapper -->

        <!-- Right Sidebar -->
        <div class="right-bar">
            <div data-simplebar="" class="h-100">
                <div class="rightbar-title px-3 py-4">
                    <a href="javascript:void(0);" class="right-bar-toggle float-right">
                        <i class="mdi mdi-close noti-icon"></i>
                    </a>
                    <h6 class="m-0 font-weight-bold">主题设置</h6>
                </div>

                <!-- Settings -->
                <hr class="mt-0">
                <h6 class="text-center mb-0">选择主题</h6>

                <div class="p-4">
                    <div class="mb-2">
                        <img src="/static/merchant/default/images/layouts/layout-1.jpg" class="img-fluid img-thumbnail" alt="">
                    </div>
                    <div class="custom-control custom-switch mb-3">
                        <input type="checkbox" name="template-switch" value="default" class="custom-control-input theme-choice" id="light-mode-switch" <?php if($_user['pc_template']=="default"): ?>checked=""<?php endif; ?>>
                               <label class="custom-control-label" for="light-mode-switch">垂直布局</label>
                    </div>

                    <div class="mb-2">
                        <img src="/static/merchant/default/images/layouts/layout-2.jpg" class="img-fluid img-thumbnail" alt="">
                    </div>
                    <div class="custom-control custom-switch mb-3">
                        <input type="checkbox" name="template-switch" value="horizontal" class="custom-control-input theme-choice" id="dark-mode-switch" <?php if($_user['pc_template']=="horizontal"): ?>checked=""<?php endif; ?>>
                               <label class="custom-control-label" for="dark-mode-switch">水平布局</label>
                    </div>
                </div>
            </div> <!-- end slimscroll-menu-->
        </div>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- JAVASCRIPT -->
        <script src="/static/merchant/default/libs/jquery/jquery.min.js"></script>
        <script src="/static/merchant/default/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="/static/merchant/default/libs/metismenu/metisMenu.min.js"></script>
        <script src="/static/merchant/default/libs/simplebar/simplebar.min.js"></script>
        <script src="/static/merchant/default/libs/node-waves/waves.min.js"></script>
        <script src="/static/merchant/default/libs/jquery-confirm/js/jquery-confirm.js"></script>
        <script src="/static/merchant/default/libs/layer/layer.js"></script>
        <script src="/static/merchant/default/libs/select2/js/select2.min.js"></script>
        <script src="/static/merchant/default/libs/moment/moment.js"></script>
        <script src="/static/merchant/default/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
        <script src="/static/merchant/default/libs/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="/static/merchant/default/libs/toastr/build/toastr.min.js"></script>
        <script>
                                    $(".select2").select2();
                                    $(document).ready(function () {

                                        $('#readAllMessage').on('click', function () {

                                            $.confirm({
                                                title: '温馨提示',
                                                content: '确定要全部已读？',
                                                type: 'red',
                                                typeAnimated: true,
                                                buttons: {
                                                    tryAgain: {
                                                        text: '确定',
                                                        btnClass: 'btn-red',
                                                        action: function () {
                                                            var loading = layer.load(1, {shade: [0.1, '#fff']});
                                                            $.ajax({
                                                                type: 'post',
                                                                url: "<?php echo url('message/allRead'); ?>",
                                                                dataType: 'json',
                                                                success: function (info) {
                                                                    layer.close(loading);
                                                                    if (info.code == 1) {
                                                                        location.reload();
                                                                    } else {
                                                                        $.alert({
                                                                            title: '温馨提示!',
                                                                            content: info.msg
                                                                        });
                                                                    }
                                                                }
                                                            });
                                                        }
                                                    },
                                                    cancel: {
                                                        text: '取消',
                                                    }
                                                }
                                            });
                                        });
                                    });
                                    $("input[name='template-switch']").on("change", function (e) {
                                        $("input[name='template-switch']").prop("checked", false);
                                        $(this).prop("checked", true);

                                        var template = $(this).val();
                                        var loading = layer.load(1, {shade: [0.1, '#fff']});
                                        $.ajax({
                                            type: 'post',
                                            url: "<?php echo url('user/set_template'); ?>",
                                            data: {template: template, platform: 'pc'},
                                            dataType: 'json',
                                            success: function (info) {
                                                layer.close(loading);
                                                if (info.code != 1) {
                                                    $.alert({
                                                        title: '温馨提示!',
                                                        content: info.msg
                                                    });
                                                } else {
                                                    location.reload();
                                                }
                                            }
                                        });
                                    });
        </script>
        <script>
            $('.input-daterange-datepicker').daterangepicker({
                buttonClasses: ['btn', 'btn-sm'],
                applyClass: 'btn-success',
                cancelClass: 'btn-light',
                locale: {
                    applyLabel: '应用',
                    cancelLabel: '取消',
                    daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                    monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十月', '十二月'],
                    firstDay: 1
                }

            });
        </script>
        
<script src="/static/merchant/default/libs/summernote/summernote-bs4.min.js"></script>
<script src="/static/merchant/default/libs/summernote/lang/summernote-zh-CN.js"></script>
<script>

                                        $(document).ready(function () {
                                            $('#summernote-content').summernote({
                                                height: 240,
                                                minHeight: null,
                                                maxHeight: null,
                                                lang: 'zh-CN',
                                                toolbar: [
                                                    ['operate', ['undo', 'redo']],
                                                    ['magic', ['style']],
                                                    ['style', ['bold', 'italic', 'underline', 'clear']],
                                                    ['para', ['height', 'fontsize', 'ul', 'ol', 'paragraph']],
                                                    ['font', ['strikethrough', 'superscript', 'subscript']],
                                                    ['color', ['color']],
                                                    ['insert', ['picture', 'link', 'hr']],
                                                    ['codeview', ['codeview']],
                                                ],
                                                callbacks: {
                                                    onImageUpload: function (files) {
                                                        sendFile(files[0]);
                                                    }
                                                }
                                            });
                                            function sendFile(files) {
                                                data = new FormData();
                                                data.append("file", files);
                                                $.ajax({
                                                    data: data,
                                                    dataType: 'json',
                                                    type: "POST",
                                                    url: "<?php echo url('Plugin/uploadImg'); ?>", //上传路径
                                                    cache: false,
                                                    contentType: false,
                                                    processData: false,
                                                    success: function (data) {
                                                        if (data.code === 1)
                                                        {
                                                            $('#summernote-content').summernote('insertImage', data.data.src);
                                                        } else {
                                                            layer.msg(data.msg);
                                                        }
                                                    },
                                                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                                                        layer.msg('上传失败');
                                                    }
                                                });
                                            }
                                        });

                                        $('[name="card_order"]').change(function () {
                                            var status = $(this).val();
                                            if (status == 3) {
                                                $('.block_selectcard_fee').slideDown();
                                            } else {
                                                $('.block_selectcard_fee').slideUp();
                                            }
                                        });

                                        $('[name="visit_type"]').change(function () {
                                            var status = $(this).val();
                                            if (status == 1) {
                                                $('.block-visit_password').slideDown();
                                            } else {
                                                $('.block-visit_password').slideUp();
                                            }
                                        });
                                        $('[name="wholesale_discount"]').change(function () {
                                            var status = $(this).val();
                                            if (status == 1) {
                                                $('.block-wholesale_discount').slideDown();
                                            } else {
                                                $('.block-wholesale_discount').slideUp();
                                            }
                                        });
                                        $('[name="can_proxy"]').change(function () {
                                            if ($(this).val() == 1) {
                                                $('.block-agent_type').slideDown();
                                            } else {
                                                $('.block-agent_type').slideUp();
                                            }
                                        });
                                        function del_discount_item(obj) {
                                            $(obj).parents('.discount_item').remove();
                                        }
                                        function add_discount_item() {
                                            var html = '<div class="form-group row discount_item d-flex align-items-center"><div class="col-md-3"><input name="wholesale_discount_list[num][]" type="number" class="form-control" value="" min=0></div><div class="col-md-1">张</div><div class="col-md-3"><input name="wholesale_discount_list[price][]" type="text" class="form-control" value=""></div><div class="col-md-1">元</div><div class="col-md-4"><button type="button" class="btn btn-danger waves-effect waves-light btn-sm" onclick="del_discount_item(this)">删除</button></div></div>';
                                            $('.block-discount_list').append($(html));
                                        }
                                        $('.btn-submit').click(function () {

                                            var good_name = $("form").find("input[name='name']").val();
                                            if (!good_name) {
                                                $.alert('商品名称不能为空!');
                                                return false;
                                            }
                                            var good_price = $("form").find("input[name='price']").val();
                                            if (!good_price) {
                                                $.alert('商品价格不能为空!');
                                                return false;
                                            }
                                            $('#content').html($('#summernote-content').summernote('code'));
                                            var loading = layer.load(1, {shade: [0.1, '#fff']});
                                            $.ajax({
                                                url: "<?php echo url('goods/add'); ?>",
                                                type: 'post',
                                                data: $('#form1').serialize(),
                                                success: function (info) {
                                                    layer.close(loading);

                                                    if (info.code != 1) {
                                                        $.alert(info.msg);
                                                    } else {
                                                        $.confirm({title: '提示!', content: info.msg,
                                                            type: 'green',
                                                            typeAnimated: true,
                                                            buttons: {
                                                                tryAgain: {
                                                                    text: '返回',
                                                                    btnClass: 'btn-light',
                                                                    action: function () {
                                                                        location.href = "<?php echo url('goods/index'); ?>";
                                                                    }
                                                                },
                                                                addStorage: {
                                                                    text: '去添加库存',
                                                                    btnClass: 'btn-primary',
                                                                    action: function () {
                                                                         location.href = "<?php echo url('goods_card/add'); ?>?goods_id=" + info.data.goods_id;
                                                                    }
                                                                },
                                                            }
                                                        });
                                                    }

                                                },
                                                error: function (xhr, textStatus, errorThrown) {
                                                    layer.close(loading);
                                                }
                                            });
                                            return false;
                                        })
</script>


        <!-- App js -->
        <script src="/static/merchant/default/js/app.js"></script>

        <?php if(!(empty($common_announce) || (($common_announce instanceof \think\Collection || $common_announce instanceof \think\Paginator ) && $common_announce->isEmpty()))): ?>
        <div id="common_title" style="display: none"><?php echo $common_announce['title']; ?></div>
        <div id="common_announce" style="display: none"><div style="padding:15px"><?php echo htmlspecialchars_decode($common_announce['content']); ?></div></div>
        <script>
            layer.open({
                type: 1,
                fix: false,
                maxmin: true,
                shadeClose: false,
                area: ['680px', '400px'],
                shade: 0.4,
                title: $('#common_title').html(),
                content: $('#common_announce').html(),
                success: function (layero, index) {
                    layer.iframeAuto(index);
                }
            });
        </script>
        <?php endif; ?>
    </body>

</html>