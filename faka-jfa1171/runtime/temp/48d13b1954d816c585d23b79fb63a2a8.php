<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:88:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/invite_code/add.html";i:1646323578;}*/ ?>
<form class="layui-form layui-box" style='padding:25px 30px 20px 0' action="__SELF__" data-auto="true" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">持有者ID</label>
        <div class="layui-input-block">
            <input type="number" name="user_id" value="" title="请输入持有者ID" placeholder="请输入持有者ID" class="layui-input">
            <p>留空为系统持有</p>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">生成数量</label>
        <div class="layui-input-block">
            <input type="number" name="num" value="" required="required" title="请输入生成数量" placeholder="请输入生成数量" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">有效期（天）</label>
        <div class="layui-input-block">
            <input type="number" name="day" value="" title="请输入有效期" placeholder="请输入有效期" class="layui-input">
            <p>留空为永不过期</p>
        </div>
    </div>
    <div class="hr-line-dashed"></div>

    <div class="layui-form-item text-center">
        <button class="layui-btn" type='submit'>保存</button>
        <button class="layui-btn layui-btn-danger" type='button' data-confirm="确定要取消吗？" data-close>取消</button>
    </div>

</form>

<script>
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });
</script>
