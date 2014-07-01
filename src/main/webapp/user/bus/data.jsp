<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>	<html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>	<html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9" lang="en"> <!-->
<html lang="en">
<!--<![endif]-->
<head>
<!-- Set the viewport width to device width for mobile -->
<meta name="viewport" content="width=device-width" />
<title>Data Management</title>
<link rel="stylesheet" href="/ls/css/jquery.raty.css">
<s:include value="/jsps/common/head.jsp" />

</head>
<body>
	<header id="brand">
		<div class="container">
			<div class="row">
				<div class="appname hide-on-phones"></div>
			</div>
		</div>
	</header>

	<s:include value="/jsps/common/menu.jsp" />
	<section class="mainbg">
		<div class="container">
			<div class="row">
				<div class="app-wrapper ui-corner-top">
					<div class="blue module ui-corner-top clearfix">
						<h2>搜索</h2>
					</div>
					<div class="content">
						<div class="row">
							<div class="three columns"></div>
							<div class="six columns">
								<div class="row collapse">
									<div class="eight columns">
										<input id="userNameInput" type="text" class="addon-postfix"
											placeholder="" />
									</div>
									<div class="four columns">
										<button class="small nice blue button postfix"
											data-bind="click : search">搜索</button>
									</div>
								</div>
							</div>
							<div class="three columns"></div>
							<br>
						</div>
					</div>
				</div>

				<div class="app-wrapper ui-corner-top">
					<div class="blue module ui-corner-top clearfix">
						<h2>客户追踪</h2>
					</div>
					<div class="content">

						<form class="nice custom"></form>
						<ul class="smartlist nice" data-bind="foreach: companyList">
							<li>


								<div class="row" data-bind="click : $root.detail">
									<label class="input-checkbox">
										<div class="row">
											<div class="two columns">
												<button class="tiny green button" style="margin-left : 20px;" data-bind="$root.showDetail">详细信息</button>
											</div>
											<div class="three columns text-center">
												<b data-bind="text : name"></b>
											</div>
											<div class="four columns">
												<span data-bind="text : contractor"></span>, <img alt="电话号码"
													data-bind="attr: { 'src' : phone_src }">
											</div>
											<div class="three columns">
												<div class="star" data-bind="attr: { 'star' : star }"></div>
											</div>
										</div>
									</label>
									<div class="row companydetail" style="display: none;">
										<hr>
										<form>
											<fieldset>
												<legend>
													<b>具体细节</b>
												</legend>
												<div class="row">
													<div class="six columns">
														<label>地址 </label> <input type="text"
															data-bind="value : address">
													</div>
													<div class="six columns">
														<label>电子邮件</label> <img alt="电子邮箱"
															data-bind="attr: { 'src' : email_src }">
													</div>
												</div>
												<div class="row">
													<div class="three columns">
														<label>关注点</label> <label class="input-checkbox selected"
															for="ex-chx-a"> <input type="checkbox"
															name="ex-checkbox" id="ex-chx-a" value="1" /> 留不住人
														</label> <label class=".selected input-checkbox" for="ex-chx-b">
															<input type="checkbox" name="ex-checkbox" id="ex-chx-b"
															value="2" /> 留不住客户
														</label>
													</div>
													<div class="three columns">
														<label>进展</label> <label class="input-checkbox selected"
															for="ex-chx-a"> <input type="checkbox"
															name="ex-checkbox" id="ex-chx-a" value="1" /> 第一次沟通
														</label> <label class=".selected input-checkbox" for="ex-chx-b">
															<input type="checkbox" name="ex-checkbox" id="ex-chx-b"
															value="2" /> 希望不大
														</label>
													</div>
													<div class="six columns">
														<label>跟踪情况</label>
														<textarea class="tall" name="ex-textarea-4">这个客户基本上没啥希望</textarea>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<s:include value="/jsps/common/footer.jsp" />
	<script src="/ls/js/list.js"></script>
	<script src="/ls/js/jquery.raty.js"></script>
	<script>
		$(document).ready(
				function() {
					var Company = function(id, name, contractor, email,
							email_src, phone, phone_src, star, address) {
						self.id = id;
						self.name = name;
						self.contractor = contractor;
						self.email = email;
						self.email_src = email_src;
						self.phone = phone;
						self.phone_src = phone_src;
						self.star = star;
						self.address = address;

					};

					var CompanyModel = function() {
						var self = this;

						self.companyList = ko.observableArray([]);

						self.search = function() {
							$.ajax({
								url : '/ls/user/loadAllCompany.ls',

								success : function(data) {
									self.companyList.removeAll();

									$.each(data, function(index, value) {
										var new_phone_src = "/ls/img/"
												+ value.phoneSrc;
										var new_email_src = "/ls/img/"
												+ value.emailSrc;
										var company = new Company(value.id,
												value.name, value.contactor,
												value.email, new_email_src,
												value.phone, new_phone_src,
												"5", value.address);

										self.companyList.push(company);

										$('.star').raty({
											score : function() {
												return $(this).attr('star');
											}
										});
									});
								}
							});
						};

						self.detail = function(item, event) {
							var $this = $(event.target);
							$this.parent().parent().find('.companydetail')
									.toggle('blind', {}, 200);
						};
						
						self.showDetail = function(item, event) {
							var $this = $(event.target);
							$this.parent().parent().parent().parent().find('.companydetail')
									.toggle('blind', {}, 200);
						};

					};
					var model = new CompanyModel();
					ko.applyBindings(model);

				});
	</script>
</body>
</html>
