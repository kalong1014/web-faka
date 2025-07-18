<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:87:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/migrate.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        
<form onsubmit="return false;" action="__SELF__" data-auto="true" method="post" class='form-horizontal' >
    <div class="form-group">
        <div class='col-sm-8 col-sm-offset-2'>
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center">第一步：配置源库信息</p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">数据库迁移是否开启</label>
        <div class='col-sm-8'>
            <select name="status" class="layui-input" >
                <option value="0" <?php if(plugconf('migrate','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('migrate','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">源站程序</label>
        <div class='col-sm-8'>
            <select name="app_type" class="layui-input" >
                <option value="1" <?php if(plugconf('migrate','app_type')=='1'): ?>selected<?php endif; ?>>知宇及其二开系统</option>
            </select>
            <p class="help-block">现只支持知宇及其二开系统，其他程序陆续加入中</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">数据库服务器地址</label>
        <div class='col-sm-8'>
            <input type="text"  name="db_host"  autocomplete="off" class="layui-input" placeholder="数据库服务器IP地址，本地为localhost" value="<?php echo plugconf('migrate','db_host'); ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">数据库名</label>
        <div class='col-sm-8'>
            <input type="text"  name="db_name"  autocomplete="off" class="layui-input" placeholder="数据库名" value="<?php echo plugconf('migrate','db_name'); ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">数据库用户名</label>
        <div class='col-sm-8'>
            <input type="text"  name="db_user"  autocomplete="off" class="layui-input" placeholder="数据库用户名" value="<?php echo plugconf('migrate','db_user'); ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">数据库密码</label>
        <div class='col-sm-8'>
            <input type="password"  name="db_pwd"  autocomplete="off" class="layui-input" placeholder="数据库密码" value="<?php echo plugconf('migrate','db_pwd'); ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">数据库端口</label>
        <div class='col-sm-8'>
            <input type="text"  name="db_port"  autocomplete="off" class="layui-input" placeholder="数据库默认端口一般为3306" value="<?php echo plugconf('migrate','db_port'); ?>">
        </div>
    </div>




    <div class="form-group">
        <div class='col-sm-8 col-sm-offset-2'>
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:16px;" class="text-center">第二步：选择迁移数据</p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">迁移用户</label>
        <div class='col-sm-8'>
            <select name="migrate_user" class="layui-input" readonly="readonly" style="background: #e9e9e9">
                <option value="1" selected>开启</option>
            </select>
            <p class="help-block">迁移用户必须开启</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">重复用户操作</label>
        <div class='col-sm-8'>
            <select name="migrate_user_repeat" class="layui-input" readonly="readonly" style="background: #e9e9e9">
                <option value="0" selected>跳过</option>
            </select>
            <p class="help-block">重复用户指用户名相同</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">迁移商品&分类</label>
        <div class='col-sm-8'>
            <select name="migrate_goods" class="layui-input" >
                <option value="0" <?php if(plugconf('migrate','migrate_goods')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('migrate','migrate_goods')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">迁移商品&分类必须开启迁移用户</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">重复商品&分类操作</label>
        <div class='col-sm-8'>
            <select name="migrate_goods_repeat" class="layui-input" >
                <option value="0" <?php if(plugconf('migrate','migrate_goods_repeat')=='0'): ?>selected<?php endif; ?>>跳过（建议）</option>
                <option value="1" <?php if(plugconf('migrate','migrate_goods_repeat')=='1'): ?>selected<?php endif; ?>>新增</option>
            </select>
            <p class="help-block">重复商品指同一用户下商品名相同</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">迁移未售出卡密</label>
        <div class='col-sm-8'>
            <select name="migrate_card" class="layui-input" >
                <option value="0" <?php if(plugconf('migrate','migrate_card')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('migrate','migrate_card')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">迁移卡密必须开启迁移商品</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">重复卡密操作</label>
        <div class='col-sm-8'>
            <select name="migrate_card_repeat" class="layui-input" >
                <option value="0" <?php if(plugconf('migrate','migrate_card_repeat')=='0'): ?>selected<?php endif; ?>>跳过（建议）</option>
                <option value="1" <?php if(plugconf('migrate','migrate_card_repeat')=='1'): ?>selected<?php endif; ?>>新增</option>
            </select>
            <p class="help-block">重复卡密指同一用户下同一商品卡密相同</p>
        </div>
    </div>

    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
        </div>
    </div>

</form>

<div class="form-group">
    <div class='col-sm-8 col-sm-offset-2'>
        <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
            <p style="font-size:18px;" class="text-center">第三部步：宝塔执行迁移命令</p>
            <p style="font-size:14px;" class="text-center">命令：cd /www/wwwroot/xxx.com; php think Migrate;</p>
            <p style="font-size:14px;" class="text-center">提示1：请把xxx.com 改成相应目录</p>
            <p style="font-size:14px;" class="text-center">提示2：迁移只会迁移<b>“用户表”、“商品表”、“卡密表”</b>，不会迁移代理关系，邀请关系</p>
            <p style="font-size:14px;color: red" class="text-center">提示3：迁移的用户新密码为源网站密码</p>
        </div>
    </div>
</div>


<script>
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });
</script>

    </div>
    
</div>