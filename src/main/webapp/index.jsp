<%@ page contentType="text/html;charset=gb2312"%>
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
<title>��½</title>
<%@ include file="jsps/common/head.jsp" %> 
</head>
<body>
	<header id="brand">
		<div class="container">
			<div class="row">
				<div class="appname hide-on-phones">С������</div>
			</div>
		</div>
	</header>
	<!-- .end branding header -->
	<section class="mainbg">
		<div class="container">
			<div class="row">
				<div class="content"></div>
			</div>
			<div class="row">
				<div class="six columns centered">
					<div class="app-wrapper ui-corner-top">
						<div class="blue module ui-corner-top clearfix">
							<h2>�����û���������</h2>
						</div>
						<div class="content">

							<form  action="user/hello.ls">
								<div class="row">
									<label for="username" class="required">�û���</label> <input type="text" id="username" autocorrect="off" autocapitalize="off" data-bind='value: username, uniqueName: true' />
								</div>
								<label for="password" class="required custdrop">����</label>
								<div class="row">
									<input type="password" id="password" autocorrect="off" autocapitalize="off" data-bind='value: password, uniqueName: true' />
								</div>
								<br>
								<div class="row">
									<button type="submit" class="nice radius medium blue button" value="Log In">��½</button>
									<a href="password.html" class="active tertiary" onclick="">��������?</a> <label for="checkbox1" class="right"> </label>
								</div>
							</form>
							<!-- .end content -->
						</div>
						<!-- .end wrapper -->
					</div>
				</div>
			</div>
			<!-- .end container -->
		</div>
	</section>
	<%@ include file="jsps/common/footer.jsp" %>
	<script>
		$(document).ready(function() {

			var userModel = function() {

				var self = this;
				self.username = ko.observable('test');
				self.password = ko.observable('');
				self.maskChecked = ko.observable(true);

				self.login = function() {
					alert(self.maskChecked());
				};
				self.doLogin = function() {

				};
			};

			ko.applyBindings(new userModel());
		});
	</script>
</body>
</html>
