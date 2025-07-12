<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:81:"/www/wwwroot/103.147.12.248/public/../application/admin/view/dashboard/index.html";i:1744031095;s:70:"/www/wwwroot/103.147.12.248/application/admin/view/layout/default.html";i:1681427358;s:67:"/www/wwwroot/103.147.12.248/application/admin/view/common/meta.html";i:1681592148;s:69:"/www/wwwroot/103.147.12.248/application/admin/view/common/script.html";i:1681427358;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">
<meta name="referrer" content="never">
<meta name="robots" content="noindex, nofollow">

<link rel="shortcut icon" href="<?php echo (isset($options['icon']) && ($options['icon'] !== '')?$options['icon']:''); ?>" type="image/png">
<!-- Loading Bootstrap -->
<link href="/assets/css/backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<?php if(\think\Config::get('fastadmin.adminskin')): ?>
<link href="/assets/css/skins/<?php echo \think\Config::get('fastadmin.adminskin'); ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">
<?php endif; ?>

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other   at the end of file. -->
<!--[if lt IE 9]>
  <script src="/assets/js/html5shiv.js"></script>
  <script src="/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config:  <?php echo json_encode($config); ?>
    };
</script>

    </head>

    <body class="inside-header inside-aside <?php echo defined('IS_DIALOG') && IS_DIALOG ? 'is-dialog' : ''; ?>">
        <div id="main" role="main">
            <div class="tab-content tab-addtabs">
                <div id="content">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <section class="content-header hide">
                                <h1>
                                    <?php echo __('Dashboard'); ?>
                                    <small><?php echo __('Control panel'); ?></small>
                                </h1>
                            </section>
                            <?php if(!IS_DIALOG && !\think\Config::get('fastadmin.multiplenav') && \think\Config::get('fastadmin.breadcrumb')): ?>
                            <!-- RIBBON -->
                            <div id="ribbon">
                                <ol class="breadcrumb pull-left">
                                    <?php if($auth->check('dashboard')): ?>
                                    <li><a href="dashboard" class="addtabsit"><i class="fa fa-dashboard"></i> <?php echo __('Dashboard'); ?></a></li>
                                    <?php endif; ?>
                                </ol>
                                <ol class="breadcrumb pull-right">
                                    <?php foreach($breadcrumb as $vo): ?>
                                    <li><a href="javascript:;" data-url="<?php echo $vo['url']; ?>"><?php echo $vo['title']; ?></a></li>
                                    <?php endforeach; ?>
                                </ol>
                            </div>
                            <!-- END RIBBON -->
                            <?php endif; ?>
                            <div class="content">
                                <style>
    .list-group-item{
        /*border-top: unset;*/
        border-left: unset;
        border-right: unset;
    }
    #jiance{
        text-decoration: none;
        margin-left: 15px;
    }
    #jiance:hover{
        text-decoration: underline;
    }
    .card{
        height: 100px;
    }
</style>
    <div class="col-xs-12 col-sm-6 col-md-6">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">广而告之：去后门不易故更改保留广告位</div>
            <div class="panel-body" style="padding: 0;">
                <div class="list-group" style="margin-bottom: 0;">
                    <a href="javascript:;" class="list-group-item">10年老程序接单：专注区块链开发/源码搭建二开/飞机号✈️ ：@fc_pay</a>
                    </div>
            </div>

        </div>
    </div>

    <div class="col-xs-12 col-sm-8 col-md-8" style="margin-bottom: 20px;">
        <div style="background: #fff; padding: 10px 10px 10px 10px;">
            <div class="fixed-table-toolbar">
                <div class="bs-bars pull-left">
                    <div id="toolbar" class="toolbar">
<!--                        <a href="javascript:;" class="btn btn-primary btn-refresh" title="刷新" data-force-refresh="false"><i class="fa fa-refresh"></i> </a>-->
                        <div class="btn-group">
                            <a href="javascript:;" class="btn btn-info btn-shijian active" data-type="today">今天</a>
                            <a href="javascript:;" class="btn btn-info btn-shijian" data-type="zuotian">昨天</a>
                            <a href="javascript:;" class="btn btn-info btn-shijian" data-type="7tian">最近7天</a>
                            <a href="javascript:;" class="btn btn-info btn-shijian" data-type="30tian">最近30天</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="echart" class="btn-refresh" style="height:300px;width:100%;"></div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-4 col-md-4">
<!--        <div style="background: #fff; height: auto;padding-top: 10px;">-->
            <ul class="list-group">
                <li class="list-group-item">
                    <span class="badge" id="add-user"><?php echo $tongji['add_user']; ?></span>
                    新增用户
                </li>
                <li class="list-group-item">
                    <span class="badge" id="order-num"><?php echo $tongji['_order_num']; ?></span>
                    订单数量
                </li>
                <li class="list-group-item">
                    <span class="badge" id="order-money"><?php echo $tongji['_order_money']; ?></span>
                    订单金额
                </li>
                <li class="list-group-item">
                    <span class="badge" id="cost"><?php echo $tongji['_cost']; ?></span>
                    成本支出
                </li>
                <li class="list-group-item">
                    <span class="badge" id="lirun"><?php echo $tongji['_lirun']; ?></span>
                    销售利润
                </li>
            </ul>
<!--        </div>-->
    </div>
</div>

<input type="hidden" value="<?php echo $new_version; ?>" id="new-version" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo htmlentities($site['version']); ?>"></script>
    </body>
</html>
