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
<link rel="stylesheet" href="/ls/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/ls/css/flat-ui.css">
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
		<div class="container" id="container">
			<div class="row">
				<div class="app-wrapper ui-corner-top">
					<div class="blue module ui-corner-top clearfix">
						<h2>����</h2>
					</div>
					<div class="content">
					
						<div class="row">
							<div class="three columns">
								<label>ʡ/ֱϽ��</label>
								<select data-bind="options: provinces, optionsCaption: 'ȫ��', optionsText: 'name', optionsValue: 'id', value: selectedProvince, valueAllowUnset: true"></select>
							</div>
							<div class="three columns">
								<label>��</label>
								<select data-bind="options: cities, optionsCaption: 'ȫ��', optionsText: 'name', optionsValue: 'id', value: selectedCity, valueAllowUnset: true"></select>
							</div>
							
							<div class="three columns">
							</div>
							<div class="three columns">
							</div>
						</div>
						<hr>
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
						<div class="row">
							���ҵ�<label class="green label" data-bind="text: totalPagesCount"></label> �� �� <label class="yellow label" data-bind="text: totalCompanyCount"></label>���ͻ�
						</div>
						<br>
						<ul class="smartlist nice" data-bind="foreach: companyList">
							<li>
								<div class="row">
									<label class="input-checkbox">
										<div class="row">
											<div class="two columns">
												<div class="row">
													<a class="tiny green " style="margin-left: 20px;" data-bind="attr : {'id': id, 'detailUrl' : detailUrl}, click : $root.showDetail, clickBubble : false" href="#">��ϸ��Ϣ</a>
												</div>
												<br>
												<div class="row">
													<a class="tiny green " style="margin-left: 20px;" data-bind="click : $root.detail, clickBubble : false" href="#">չ��/����</a>
												</div>
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
									<div style="display: none;" data-bind="attr : {'class': id}">
									<div class="row companydetail">
										<div class="app-wrapper ui-corner-top">
											<div class="gray module ui-corner-top clearfix">
												<h2>
													��ϸ��Ϣ<span class="subheader line" data-bind="text : name"></span>
												</h2>
											</div>
											<div class="content">
												<div class="currentId" data-bind="text : id, visible : false"></div>
												<div class="row">
													<div class="six columns">
														<div class="row">
															<div class='two columns'><label>���� </label><input type="text" data-bind="value : distinct"></div>
															<div class='ten columns'><label>��ַ </label> <input type="text" data-bind="value : address"></div>
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
																<ul >
																	<li data-bind="foreach : problems">
																	<div class="row">
																		<div class="ten columns">
																			<label class="btn btn-block btn-lg btn-success">
																			<span data-bind="text : $data"></span>
																		</label>
																		</div>
																		<div class="two columns">
																			<button class="tiny blue button">ɾ��</button>
																		</div>
																	</div>
																		
																	</li>
																	<li>
																		<div class="row">
																		<div class="ten columns">
																			<select data-bind="options:$root.allProblemsConstant, optionsValue : 'id', optionsText : 'name', value : $parent.selectedProblem"> </select> 
																		</div>
																		<div class="two columns">
																			<a href="#" class="tiny blue button" data-bind="click: $root.addProblem">����</a>
																		</div>
																		</div>
																	</li>
																</ul>
																<br>
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
																</label> <label class=".selected input-checkbox" for="ex-chx-b"> <input type="checkbox" name="ex-checkbox" id="ex-chx-b" value="2" /> �ڶ��ι�ͨ
																</label>
															</div>
														</div>
													</div>
													<div class="six columns">
														<div class="app-wrapper ui-corner-top">
															<div class="module ui-corner-top clearfix">
																<h2>�������(�ĵ����)</h2>
																<h2 class="right">
																	<a href="" class="nice radius blue tiny button">����</a>
																</h2>
															</div>
															<div class="content">
																<textarea class="tall" name="ex-textarea-4">������δ�ɹ���ͬ־����Ŭ����</textarea>
															</div>
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
								
							</div>
							<div class="six columns">
								<a href="#" class="small blue button"  data-bind="click : lastPage, disable : currentIndex() > 1" >��һ���ͻ�</a>
								<label class="label yellow" data-bind="text : currentIndex"></label>
								<a href="#" class="small blue button" data-bind="click : nextPage">��һ���ͻ�</a>
							</div>
							<div class="three columns">
								<!--  <span>ȥ</span><input type="text" data-bind="value : pageIndexToGo" style="width:50px"> -->
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
			
					var Problem = function(id, name) {
						var self = this;
						
						self.id= id;
						self.name = name;
						self.checked = ko.observable(false);
						self.selectedItem = ko.observable('');
						
					};
					
					var Company = function(id, name, contractor, email, email_src, phone, phone_src, star, address, distinct, problems, detailUrl) {
						var self = this;
						
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
						self.problems = ko.observableArray(problems);
						self.detailUrl = detailUrl;
						self.selectedProblem = ko.observable('');
					};

					var Province = function(id, name, cities) {
						this.id = id;
						this.name = name;
						this.cities = cities;
					};
					
					var City = function(id, name) {
						this.id = id;
						this.name = name;
					};
					
					var CompanyModel = function() {
						var self = this;

						self.companyList = ko.observableArray([]);
						self.currentIndex = ko.observable(1);
						self.pageIndexToGo = ko.observable('');
						self.totalPagesCount = ko.observable('1');
						self.totalCompanyCount = ko.observable('0');
						self.starInput = ko.observable(0);
						self.distinctInput = ko.observable();
						self.seachCompany = ko.observable('');
						self.searchContactor =  ko.observable('');
						self.searchDistinct =  ko.observable('');
						self.allStar = ko.observable(true);
						self.allProblemsConstant = ko.observableArray([]);
						self.provinces = ko.observableArray([]);
						self.selectedProvince =  ko.observable('');
						self.cities = ko.computed(function() {
							var cityOptions;
							$.each(self.provinces(), function(i, n){
								if (n.id == self.selectedProvince()) {
									cityOptions =  n.cities;
								}
							});
							return cityOptions;
						});
						self.selectedCity = ko.observable('');
						
						self.init = function() {
							$('#starInput').raty({
								  click: function(score, evt) {
									  	self.starInput(score);
									  }
								});
							
							self.searchCompany();
							
							$.ajax({
								url : '/ls/findAllProblems.ls',
								success : function(data) {
									
									$.each(data, function(index, value) {

										self.allProblemsConstant.push(value);

									});
								}
							});
							
							$.ajax({
								url : '/ls/findAllProvinces.ls',
								success : function(data) {
									
									$.each(data, function(index, value) {

										//self.provinces.push(value.name);
										var cities = new Array();
										$.each(value.citys, function(i, n){
											var city = new City(n.id, n.name);
											cities.push(city);
										});
										var province = new Province(value.id, value.name, cities);
										self.provinces.push(province);
									});
								}
							});
						};
						
						self.lastPage = function() {
							
							self.currentIndex(self.currentIndex() - 1);
							self.searchCompany();
						};
						
						self.nextPage = function() {
							self.currentIndex(self.currentIndex() + 1);
							self.searchCompany();
						};
						
						self.detail = function(item, event) {
							$('.'+item.id).toggle('blind', {}, 200);
							//var $this = $(event.target);
							//$this.parent().parent().find('.companydetail').toggle('blind', {}, 200);
						};

						self.showDetail = function(item, event) {
							window.open(item.detailUrl, '_blank');
						};
						
						self.searchCompany = function() {
							
							$.ajax({
								url : '/ls/user/loadCompanyInPage.ls',
								data : {pageNumber : self.currentIndex(), 
										starInput : self.starInput(), 
										searchDistinct: self.searchDistinct(),
										seachCompany : self.seachCompany(), 
										searchContactor : self.searchContactor(),
										allStar : self.allStar(),
										cityId : self.selectedCity(),
										provinceId : self.selectedProvince()
										},
								success : function(data) {
									self.fillCompany(data);
								}
							});
						};
						
						self.fillCompany = function(data) {
							
							self.companyList.removeAll();

							$.each(data.elements, function(index, value) {
								var new_phone_src = "/ls/img/" + value.phoneSrc;
								var new_email_src = "/ls/img/" + value.emailSrc;
								
								var problems = new Array();
								
								$.each(value.problems, function(i, n) {
									problems.push(n.name);
								});
								
								var company = new Company(value.id, value.name, value.contactor, value.email, new_email_src, value.phone, new_phone_src, value.star, value.address, value.area, problems, value.fEurl);

								self.companyList.push(company);

								$('.star').raty({
									score : function() {
										return $(this).attr('star');
									}
								});
							});
							
							self.totalCompanyCount(data.total);
							self.totalPagesCount(data.totalPages);
						};
						
						self.findProblemInItem = function(array, id) {
							var found = false;
							$.each(array, function(i, v) {
								if (v.id == id) {
									found = true;
								}
							});
							
							return found;
						};
						
						self.addProblem = function(item, event) {
							console.debug(item);
							console.debug(item.selectedProblem());
						};
						
						self.updateProblem = function(item, event) {
							
						//	self.companyList()[0].problems().push(item);
							
						//	if (event.stopPropagation) {event.stopPropagation();}
							
						//	if ($(event.target).is(':selected')) {
						//		$(event.target).removeAttr('checked');
						//		
						//	} else {
						//		$(event.target).attr('checked', 'checked');
						//	}
							
							return true;
						};
						
					};
					
					var model = new CompanyModel();
					model.init();
					var $container = $("#container")[0];
					ko.applyBindings(model, $container);

				});
	</script>
</body>
</html>
