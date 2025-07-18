<?php
/* Smarty version 3.1.46, created on 2025-04-07 22:23:19
  from '/www/wwwroot/webfaka/app/View/Admin/Dashboard/Index.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.46',
  'unifunc' => 'content_67f3dfd78dd080_00192531',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '484224ba1f67a00c5a2f7d4ddb9c4ee39529b8a6' => 
    array (
      0 => '/www/wwwroot/webfaka/app/View/Admin/Dashboard/Index.html',
      1 => 1743848191,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:../Header.html' => 1,
    'file:../Toolbar.html' => 1,
    'file:../Footer.html' => 1,
  ),
),false)) {
function content_67f3dfd78dd080_00192531 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:../Header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<!--begin::Content-->
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!--begin::Toolbar-->
    <?php $_smarty_tpl->_subTemplateRender("file:../Toolbar.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <!--end::Toolbar-->

    <!--begin::Post-->
    <div class="post d-flex flex-column-fluid">
        <!--begin::Container-->
        <div id="kt_content_container" class="container-fluid">
            <div class="row">
                <div class="col-4">
                    <!--begin::Tasks-->
                    <div class="card card-flush h-lg-100">
                        <!--begin::Card header-->
                        <div class="card-header mt-6">
                            <!--begin::Card title-->
                            <div class="card-title flex-column">
                                <h3 class="fw-bolder mb-1" style="color: #e6a0ef;">官方公告</h3>
                            </div>
                            <!--end::Card title-->
                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body d-flex flex-column mb-9 p-9 pt-3 ad-html">
                        </div>
                        <!--end::Card body-->
                    </div>
                    <!--end::Tasks-->
                </div>

                <div class="col-8">
                    <!--begin::Navbar-->
                    <div class="card mb-6">
                        <div class="card-body pt-9 pb-0">
                            <!--begin::Details-->
                            <div class="d-flex flex-wrap flex-sm-nowrap">
                                <!--begin: Pic-->
                                <div class="me-7 mb-4">
                                    <div class="symbol  symbol-fixed position-relative">
                                        <img src="<?php if ($_smarty_tpl->tpl_vars['user']->value['avatar']) {
echo $_smarty_tpl->tpl_vars['user']->value['avatar'];
} else { ?>/favicon.ico<?php }?>"
                                             alt="image"/>
                                        <div class="position-absolute translate-middle bottom-0 start-100 mb-6 bg-success rounded-circle border border-4 border-white h-20px w-20px"></div>
                                    </div>
                                </div>
                                <!--end::Pic-->
                                <!--begin::Info-->
                                <div class="flex-grow-1">
                                    <!--begin::Title-->
                                    <div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
                                        <!--begin::User-->
                                        <div class="d-flex flex-column">
                                            <!--begin::Name-->
                                            <div class="d-flex align-items-center mb-2">
                                                <span class="text-gray-900 text-hover-primary fs-2 fw-bolder me-1"><?php echo $_smarty_tpl->tpl_vars['user']->value['nickname'];?>
</span>
                                            </div>
                                            <!--end::Name-->
                                            <!--begin::Info-->
                                            <div class="d-flex flex-wrap fw-bold fs-6 mb-1 pe-2">
                                        <span class="d-flex align-items-center text-gray-400 text-hover-primary mb-2">
                                            <span class="svg-icon svg-icon-4 me-1">
																<svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                     height="24" viewBox="0 0 24 24" fill="none">
																	<path opacity="0.3"
                                                                          d="M21 19H3C2.4 19 2 18.6 2 18V6C2 5.4 2.4 5 3 5H21C21.6 5 22 5.4 22 6V18C22 18.6 21.6 19 21 19Z"
                                                                          fill="black"/>
																	<path d="M21 5H2.99999C2.69999 5 2.49999 5.10005 2.29999 5.30005L11.2 13.3C11.7 13.7 12.4 13.7 12.8 13.3L21.7 5.30005C21.5 5.10005 21.3 5 21 5Z"
                                                                          fill="black"/>
																</svg>
											</span>
                                            <!--end::Svg Icon--><?php echo $_smarty_tpl->tpl_vars['user']->value['email'];?>
 </span>
                                            </div>
                                            <div class="d-flex flex-wrap fw-bold fs-6 pe-2">
                                                <span class="d-flex align-items-center text-gray-400 text-hover-primary mb-2">
                                                   <i class="fas fa-map-marker-alt text-success"></i> <span class="mx-1 text-success fs-10">本次登录IP-><?php echo $_smarty_tpl->tpl_vars['user']->value['login_ip'];?>
</span>
                                                    ·<span class="mx-1 text-danger fs-10">上次登录IP-><?php if ($_smarty_tpl->tpl_vars['user']->value['last_login_ip']) {
echo $_smarty_tpl->tpl_vars['user']->value['last_login_ip'];?>
(<?php echo $_smarty_tpl->tpl_vars['user']->value['last_login_time'];?>
)<?php } else { ?> - <?php }?></span>
                                                </span>
                                            </div>

                                            <!--end::Info-->
                                        </div>
                                        <!--end::User-->
                                        <!--begin::Actions-->
                                        <div class="d-flex my-4">
                                            <a href="/admin/manage/set" class="btn btn-sm btn-light-primary me-3"><i
                                                        class="fas fa-pen-square"></i> 修改资料</a>

                                        </div>
                                        <!--end::Actions-->
                                    </div>
                                    <!--end::Title-->

                                </div>
                                <!--end::Info-->
                            </div>
                            <!--end::Details-->
                        </div>
                    </div>
                    <!--end::Navbar-->
                    <!--begin::Toolbar-->
                    <div class="d-flex flex-wrap flex-stack mb-6">
                        <!--begin::Controls-->
                        <div class="d-flex align-items-center my-2">
                            <!--begin::Select wrapper-->
                            <div class="w-100px me-5">
                                <!--begin::Select-->
                                <select name="status"
                                        class="form-select form-select-white form-select-sm dashboard-data-type">
                                    <option value="0" selected="selected">今日数据</option>
                                    <option value="1">昨日数据</option>
                                    <option value="2">本周数据</option>
                                    <option value="3">本月数据</option>
                                    <option value="4">所有数据</option>
                                </select>
                                <!--end::Select-->
                            </div>
                        </div>
                        <!--end::Controls-->
                    </div>
                    <!--end::Toolbar-->
                    <!--begin::Row-->
                    <div class="row g-6 g-xl-9">
                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fas fa-shopping-bag p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">交易金额</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 turnover" style="color: #f1a6b4;">...</div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fas fa-chart-pie p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">订单</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 order_num" style="color: #f1a6b4;">...</div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fas fa-chart-pie p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">盈利</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 order_rent" style="color: #f1a6b4;">...</div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fas fa-donate p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">手续费</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 cost" style="color: #f1a6b4;">...</div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fas fa-laptop-house p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">子站</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 business" style="color: #f1a6b4;">...</div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fab fa-sellcast p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">未处理提现</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 cash_status_0" style="color: #f1a6b4;">...</div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fas fa-funnel-dollar p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">成功提现金额</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 cash_money_status_1" style="color: #f1a6b4;">...
                                    </div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fas fa-user-plus p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">注册用户</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 user_register_num" style="color: #f1a6b4;">...
                                    </div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fas fa-clock p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">打卡用户</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 user_login_num" style="color: #f1a6b4;">...</div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fas fa-hand-holding-usd p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">充值金额</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 recharge_amount" style="color: #f1a6b4;">...</div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->

                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fab fa-amazon-pay p-3" style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">非余额交易</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 online_amout" style="color: #f1a6b4;">...</div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->

                        <!--begin::Col-->
                        <div class="col-sm-6 col-xl-3">
                            <!--begin::Card-->
                            <div class="card h-100">
                                <!--begin::Card header-->
                                <div class="card-header flex-nowrap border-0 pt-9">
                                    <!--begin::Card title-->
                                    <div class="card-title m-0">
                                        <!--begin::Icon-->
                                        <div class="symbol symbol-45px w-45px bg-light me-5">
                                            <i class="fas fa-yen-sign p-3"  style="font-size: 26px;"></i>
                                        </div>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <a class="fs-4 fw-bold text-hover-primary text-gray-600 m-0">推广返利</a>
                                        <!--end::Title-->
                                    </div>
                                    <!--end::Card title-->
                                </div>
                                <!--end::Card header-->
                                <!--begin::Card body-->
                                <div class="card-body d-flex flex-column px-9 pt-6 pb-8">
                                    <!--begin::Heading-->
                                    <div class="fs-2hx fw-bolder mb-3 rebate" style="color: #f1a6b4;">...</div>
                                    <!--end::Heading-->
                                </div>
                                <!--end::Card body-->
                            </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Col-->
                    </div>
                    <!--end::Row-->
                </div>

                <div class="col-12" style="margin-top: 20px;">
                    <!--begin::Tasks-->
                    <div class="card card-flush h-lg-100">
                        <!--begin::Card header-->
                        <div class="card-header mt-6">
                            <!--begin::Card title-->
                            <div class="card-title flex-column">
                                <h3 class="fw-bolder mb-1" style="color: #e6a0ef;">本周数据</h3>
                            </div>
                            <!--end::Card title-->
                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body d-flex flex-column mb-9 p-9 pt-3">
                            <div id="statistics" style="height:380px;width: 100%;"></div>
                        </div>
                        <!--end::Card body-->
                    </div>
                    <!--end::Tasks-->
                </div>

            </div>

        </div>
        <!--end::Container-->
    </div>
    <!--end::Post-->
</div>
<!--end::Content-->


<!--begin::Item -MODEL-->
<div class="ad-item-model" style="display: none;">
    <div class="d-flex align-items-center position-relative mb-7">
        <!--begin::Label-->
        <div class="position-absolute top-0 start-0 rounded h-100 bg-secondary w-4px"></div>
        <!--end::Label-->
        <!--begin::Details-->
        <div class="fw-bold ms-3">
            <a href="[url]" [target] class="fs-6 fw-bolder text-hover-primary" style="color: #b593a4;">[title]</a>
            <!--begin::Info-->
            <div class="text-gray-400 mt-1">[create_time]</div>
            <!--end::Info-->
        </div>
        <!--end::Details-->
    </div>
</div>
<!--end::Item-->

<?php echo '<script'; ?>
>
    $.get("/admin/api/app/ad", res => {
        if (res.code != 200) {
            return;
        }
        let html = "";
        res.data.forEach(item => {
            html += $('.ad-item-model').html().replace("[title]", item.title).replace("[create_time]", item.create_date).replace("[url]", item.url ? item.url : "javascript:void(0)").replace("[target]", item.url ? 'target="_blank"' : '');
        });
        $('.ad-html').append(html);
    });

    $(function () {
        layui.use('layer', function () {

            function getDashboardData(type) {
                let loaderIndex = layer.load(2, {shade: ['0.3', '#fff']});
                $.post("/admin/api/dashboard/data", {type: type}, res => {
                    layer.close(loaderIndex);
                    if (res.code == 200) {
                        $('.turnover').text("￥" + res.data.turnover);
                        $('.order_num').text(res.data.order_num);
                        $('.cost').text("￥" + res.data.cost);
                        $('.business').text(res.data.business);
                        $('.cash_status_0').text(res.data.cash_status_0);
                        $('.cash_money_status_1').text("￥" + res.data.cash_money_status_1);
                        $('.user_register_num').text(res.data.user_register_num);
                        $('.user_login_num').text(res.data.user_login_num);
                        $('.recharge_amount').text("￥" + res.data.recharge_amount);
                        $('.order_rent').text("￥" + res.data.rent);
                        $('.rebate').text("￥" + res.data.rebate);
                        $('.online_amout').text("￥" + res.data.online_amout);
                    }
                });
            }

            getDashboardData(0);

            $('.dashboard-data-type').change(function (e) {
                getDashboardData(this.value);
            });


            $.get("/admin/api/dashboard/weekStatistics", res => {
                if (res.code != 200) {
                    layer.msg(res.msg);
                    return;
                }
                let statistics = echarts.init(document.getElementById('statistics'));
                let option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            label: {
                                backgroundColor: '#6a7985'
                            }
                        }
                    },
                    legend: {
                        data: ['交易额', '盈利', '手续费', '提现', '充值']
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    grid: {
                        left: '1%',
                        right: '1%',
                        bottom: '1%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data: res.data.week
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '交易额',
                            type: 'line',
                            stack: 'Total',
                            label: {
                                show: true,
                                position: 'top'
                            },
                            areaStyle: {},
                            emphasis: {
                                focus: 'series'
                            },
                            data: res.data.series.trade
                        },
                        {
                            name: '手续费',
                            type: 'line',
                            stack: 'Total',
                            areaStyle: {},
                            emphasis: {
                                focus: 'series'
                            },
                            data: res.data.series.cost
                        },
                        {
                            name: '盈利',
                            type: 'line',
                            stack: 'Total',
                            areaStyle: {},
                            emphasis: {
                                focus: 'series'
                            },
                            data: res.data.series.profit
                        },
                        {
                            name: '提现',
                            type: 'line',
                            stack: 'Total',
                            areaStyle: {},
                            emphasis: {
                                focus: 'series'
                            },
                            data: res.data.series.cash
                        },
                        {
                            name: '充值',
                            type: 'line',
                            stack: 'Total',
                            areaStyle: {},
                            emphasis: {
                                focus: 'series'
                            },
                            data: res.data.series.recharge
                        }
                    ]
                };
                statistics.setOption(option);
            });

        });
    });


<?php echo '</script'; ?>
>

<?php $_smarty_tpl->_subTemplateRender("file:../Footer.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
