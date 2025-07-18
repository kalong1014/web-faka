<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:91:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/plugin/risk_manual.html";i:1646323578;}*/ ?>
<style>
    #account_id,#weight{
        display: none;
    }
</style>
<form class="layui-form layui-box" style='padding:25px 30px 20px 0' action="<?php echo url('riskAction'); ?>" data-auto="true" method="post">
    <input type="hidden" name="act" value="manual">
    <div class="layui-form-item">
        <label class="layui-form-label">风控操作</label>
        <div class="layui-input-block">
            <select id="risk_type" class="layui-input" name="risk_type" style="display:inline">
                <option value="0" selected="selected">系统警告（只提醒）</option>
                <option value="1">下架警告（下架相关商品）</option>
                <option value="2">关闭交易（能登录，不能出售和结算）</option>
                <option value="3">封禁（无法登录，不能出售和结算）</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">提示文字</label>
        <div class="layui-input-block">
            <input id='desc' type="text" name="desc" placeholder="提示文字" autocomplete="off" class="layui-input"  value="<?php echo plugconf('risk','risk_type0'); ?>">
        </div>
    </div>


    <div class="layui-form-item user_box">
        <label class="layui-form-label">输入用户ID</label>
        <div class="layui-input-block">
            <input  type="text" name="user_id" placeholder="请输入用户ID" autocomplete="off" class="layui-input" >
        </div>
    </div>

    <div class="layui-form-item goods_box" style="display:none">
        <label class="layui-form-label">输入商品ID</label>
        <div class="layui-input-block">
            <input type="text" name="goods_id" placeholder="请输入商品ID" autocomplete="off" class="layui-input" >
        </div>
    </div>


    <div class="hr-line-dashed"></div>
    <div class="layui-form-item text-center">
        <button class="layui-btn" type="submit">确定</button>
        <button class="layui-btn layui-btn-danger" type="button" data-confirm="确定要取消吗？" data-close="">取消</button>
    </div>
</form>
<script>
    $('#risk_type').change(function () {
        $('.user_box').hide();
        $('.goods_box').hide();
        if ($(this).val() == 0) {
            $('#desc').val("<?php echo plugconf('risk','risk_type0'); ?>");
            $('.user_box').show();
        }
        if ($(this).val() == 1) {
            $('#desc').val("<?php echo plugconf('risk','risk_type1'); ?>");
            $('.goods_box').show();
        }
        if ($(this).val() == 2) {
            $('#desc').val("<?php echo plugconf('risk','risk_type2'); ?>");
            $('.user_box').show();
        }
        if ($(this).val() == 3) {
            $('#desc').val("<?php echo plugconf('risk','risk_type3'); ?>");
            $('.user_box').show();
        }
    });

</script>
