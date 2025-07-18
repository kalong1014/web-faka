<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:85:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/user/message.html";i:1646323578;}*/ ?>
<form class="layui-form layui-box" style='padding:25px 30px 20px 0' action="__SELF__" data-auto="true" method="post">

    <div class="layui-form-item">
        <label class="layui-form-label">商户ID</label>
        <div class="layui-input-block">
            <input type="number" name="user_id" value="<?php echo (\think\Request::instance()->get('user_id') ?: ''); ?>" required="required" title="请输入商户ID" placeholder="请输入商户ID" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" value="" required="required" title="请输入标题" placeholder="请输入标题" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block">
            <textarea name="content" id="" cols="30" rows="5" class="layui-textarea" maxlength="1024" required="required" placeholder="请输入内容"></textarea>
        </div>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="layui-form-item text-center">
        <button class="layui-btn" type='submit'>发送</button>
        <button class="layui-btn layui-btn-danger" type='button' data-confirm="确定要取消吗？" data-close>取消</button>
    </div>

</form>

<script>
    // layui.use('form', function(){
    //     var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
    //     form.render();
    // });
</script>
