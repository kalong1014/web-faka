<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:83:"/www/wwwroot/www.811192.xyz/application/templates/pc/admin/default/index/index.html";i:1646323578;s:76:"/www/wwwroot/www.811192.xyz/application/templates/pc/admin/default/main.html";i:1682351970;s:75:"/www/wwwroot/www.811192.xyz/application/templates/pc/admin/default/top.html";i:1744484126;s:76:"/www/wwwroot/www.811192.xyz/application/templates/pc/admin/default/left.html";i:1646323578;}*/ ?>
<!DOCTYPE html>
<html lang="zh-cn">
    <head>
        <meta charset="utf-8">
        <meta name="renderer" content="webkit"/>
        <title><?php echo (isset($title) && ($title !== '')?$title:''); if(!empty($title)): ?> · <?php endif; ?><?php echo sysconf('site_name'); ?></title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="shortcut icon" href="<?php echo sysconf('browser_icon'); ?>" />
        <link rel="stylesheet" href="/static/plugs/awesome/css/font-awesome.min.css?ver=<?php echo date('YmdH'); ?>">
        <link rel="stylesheet" href="/static/plugs/bootstrap/css/bootstrap.min.css?ver=<?php echo date('YmdH'); ?>"/>
        <link rel="stylesheet" href="/static/plugs/layui/css/layui.css?ver=<?php echo date('YmdH'); ?>"/>
        <link rel="stylesheet" href="/static/theme/default/css/console.css?ver=<?php echo date('YmdH'); ?>">
        <link rel="stylesheet" href="/static/theme/default/css/animate.css?ver=<?php echo date('YmdH'); ?>">
        <script src="/static/plugs/echarts/echarts.min.js?ver=<?php echo date('YmdH'); ?>"></script>
        <script src="/static/plugs/require/require.js?ver=<?php echo date('YmdH'); ?>"></script>
        <script src="/static/admin/app.js?ver=<?php echo date('YmdH'); ?>"></script>
        <script>window.ROOT_URL='__PUBLIC__';</script>
        <script> console.log('\n' + ' %c  by CoCo  hhttps://coco.0v7.cn/' + '\n\n\n', "color: #fadfa3; background: #030307; padding:5px 0;', 'background: #fadfa3; padding:5px 0;");
            </script>
    </head>
    
    <body>
        
