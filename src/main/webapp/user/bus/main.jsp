<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
<title>ึ๗าณ</title>

<s:include value="/jsps/common/head.jsp" />

</head>
<body>
	<header id="brand">
		<div class="container">
			<div class="row">
				<div class="appname hide-on-phones">ะกต๊ึ๚สึ</div>
			</div>
		</div>
	</header>
	<section class="mainbg">
		<div class="container">
			<div class="row">
				<div class="content"></div>
			</div>
			<div class="row">
				<div class="six columns centered">
					<div class="app-wrapper ui-corner-top">
						<div class="blue module ui-corner-top clearfix">
							<h2>index</h2>
						</div>
						<div class="content">
								test
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<s:include value="/jsps/common/footer.jsp" />
	
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
