<?php
//AUTO:迷失的爱上云
//QQ：487845970
//TIME:2018年5月26日20:30:56
//就连最爱的人都留不住
include '../includes/common.php';
$title = '网站公告';
include 'head.php';
if ($islogin != 1) {
    exit('<script language=\'javascript\'>window.location.href=\'./login.php\';</script>');
}
echo '<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">发布一条公告</h4>
            </div>
            <div class="modal-body">
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">公告标题</div>
						<input type="text" id="title" class="form-control" placeholder="公告标题">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">公告内容</div>
						<input type="text" id="body" class="form-control" placeholder="请填写公告内容">
					</div>
				</div>
				
				<div class="form-group">
					<a class="btn btn-info btn-block" id="submit" data-dismiss="modal">确定添加</a>
				</div>
			</div>
        </div>
    </div>
</div>
<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="edit_set">编辑公告</h4>
            </div>
            <div class="modal-body">
			<input type="hidden" id="edit_val">
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">公告标题</div>
						<input type="text" id="edit_title" class="form-control" placeholder="公告标题">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">公告内容</div>
						<input type="text" id="edit_body" class="form-control" placeholder="请填写公告内容">
					</div>
				</div>
				<div class="form-group">
					<a class="btn btn-info btn-block" onclick="edit_ok($(\'#edit_val\').val())">确定修改</a>
				</div>
			</div>
        </div>
    </div>
</div>
<div class="container" style="padding-top:70px;">
<div class="col-xs-12 col-sm-10 col-lg-8 center-block" style="float: none;" id="main">
<div class="panel panel-success">
<div class="panel-heading">
<h3 class="panel-title"><b>网站弹窗公告</b></h3>
</div>
<div class="panel-body">
<a class="btn btn-info" data-toggle="modal" data-target="#myModal">新增一条公告</a>
<br><br><code>公告标题或公告内容支持html代码！但<b>使用html代码后无法再次编辑该公告,请仔细斟酌使用</b></code>
</div>
<table class="table table-striped" id="tab">
<thead><tr><th>公告ID</th><th>公告标题</th><th>公告内容</th><th>发布日期</th><th>操作</th></tr></thead>
<tbody>
<!--就连最爱的人都留不住 QQ：1911644263-->
';
$rs = $DB->query('SELECT * FROM shua_gonggao');
while ($row = $DB->fetch($rs)) {
    echo '<tr><td>' . $row['id'] . '</td><td>' . $row['title'] . '</td><td>' . $row['body'] . '</td><td>' . $row['date'] . '</td><td><a href="javascript:void(0)" onclick="editgonggao(\'' . $row['id'] . '\')" class="btn btn-info btn-xs">编辑</a>&nbsp;<a href="javascript:void(0)" class="btn btn-xs btn-danger" onclick="del_gonggao(\'' . $row['id'] . '\')">删除</a></td></tr>';
}
echo '</tbody>
</table>
</div>
</div>
</div>
<script src="//lib.baomitu.com/layer/2.3/layer.js"></script>
<script>
function editgonggao(id){
	ii=layer.load(1);
	$.ajax({
		type:"post",
		url:"ajax.php?act=edit_gonggao",
		data:{
			id:id
		},
		dataType:"json",
		success:function(edit){
			layer.close(ii);
			if(edit.code==0){
				$("#edit_val").val(edit.id);
				$("#edit_title").val(edit.title);
				$("#edit_body").val(edit.body);
				$("#edit_modal").modal(\'show\');
			}else{
				layer.alert(edit.msg);
			}
		}
	});
}
function del_gonggao(id){
	ii=layer.load(1);
	$.ajax({
		type:"post",
		url:"ajax.php?act=del_gonggao",
		data:{
			id:id
		},
		dataType:"json",
		success:function(del){
			layer.close(ii);
			if(del.code==0){
				layer.msg(del.msg,{icon:1,time:1500,shade:0.3});
				$.ajax({
					type:"get",
					url:"gonggao.php",
					dataType:"html",
					success:function(html){
						$("#tab").html($(html).find(\'#tab\').html());
					}
				});
			}else{
				layer.alert(del.msg);
			}
		}
	});
}
function edit_ok(id){
	ii=layer.load(1);
	var title=$("#edit_title").val();
	var body=$("#edit_body").val();
	if(!title|| body==\'\'){
		layer.msg("公告标题或公告内容不可为空！",{icon:2,time:1000,shade:0.3});
		layer.close(ii);
		return false;
	}
	$.ajax({
		type:"post",
		url:"ajax.php?act=edit_gg_ok",
		data:{
			id:id,title:title,body:body
		},
		dataType:"json",
		success:function(add){
			$("#edit_modal").modal(\'hide\');
			if(add.code==0){
				layer.close(ii);
				layer.msg(add.msg,{icon:1,shade:0.3,time:1500});
				window.location.href="gonggao.php";
			}else{
				layer.close(ii);
				layer.alert(add.msg);
			}
		}
	});
}
$("#submit").click(function(){
	ii=layer.load(1);
	var title=$("#title").val();
	var body=$("#body").val();
	if(!title){
		layer.msg("公告标题或公告内容不可为空！",{icon:2,time:1000,shade:0.3});
		layer.close(ii);
		return false;
	}
	$.ajax({
		type:"post",
		url:"ajax.php?act=add_gonggao",
		data:{
			title:title,body:body
		},
		dataType:"json",
		success:function(add){
			if(add.code==0){
				$(".modal-backdrop").remove();
				layer.close(ii);
				layer.msg(add.msg,{icon:1,shade:0.3,time:1500});
				$.ajax({
					type:"get",
					url:"gonggao.php",
					dataType:"html",
					success:function(html){
						$("#tab").html($(html).find(\'#tab\').html());
					}
				});
			}else{
				layer.close(ii);
				layer.alert(add.msg);
			}
		}
	});
});
</script>
</body>
</html>';