<div class="framework-topbar">
    <div class="console-topbar">
        <div class="topbar-wrap topbar-clearfix">
            <div class="topbar-head topbar-left">
                <a href="<?php echo url('@admin'); ?>" class="topbar-logo topbar-left">
                    <span class="icon-logo">
                        <?php echo sysconf('app_name'); ?> 
                    </span>
                </a>
            </div>
            <?php if(is_array($menus) || $menus instanceof \think\Collection || $menus instanceof \think\Paginator): $i = 0; $__LIST__ = $menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pmenu): $mod = ($i % 2 );++$i;if(empty($pmenu['sub']) || (($pmenu['sub'] instanceof \think\Collection || $pmenu['sub'] instanceof \think\Paginator ) && $pmenu['sub']->isEmpty())): ?>
            <a data-menu-node='m-<?php echo $pmenu['id']; ?>' data-open="<?php echo $pmenu['url']; ?>"
               class="topbar-home-link topbar-btn topbar-left">
                <span><?php if(!(empty($pmenu['icon']) || (($pmenu['icon'] instanceof \think\Collection || $pmenu['icon'] instanceof \think\Paginator ) && $pmenu['icon']->isEmpty()))): ?><i class="<?php echo $pmenu['icon']; ?>"></i><?php endif; ?> <?php echo $pmenu['title']; ?></span>
            </a>
            <?php else: ?>
            <a data-menu-target='m-<?php echo $pmenu['id']; ?>' class="topbar-home-link topbar-btn topbar-left">
                <span><?php if(!(empty($pmenu['icon']) || (($pmenu['icon'] instanceof \think\Collection || $pmenu['icon'] instanceof \think\Paginator ) && $pmenu['icon']->isEmpty()))): ?><i class="<?php echo $pmenu['icon']; ?>"></i><?php endif; ?> <?php echo $pmenu['title']; ?></span>
            </a>
            <?php endif; endforeach; endif; else: echo "" ;endif; ?>
            <div class="topbar-info topbar-right">

                <div class="topbar-left topbar-user">
                    <?php if(session('user')): ?>
                    <div class="dropdown topbar-info-item">
                        <a href="#" class="dropdown-toggle topbar-btn text-center" data-toggle="dropdown">
                            <span class='glyphicon glyphicon-bell'></span> 待处理事件</span>
                            <span class="glyphicon glyphicon-menu-up transition" style="font-size:12px"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="topbar-info-btn">
                                <a data-load="<?php echo url('manage/complaint/index',['status'=>0]); ?>">
                                    <span>投诉待处理 
                                        <?php if($peddingtask['complaint_count']>0): ?>
                                        <b style="color:red"><?php echo $peddingtask['complaint_count']; ?></b>
                                        <?php else: ?>
                                        <b style="color:green"><?php echo $peddingtask['complaint_count']; ?></b>
                                        <?php endif; ?>
                                    </span>
                                </a>
                            </li>
                            <li class="topbar-info-btn">
                                <a data-load="<?php echo url('manage/cash/index',['status'=>0]); ?>">
                                    <span>结算待审核 
                                        <?php if($peddingtask['cash_count']>0): ?>
                                        <b style="color:red"><?php echo $peddingtask['cash_count']; ?></b>
                                        <?php else: ?>
                                        <b style="color:green"><?php echo $peddingtask['cash_count']; ?></b>
                                        <?php endif; ?>
                                    </span>
                                </a>
                            </li>
                            <li class="topbar-info-btn">
                                <a data-load="<?php echo url('manage/user/index',['status'=>0]); ?>">
                                    <span>商户待审核 
                                        <?php if($peddingtask['user_count']>0): ?>
                                        <b style="color:red"><?php echo $peddingtask['user_count']; ?></b>
                                        <?php else: ?>
                                        <b style="color:green"><?php echo $peddingtask['user_count']; ?></b>
                                        <?php endif; ?>
                                    </span>
                                </a>
                            </li>
                            <li class="topbar-info-btn">
                                <a data-load="<?php echo url('manage/goods/pool_list',['status'=>0]); ?>">
                                    <span>商品池待审核 
                                        <?php if($peddingtask['goodspool_count']>0): ?>
                                        <b style="color:red"><?php echo $peddingtask['goodspool_count']; ?></b>
                                        <?php else: ?>
                                        <b style="color:green"><?php echo $peddingtask['goodspool_count']; ?></b>
                                        <?php endif; ?>
                                    </span>
                                </a>
                            </li>
                            <li class="topbar-info-btn">
                                <a data-load="<?php echo url('manage/plugin/poolauth',['status'=>0]); ?>">
                                    <span>浏览全网通申请
                                        <?php if($peddingtask['pluginpool_count']>0): ?>
                                        <b style="color:red"><?php echo $peddingtask['pluginpool_count']; ?></b>
                                        <?php else: ?>
                                        <b style="color:green"><?php echo $peddingtask['pluginpool_count']; ?></b>
                                        <?php endif; ?>
                                    </span>
                                </a>
                            </li>
                            <li class="topbar-info-btn">
                                <a data-load="<?php echo url('manage/plugin/crossauth',['status'=>0]); ?>">
                                    <span>使用跨平台申请 
                                        <?php if($peddingtask['plugincross_count']>0): ?>
                                        <b style="color:red"><?php echo $peddingtask['plugincross_count']; ?></b>
                                        <?php else: ?>
                                        <b style="color:green"><?php echo $peddingtask['plugincross_count']; ?></b>
                                        <?php endif; ?>
                                    </span>
                                </a>
                            </li>

                            <li class="topbar-info-btn">
                                <a data-load="<?php echo url('manage/plugin/custompayauth',['status'=>0]); ?>">
                                    <span>使用自定义支付申请 
                                        <?php if($peddingtask['custompay_count']>0): ?>
                                        <b style="color:red"><?php echo $peddingtask['custompay_count']; ?></b>
                                        <?php else: ?>
                                        <b style="color:green"><?php echo $peddingtask['custompay_count']; ?></b>
                                        <?php endif; ?>
                                    </span>
                                </a>
                            </li>

                            <li class="topbar-info-btn">
                                <a data-load="<?php echo url('manage/article/index'); ?>">
                                    <span>今日结算公告 
                                        <?php if($peddingtask['settlement_count']>0): ?>
                                        <b style="color:green">已发布</b>
                                        <?php else: ?>
                                        <b style="color:red">未发布</b>
                                        <?php endif; ?>
                                    </span>
                                </a>
                            </li>

                        </ul>
                    </div>
                    <?php else: ?>
                    <div class=" topbar-info-item">
                        <a data-href="<?php echo url('@admin/login'); ?>" data-toggle="dropdown" class=" topbar-btn text-center">
                            <span class='glyphicon glyphicon-user'></span> 立即登录 </span>
                        </a>
                    </div>
                    <?php endif; ?>
                </div>

                <a data-reload data-tips-text='刷新' style='width:50px'
                   class=" topbar-btn topbar-left topbar-info-item text-center">
                    <span class='glyphicon glyphicon-refresh'></span>
                </a>

                <a href="/index.php" target="_blank" class="topbar-btn topbar-left topbar-info-item text-center">
                    首页
                </a>

                <a data-tips-text='清除缓存'  data-load="<?php echo url('manage/site/clearcache'); ?>" data-confirm='确定要清除缓存吗？'
                   class=" topbar-btn topbar-left topbar-info-item text-center">
                    清除缓存
                </a>
                <div class="topbar-left topbar-user">
                    <?php if(session('user')): ?>
                    <div class="dropdown topbar-info-item">
                        <a href="#" class="dropdown-toggle topbar-btn text-center" data-toggle="dropdown">
                            <span class='glyphicon glyphicon-user'></span> <?php echo session('user.username'); ?> </span>
                            <span class="glyphicon glyphicon-menu-up transition" style="font-size:12px"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="topbar-info-btn">
                                <a data-modal="<?php echo url('admin/index/pass'); ?>?id=<?php echo session('user.id'); ?>">
                                    <span><i class='glyphicon glyphicon-lock'></i> 修改密码</span>
                                </a>
                            </li>
                            <li class="topbar-info-btn">
                                <a data-modal="<?php echo url('admin/index/info'); ?>?id=<?php echo session('user.id'); ?>">
                                    <span><i class='glyphicon glyphicon-edit'></i> 修改资料</span>
                                </a>
                            </li>
                            <li class="topbar-info-btn">
                                <a data-load="<?php echo url('admin/login/out'); ?>" data-confirm='确定要退出登录吗？'>
                                    <span><i class="glyphicon glyphicon-log-out"></i> 退出登录</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <?php else: ?>
                    <div class=" topbar-info-item">
                        <a data-href="<?php echo url('@admin/login'); ?>" data-toggle="dropdown" class=" topbar-btn text-center">
                            <span class='glyphicon glyphicon-user'></span> 立即登录 </span>
                        </a>
                    </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="framework-body framework-sidebar-mini">
    <div class="framework-sidebar hide">
    <div class="sidebar-content">
        <div class="sidebar-inner">
            <div class="sidebar-fold">
                <span class="glyphicon glyphicon-option-vertical transition"></span>
            </div>
            <?php if(is_array($menus) || $menus instanceof \think\Collection || $menus instanceof \think\Paginator): $i = 0; $__LIST__ = $menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pmenu): $mod = ($i % 2 );++$i;if(!(empty($pmenu['sub']) || (($pmenu['sub'] instanceof \think\Collection || $pmenu['sub'] instanceof \think\Paginator ) && $pmenu['sub']->isEmpty()))): ?>
            <div data-menu-box="m-<?php echo $pmenu['id']; ?>">
                <?php if(is_array($pmenu['sub']) || $pmenu['sub'] instanceof \think\Collection || $pmenu['sub'] instanceof \think\Paginator): $i = 0; $__LIST__ = $pmenu['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?>
                <div class="sidebar-nav main-nav">
                    <?php if(empty($menu['sub']) || (($menu['sub'] instanceof \think\Collection || $menu['sub'] instanceof \think\Paginator ) && $menu['sub']->isEmpty())): ?>
                    <ul class="sidebar-trans">
                        <li class="nav-item">
                            <a data-menu-node='m-<?php echo $pmenu['id']; ?>-<?php echo $menu['id']; ?>' data-open="<?php echo $menu['url']; ?>"
                               class="sidebar-trans">
                                <div class="nav-icon sidebar-trans">
                                    <span class="<?php echo (isset($menu['icon']) && ($menu['icon'] !== '')?$menu['icon']:'fa fa-link'); ?> transition"></span>
                                </div>
                                <span class="nav-title"><?php echo $menu['title']; ?></span>
                            </a>
                        </li>
                    </ul>
                    <?php else: ?>
                    <div class="sidebar-title">
                        <div class="sidebar-title-inner">
                            <span class="sidebar-title-icon fa fa-caret-right transition"></span>
                            <span class="sidebar-title-text"><?php echo $menu['title']; ?></span>
                        </div>
                    </div>
                    <ul class="sidebar-trans" style="display:none" data-menu-node='m-<?php echo $pmenu['id']; ?>-<?php echo $menu['id']; ?>'>
                        <?php if(is_array($menu['sub']) || $menu['sub'] instanceof \think\Collection || $menu['sub'] instanceof \think\Paginator): $i = 0; $__LIST__ = $menu['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$submenu): $mod = ($i % 2 );++$i;?>
                        <li class="nav-item">
                            <a data-menu-node='m-<?php echo $pmenu['id']; ?>-<?php echo $submenu['id']; ?>' data-open="<?php echo $submenu['url']; ?>"
                               class="sidebar-trans">
                                <div class="nav-icon sidebar-trans">
                                    <span class="<?php echo (isset($submenu['icon']) && ($submenu['icon'] !== '')?$submenu['icon']:'fa fa-link'); ?> transition"></span>
                                </div>
                                <span class="nav-title"><?php echo $submenu['title']; ?></span>
                            </a>
                        </li>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                    <?php endif; ?>
                </div>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
            <?php endif; endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </div>
</div>
    <div class="framework-container" style="left:0"></div>
</div>

        
    </body>
    
</html>
