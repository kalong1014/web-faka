<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:83:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/index/main.html";i:1656953116;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/manage/default/content.html";i:1646323578;}*/ ?>
<div class="ibox">
    
<style>
    .ibox{
    margin-top:120px;
    margin-bottom:0px;
    margin-left:-20px;
    margin-right:-20px;
     margin:0px;
      
     
    }
    .ibox-content{
        padding:0px
    } 
    .tipbox .alert{
        margin-left:-500px;
       
        margin-bottom:-60px;
        margin-right:30px;
       
    }
</style>

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
        
<div class="tipbox">
</div>
<div>
    <iframe src="<?php echo url('manage/index/bgdata'); ?>" style='width: 100%;'  frameborder="no" />
</div>

    </div>
    
<script>

    $(function () {
        $.ajax({type: "POST",
            url: "<?php echo url('admin/cloud/checkVersion'); ?>",
            dataType: 'json',
            success: function (result) {
                if (result.code == 1)
                {
                    if (result.data != null)
                    {
                        $(".tipbox").html('<p class="alert alert-danger">发下新版本：V' + result.data.newversion + '<button data-open="<?php echo url('admin/cloud/upgrade'); ?>" style="margin-left:15px" class="layui-btn layui-btn-normal layui-btn-mini">去更新</button><br>' + result.data.content + '</p>');
                        if (result.data.enforce == 1)
                        {
                            layer.alert("发现一个强制更新补丁，为了您的系统安全与稳定，推荐您立即更新！");
                        }
                    }
                }
            },
        });
    })
</script>

</div>