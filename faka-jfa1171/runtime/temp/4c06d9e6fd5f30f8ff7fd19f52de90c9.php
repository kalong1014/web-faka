<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:84:"/www/wwwroot/www.811192.xyz/application/templates/pc/admin/default/config/index.html";i:1646323578;s:79:"/www/wwwroot/www.811192.xyz/application/templates/pc/admin/default/content.html";i:1646323578;}*/ ?>
<div class="ibox">
    
    <?php if(isset($title)): ?>
    <div class="ibox-title notselect">
        <h5><?php echo $title; ?></h5>
        
    </div>
    <?php endif; ?>
    <div class="ibox-content">
        <?php if(isset($alert)): ?>
        <div class="alert alert-<?php echo $alert['type']; ?> alert-dismissible" role="alert" style="border-radius:0">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <?php if(isset($alert['title'])): ?><p style="font-size:18px;padding-bottom:10px"><?php echo $alert['title']; ?></p><?php endif; if(isset($alert['content'])): ?><p style="font-size:14px"><?php echo $alert['content']; ?></p><?php endif; ?>
        </div>
        <?php endif; ?>
        
<form onsubmit="return false;" action="__SELF__" data-auto="true" method="post" class='form-horizontal'
      style='padding-top:20px'>

    <div class="form-group">
        <label class="col-sm-2 control-label">网站名称</label>
        <div class='col-sm-8'>
            <input type="text" name="site_name" required="required" title="请输入网站名称" placeholder="请输入网站名称"
                   value="<?php echo sysconf('site_name'); ?>"
                   class="layui-input">
            <p class="help-block">网站名称，显示在浏览器标签上</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">网站副标题</label>
        <div class='col-sm-8'>
            <input type="text" name="site_subtitle" required="required" title="请输入网站副标题" placeholder="请输入网站副标题"
                   value="<?php echo sysconf('site_subtitle'); ?>"
                   class="layui-input">
            <p class="help-block">网站副标题，显示在浏览器标签上</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">关键字</label>
        <div class='col-sm-8'>
            <input type="text" name="site_keywords" required="required" title="请输入网站关键字" placeholder="请输入网站关键字"
                   value="<?php echo sysconf('site_keywords'); ?>"
                   class="layui-input">
            <p class="help-block">网站关键字</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">网站描述</label>
        <div class='col-sm-8'>
            <input type="text" name="site_desc" required="required" title="请输入网站描述" placeholder="请输入网站描述"
                   value="<?php echo sysconf('site_desc'); ?>"
                   class="layui-input">
            <p class="help-block">网站描述</p>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">程序名称</label>
        <div class='col-sm-8'>
            <input type="text" name="app_name" required="required" title="请输入程序名称" placeholder="请输入程序名称"
                   value="<?php echo sysconf('app_name'); ?>"
                   class="layui-input">
            <p class="help-block">当前程序名称，在后台主标题上显示</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">百度统计ID</label>
        <div class='col-sm-8'>
            <input type="text" name="tongji_baidu_key" maxlength="32" pattern="^[0-9a-z]{32}$" title="请输入32位百度统计应用ID"
                   placeholder="请输入32位百度统计应用ID" value="<?php echo sysconf('tongji_baidu_key'); ?>" class="layui-input">
            <p class="help-block">百度统计应用ID，可以在<a target="_blank" href="https://tongji.baidu.com">百度网站统计</a>申请并获取</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">浏览器图标</label>
        <div class='col-sm-8'>
            <img data-tips-image style="height:auto;max-height:32px;min-width:32px" src="<?php echo sysconf('browser_icon'); ?>"/>
            <input type="hidden" name="browser_icon" onchange="$(this).prev('img').attr('src', this.value)"
                   value="<?php echo sysconf('browser_icon'); ?>"
                   class="layui-input">
            <a class="btn btn-link" data-file="one" data-type="ico,png" data-field="browser_icon">上传图片</a>
            <p>建议上传ICO图标的尺寸为128x128px，此图标用于网站标题前，ICON在线制作。</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">站点LOGO</label>
        <div class='col-sm-8'>
            <img data-tips-image style="height:auto;max-height:32px;min-width:32px" src="<?php echo sysconf('site_logo'); ?>"/>
            <input type="hidden" name="site_logo" onchange="$(this).prev('img').attr('src', this.value)"
                   value="<?php echo sysconf('site_logo'); ?>"
                   class="layui-input">
            <a class="btn btn-link" data-file="one" data-type="jpg,jpeg,gif,png" data-field="site_logo">上传图片</a>
            <p>此图片用于显示站点LOGO，LOGO尺寸推荐182*50px</p>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">商户中心LOGO</label>
        <div class='col-sm-8'>
            <img data-tips-image style="height:auto;max-height:32px;min-width:32px" src="<?php echo sysconf('merchant_logo'); ?>"/>
            <input type="hidden" name="merchant_logo" onchange="$(this).prev('img').attr('src', this.value)"
                   value="<?php echo sysconf('merchant_logo'); ?>"
                   class="layui-input">
            <a class="btn btn-link" data-file="one" data-type="jpg,jpeg,gif,png" data-field="merchant_logo">上传图片</a>
            <p>此图片用于显示商户中心LOGO，LOGO尺寸推荐127*28px</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">商户中心缩小LOGO </label>
        <div class='col-sm-8'>
            <img data-tips-image style="height:auto;max-height:32px;min-width:32px" src="<?php echo sysconf('merchant_logo_sm'); ?>"/>
            <input type="hidden" name="merchant_logo_sm" onchange="$(this).prev('img').attr('src', this.value)"
                   value="<?php echo sysconf('merchant_logo_sm'); ?>"
                   class="layui-input">
            <a class="btn btn-link" data-file="one" data-type="jpg,jpeg,gif,png" data-field="merchant_logo_sm">上传图片</a>
            <p>此图片用于显示商户中心菜单栏缩小后LOGO，LOGO尺寸推荐64*64px</p>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">PC端首页主题</label>
        <div class='col-sm-8'>
            <select name="index_theme_pc" class="layui-input" required>
                <?php $index_theme_list_pc=json_decode(sysconf('index_theme_list_pc'),true); foreach($index_theme_list_pc as $vo): ?>
                <option value="<?php echo $vo; ?>" <?php if(sysconf('index_theme_pc')==$vo): ?>selected<?php endif; ?>><?php echo $vo; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">移动端首页主题</label>
        <div class='col-sm-8'>
            <select name="index_theme_mobile" class="layui-input" required>
                <?php $index_theme_list_mobile=json_decode(sysconf('index_theme_list_mobile'),true); foreach($index_theme_list_mobile as $vo): ?>
                <option value="<?php echo $vo; ?>" <?php if(sysconf('index_theme_mobile')==$vo): ?>selected<?php endif; ?>><?php echo $vo; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">站点开关</label>
        <div class='col-sm-8'>
            <select name="site_status" class="layui-input" required>
                <option value="0" <?php if(sysconf('site_status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(sysconf('site_status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>
    <div
        class="form-group">
        <label class="col-sm-2 control-label">站点关闭提示</label>
        <div class='col-sm-8'>
            <textarea name="site_close_tips" id="" cols="30" rows="5" class="layui-textarea"><?php echo sysconf('site_close_tips'); ?></textarea>
            <p class="help-block">站点关闭提示</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">购买协议</label>
        <div class='col-sm-8'>
            <textarea class="layui-textarea" cols="30" rows="2" name="buy_protocol" placeholder="购买协议"
                      autocomplete="off"><?php echo sysconf('buy_protocol'); ?></textarea>
            <p class="help-block red" style="color: red;">文字过多请使用换行，如不想显示请留空</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">购买协议阅读倒计时</label>
        <div class='col-sm-8'>
            <input type="text" name="buy_protocol_time" required="required" title="购买协议阅读倒计时" placeholder="购买协议阅读倒计时"
                   value="<?php echo sysconf('buy_protocol_time'); ?>"
                   class="layui-input">
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">售卡页语音播报</label>
        <div class='col-sm-8'>
            <input type="text" name="shop_voice"  value="<?php echo sysconf('shop_voice'); ?>" class="layui-input">
            <a class="btn btn-link" data-file="one" data-type="mp3" data-field="shop_voice">上传MP3文件</a>
            <span>注意请在文件存储添加允许mp3格式，可使用http://peiyin.xunfei.cn/make/ 等配音网站生成</span>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-2 control-label">下单是否显示安全提示</label>
        <div class='col-sm-8'>
            <select name="safe_tip" class="layui-input" required>
                <option value="0" <?php if(sysconf('safe_tip')=='0'): ?>selected<?php endif; ?>>隐藏</option>
                <option value="1" <?php if(sysconf('safe_tip')=='1'): ?>selected<?php endif; ?>>显示</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">手续费承担方</label>
        <div class='col-sm-8'>
            <select name="fee_payer" class="layui-input" required>
                <option value="1" <?php if(sysconf('fee_payer')=='1'): ?>selected<?php endif; ?>>商家承担</option>
                <option value="2" <?php if(sysconf('fee_payer')=='2'): ?>selected<?php endif; ?>>买家承担</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">最低交易手续费</label>
        <div class='col-sm-8'>
            <input type="number" onkeyup="gt0(this)" name="transaction_min_fee" required="required"
                   title="请输入最低交易手续费" placeholder="请输入最低交易手续费" value="<?php echo sysconf('transaction_min_fee'); ?>"
                   class="layui-input" min="0">
            <p class="help-block red" style="color: red;">最低交易手续费，手续费不足的按照此手续费计算，可以和商品价格区间配合使用。</p>
        </div>
    </div>
    <div class="form-group layui-form-item">
        <label class="col-sm-2 control-label">商品价格区间</label>
        <div class='layui-input-inline' style="margin-left: 15px;">
            <input type="number" onkeyup="gt0(this)" name="goods_min_price" required="required" title="商品最低价格"
                   placeholder="商品最低价格" value="<?php echo sysconf('goods_min_price'); ?>" class="layui-input" min="0">
            <p class="help-block">商品发布的价格区间,0为不限制</p>
        </div>

        <div class='layui-input-inline'>
            <input type="number" onkeyup="gt0(this)" name="goods_max_price" required="required" title="商品最高价格"
                   placeholder="商品最高价格" value="<?php echo sysconf('goods_max_price'); ?>" class="layui-input" min="0">

        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">一天内同个IP地址限制注册次数</label>
        <div class='col-sm-8'>
            <input type="number" onkeyup="gt0(this)" name="ip_register_limit" required="required" title="请输入限制次数"
                   placeholder="请输入限制次数" value="<?php echo sysconf('ip_register_limit'); ?>" class="layui-input">
            <p class="help-block">0表示不限制</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">短信验证码输错次数限制</label>
        <div class='col-sm-8'>
            <input type="number" onkeyup="gt0(this)" name="sms_error_limit" required="required" title="请输入限制次数"
                   placeholder="请输入限制次数" value="<?php echo sysconf('sms_error_limit'); ?>" class="layui-input">
            <p class="help-block">0表示不限制</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">短信验证码输错次数超限禁用时间（分钟）</label>
        <div class='col-sm-8'>
            <input type="number" onkeyup="gt0(this)" name="sms_error_time" required="required" title="请输入禁用时间"
                   placeholder="请输入禁用时间" value="<?php echo sysconf('sms_error_time'); ?>" class="layui-input">
            <p class="help-block">0表示不限制</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label"><span class="nowrap">当日输入错误登录密码次数限制</span></label>
        <div class='col-sm-8'>
            <input type="number" onkeyup="gt0(this)" name="wrong_password_times" required="required"
                   title="请输入错误登录密码次数" placeholder="请输入错误登录密码次数" value="<?php echo sysconf('wrong_password_times'); ?>"
                   class="layui-input">
            <p class="help-block">超过这个次数锁定账号24小时</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">系统公告自动弹出</label>
        <div class='col-sm-8'>
            <select name="announce_push" class="layui-input" required>
                <?php if(sysconf('announce_push')==0): ?>
                <option value="0" selected>否</option>
                <?php else: ?>
                <option value="0">否</option>
                <?php endif; if(sysconf('announce_push')==1): ?>
                <option value="1" selected>是</option>
                <?php else: ?>
                <option value="1">是</option>
                <?php endif; ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">开启微信自动登录</label>
        <div class='col-sm-8'>
            <select name="wx_auto_login" class="layui-input" required>
                <?php if(sysconf('wx_auto_login')==0): ?>
                <option value="0" selected>否</option>
                <?php else: ?>
                <option value="0">否</option>
                <?php endif; if(sysconf('wx_auto_login')==1): ?>
                <option value="1" selected>是</option>
                <?php else: ?>
                <option value="1">是</option>
                <?php endif; ?>
            </select>
        </div>
    </div>

    <div class="form-group layui-form-item">
        <label class="col-sm-2 control-label">商户安全登录开关</label>
        <div class='col-sm-8'>
            <select name="login_auth" class="layui-input" required>
                <?php if(sysconf('login_auth')==0): ?>
                <option value="0" selected>关闭</option>
                <?php else: ?>
                <option value="0">关闭</option>
                <?php endif; if(sysconf('login_auth')==1): ?>
                <option value="1" selected>开启</option>
                <?php else: ?>
                <option value="1">开启</option>
                <?php endif; ?>

            </select>
            <p class="help-block">
            </p>
        </div>
    </div>

    <div class="form-group layui-form-item">
        <label class="col-sm-2 control-label">商户安全登录验证方式</label>
        <div class='col-sm-8'>
            <select name="login_auth_type" class="layui-input" required>
                <?php if(sysconf('login_auth_type')==0): ?>
                <option value="0" selected>全部</option>
                <?php else: ?>
                <option value="0">全部</option>
                <?php endif; if(sysconf('login_auth_type')==1): ?>
                <option value="1" selected>邮箱 + 谷歌验证码</option>
                <?php else: ?>
                <option value="1">邮箱 + 谷歌验证码</option>
                <?php endif; if(sysconf('login_auth_type')==2): ?>
                <option value="2" selected>>短信 + 谷歌验证码</option>
                <?php else: ?>
                <option value="2">短信 + 谷歌验证码</option>
                <?php endif; ?>
            </select>
            <p class="help-block">
            </p>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="col-sm-4 col-sm-offset-2">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
        </div>
    </div>

</form>
<script>
    /* require(['ckeditor'], function () {
     var editor = window.createEditor('[name="contact_us"]');
     var content = editor.getData();
     }); */

    function gt0(ob) {
        if (!/^[\d]+\.?[\d]*$/.test(ob.value) && ob.value != '') {
            console.log('s');
            ob.value = 0;
        }
    }

    require(['ckeditor'], function () {
        var editor = window.createEditor('[name="buy_protocol"]');
        // 获取内容
        var content = editor.getData();
        console.log(content);
    });
</script>

    </div>
    
</div>