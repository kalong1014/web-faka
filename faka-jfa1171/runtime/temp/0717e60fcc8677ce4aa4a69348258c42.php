<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:89:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/subdomain.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
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
        <label class="col-sm-2 control-label">功能是否开启</label>
        <div class='col-sm-8'>
            <select name="status" class="layui-input" >
                <option value="0" <?php if(plugconf('subdomain','status')=='0'): ?>selected<?php endif; ?>>关闭</option>
                <option value="1" <?php if(plugconf('subdomain','status')=='1'): ?>selected<?php endif; ?>>开启</option>
            </select>
            <p class="help-block">开启之后商户可使用该功能</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">顶级根域名</label>
        <div class='col-sm-8'>
            <input type="text"  name="top_domain"  autocomplete="off" class="layui-input" placeholder="请输入顶级根域名，例如：faka.com，不带http://和www" value="<?php echo plugconf('subdomain','top_domain'); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">禁用子域名</label>
        <div class='col-sm-8'>
            <textarea name="disabled_domains" id="" cols="30" rows="5" class="layui-textarea"><?php echo plugconf('subdomain','disabled_domains'); ?></textarea>
            <p class="help-block">禁用子域名，使用“|”分隔</p>
        </div>
    </div>


    <div class="col-sm-12">
        <div class="layui-form-item text-center">
            <button class="layui-btn" type="submit">保存配置</button>
        </div>
    </div>


    <div class="form-group">
        <div class='col-sm-8 col-sm-offset-2'>
            <div class="alert alert-success alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:14px;" class="text-center">域名设置：①将顶级域名解析到服务器，例如：*.faka.com&nbsp;&nbsp;&nbsp;&nbsp;②：网站添加域名：*.faka.com</p>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class='col-sm-8 col-sm-offset-2'>
            <div class="alert alert-danger alert-dismissible" role="alert" style="border-radius:0">
                <p style="font-size:14px;" class="text-center">提示：使用此功能需要平台域名使用“www”或“@”主机名，使用其他二级域名会与商户二级域名冲突。</p>
            </div>
        </div>
    </div>
</form>



<script>
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });

</script>

    </div>
    
</div>