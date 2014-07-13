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
				<div class="app-wrapper ui-corner-top">
					<div class="blue module ui-corner-top clearfix">
						<h2>抓取任务</h2>
					</div>
					<div class="content">
						<div class="row">
							
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
			
			var GrabModel = function() {
				var self = this;
				self.url = ko.observable("");
				self.companyList = ko.observableArray([]);
				
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
			ko.applyBindings(model);
		});
	</script>
</body>
</html>
