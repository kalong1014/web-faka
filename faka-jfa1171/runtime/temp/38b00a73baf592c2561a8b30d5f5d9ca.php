<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:82:"/www/wwwroot/www.811192.xyz/application/templates/pc/wechat/default/news/form.html";i:1646323578;s:80:"/www/wwwroot/www.811192.xyz/application/templates/pc/wechat/default/content.html";i:1646323578;}*/ ?>
<div class="ibox">
    
<style>
    .panel{border-radius:0}
    .news-left {left:20px;width:300px;position:absolute;}
    .news-right {position:absolute;left:330px;right:20px;}
    .news-left .news-item {position:relative;width:280px;height:150px;max-width:270px;overflow:hidden;border:1px solid #ccc;background-size:cover;background-position:center center;}
    .news-left .news-item.active {border:1px solid #44b549 !important;}
    .news-left .article-add {font-size:22px;text-align:center;display:block;color:#999;}
    .news-left .article-add:hover{color:#666;}
    .news-left .news-title{bottom:0;width:272px;color:#fff;display:block;padding:0 5px;overflow:hidden;position:absolute;margin-left:-1px;text-overflow:ellipsis;max-height:6em;background:rgba(0,0,0,0.7);}
    .news-right .layui-input{border-radius:0;border:1px solid #e5e6e7;}
    .news-right .layui-input:hover, .news-right .layui-input:focus{border-color:#e5e6e7!important;}
    .news-right .input-group-addon{background:#fff;border-radius:0;border-color:#e5e6e7;}
    .news-right .upload-image-box{width:130px;height:90px;background-size:cover;background-position:center center;border:1px solid rgba(125,125,125,0.1);margin:5px}
    .news-item .upload-multiple-close{width:30px;height:30px;line-height:30px;text-align:center;background-color:rgba(0,0,0,.5);color:#fff;float:right;margin-right:-1px;margin-top:-1px}
    .news-item .upload-multiple-close:hover{text-decoration:none}
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
        

<!--左侧图文列表 开始-->
<div class="panel panel-default news-left">
    <div class="panel-heading">图文列表</div>
    <div class="panel-body news-box">
        <?php if(empty($vo['articles']) == false): foreach($vo['articles'] as $key=>$value): ?>
        <div class="news-item transition" data-id="<?php echo $value['id']; ?>" style="background-image:url('<?php echo $value['local_url']; ?>?imageView2/1/w/338/h/190/interlace/1')">
            <a class="upload-multiple-close fa fa-close hide"></a>
            <span class="news-title"><?php echo $value['title']; ?></span>
        </div>
        <hr/>
        <?php endforeach; else: ?>
        <div class="news-item transition active news-image" style="background-image:url('/static/plugs/uploader/theme/image.png')">
            <a class="upload-multiple-close fa fa-close hide"></a>
            <span class="news-title"></span>
        </div>
        <hr/>
        <?php endif; ?>
        <a href="javascript:void(0)" class='article-add transition' data-text-tip="添加图文"><i class="fa fa-plus"></i></a>
    </div>
</div>
<!--左侧图文列表 结束-->

<!--右侧编辑区 开始-->
<div class="panel panel-default news-right" style="overflow:hidden">
    <div class="panel-heading">图文内容编辑</div>
    <div class="panel-body">
        <form class="form-horizontal" role="form" name="news" onsubmit="return false;">

            <div class="form-group">
                <div class="col-md-12">
                    <div class="input-group">
                        <span class="input-group-addon">标题</span>
                        <input maxlength="64" required="required" title="标题不能为空哦" placeholder="请在这里输入标题" name='title' class="layui-input">
                        <input type="hidden" name="id">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <div class="input-group">
                        <span class="input-group-addon">作者</span>
                        <input maxlength="8" required="required" title="作者不能为空哦" placeholder="请输入作者" name='author' class="layui-input">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <div class="form-control" style="height:auto">
                        <label style="color:#ccc">图文封面大图片设置</label>
                        <div class="row nowrap">
                            <div class="col-xs-3" style="width:160px">
                                <div class="upload-image-box transition">
                                    <input value="/static/plugs/uploader/theme/image.png" type="hidden" name="local_url">
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <br>
                                <a data-file="one" data-type="jpg,png,jpeg" data-field="local_url" class="btn btn-sm">上传图片</a>
                                <a data-iframe='<?php echo url("image"); ?>?field=local_url' class="btn btn-sm">选择图片</a>
                                <br><br>
                                <label style="margin-left:0;padding-left:10px">
                                    <input data-auto-none type="checkbox" value="1" name="show_cover_pic">
                                    在正文显示此图片
                                </label>
                            </div>
                        </div>
                        <p class="help-block" style="margin-top:10px;color:#ccc">封面大图片建议尺寸：900像素 * 500像素</p>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <textarea name='content'></textarea>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label style="color:#aaa">摘要选填，如果不填写会默认抓取正文前54个字</label>
                    <textarea name="digest" class="layui-input" style="height:80px;resize:none;line-height:20px"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <label style="display:block"><span style="color:#aaa;">原文链接<b>选填</b>，填写之后在图文左下方会出现此链接</span>
                        <input maxlength="200" name='content_source_url' class="layui-input">
                    </label>
                </div>
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-4 col-md-9">
                        <button data-submit type="button" class="layui-btn">保存图文</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!--右侧编辑区 结束-->


    </div>
    
<script>
    $(function () {

        var editDdata = <?php echo json_encode((isset($vo['articles']) && ($vo['articles'] !== '')?$vo['articles']:[])); ?>;

        for (var i in editDdata) {
            $('.news-item').eq(i).data('item', editDdata[i]);
        }

        $('body').on('change', '.upload-image-box input', function () {
            $('.news-item.active').css('background-image', 'url(' + this.value + ')');
            $(this).parent('.upload-image-box').css('background-image', 'url(' + this.value + ')');
        });

        

		/*! 实例富文本编辑器  */
		var editor, $item;

		/*! 默认编辑第一篇图文 */
		editor = window.createEditor('[name="content"]');



		var $form = $('form[name="news"]'), $body = $('body');

		$form.validate();

		/*! 数据提交 */
		$form.find('button[data-submit]').on('click', function () {
			var data = [];
			$form.submit();
			if (!syncEditor($('.news-item.active'))) {
				editor.setData('文章内容不能留空，请输入内容！');
				return false;
			}
			$('.news-item').map(function () {
				var item = $(this).data('item');
				item.content = item.content || '文章内容不能留空，请输入内容！';
				data.push(item);
			});
			$.form.load('__SELF__', {data: data}, "post");
		});

		/*! 输入标题显示 */
		$form.find('[name="title"]').on('keyup', function () {
			if ($item) {
				$item.find('.news-title').html(this.value).show();
			}
		});

		/*! 同步编辑器 */
		function syncEditor($pItem) {
			// 处理上一个编辑器
			if ($form && $pItem && $pItem.size() > 0) {
				var data = {};
				data.id = $form.find('[name=id]').val();
				data.title = $form.find('[name=title]').val();
				data.local_url = $form.find('[name=local_url]').val();
				data.content = editor.getData() || '';
				data.author = $form.find('[name=author]').val();
				data.digest = $form.find('[name=digest]').val();
				data.show_cover_pic = $form.find('[name="show_cover_pic"]').get(0).checked ? 1 : 0;
				data.content_source_url = $form.find('[name="content_source_url"]').val();
				$form.find('[name=local_url]').trigger('change');
				$pItem.data('item', data), $form.submit();
				if ($form.find('input.validate-error').size() > 0 || data.content.length < 1) {
					((data.content || '').length < 1) && editor.setData('文章内容不能留空，请输入内容！');
					$pItem.addClass('active').siblings().removeClass('active');
					return false;
				}
			}
			return true;
		}

		/*! 显示编辑器 */
		function showEditor() {
			// 读取对象数据
			$item = $('.news-item.active');
			this.get = function () {
				var data = $item.data('item') || {};
				data.id = data.id || 0;
				data.title = data.title || '';
				data.local_url = data.local_url || '/static/plugs/uploader/theme/image.png';
				data.content = data.content || '';
				data.author = data.author || '';
				data.digest = data.digest || '';
				data.content_source_url = data.content_source_url||'';
				data.show_cover_pic = data.show_cover_pic || 0;
				return data;
			};
			// 重置表单
			$form.get(0).reset();
			// 获取当前数据
			var data = this.get();
			for (var i in data) {
				if (i !== 'content' && i !== 'show_cover_pic') {
					$form.find('[name="' + i + '"]').val(data[i]).trigger('change');
				}
			}
			if (parseInt(data.show_cover_pic) === 1) {
				$form.find('[name="show_cover_pic"]').get(0).checked = true;
			}
			editor.setData(data.content);
		}

		/*! 添加新图文 */
		$body.off('click', '.news-box .article-add').on('click', '.news-box .article-add', function () {
			var $html = $('<div class="news-item transition" style="background-image:url(/static/plugs/uploader/theme/image.png)"><a class="upload-multiple-close fa fa-close hide"></a><span class="news-title"></span></div><hr />');
			$html.insertBefore(this).trigger('click');
			$('.news-item').size() >= 7 && $(this).hide();
		});

		/*! 列表选择 */
		$body.off('click', '.news-item').on('click', '.news-item', function () {
			if (syncEditor($('.news-item.active'))) {
				$(this).addClass('active').siblings().removeClass('active');
				showEditor($item);
			}
		});

		/*! 隐藏删除按钮 */
		$body.off('mouseleave').on('mouseleave', '.news-item', function () {
			$(this).find('.upload-multiple-close').addClass('hide');
		});

		/*! 显示删除按钮 */
		$body.off('mouseenter', '.news-item').on('mouseenter', '.news-item', function () {
			$('.upload-multiple-close').addClass('hide');
			$(this).find('.upload-multiple-close').removeClass('hide');
		});

		/*! 删除操作图文 */
		$body.off('click', '.upload-multiple-close').on('click', '.upload-multiple-close', function () {
			var $box = $(this).parents('.news-item');
			$box.add($box.next('hr')).remove();
			$('.news-item').size() < 7 && $('.news-box .article-add').show();
		});

		/*! 默认显示第一个 */
		$('.news-box .news-item:first').trigger('click');
   
    });
</script>

</div>