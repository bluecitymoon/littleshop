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
							<h2>��˾��ע���е�����</h2>
						</div>
						<div class="content">
							<div data-bind="foreach : problems">
								<div class="row">
									<div class="two columns"><b  data-bind="text : id"></b>, </div>
									<div class="six columns"><input type="text" data-bind="value : name"></div>
									<div  class="two columns"><a href="#" class="tiny blue button" data-bind="click : $root.editProblem" title="">�����޸�</a></div>
									<div  class="two columns"><a href="#" class="tiny blue button" data-bind="click : $root.deleteProblem" title="">ɾ��</a></div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="eight columns">
									<input type="text" data-bind="value : newProblenName">
								</div>
								<div class="three columns">
									<a href="#" class="tiny blue button" data-bind="click : saveProblem" title="">�����µ�����</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="six columns">
					<div class="app-wrapper ui-corner-top" id="createUserDiv">
						<div class="blue module ui-corner-top clearfix">
							<h2>���ٽ�������</h2>
						</div>
						<div class="content">
							<div data-bind="foreach : steps">
								<div class="row">
									<div class="two columns"><b  data-bind="text : id"></b>, </div>
									<div class="six columns"><input type="text" data-bind="value : name"></div>
									<div  class="two columns"><a href="#" class="tiny blue button" data-bind="click : $root.editStep" title="">�����޸�</a></div>
									<div  class="two columns"><a href="#" class="tiny blue button" data-bind="click : $root.deleteStep" title="">ɾ��</a></div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="eight columns">
									<input type="text" data-bind="value : newStepName">
								</div>
								<div class="three columns">
									<a href="#" class="tiny blue button" data-bind="click : saveStep" title="">�����µ�����</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<s:include value="/jsps/common/footer.jsp" />
	<script src="/ls/js/User.js"></script>
	<script>
		$(document).ready(function() {

			var Problem = function(id, name) {
				var self = this;
				
				self.id = id;
				self.name = name;
			};

			var Step = function(id, name) {
				var self = this;
				
				self.id = id;
				self.name = name;
			};
			
			var ConfigurationModel = function() {
				var self = this;

				self.newProblenName = ko.observable();
				self.problems = ko.observableArray([]);
				self.newStepName = ko.observable();
				self.steps = ko.observableArray([]);
				
				self.findAllSteps = function() {
					$.ajax({
						url : '/ls/getAllSteps.ls',
						success : function(data) {

							self.steps.removeAll();
							$.each(data, function(index, value) {
								var p = new Step(value.id, value.name);
								self.steps.push(p);
							});
						}
					});
				};
				
				self.deleteStep = function() {
					alert("������ܻ��ڿ�����");
				};
				
				self.saveStep = function() {

					if (self.newStepName()) {
						$.ajax({
							url : '/ls/saveStep.ls',
							data : {
								name : self.newStepName()
							},
							success : function(data) {
								var p = new Step(data.id, data.name);
								self.steps.push(p);
							}
						});
					} else {

						alert('������һ�㶫����');
					}
				};

				self.editStep = function() {
					alert("������ܻ��ڿ�����");
				};
				
				

				self.findAllProblems = function() {
					$.ajax({
						url : '/ls/getAllProblems.ls',
						success : function(data) {

							self.problems.removeAll();
							$.each(data, function(index, value) {
								var p = new Problem(value.id, value.name);
								self.problems.push(p);
							});
						}
					});
				};
				
				self.deleteProblem = function() {
					alert("������ܻ��ڿ�����");
				};
				
				self.saveProblem = function() {

					if (self.newProblenName()) {
						$.ajax({
							url : '/ls/saveProblem.ls',
							data : {
								name : self.newProblenName()
							},
							success : function(data) {
								var p = new Problem(data.id, data.name);
								self.problems.push(p);
							}
						});
					} else {

						alert('������һ�㶫����');
					}
				};

				self.editProblem = function() {
					alert("������ܻ��ڿ�����");
				};
			};

			var model = new ConfigurationModel();
			model.findAllProblems();
			model.findAllSteps();
			ko.applyBindings(model);
		});
	</script>
</body>
</html>
