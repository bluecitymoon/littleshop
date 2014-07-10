<%@ page contentType="text/html;charset=gb2312"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>	<html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>	<html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9" lang="en"> <!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta name="viewport" content="width=device-width" />
<title>��½</title>
<%@ include file="jsps/common/head.jsp"%>
</head>
<body>
	<header id="brand">
		<div class="container">
			<div class="row">
				<div class="appname hide-on-phones">С������</div>
			</div>
		</div>
	</header>
	<section class="mainbg">
		<div class="container">
			<div class="content">
				<div class="row">
					<div class="four columns">
						<div class="app-wrapper ui-corner-top">
							<div class="blue module ui-corner-top clearfix">
								<h2>�����û���������</h2>
							</div>
							<div class="content">

								<form action="user/hello.ls" method="POST">
									<div class="row">
										<label for="username" class="required">�û���</label> <input type="text" id="username" name="username" autocorrect="off" autocapitalize="off" />
									</div>
									<label for="password" class="required custdrop">����</label>
									<div class="row">
										<input type="password" id="password" name="password" autocorrect="off" autocapitalize="off" />
									</div>
									<br>
									<div class="row">
										<button type="submit" class="nice radius medium blue button" value="Log In">��½</button>
										<a class="active tertiary" data-bind="click : forgetPassword">��������?</a> <label for="checkbox1" class="right"> </label>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="eight columns">

						<div class="app-wrapper ui-corner-top">
							<div class="blue module ui-corner-top clearfix">
								<h2>ϵͳ������Ϣ</h2>
							</div>
							<div class="content">
								<h4>��һ�汾����</h4>
								<hr>
								<p>�ͻ���Ϣץȡ</p>
								<p>�ͻ�׷�ټ�����</p>
								<p>���ݵ���</p>
								<p>�û�����</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="jsps/common/footer.jsp"%>
</body>
</html>
