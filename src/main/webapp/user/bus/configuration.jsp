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
<title>Configuration</title>

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

					<div class="six columns">
						<div class="app-wrapper ui-corner-top">
							<div class="blue module ui-corner-top clearfix">
								<h2>公司关注点列点配置</h2>
							</div>
							<div class="content">
								<div class="row" data-bind="foreach : problems">
									<div class="two columns">
										<input type="text" data-bind="value : id">
									</div>
									<div class="eight columns">
										<input type="text" data-bind="value : name">
									</div>
									<div class="two columns"><a  href="#" class="tiny white button" data-bind="click : editProblem" title="">存一下</a></div>
								</div>
								<div class="row">
									<div class="ten columns">
										<input type="text" data-bind="value : newProblenName">
									</div>
									<div class="two columns">
										<a  href="#" class="tiny white button" data-bind="click : saveProblem" title="">存一下</a>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="six columns">
						<div class="app-wrapper ui-corner-top" id="createUserDiv">
							<div class="blue module ui-corner-top clearfix">
								<h2>跟踪进度配置</h2>
							</div>
							<div class="content"></div>
						</div>

					</div>
				</div>
		</div>
	</section>

	<s:include value="/jsps/common/footer.jsp" />
	<script src="/ls/js/User.js"></script>
	<script>
		$(document).ready( function() {
			
					var Problem = function(id, name) {
						self.id = id;
						self.name = name;
					};
					
					var ConfigurationModel = function() {
						var self = this;
						
						self.newProblenName = ko.observable();
						self.problems = ko.observableArray([]);
						
						self.findAllProblems = function() {
							$.ajax({	url : '/ls/getAllProblems.ls',
										success : function(data) {
											self.problems.removeAll();

											for ( var i in data) {
												var problem = new Problem(data[i].id, data[i].name);
												self.problems.push(problem);
											}
										}
									});
						};
						
						self.saveProblem = function() {
							
							if (self.newProblenName()) {
								$.ajax({	url : '/ls/saveProblem.ls',
									data : { name : self.newProblenName()},
									success : function(data) {
										var p = new Problem(data.id, data.name);
										self.users.push(p);
									}
								});
							} else {
								
								alert('请输入一点东西吧');
							}
						};
						
						self.editProblem = function() {
							alert("这个功能还在开发中");
						};
						
					};
					
					var model = new ConfigurationModel();
					model.findAllProblems();
					ko.applyBindings(model);
				});
	</script>
</body>
</html>
