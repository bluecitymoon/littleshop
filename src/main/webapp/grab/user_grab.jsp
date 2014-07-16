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
<title>抓取</title>

<s:include value="/jsps/common/head.jsp" />

</head>
<body>
	<header id="brand">
		<div class="container">
			<div class="row">
				<div class="appname hide-on-phones">客户助手</div>
			</div>
		</div>
	</header>

	<s:include value="/jsps/common/menu.jsp" />
	<section class="mainbg">
		<div class="container">
			<div class="row">
				<div class="four columns">
					<div class="app-wrapper ui-corner-top">
						<div class="blue module ui-corner-top clearfix">
							<h2>江苏</h2>
						</div>
						<div>
							<ul style="border: 0; margin: 0;" class="smartlist nice" data-bind="foreach : jiangsuCities">
								<li><label>
										<div class="row collapse">
											<div class="one columns text-center">
												<input type="checkbox">
											</div>
											<div class="two columns" data-bind="text : name"></div>
											<div class="nice columns" data-bind="text : url"></div>
										</div>
								</label></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="four columns">
				<div class="app-wrapper ui-corner-top">
						<div class="blue module ui-corner-top clearfix">
							<h2>安徽</h2>
						</div>
						<div>
							<ul style="border: 0; margin: 0;" class="smartlist nice" data-bind="foreach : anhuiCities">
								<li><label>
										<div class="row collapse">
											<div class="one columns text-center">
												<input type="checkbox">
											</div>
											<div class="two columns" data-bind="text : name"></div>
											<div class="nice columns" data-bind="text : url"></div>
										</div>
								</label></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="four columns">
				<div class="app-wrapper ui-corner-top">
						<div class="blue module ui-corner-top clearfix">
							<h2>浙江</h2>
						</div>
						<div>
							<ul style="border: 0; margin: 0;" class="smartlist nice" data-bind="foreach : zhejiangCities">
								<li><label>
										<div class="row collapse">
											<div class="one columns text-center">
												<input type="checkbox">
											</div>
											<div class="two columns" data-bind="text : name"></div>
											<div class="nice columns" data-bind="text : url"></div>
										</div>
								</label></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="app-wrapper ui-corner-top">
					
					<div class="blue module ui-corner-top clearfix">
						<h2>抓取任务</h2>
					</div>
					<div class="content">
						<div class="row">
							<label>示例链接</label>
							<p>
								http://su.58.com/meirongshi/pn2/?PGTID=14052516562690.6999314113601204&ClickID=1
							</p>
						</div>
						<hr>
						<div class="row">
							<label>目标链接</label>
							<input type="text" data-bind="value : url" >
						</div>
						<a class="nice radius blue button" href="#" data-bind="click : grab">开始抓取</a>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="app-wrapper ui-corner-top">
					<div class="blue module ui-corner-top clearfix">
						<h2>抓取结果</h2>
					</div>
					<div class="content">
						<ul class="smartlist nice" data-bind="foreach: companyList">
							<li><label class="input-checkbox">
									<div class="row">
										<div class="one columns"></div>
										<div class="four columns text-center">
											<h5>
												<b data-bind="text : name"></b>
											</h5>
										</div>
										<div class="one columns">
											<b data-bind="text : distinct"></b>
										</div>
										<div class="six columns">
											<a data-bind="text : detailUrl, attr: { 'href' : detailUrl }"></a>
										</div>
									</div>
							</label></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<s:include value="/jsps/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			
			var Company = function(name, distinct, detailUrl) {
				self.name = name;
				self.detailUrl = detailUrl;
				self.distinct = distinct;

			};
			
			var City = function(name, url) {
				self.name = name;
				self.url = url;

			};
			
			var GrabModel = function() {
				var self = this;
				self.url = ko.observable("");
				self.companyList = ko.observableArray([]);
				self.jiangsuCities =  ko.observableArray([]);
				self.anhuiCities =  ko.observableArray([]);
				self.zhejiangCities = ko.observableArray([]);
				
				self.initCities = function(city) {
					
					$.ajax({url : '/ls/grab/getcities.ls',
						data : {province : "浙江"},
						sync : false,
						success: function(data) {

							$.each(data, function(index, value) {
								var city = new City( value.name, value.url );
								self.zhejiangCities.push(city);

								});
						}
					});
					
					$.ajax({url : '/ls/grab/getcities.ls',
						data : {province : "江苏"},
						sync : false,
						success: function(data) {

							$.each(data, function(index, value) {
								var city = new City( value.name, value.url );
								self.jiangsuCities.push(city);

								});
						}
					});
					
					$.ajax({url : '/ls/grab/getcities.ls',
						data : {province : "安徽"},
						sync : false,
						success: function(data) {

							$.each(data, function(index, value) {
								var city = new City( value.name, value.url );
								self.anhuiCities.push(city);

								});
						}
					});
				};
				
				self.grab = function() {
						$.ajax({url : '/ls/grab/grabCompanyIndexPage.ls',
								data : {url : encodeURIComponent(self.url())},
								success: function(data) {
									self.companyList.removeAll();

									$.each(data, function(index, value) {
										var company = new Company( value.name, value.distinct, value.fEurl );

										self.companyList.push(company);

										});
								}
								});
					
					};

				};

			var model = new GrabModel();
			model.initCities();
			ko.applyBindings(model);
		});
	</script>
</body>
</html>
