<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:85:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/index/bgdata.html";i:1646323578;}*/ ?>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            实时平台大数据可视化
        </title>
        <link rel="stylesheet" href="/static/plugs/bgdata/comon.css">
        <script type="text/javascript" src="/static/plugs/bgdata/jquery.js"></script>
        <script type="text/javascript" src="/static/plugs/echarts/echarts.min.js"></script>
        <script type="text/javascript" src="/static/plugs/bgdata/china.js"></script>
        <script type="text/javascript" src="/static/plugs/bgdata/bg.js"></script>
        <script type="text/javascript" src="/static/plugs/bgdata/TweenLite.min.js"></script>
        <script type="text/javascript" src="/static/plugs/bgdata/lem_counter.js"></script>
    </head>
    <body>
        <div class="canvas">

            <div class="bg_content">
                <canvas id="canvas" width="100%" height="100%"></canvas>
            </div>
        </div>
        <div class="loading">
            <div class="loadbox">
                <img src="/static/plugs/bgdata/loading.gif">
                页面加载中...
            </div>
        </div>
        <div style="overflow: hidden;background:rgba(0,0,40,0) ; position: relative; z-index: 2;">
            <div class="mainbox">
                <ul class="clearfix">
                    <li>
                        <div class="boxall" style="height:725px;">
                            <div class="alltitle">
                                平台数据
                            </div>
                            <div class="navboxall">
                                <div class="sycm">
                                    <ul class="clearfix">
                                        <li>
                                            <h2 id="today_sum">
                                                0
                                            </h2>
                                            <span>
                                                今日收款总额
                                            </span>
                                        </li>
                                        <li>
                                            <h2 id="today_paid">
                                                0
                                            </h2>
                                            <span>
                                                今日订单（笔）
                                            </span>
                                        </li>
                                        <li>
                                            <h2 id="yester_sum">
                                                0
                                            </h2>
                                            <span>
                                                昨日收款总额
                                            </span>
                                        </li>
                                        <li>
                                            <h2 id="yester_paid">
                                                0
                                            </h2>
                                            <span>
                                                昨日订单（笔）
                                            </span>
                                        </li>
                                        <li>
                                            <h2 id="today_ucount">
                                                0
                                            </h2>
                                            <span>
                                                今日注册
                                            </span>
                                        </li>
                                        <li>
                                            <h2 id="yester_ucount">
                                                0
                                            </h2>
                                            <span>
                                                昨日注册
                                            </span>
                                        </li>
                                        <li>
                                            <h2 id="all_sum">
                                                0
                                            </h2>
                                            <span>
                                                平台总收款
                                            </span>
                                        </li>
                                        <li>
                                            <h2 id="notpass_ucount">
                                                0
                                            </h2>
                                            <span>
                                                待审核商户
                                            </span>
                                        </li>

                                        <li>
                                            <h2 id="today_applycash">
                                                0
                                            </h2>
                                            <span>
                                                今日申请提现(元)
                                            </span>
                                        </li>

                                        <li>
                                            <h2 id="yester_applycash">
                                                0
                                            </h2>
                                            <span>
                                                昨日申请提现(元)
                                            </span>
                                        </li>


                                        <li>
                                            <h2 id="today_cashed">
                                                0
                                            </h2>
                                            <span>
                                                今日提现成功(元)
                                            </span>
                                        </li>
                                        <li>
                                            <h2 id="yester_cashed">
                                                0
                                            </h2>
                                            <span>
                                                昨日提现成功(元)
                                            </span>
                                        </li>


                                        <li>
                                            <h2 id="today_unpaid">
                                                0
                                            </h2>
                                            <span>
                                                今日未付款（笔）
                                            </span>
                                        </li>

                                        <li>
                                            <h2 id="is_freeze_ucount">
                                                0
                                            </h2>
                                            <span>
                                                总冻结用户
                                            </span>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="boxall" style="height:355px;">
                            <div class="alltitle">
                                今日支付通道
                            </div>
                            <div class="navboxall" id="echart1">
                            </div>
                        </div>

                    </li>
                    <li>
                        <div class="boxall" style="height:100px">
                            <div class="navboxall">
                                <h1>
                                    实时平台大数据可视化展示
                                </h1>
                                <p style="color: #5a71b0;text-align: center;font-size: 9px;" id="time_out"></p>
                                <a id="aloneshow" href="<?php echo url('manage/index/bgdata'); ?>" style="position: absolute;top: 8px;right: 8px;color: #5a71b0;font-size: 10px;border: 1px solid #5a71b0;padding: 2px 2px;border-radius: 3px;" target="_blank">独立显示</a>
                            </div>
                        </div>
                        <div class="boxall" style="height:610px">
                            <div class="navboxall" style="overflow: hidden;height: 100%;text-align: center;display: flex;justify-content: center">

                                <div class="map1"><img src="/static/admin/images/lbx.png"></div>
                                <div class="map2"><img src="/static/admin/images/jt.png"></div>
                                <div class="map3"><img src="/static/admin/images/map.png"></div>

                                <div style="width: 100%; height: 100%; position: relative;"
                                     id="echart3">
                                </div>
                            </div>
                        </div>
                        <div class="boxall" style="height:355px;">
                            <div class="alltitle">
                                近30日收款统计
                            </div>
                            <div class="navboxall " id="echart2">
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="boxall" style="height:355px">
                            <div class="alltitle">
                                今日商户流水排行
                            </div>
                            <div class="navboxall">
                                <table class="table1" width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tbody id="day_top_statis">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="boxall" style="height: 355px">
                            <div class="alltitle">
                                月度商户流水排行
                            </div>
                            <div class="navboxall">
                                <table class="table1" width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tbody id="month_top_statis">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="boxall" style="height: 355px">
                            <div class="alltitle">
                                总流水排行
                            </div>
                            <div class="navboxall">
                                <table class="table1" width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tbody id="all_top_statis">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </li>
                </ul>
                <ul class="clearfix">
                  
                    <li style="width: 100%">
                        <div class="boxall" style="height:300px">
                            <div class="alltitle">
                                年度收款统计
                            </div>
                            <div class="navboxall" id="echart4">
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <script>
            if (window.parent != this.window) {
                parent.document.querySelectorAll("iframe")[0].height = 0;
                parent.document.querySelectorAll("iframe")[0].height = document.body.scrollHeight;
            }else{
                $("#aloneshow").hide();
            }
            function ajax_url()
            {
                return "<?php echo url('manage/index/bgdata_ajax'); ?>";
            }
        </script>

        <script type="text/javascript" src="/static/plugs/bgdata/main.js?v=2"></script>
    </body>



</html>