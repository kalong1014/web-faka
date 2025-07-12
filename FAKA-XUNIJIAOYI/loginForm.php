<?php
session_start();
include("config/conn.php");
include("config/function.php");
?>
<style>
html{overflow-x:hidden;overflow-y:scroll;*background-image:url(about:blank);*background-attachment:fixed;} 
body{color:#333;font:12px/1.4 '\5FAE\8F6F\96C5\9ED1',microsoft yahei,"宋体",Arial,sans-serif}
*{margin:0 auto;}
.inprmb,#bcar,#acar,#hcar,.c_g_ser span,.tdel,.list_tab .l4,.slist .l4 a,.info2 i, .i2 .l4 a,.rank em,.reply input,.reply .u1 span,.d_g_menu .post,.d_g_menu .replay,.tuan .zk,.tuan .go,.toplink a,.tab-hd span.active,.iu_reg,.iu_login,.iu_tx,.c_s_name .tx,.tit .bz,.scroltit small,.footer-gt dl dt,.dqwz,.login_qq,.login_alipay,#searchtype,.search i,.c_g_ihd .sc,.c_g_ihd .fx,.c_s_shop a,.nature span,.api_login a,.reg_left ul div,.login_right ul span,.rl_top span,.reg_btn,.login_btn,.sms_start ul span,.outsideb,.sidebar i,.quick_links i,.empty i{background:url(../img/focus.png) no-repeat;}
ul{list-style-type:none;margin:0;padding:0;}
li{list-style-type:none;}
a{color:#333;text-decoration:none;cursor:pointer;}
.red{color:red;}
.feng{color:#ff6600;}
.blue{color:blue;}
.hui{color:#666;}
.fd{float:left;}
.fd .anone{text-decoration:none;}
img{border:0;}
.clear{clear:both}

.main{width:1000px;}
.header div{width:1000px;}
.top{color:#666;height:18px;padding:5px 0;background-color:#f7f7f7;border-bottom:#eee solid 1px;}
.top  a{margin-right:8px;color:#666;}
.top  a:hover{text-decoration:underline;}
.toplogin,.toplogin .no_login span{float:left;}
.toplogin a{color:#247FBD;}
.toplogin a.login_qq,.toplogin a.login_alipay{
padding-left:18px;height:18px;line-height:18px;display: inline-block;color:#666;}
a.login_qq{float:left;background-position:-380px -386px;}
a.login_alipay{float:left;background-position:-380px -364px;}

.index_top{width:1000px;margin-top:10px;}
.t_left{float:left;width:206px;}
.t_center{float:left;width:526px;margin:0 10px;}
.t_right{float:left;width:246px;COLOR: #666;border: 1px solid #eee;}
.t_right a{COLOR: #666;}
.index_user{float:left;width:246px;height:82px;}
.index_user li{float:left;}
.index_user ul{margin:11px 0 11px 11px;}

.index_user a.iu_reg,.index_user a.iu_login{float:left;width:109px;height:34px;margin:10px 0 0 10px;}
.index_user .iu_reg{
	background-image: url(../homeimg/dl1.gif);
	background-repeat: no-repeat;
	background-position: left top;	
}
.index_user .iu_login{background:url(../homeimg/zc1.gif) left top no-repeat;}

.index_user .iu_tx{padding:5px;BACKGROUND-POSITION:-319px -10px;width:50px;height:50px;margin-right:4px;}
.index_user .iu_name{font-size: 14px;padding:2px 0 8px 0;width:160px;height:20px;}
.index_user .iu_name strong{color:#247fbd;}
.index_user .iu_link a{
	float:left;
	display: inline-block;
	padding:4px;
	border: 1px solid #eee;
	margin-right:6px;
}
.index_user .iu_link a:hover{color:#247fbd;border: 1px solid #247fbd;}


.user_third{
	float:left;
	margin-top: 12px;
	padding-top: 0;
	padding-right: 0;
	padding-bottom: 10px;
	padding-left: 19px;
}
.user_third span{float:left;}
.user_third a{width:16px;height:16px;margin:0 0 0 5px;}

.index_gg{width:246px;OVERFLOW: hidden;height:304px;}
.index_gg .tit{font-size: 14px;padding:8px;COLOR: #333;border-top: 1px solid #eee; }
.index_gg ul{width:246px;float:left;}
.index_gg li{
	width:226px;
	float:left;
	padding-top: 3px;
	padding-right: 10px;
	padding-bottom: 5px;
	padding-left: 10px;
}
.index_gg li span{width:101px;display: inline-block;OVERFLOW: hidden;}
.index_gg li em{font-size: 13px;font-weight:700;color:#dd530f;font-style:normal}
.index_gg li .gt{float:left;WIDTH: 170px; TEXT-OVERFLOW: ellipsis; WHITE-SPACE: nowrap;OVERFLOW: hidden;}
.index_gg li .date{FLOAT: right}
.index_gg li.tisp{background:#fafafa;color:#999;letter-spacing:2px;border-top: 1px solid #f0f0f0; }
.index_gg .tit .bz{BACKGROUND-POSITION:-140px -158px;width:27px;height:32px;position:absolute;z-index:2;margin:-14px 0 0 90px;_margin:-16px 0 0 90px; }

</style>
<base target="_top" /> 
<div class="t_right">
	<div class="index_user">
<?php
if($_SESSION["SHOPUSER"])
{
	$userid = returnuserid($_SESSION["SHOPUSER"]);
	$usertx="upload/".$userid."/user.jpg";if(!is_file($usertx)){$usertx="/user/img/nonetx.gif";}
    echo '<span id="i_ok_login" class="ok_login" ><ul>
	<li class="iu_tx"><img src="'.$usertx.'" class="pic_Layer" width="48" height="48" onerror=javascript:this.src=\'/user/img/nonetx.gif\' /></li>
	<li class="iu_name">您好，<strong>'.$_SESSION["SHOPUSER"].'</strong></li><li class="iu_link"><a href="/user/">管理中心</a> <a href="/shop/view'.$userid.'.html">我的店铺</a> <a href="/user/order.php">订单</a></li>
	</ul> </span>
    </span>';
}
else
{
	echo '<span class="no_login">
    	<a href="../reg/" target="_blank" class="iu_reg"></a>
		<a href="../reg/reg.php" onclick="layer.login()" class="iu_login"></a>
		<div class="user_third"><span>第三方帐号登录：</span><a href="config/qq/oauth/index.php"><img border="0" src="img/qq5.gif" width="15" height="16" /></a>	</div>
    </span>';
}
?>
	</div>
	<div class="index_gg">
<ul class="tit"><?=webname?> - 指数：	<span class="bz"></span></ul>
<ul>
<li><span>商  品：<em><?=returncount("yjcode_pro where zt=0 and ifxj=0")?></em> 个</span>  <span>需  求：<em><?=returncount("yjcode_task where zt=0")?></em> 条</span></li> 
<li><span>会  员：<em><?=returncount("yjcode_user")?></em> 位</span> <span>商  家：<em><?=returncount("yjcode_user where shopzt=2")?></em> 家</span></li>
<li><span>交  易：<em><?=returncount("yjcode_pro where zt=0 and ifxj=0")?></em> 笔</span> <span>金  额：<em><?=sprintf("%.0f",returnsum("money1*num","yjcode_order where ddzt<>'backsuc' and ddzt<>'close'"))?></em> 元</span></li>
<li class="tisp">正式上线<?php echo floor((time()-strtotime("2015-4-11"))/86400);?>天 | 指数每日0点刷新</li> 
</ul>
            <ul class="tit">网站公告</ul>
                  <ul>
 <? while0("*","yjcode_gg where zt=0 order by sj desc limit 3");while($row=mysql_fetch_array($res)){?>
         <li><div class="gt">·<a href="help/ggview<?=$row[id]?>.html" title="<?=$row[tit]?>" target="_blank"><?=strgb2312($row[tit],0,26)?></a></div><div class="date">[<?=dateMD($row[sj])?>]</div></li>
 <? }?>
                  </ul>
            </div>



</div>
</div>