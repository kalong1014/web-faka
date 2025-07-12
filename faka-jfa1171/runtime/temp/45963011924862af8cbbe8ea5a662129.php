<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:89:"/www/wwwroot/www.811192.xyz/application/templates/pc/merchant/horizontal/goods/index.html";i:1646323578;s:82:"/www/wwwroot/www.811192.xyz/application/templates/pc/merchant/horizontal/base.html";i:1646323578;}*/ ?>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>商户面板 - <?php echo sysconf('site_name'); ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="keywords" content="<?php echo sysconf('site_keywords'); ?>" />
        <meta name="description" content="<?php echo sysconf('site_desc'); ?>" />
        <link rel="shortcut icon" href="<?php echo sysconf('browser_icon'); ?>" />
        <!-- App favicon -->
        
        
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

    <body data-topbar="dark" data-layout="horizontal">

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

                        <button type="button" class="btn btn-sm px-3 font-size-16 d-lg-none header-item waves-effect waves-light" data-toggle="collapse" data-target="#topnav-menu-content">
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

                                <form class="p-3">
                                    <div class="form-group m-0">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
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
                                <i class="bx bx-cog bx-spin"></i>
                            </button>
                        </div>

                    </div>
                </div>
            </header>

            <div class="topnav">
                <div class="container-fluid">
                    <nav class="navbar navbar-light navbar-expand-lg topnav-menu">

                        <div class="collapse navbar-collapse" id="topnav-menu-content">
                            <ul class="navbar-nav">
                                <?php foreach($_navmenus as $menu): ?>
                                <li class="nav-item dropdown">


                                    <?php if($menu['is_link']==1): ?>
                                    <a class="nav-link dropdown-toggle arrow-none" href="<?php echo url($menu['url']); ?>"  role="button" >
                                        <i class="<?php echo $menu['icon']; ?> mr-2"></i><span key="t-<?php echo $menu['title']; ?>"><?php echo $menu['title']; ?></span> 
                                    </a>
                                    <?php else: ?>


                                    <a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-<?php echo $menu['title']; ?>" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="<?php echo $menu['icon']; ?> mr-2"></i><span key="t-<?php echo $menu['title']; ?>"><?php echo $menu['title']; ?></span> <div class="arrow-down"></div>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="topnav-<?php echo $menu['title']; ?>">

                                        <?php foreach($menu['child'] as $child): if($child['is_link']==1): ?>
                                        <a href="<?php echo url($child['url']); ?>" class="dropdown-item" key="t-<?php echo $child['title']; ?>"><?php echo $child['title']; ?></a>
                                        <?php else: ?>

                                        <div class="dropdown">
                                            <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-<?php echo $child['title']; ?>" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span key="t-<?php echo $child['title']; ?>"><?php echo $child['title']; ?></span> <div class="arrow-down"></div>
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="topnav-<?php echo $child['title']; ?>">

                                                <?php foreach($child['child'] as $childchild): ?>
                                                <a href="<?php echo url($childchild['url']); ?>" class="dropdown-item" key="t-<?php echo $childchild['title']; ?>"><?php echo $childchild['title']; ?></a>
                                                <?php endforeach; ?>

                                            </div>
                                        </div>
                                        <?php endif; endforeach; ?>

                                    </div>
                                    <?php endif; ?>
                                </li>
                                <?php endforeach; ?>

                            </ul>
                        </div>
                    </nav>
                </div>
            </div>

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
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row mb-2">
                            <div class="col-sm-auto">
                                <a href="<?php echo url('goods/add'); ?>" class="pull-right btn btn-primary waves-effect waves-light"><i class='bx bx-plus mr-1'></i>添加商品</a>
                            </div>

                            <div class="col-sm-auto">

                                <form class="form-inline" role="form" action="" method="get">
                                    <div class="form-group">
                                        <select name="cate_id" class="form-control select2">
                                            <option value="" <?php if(\think\Request::instance()->get('cate_id')==''): ?>selected<?php endif; ?>>全部分类 </option> 
                                            <?php foreach($categorys as $v): ?>
                                            <option value="<?php echo htmlentities($v['id']); ?>" <?php if(\think\Request::instance()->get('cate_id')==$v['id']): ?>selected<?php endif; ?>><?php echo $v['name']; ?> </option> 
                                            <?php endforeach; ?>
                                        </select>
                                    </div>

                                    <div class="form-group ml-1">
                                        <input name="name" type="text" class="form-control" placeholder="商品名" value="<?php echo htmlentities((\think\Request::instance()->get('name') ?: '')); ?>">
                                    </div>
                                    <button type="submit" class="btn btn-light waves-effect waves-light ml-1"><i class="bx bx-search mr-1"></i>搜索</button>
                                </form>
                            </div>

                            <div class="col-sm-auto">
                                <button onclick="batch_del()" class="btn btn-danger" ><i class="bx bx-trash mr-1"></i>批量删除</button>
                            </div>
                        </div>


                        <div class="table-responsive">
                            <table class="table mb-0">
                                <thead>
                                    <tr>
                                        <th> 
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="select_all">
                                                <label class="custom-control-label" for="select_all"></label>
                                            </div>
                                        </th>
                                        <th>商品名称</th>
                                        <th>商品分类</th>
                                        <th>价格</th>
                                        <th>库存</th>
                                        <th>卖出</th>
                                        <th>上下架</th>
                                        <th>开启代理</th>
                                        <th>创建时间</th>
                                        <th>排序</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php foreach($goodsList as $k=>$v): ?>
                                    <tr>
                                        <td>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input select-checkbox" id="checkbox<?php echo $k; ?>" name="good_id" value="<?php echo htmlentities($v['id']); ?>">
                                                <label class="custom-control-label" for="checkbox<?php echo $k; ?>"></label>
                                            </div>
                                        </td>
                                        <th scope="row">   
                                            <?php echo $v['name']; if($v['wholesale_discount']==1): ?>
                                            <span class="badge badge-pill badge-warning font-size-12" data-toggle="tooltip" data-placement="top" title="批发优惠" data-original-title="批发优惠">批</span>
                                            <?php endif; if($v['coupon_type']==1): ?>
                                            <span class="badge badge-pill badge-success font-size-12" data-toggle="tooltip" data-placement="top" title="支持优惠券" data-original-title="支持优惠券">券</span>
                                            <?php endif; if($v['take_card_type']!=0): ?>
                                            <span class="badge badge-pill badge-primary font-size-12"  data-toggle="tooltip" data-placement="top" title="提卡必填或选填取卡密码" data-original-title="提卡必填或选填取卡密码">取</span>
                                            <?php endif; if($v['visit_type']==1): ?>
                                            <span class="badge badge-pill badge-info font-size-12" data-toggle="tooltip" data-placement="top" title="商品购买页面需要访问密码" data-original-title="商品购买页面需要访问密码">密</span>
                                            <?php endif; ?>
                                        </th>
                                        <td><?php echo (isset($v['category']['name']) && ($v['category']['name'] !== '')?$v['category']['name']:"未分类"); ?></td>
                                        <td><?php echo $v['price']; ?></td>

                                        <td>
                                            <?php echo $v->cards_stock_count; ?>张
                                            <?php if($v->cards_stock_count==0): ?>
                                            <span class="text-danger">缺货</span>
                                            <?php else: ?>
                                            <a href="<?php echo url('goods_card/index',['goods_id'=>$v['id'],'status'=>1]); ?>">查看</a>
                                            <a class="dumpCard" href="javascript:;" data-id="<?php echo $v['id']; ?>" data-goodsname="<?php echo $v['name']; ?>">导出</a>
                                            <a href="javascript:void(0);" onclick="emptied(this, '<?php echo $v['id']; ?>')">清空</a>
                                            <?php endif; ?>
                                        <td>
                                            <?php echo $v->cards_sold_count; ?>张
                                            <a href="<?php echo url('goods_card/index',['goods_id'=>$v['id'],'status'=>2]); ?>">查看</a>
                                            <a href="<?php echo url('goods/dumpCards',['goods_id'=>$v['id'],'status'=>2]); ?>" target="_blank">导出</a>
                                        </td>
                                        <td>
                                            <div class="custom-control custom-switch  mb-3" dir="ltr">
                                                <input onchange="change_status(this, '<?php echo $v['id']; ?>')"  <?php if($v['status']==1): ?>checked<?php endif; ?> type="checkbox" class="custom-control-input" id="customSwitchsizemd<?php echo $k; ?>">
                                                       <label class="custom-control-label" for="customSwitchsizemd<?php echo $k; ?>"></label>
                                            </div>
                                        </td>

                                        <td>
                                            <?php if($v['can_proxy'] == 1): ?>
                                            <span class="badge badge-pill badge-soft-success font-size-12">是</span>
                                            <?php else: ?>
                                            <span class="badge badge-pill badge-soft-danger font-size-12">否</span>
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo date("Y-m-d H:i:s",$v['create_at']); ?>
                                        </td>
                                        <td>
                                            <?php echo $v['sort']; ?>
                                        </td>
                                        <td>

                                            <div class="btn-group btn-group-sm " role="group" aria-label="Basic group">
                                                <button  onclick="$.x_show('分类链接', '<?php echo url('goods/link',['id'=>$v['id']]); ?>', 560)"  class="btn btn-light waves-effect waves-light text-primary">链接</button>
                                                <a href="<?php echo url('goods_card/add',['goods_id'=>$v['id']]); ?>" class="btn btn-light waves-effect waves-light text-primary">加卡</a>
                                                <a href="<?php echo url('goods/edit',['id'=>$v['id']]); ?>" class="btn btn-light waves-effect waves-light text-primary">编辑</a>
                                                <button onclick="del(this, '<?php echo $v['id']; ?>')" class="btn btn-light waves-effect waves-light text-danger">删除</button>
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

    </div>
    <!-- container-fluid -->
