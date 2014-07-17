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
						<h2>����</h2>
					</div>
					<div class="content">
						<div class="row">
							<div class="three columns">
								<label>��˾����</label>
								<input type="text" class="addon-postfix" data-bind = "value : seachCompany"/>
							</div>
							<div class="three columns">
								<label>��ϵ��</label>
								<input type="text" class="addon-postfix" data-bind = "value : searchContactor"/>
							</div>
							
							<div class="three columns">
								<label>������</label>
								<input type="text" class="addon-postfix" data-bind = "value : searchDistinct"/>
							</div>
							<div class="three columns">
								<label>�Ǽ�</label>
								<div id="starInput" data-bind="attr: { 'starInput' : starInput }"></div>
								<input type="checkbox" data-bind="checked : allStar"> ���������Ǽ�
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="six columns centered">
								<a class="small blue button" href="#" data-bind="click : searchCompany" > �������������Ŀͻ� </a>
							</div>
						</div>
					</div>
				</div>

				<div class="app-wrapper ui-corner-top">
					<div class="blue module ui-corner-top clearfix">
						<h2>�ͻ�׷��</h2>
					</div>
					<div class="content">
						<form class="nice custom"></form>
						<ul class="smartlist nice" data-bind="foreach: companyList">
							<li>
								<div class="row" data-bind="click : $root.detail">
									<label class="input-checkbox">
										<div class="row">
											<div class="two columns">
												<button class="tiny green button" style="margin-left: 20px;" data-bind="$root.showDetail">��ϸ��Ϣ</button>
											</div>
											<div class="three columns text-center">
												<h5>
													<b data-bind="text : name"></b>
												</h5>
											</div>
											<div class="one columns">
												<b data-bind="text : contractor"></b>
											</div>
											<div class="three columns">
												<label class="input-checkbox"> <img alt="�绰����" data-bind="attr: { 'src' : phone_src }">
												</label>
											</div>
											<div class="three columns">
												<div class="star" data-bind="attr: { 'star' : star }"></div>
											</div>
										</div>
									</label>
									<div class="row companydetail" style="display: none;">
										<div class="app-wrapper ui-corner-top">
											<div class="blue module ui-corner-top clearfix">
												<h2>
													��ϸ��Ϣ<span class="subheader line" data-bind="text : name"></span>
												</h2>
											</div>
											<div class="content">
												<div class="row">
													<div class="six columns">
														<div class="row">
															<label>��ַ </label> <input type="text" data-bind="value : address">
														</div>
														<div class="row">
															<label>�����ʼ�</label><label class="input-checkbox"> <img alt="��������" data-bind="attr: { 'src' : email_src }">
															</label>
														</div>

													</div>
													<div class="six columns">
														<label>��˾���</label>
														<textarea class="tall" name="ex-textarea-4" data-bind="text : name" data-bind="text : name"></textarea>
													</div>
												</div>
												<div class="row">
													<div class="three columns">
														<div class="app-wrapper ui-corner-top">
															<div class="module ui-corner-top clearfix">
																<h2>�ͻ���ע��</h2>
															</div>
															<div class="content">
																<label class="input-checkbox selected" for="ex-chx-a"> <input type="checkbox" name="ex-checkbox" id="ex-chx-a" value="1" /> ����ס��
																</label> <label class=".selected input-checkbox" for="ex-chx-b"> <input type="checkbox" name="ex-checkbox" id="ex-chx-b" value="2" /> ����ס�ͻ�
																</label>
															</div>
														</div>
													</div>
													<div class="three columns">
														<div class="app-wrapper ui-corner-top">
															<div class="module ui-corner-top clearfix">
																<h2>���ٽ���</h2>
															</div>
															<div class="content">
																<label class="input-checkbox selected" for="ex-chx-a"> <input type="checkbox" name="ex-checkbox" id="ex-chx-a" value="1" /> ��һ�ι�ͨ
																</label> <label class=".selected input-checkbox" for="ex-chx-b"> <input type="checkbox" name="ex-checkbox" id="ex-chx-b" value="2" /> ϣ������
																</label>
															</div>
														</div>
													</div>
													<div class="six columns">
														<div class="app-wrapper ui-corner-top">
															<div class="module ui-corner-top clearfix">
																<h2>�������</h2>
																<h2 class="right">
																	<a href="" class="nice radius blue tiny button">����</a>
																</h2>
															</div>
															<div class="content">
																<textarea class="tall" name="ex-textarea-4">����ͻ�������ûɶϣ��</textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
						
						<div class="row">
							<div class="three columns">
								���ҵ� <label class="yellow label" data-bind="text: totalCompanyCount"></label>���ͻ�
							</div>
							<div class="six columns">
								<a href="#" class="small blue button"  data-bind="click : lastPage, disable : currentIndex() > 1" >��һ���ͻ�</a>
								<label class="label yellow" data-bind="text : currentIndex"></label>
								<a href="#" class="small blue button" data-bind="click : nextPage">��һ���ͻ�</a>
							</div>
							<div class="three columns">
								 <span>ȥ</span><input type="text" data-bind="value : pageIndexToGo" style="width:50px">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<s:include value="/jsps/common/footer.jsp" />
	<script src="/ls/js/list.js"></script>
	<script src="/ls/js/jquery.raty.js"></script>
	<script>
		$(document).ready( function() {
					var Company = function(id, name, contractor, email, email_src, phone, phone_src, star, address, distinct) {
						self.id = id;
						self.name = name;
						self.contractor = contractor;
						self.email = email;
						self.email_src = email_src;
						self.phone = phone;
						self.phone_src = phone_src;
						self.star = star;
						self.address = address;
						self.distinct = distinct;

					};

					var CompanyModel = function() {
						var self = this;

						self.companyList = ko.observableArray([]);
						self.currentIndex = ko.observable(1);
						self.pageIndexToGo = ko.observable(1);
						self.totalPagesCount = ko.observable(1);
						self.totalCompanyCount = ko.observable(0);
						self.starInput = ko.observable(0);
						self.distinctInput = ko.observable();
						self.seachCompany = ko.observable('');
						self.searchContactor =  ko.observable('');
						self.searchDistinct =  ko.observable('');
						self.allStar = ko.observable(false);
						self.init = function() {
							$('#starInput').raty({
								  click: function(score, evt) {
									  	self.starInput(score);
									  }
								});
						};
						self.search = function() {
							$.ajax({
								url : '/ls/user/loadAllCompany.ls',
								data : {pageNumber : self.currentIndex()},
								success : function(data) {
									self.companyList.removeAll();

									$.each(data, function(index, value) {
										var new_phone_src = "/ls/img/" + value.phoneSrc;
										var new_email_src = "/ls/img/" + value.emailSrc;
										var company = new Company(value.id, value.name, value.contactor, value.email, new_email_src, value.phone, new_phone_src, value.star, value.address);

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

						self.lastPage = function() {
							
							self.currentIndex(self.currentIndex() - 1);
							
							$.ajax({
								url : '/ls/user/loadCompanyInPage.ls',
								data : {pageNumber : self.currentIndex()},
								success : function(data) {
								}
							});
						};
						
						self.nextPage = function() {
							self.test('a', 'b', 'c' , 'd');
						};
						
						self.test = function(a,b,c,d) {
							console.debug(a + b + c + d);
						};
						
						self.detail = function(item, event) {
							var $this = $(event.target);
							$this.parent().parent().find('.companydetail').toggle('blind', {}, 200);
						};

						self.showDetail = function(item, event) {
							var $this = $(event.target);
							$this.parent().parent().parent().parent().find('.companydetail').toggle('blind', {}, 200);
						};
						
						self.searchCompany = function() {
							
							$.ajax({
								url : '/ls/user/loadCompanyInPage.ls',
								data : {pageNumber : self.currentIndex(), 
										starInput : self.starInput(), 
										searchDistinct: self.searchDistinct(),
										seachCompany : self.seachCompany(), 
										searchContactor : self.searchContactor(),
										allStar : self.allStar()},
								success : function(data) {
									JSON.stringify(data);
								}
							});
						};
					};
					var model = new CompanyModel();
					model.init();
					ko.applyBindings(model);

				});
	</script>
</body>
</html>
