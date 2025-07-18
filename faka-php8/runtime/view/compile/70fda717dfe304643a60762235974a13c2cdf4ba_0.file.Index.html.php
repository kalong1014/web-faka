<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:36:27
  from '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Index/Index.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3e2eb542606_48505589',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '70fda717dfe304643a60762235974a13c2cdf4ba' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/User/Theme/Cartoon/Index/Index.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:./Header.html' => 1,
    'file:./Footer.html' => 1,
  ),
),false)) {
function content_67f3e2eb542606_48505589 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:./Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div class="content-wrapper">
    <div class="container">

        <!--            公告部分-->
        <div class="card">
            <div class="card-header">
                <p class="card-title"><i class="fa fa-bullhorn" aria-hidden="true"></i> 公告</p>
            </div>
            <div class="card-block">
                <?php echo $_smarty_tpl->tpl_vars['config']->value['notice'];?>

            </div>
        </div>


        <!--            选择商品部分-->
        <div class="card">
            <div class="card-header">
                <p class="card-title"><i class="fa fa-gratipay" aria-hidden="true"></i> 购买</p>
            </div>
            <div class="card-block">
                <fieldset class="form-group">
                    <label for="type" style="font-size: 14px;">请选择商品分类</label>
                    <div id="type" class="category">
                    </div>
                </fieldset>

                <fieldset class="form-group product" style="display: none;">
                    <label for="product" style="font-size: 14px;">请选择商品</label>
                    <div id="product">

                    </div>
                </fieldset>
            </div>
        </div>


        <!--            商品简介部分-->
        <div class="card animated shopInfoHtml" style="display: none;">
            <div class="card-header">
                <p class="card-title">商品信息</p>
            </div>
            <form class="commodity"></form>

            <div class="sliderbar-container">
                <div class="title"><i></i> 联系客服</div>
                <div class="body">
                    <div style="margin-bottom: 10px;"><img src="/favicon.ico" alt=""
                                                           style="border-radius: 100%;height: 28px;"
                                                           class="service-avatar"> <span
                                style="color: #e093ff;position: relative;top: 1px;" class="service-nickname">自营商品</span>
                    </div>
                    <a class="button-click service-url" style="line-height: 22px;margin-right: 0;color: #ff8888;"
                       target="_blank"><i
                                class="fa fa-user-plus"></i> 网页客服</a>
                    <a class="button-click service-qq" style="line-height: 22px;margin-right: 0;color: #7599b1;"
                       target="_blank"><i
                                class="fa fa-qq"></i> ＱＱ客服</a>
                </div>
            </div>
        </div>

        <!--            指定购买部分-->
        <div class="card animated specified" style="display: none;">
            <div class="card-header">
                <p class="card-title"></p>
            </div>
            <div class="card-block anticipation">
            </div>
        </div>


        <!--            付款部分-->
        <div class="card animated fadeInLeft" style="display: none;">
            <div class="card-header">
                <p class="card-title">付款方式</p>
            </div>
            <div class="card-block">
                <div class="login-display"
                     style="text-align: center;font-weight: bold;margin: 10px 0 20px 0;font-size: 18px;color: #00A3FF;display: none;">
                    该商品需要登录才能购买，<a class="login-url" href="/user/authentication/login?goto=/">现在登录</a></div>
                <div class="row pay_type" style="margin-left: 0px;"></div>
            </div>
        </div>


    </div>
</div>
</div>

<?php echo '<script'; ?>
>
    const setting_cache = <?php echo $_smarty_tpl->tpl_vars['setting']->value['cache'];?>
;
    const setting_cache_expire = <?php echo $_smarty_tpl->tpl_vars['setting']->value['cache_expire'];?>
;

    let commodityHtml = '<div class="card-block">\n' +
        '                    <div class="row">\n' +
        '                        <div class="col-md-5 description"></div>\n' +
        '                        <div class="col-md-7">\n' +
        '                            <h4 class="productName" style="margin-bottom: 10px;"></h4>\n' +
        '                            <p><span style="color: #0C84D1;font-size: 14px;cursor: pointer;" class="clipboard" data-clipboard-text=""><i class="fa fa-share"></i> 将宝贝分享给好友</span></p>\n' +
        '                            <p style="display: none;" class="seckill_status">限时秒杀： <span class="text-danger seckill"></span></p>\n' +
        '                            <p>商品单价： <span class="text-success price"></span></p>\n' +
        '                            <p>发货方式： <span class="badge badge-pill text-white cardType"></span></p>\n' +
        '                            <fieldset class="form-group">\n' +
        '                                <label style="display: inline-block;">联系方式：</label>\n' +
        '                                <input class="form-control round contact" name="contact" placeholder="">\n' +
        '                            </fieldset>\n' +
        '                            <fieldset class="form-group fieldset-password" style="display: none;">\n' +
        '                                <label style="display: inline-block;">查询密码：</label>\n' +
        '                                <input class="form-control round password" name="password" type="password"\n' +
        '                                       placeholder="请设置您的订单查询密码(6位以上)">\n' +
        '                            </fieldset>\n' +
        '                            <fieldset class="form-group voucher-view" style="display: none;">\n' +
        '                                <label style="display: inline-block;">优惠代卷：</label>\n' +
        '                                <input class="form-control round voucher" onchange="getTradeAmount()" name="coupon"\n' +
        '                                       placeholder="如果您有优惠卷可以填写优惠卷，没有可不填写">\n' +
        '                            </fieldset>\n' +
        '                            <fieldset class="form-group race-view" style="display: none;">\n' +
        '                                <label style="display: inline-block;">选择种类：</label>\n' +
        '                                 <span class="race-list"></span>\n' +
        '                            </fieldset>\n' +
        '                            <fieldset class="form-group">\n' +
        '                                <label>购买数量：</label>\n' +
        '                                <input class="form-control round buyNum" onchange="getTradeAmount()" name="num"\n' +
        '                                       type="number" style="width: 10%;" value="1">\n' +
        '                                <span style="margin-left: 10px;display: none;" class="kucunView"> 剩余库存: <span\n' +
        '                                        class="badge badge-pill badge-success text-white card_count">0</span></span>\n' +
        '                            </fieldset><p class="widget"></p>\n' +
        '                            <p><span class="purchase_count" style="font-size: 14px;font-weight: bold;color: #c59de9;display: none;"></span></p>\n' +
        '                            <?php if ($_smarty_tpl->tpl_vars['config']->value['trade_verification'] == 1) {?>\n' +
        '                            <fieldset class="form-group">\n' +
        '                                <label>人机验证：</label>\n' +
        '                                <input class="form-control round captcha" name="captcha" type="text" style="width: 15%;"\n' +
        '                                       value="">\n' +
        '                                <span style="margin-left: 10px;"><img\n' +
        '                                    class="captchaImage"\n' +
        '                                        style="margin-top: -3px;cursor: pointer;" src="/user/captcha/image?action=trade"\n' +
        '                                        alt="验证码"></span>\n' +
        '                            </fieldset>\n' +
        '                            <?php }?>\n' +
        '                            <p style="" class="payAmountView">订单金额： <span><b style="font-size:16px;color: #f757b7;font-weight: bold;" class="payAmount"></b></span></p>\n' +
        '                            <fieldset class="form-group wholesale" style="display: none;">\n' +
        '                                <div style="font-size: 12px;color: #ff5aa6;font-weight: bold;"\n' +
        '                                     class="wholesaleHtml"></div>\n' +
        '                            </fieldset>\n' +
        '                        </div>\n' +
        '                    </div>\n' +
        '                </div>';
    let switchElement = function (obj) {
        $('.checked').removeClass('checked');
        $(obj).addClass('checked');
    };

    let productInstance = $('#product');
    let globalCommodityId = 0;
    let globalRaceId = "";
    let seckillPid = 0;
    let defaultCategory = "<?php echo $_smarty_tpl->tpl_vars['categoryId']->value;?>
";
    let defaultCommodity = "<?php echo $_smarty_tpl->tpl_vars['commodityId']->value;?>
";
    let draftStatus = 0;
    let inventoryHidden = 0;

    //-----------------------------------获取分类------------------------------------------
    Pay.getCategory(list => {
        list.forEach(category => {
            $(".category").append('<span class="category-' + category.id + ' button-click category-button ' + (category.commodity_count == 0 ? 'empty-commodity' : '') + '" ' + (category.commodity_count == 0 ? '' : 'onclick="getCommodity(this,' + category.id + ')"') + '>' + (category.icon ? '<img class="commodity-icon" src="' + category.icon + '">' : '') + ' ' + category.name + '</span>');
        });
        if (defaultCategory) {
            $('.category-' + defaultCategory).click(); //自动点击分类
            defaultCategory = null;
        }
    });

    //-----------------------------------获取商品------------------------------------------
    function getCommodity(obj, categoryId) {
        switchElement(obj);
        $('.shopInfoHtml').hide(150);
        $('.fadeInLeft').hide(150);
        $('.specified').hide(150);

        Pay.getCommodityAll(categoryId, list => {
            $('.product').hide(150);
            productInstance.html("");
            if (list.length === 0) {
                layer.msg("该分类下没有商品");
                return;
            }
            $('.product').show(150);
            list.forEach(item => {
                productInstance.append('<span class="button-click commodity-' + item.id + '" onclick="getCommodityInfo(this,' + item.id + ')" ' + ((item.card_count == 0 && item.delivery_way == 0 && !item.shared) ? 'style="background-color: #ced4dadb;opacity: 0.6;"' : '') + '>' + (item.cover ? '<img class="commodity-icon" src="' + item.cover + '">' : '') + ' ' + item.name + '</span>');
            });

            if (defaultCommodity) {
                $('.commodity-' + defaultCommodity).click(); //自动点击商品
                defaultCommodity = null;
            }
        })
    }


    //-----------------------------------获取预选卡密--------------------------------------
    function checkbox(obj) {
        let state = $(obj).prop("checked");
        $('input[name=card_id]:checked').prop("checked", false);
        if (state === true) {
            $(obj).prop("checked", true);
        } else {
            $(obj).prop("checked", false);
        }
    }

    function getDraftCard(commodityId, page) {
        Pay.getDraftCard(commodityId, page, globalRaceId, res => {
            let next = res.current_page + 1;
            let prev = res.current_page - 1;
            if (next >= res.last_page) {
                next = res.last_page;
            }
            if (prev <= 1) {
                prev = 1;
            }
            $('.anticipation').show(150);
            $('.anticipation').html('<table><thead><tr><th><button ' + (res.current_page <= 1 ? 'disabled' : '') + ' type="button" onclick="getDraftCard(' + commodityId + ',' + prev + ')">上一页</button> <button ' + (res.current_page >= res.last_page ? 'disabled' : '') + ' type="button" onclick="getDraftCard(' + commodityId + ',' + next + ')">下一页</button></th></tr></thead><tbody class="draftCard"></tbody></table>');

            if (res.data.length == 0) {
                $('.draftCard').append('<tr><td style="text-align: center;">暂无数据</td></tr>');
                return;
            }

            res.data.forEach(item => {
                $('.draftCard').append('<tr><td><label><input type="checkbox" onclick="getTradeAmount()" onchange="checkbox(this)" name="card_id" value="' + item.id + '"> ' + item.draft + '</label></td></tr>');
            });
        });
    }

    //-----------------------------------获取商品详情--------------------------------------

    function getCommodityInfo(obj, commodityId) {
        $('.shopInfoHtml').hide(150);
        $('.fadeInLeft').hide(150);
        $('.specified').hide(150);
        $('.commodity').html("");
        $('.login-display').hide();
        $('.pay_type').show();

        globalRaceId = "";
        globalCommodityId = commodityId;
        switchElement(obj);
        Pay.getCommodityDetail(commodityId, commodity => {
            $('.service-qq').attr("href", "https://wpa.qq.com/msgrd?v=1&uin=" + commodity.service_qq);
            $('.service-url').attr("href", commodity.service_url);

            if (commodity.owner) {
                $('.service-avatar').attr("src", commodity.owner.avatar);
                $('.service-nickname').css({"color": "#ff00e0a1"}).html(commodity.owner.username);
            } else {
                $('.service-avatar').attr("src", "/favicon.ico");
                $('.service-nickname').css({"color": "#e093ff"}).html("自营商品");
            }

            $('.commodity').html(commodityHtml);
            $('.shopInfoHtml').show(150);
            $('.fadeInLeft').show(150);

            $('.productName').html(commodity.name);
            $('.description').html(commodity.description);

            if (commodity.minimum > 0) {
                $('.buyNum').val(commodity.minimum).change();
            }


            $('.description').find("img").click(function () {
                let imageUrl = $(this).attr("src");

                let img = new Image()
                img.src = imageUrl;
                img.onload = function () {
                    if (img.width >= window.innerWidth) {
                        img.width = window.innerWidth * 0.9;
                    }

                    if (img.height >= window.innerHeight) {
                        img.height = window.innerHeight * 0.9;
                    }

                    // 打印
                    layer.open({
                        type: 1,
                        title: false,
                        closeBtn: 0, //不显示关闭按钮
                        anim: 5,
                        area: [img.width + "px", img.height + "px"],
                        shadeClose: true, //开启遮罩关闭
                        content: '<img  src="' + imageUrl + '" style="width:' + img.width + 'px;height:' + img.height + 'px">'
                    });
                }
            });

            //限时秒杀
            clearInterval(seckillPid);
            if (commodity.seckill_status == 1) {
                $('.seckill_status').show();
                let seckillStartTime = new Date(commodity.seckill_start_time).getTime();
                let seckillEndTime = new Date(commodity.seckill_end_time).getTime();
                var nowTime = new Date().getTime();

                let fnEnd = () => {
                    let langTime = Pay.getLangTime(new Date().getTime(), seckillEndTime);
                    $('.seckill').html("<b style='color: #0fb183;'>还剩" + langTime.days + "天" + langTime.hours + "时" + langTime.minutes + "分" + langTime.seconds + "秒结束</b>");
                    if (langTime.days <= 0 && langTime.hours <= 0 && langTime.minutes <= 0 && langTime.seconds <= 0) {
                        $('.seckill').html("<b style='color: #9d9d9d;'>已结束</b>");
                        $('.fadeInLeft').hide();
                        clearInterval(seckillPid);
                    }
                };
                let fnStart = () => {
                    let langTime = Pay.getLangTime(new Date().getTime(), seckillStartTime);
                    $('.seckill').html("<b style='color: #e22727;'>" + langTime.days + "天" + langTime.hours + "时" + langTime.minutes + "分" + langTime.seconds + "秒后开始抢购</b>");
                    if (langTime.days <= 0 && langTime.hours <= 0 && langTime.minutes <= 0 && langTime.seconds <= 0) {
                        clearInterval(seckillPid);
                        $('.fadeInLeft').show();
                        fnEnd();
                        seckillPid = setInterval(fnEnd, 1000);
                    }
                };

                if (nowTime >= seckillStartTime && nowTime <= seckillEndTime) {
                    $('.fadeInLeft').show();
                    fnEnd();
                    //秒杀正在进行当中
                    seckillPid = setInterval(fnEnd, 1000);
                } else if (nowTime < seckillStartTime) {
                    $('.fadeInLeft').hide();
                    fnStart();
                    seckillPid = setInterval(fnStart, 1000);
                } else if (nowTime > seckillEndTime) {
                    $('.fadeInLeft').hide();
                    $('.seckill').html("<b style='color: #9d9d9d;'>已结束</b>");
                }

            }

            <?php if ($_smarty_tpl->tpl_vars['user']->value) {?>
            $('.price').html("¥" + commodity.user_price);
            $('.payAmount').html("¥" + commodity.user_price);
            <?php } else { ?>
            let user = "";
            if (commodity.user_price < commodity.price) {
                user = '<span class="price_tips">(会员价:¥' + commodity.user_price + ') <a style="color: #6d97d5;" href="/user/authentication/login" target="_blank">现在就去登录!</a></span>';
            }
            $('.price').html('¥' + commodity.price + ' ' + user);
            $('.payAmount').html("¥" + commodity.price);

            //未登录
            //判断是否需要登录才能购买商品
            if (commodity.only_user == 1 || commodity.purchase_count > 0) {
                $('.login-url').attr("href", "/user/authentication/login?goto=" + encodeURIComponent(commodity.share_url));
                $('.login-display').show();
                $('.pay_type').hide();
            }
            <?php }?>
            inventoryHidden = commodity.inventory_hidden;
            if (commodity.delivery_way === 0) {
                $('.cardType').html("自动发货").addClass("badge-success");
                $('.kucunView').show();
                if (commodity.inventory_hidden == 1) {
                    if (commodity.card <= 0) {
                        $('.card_count').removeClass("badge-success").addClass("badge-dark").html("已售罄");
                    } else if (commodity.card <= 5) {
                        $('.card_count').removeClass("badge-success").addClass("badge-danger").html("即将售罄");
                    } else if (commodity.card <= 20) {
                        $('.card_count').removeClass("badge-success").addClass("badge-warning").html("一般");
                    } else if (commodity.card > 20) {
                        $('.card_count').html("充足");
                    }
                } else {
                    $('.card_count').html(commodity.card);
                }

            } else {
                $('.cardType').html("在线发货").addClass("badge-danger");
            }

            let contactType = ["任意联系方式", "手机号", "邮箱", "QQ号"];

            $('.contact').attr("placeholder", "请输入您的" + contactType[commodity.contact_type] + "，方便订单查询");

            if (commodity.login) {
                $('.contact').parent().hide();
            }

            //
            if (commodity.password_status === 1 && !commodity.login) {
                $('.fieldset-password').show();
            }


            if (commodity.coupon === 1) {
                $('.voucher-view').show();
            }

            if (commodity.purchase_count > 0) {
                $('.purchase_count').html("该商品每人累计购买最多" + commodity.purchase_count + "个");
                $('.purchase_count').show();
            }

            //控件
            if (commodity.widget) {
                let parse = JSON.parse(commodity.widget);
                if (parse != null) {
                    parse.forEach(widget => {
                        if (widget.type == "text" || widget.type == "password" || widget.type == "number") {
                            $('.widget').append('<fieldset class="form-group"><label style="display: inline-block;">' + widget.cn + '：</label><input type="' + widget.type + '" class="form-control round" name="' + widget.name + '" placeholder="' + widget.placeholder + '"></fieldset>');
                        } else if (widget.type == "select") {
                            let html = '<fieldset class="form-group"><label style="display: inline-block;">' + widget.cn + '：</label><select name="' + widget.name + '" style="border-radius: 5px;border: 1px dashed #80b9f594;width:auto;height: auto;display: inline-block;padding: 0 0;"><option value="">' + widget.placeholder + '</option>';
                            let dict = widget.dict.split(",");
                            for (let i = 0; i < dict.length; i++) {
                                let sp = dict[i].split("=");
                                if (sp.length != 2) {
                                    continue;
                                }
                                html += '<option value="' + sp[1] + '">' + sp[0] + '</option>'
                            }
                            html += "</select></fieldset>"
                            $('.widget').append(html);
                        } else if (widget.type == "textarea") {
                            $('.widget').append('<fieldset class="form-group"><textarea name="' + widget.name + '" placeholder="' + widget.placeholder + '" style="border-radius: 5px;border: 1px dashed #80b9f594;width: 100%;height: 100px;"></textarea></fieldset>');
                        } else if (widget.type == "checkbox") {
                            let html = '<fieldset class="form-group"><label style="display: inline-block;">' + widget.cn + '：</label>';
                            let dict = widget.dict.split(",");
                            for (let i = 0; i < dict.length; i++) {
                                let sp = dict[i].split("=");
                                if (sp.length != 2) {
                                    continue;
                                }
                                html += '<label style="margin-right: 10px;"><input name="' + widget.name + '[]" type="checkbox" value="' + sp[1] + '"> ' + sp[0] + '</label>';
                            }
                            html += '</fieldset>';
                            $('.widget').append(html);
                        } else if (widget.type == "radio") {
                            let html = '<fieldset class="form-group"><label style="display: inline-block;">' + widget.cn + '：</label>';
                            let dict = widget.dict.split(",");
                            for (let i = 0; i < dict.length; i++) {
                                let sp = dict[i].split("=");
                                if (sp.length != 2) {
                                    continue;
                                }
                                html += '<label style="margin-right: 10px;"><input name="' + widget.name + '" type="radio" value="' + sp[1] + '"> ' + sp[0] + '</label>';
                            }
                            html += '</fieldset>';
                            $('.widget').append(html);
                        }

                    });
                }
            }


            $('.clipboard').attr("data-clipboard-text", commodity.share_url);

            $('.clipboard').click(function () {
                var clipboard = new ClipboardJS(".clipboard");
                clipboard.on('success', function (e) {
                    layer.msg("分享链接已经复制成功了，赶快发给好友吧！")
                });
            });

            $('.captchaImage').click(function () {
                captchaImage();
            });


            //渲染商品种类
            if (commodity.hasOwnProperty('race') && commodity.race) {
                $('.race-view').show();
                let raceIndex = 0;
                for (let key in commodity.race) {
                    if (raceIndex == 0) {
                        globalRaceId = key;
                    }
                    $('.race-list').append('<span onclick="raceClick(this,\'' + key + '\')" class="race-click button-click ' + (raceIndex == 0 ? 'checked' : '') + '" style="padding: 0 8px;font-size: 14px;border-radius: 10px;">' + key + '</span>');
                    raceIndex++;
                }

                let categoryWholesale = function () {
                    //批发渲染
                    let categoryWholesale = commodity.category_wholesale;
                    if (categoryWholesale && categoryWholesale.hasOwnProperty(globalRaceId)) {
                        let rules = categoryWholesale[globalRaceId];
                        let ws = [];
                        for (const ruleKey in rules) {
                            ws[ruleKey] = rules[ruleKey];
                        }
                        let x = '';
                        ws.forEach((money, num) => {
                            x += '<div class="lot_string">一次性购买' + num + '张，单价自动调整为：<b>¥' + money + '</b></div>';
                        });
                        if (ws.length > 0) {
                            $('.wholesale').show();
                            $('.wholesaleHtml').html(x);
                        } else {
                            $('.wholesale').hide();
                        }
                    } else {
                        $('.wholesale').hide();
                    }
                }

                categoryWholesale();

                $('.race-click').click(function () {
                    categoryWholesale();
                });
            } else {
                let wholesale = commodity.wholesale;
                if (wholesale && Object.keys(wholesale).length > 0) {
                    let ws = [];
                    for (const ruleKey in wholesale) {
                        ws[ruleKey] = wholesale[ruleKey];
                    }
                    let x = '';
                    ws.forEach((money, num) => {
                        x += '<div class="lot_string">一次性购买' + num + '张，单价自动调整为：<b>¥' + money + '</b></div>';
                    });
                    if (ws.length > 0) {
                        $('.wholesale').show();
                        $('.wholesaleHtml').html(x);
                    } else {
                        $('.wholesale').hide();
                    }
                }
            }

            if (commodity.draft_status === 1) {
                draftStatus = 1;
                $('.specified').show(150);
                $('.specified .card-title').html('自选加价:<b style="color: #eba0a0;font-weight: bold;">' + commodity.draft_premium + "元</b>");
                getDraftCard(commodity.id, 1);
            } else {
                draftStatus = 0;
            }

            $('html,body').animate({
                scrollTop: 9999
            }, 'slow');
        });
    }

    function getTradeAmount() {
        let num = $('input[name=num]').val();

        if (num <= 0) {
            $('input[name=num]').val(1);
            num = 1;
        }
        let cardId = $('input[name=card_id]:checked').val();
        let coupon = $('input[name=coupon]').val();
        if (cardId === undefined) {
            cardId = 0;
        }
        Pay.getTradeAmount(globalCommodityId, coupon, cardId, num, globalRaceId, res => {
            $('.payAmount').html("¥" + res.amount);
            $('.price').html("¥" + res.price);
            if (res.hasOwnProperty("card_count")) {
                let instance = $('.card_count');
                if (inventoryHidden == 1) {
                    if (res.card_count <= 0) {
                        instance.removeClass("badge-success").addClass("badge-dark").html("已售罄");
                    } else if (res.card_count <= 5) {
                        instance.removeClass("badge-success").addClass("badge-danger").html("即将售罄");
                    } else if (res.card_count <= 20) {
                        instance.removeClass("badge-success").addClass("badge-warning").html("一般");
                    } else if (res.card_count > 20) {
                        instance.addClass("badge-success").html("充足");
                    }
                } else {
                    instance.html(res.card_count);
                }
            }
        });
    }

    function captchaImage() {
        <?php if ($_smarty_tpl->tpl_vars['config']->value['trade_verification'] == 1) {?>
        $('.captchaImage').attr("src", "/user/captcha/image?action=trade&rand=" + Math.ceil(Math.random() * 100000));
        <?php }?>
    }

    function Trade(payId) {
        let cardId = $('input[name=card_id]:checked').val();
        if (cardId === undefined) {
            cardId = 0;
        }

        let arrayToObject = Pay.arrayToObject($('.commodity').serializeArray());
        arrayToObject.commodity_id = globalCommodityId;
        arrayToObject.card_id = cardId;
        arrayToObject.pay_id = payId;
        arrayToObject.device = Pay.device();
        arrayToObject.from = localStorage.hasOwnProperty("from_id") ? localStorage.getItem("from_id") : 0;
        arrayToObject.race = globalRaceId;
        Pay.trade(arrayToObject, res => {
            captchaImage();
            if (res.secret == null) {
                window.location.href = res.url;
            } else {
                //跳转个人中心
                layer.open({
                    type: 1,
                    title: "您购买的卡密如下：",
                    area: Pay.isMobile() ? ["100%", "100%"] : ['420px', '420px'],
                    content: '<textarea class="layui-input" style="padding: 15px;height: 98%;width: 100%;border: none;overflow-x: hidden;">' + res.secret + '</textarea>',
                    btn: ['<span style="color:white;">查看更多信息/下载</span>'],
                    yes: function () {
                        window.open('/user/personal/purchaseRecord?tradeNo=' + res.tradeNo);
                    }
                });
            }
        }, () => {
            captchaImage();
        });
    }

    function raceClick(obj, id) {
        switchElement(obj);
        globalRaceId = id;
        getTradeAmount();
        if (draftStatus) {
            getDraftCard(globalCommodityId, 1);
        }
    }


    Pay.getPay(res => {
        res.forEach(item => {
            if (item.handle === "#system") {
                <?php if ($_smarty_tpl->tpl_vars['user']->value) {?>
                $('.pay_type').append(' <a class="button-click" onclick="Trade(' + item.id + ')" style="line-height: 22px;color: #f5a6d9;font-weight: bold;"> <img src="' + item.icon + '" class="commodity-icon"> ' + item.name + '(<?php echo sprintf("%.2f",$_smarty_tpl->tpl_vars['user']->value['balance']);?>
)</a>');
                <?php }?>
            } else {
                $('.pay_type').append(' <a class="button-click" onclick="Trade(' + item.id + ')" style="line-height: 22px;"> <img src="' + item.icon + '" class="commodity-icon"> ' + item.name + '</a>');
            }
        })
    });

    let from = parseInt("<?php echo $_smarty_tpl->tpl_vars['from']->value;?>
");
    if (from !== 0) {
        localStorage.setItem("from_id", from);
    }


    $(function () {
        if (Pay.isPc()) {
            $('.sliderbar-container').sliderBar({
                open: false,           // 默认是否打开，true打开，false关闭
                width: 105,           // body内容宽度
                height: 180,          // body内容高度
                theme: '#f1a3b0',       // 主题颜色
                position: 'left'      // 显示位置，有left和right两种
            });
        } else {
            $('.sliderbar-container').hide();
        }
    });
<?php echo '</script'; ?>
>
<?php $_smarty_tpl->_subTemplateRender("file:./Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