</div>
<!-- End Page-content -->
<div class="modal fade" id="exportCard" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title mt-0" >导出卡密</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form id="export_form" class="form-horizontal" method="POST" action="<?php echo url('goods/dumpCards'); ?>" target="_blank">
                    <input type="hidden" id="goods_id" name="goods_id" value="">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">商品名称</label>
                        </div>
                        <div class="col-sm-6">
                            <p id="goodsname" style="padding-top: 5px;"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">导出范围</label>
                        </div>
                        <div class="col-sm-6">
                            <label class="radio-inline">
                                <input type="radio" name="range" value="0" checked> 全部库存的卡密
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="range" value="1"> 导出指定的数量
                            </label>
                        </div>
                    </div>
                    <div class="form-group" id="exportNUm" style="display:none">
                        <div class="col-sm-2">
                            <label class="control-label">导出数量</label>
                        </div>
                        <div class="col-sm-6">
                            <input name="number" type="number" class="form-control" placeholder="请输入正整数">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">是否删除</label>
                        </div>
                        <div class="col-sm-6">
                            <label class="radio-inline">
                                <input type="radio" name="del" value="0" checked> 仅导出不做删除
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="del" value="1"> 导出并删除卡密
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">商品名称</label>
                        </div>
                        <div class="col-sm-6">
                            <label class="radio-inline">
                                <input type="radio" name="need_goods_name" value="1" checked> 导出商品名
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="need_goods_name" value="0"> 不需要商品名
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">导出格式</label>
                        </div>
                        <div class="col-sm-6">
                            <label class="radio-inline">
                                <input type="radio" name="file_type" value="0" checked> EXCEL
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="file_type" value="1"> TXT
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" id="export">确定</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">关闭</button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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
                                                                    if (info.code !== 0) {
                                                                        $.alert({
                                                                            title: '温馨提示!',
                                                                            content: info.msg
                                                                        });
                                                                    } else {
                                                                        location.reload();
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
                                                if (info.code !== 0) {
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
        
<script>

    $('#select_all').click(function () {
        if ($(this).is(':checked')) {
            $('tbody').find('.select-checkbox').each(function () {
                $(this).prop("checked", true)
            })
        } else {
            $('tbody').find('.select-checkbox').each(function () {
                $(this).prop("checked", false)
            })
        }
    });

    function change_status(obj, id) {
        var status = $(obj).prop('checked');
        if (status) {
            status = 1;
        } else {
            status = 0;
        }
        $.post("<?php echo url('goods/changeStatus'); ?>", {
            id: id,
            status: status
        }, function (res) {
            if (res.code != 1) {
                $.alert(res.msg);
                $(obj).prop('checked', false)
                return false;
            }
            if (status == 1) {
                $(obj).prop('checked', true)
            } else {
                $(obj).prop('checked', false)
            }
        });
    }


    function del(obj, id)
    {
        $.confirm({
            title: '确定删除吗？',
            content: '删除的商品将进入回收站！',
            type: 'red',
            typeAnimated: true,
            buttons: {
                tryAgain: {
                    text: '确定',
                    btnClass: 'btn-red',
                    action: function () {
                        var loading = layer.load(1, {shade: [0.1, '#fff']});
                        $.post("<?php echo url('goods/del'); ?>", {
                            id: id
                        }, function (res) {
                            if (res.code != 1) {
                                $.alert(res.msg);
                            } else {
                                $.alert("删除成功");
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

    function emptied(obj, id) {
        $.confirm({
            title: '确定清空该商品所有未售虚拟卡吗？',
            content: '删除的虚拟卡将进入回收站！',
            type: 'red',
            typeAnimated: true,
            buttons: {
                tryAgain: {
                    text: '确定',
                    btnClass: 'btn-red',
                    action: function () {
                        var loading = layer.load(1, {shade: [0.1, '#fff']});
                        $.post("<?php echo url('goods/emptiedCards'); ?>", {
                            id: id
                        }, function (res) {
                            if (res.code != 1) {
                                $.alert(res.msg);
                            } else {
                                $.alert("清空成功");
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

    function batch_del() {
        var ids = new Array();
        $('tbody').find('input[name="good_id"]').each(function () {
            if ($(this).is(':checked')) {
                ids.push($(this).val());
            }
        })
        if (ids.length == 0) {
            $.alert("选择要删除的数据");
            return false;
        }
        $.confirm({
            title: '确定要批量删除吗？',
            content: '删除的商品将进入回收站！',
            type: 'red',
            typeAnimated: true,
            buttons: {
                tryAgain: {
                    text: '确定',
                    btnClass: 'btn-red',
                    action: function () {
                        var loading = layer.load(1, {shade: [0.1, '#fff']});
                        $.post("<?php echo url('goods/batch_del'); ?>", {
                            ids: ids
                        }, function (res) {
                            if (res.code != 1) {
                                $.alert(res.msg);
                            } else {
                                $.alert("删除成功");
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

    $(document).ready(function () {
        $("input[name='range']").change(function () {
            var selectedvalue = $("input[name='range']:checked").val();
            if (selectedvalue == 1) {
                $('#exportNUm').show();
            } else {
                $('#exportNUm').hide();
            }
        });
        $('.dumpCard').click(function () {
            var id = $(this).data('id');
            $('#goods_id').val(id);
            var goodsname = $(this).data('goodsname');
            $('#goodsname').html(goodsname);
            $('#exportCard').modal('show')
        });
        $('#export').click(function () {
            var range = $("input[name='range']");
            var number = $("input[name='number']");
            if (range == 1 && !number) {
                swal('请输入导出数量', '', "error");
                return false;
            }
            $('#export_form').submit();
        });
    });

</script>


        <!-- App js -->
        <script src="/static/merchant/default/js/app.js"></script>

        <?php if(!(empty($common_announce) || (($common_announce instanceof \think\Collection || $common_announce instanceof \think\Paginator ) && $common_announce->isEmpty()))): ?>
        <div id="common_title" style="display: none"><?php echo $common_announce['title']; ?></div>
        <div id="common_announce" style="display: none"><div style="padding:15px"><?php echo removeXSS(htmlspecialchars_decode($common_announce['content'])); ?></div></div>
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
