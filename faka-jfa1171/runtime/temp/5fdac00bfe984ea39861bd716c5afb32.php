<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:92:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/risk_keyword.html";i:1646323578;}*/ ?>
<style>
    #account_id,#weight{
        display: none;
    }
</style>
<form class="layui-form layui-box" style='padding:25px 30px 20px 0' action="__SELF__" data-auto="true" method="post">


    <div class="layui-form-item">
        <label class="layui-form-label">关键词维度</label>
        <div class="layui-input-block">
            <select class="layui-input" name="keyword_mode" style="display:inline">
                <option value="0" <?php if(plugconf('risk','keyword_mode')=='0'): ?>selected<?php endif; ?>>商品名</option>
                <option value="1" <?php if(plugconf('risk','keyword_mode')=='1'): ?>selected<?php endif; ?>>商品名+商品描述</option>
                <option value="2" <?php if(plugconf('risk','keyword_mode')=='2'): ?>selected<?php endif; ?>>商品名+商品描述+投诉内容</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">风控关键词</label>
        <div class="layui-input-block">
            <textarea class="layui-textarea" cols="30" rows="2" name="keyword" placeholder="请输入风控关键词" autocomplete="off"><?php echo plugconf('risk','keyword'); ?></textarea>
            <span>多个关键词用“|”分割字段。例如：辅助|外挂</span>
        </div>
    </div>

    <div class="hr-line-dashed"></div>
    <div class="layui-form-item text-center">
        <button class="layui-btn" type="submit">保存</button>
        <button class="layui-btn layui-btn-danger" type="button" data-confirm="确定要取消吗？" data-close="">取消</button>
    </div>
</form>
<script>
</script>
