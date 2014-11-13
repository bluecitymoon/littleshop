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
<title>Customer Management</title>

<s:include value="/jsps/common/head.jsp" />

</head>
<body>
	
	<header id="brand">
	<div class="container">
		<div class="row">
			<div class="appname hide-on-phones">Routing Guide</div>
			<address>
			<!-- 
				<span> <strong></strong>��ӭ�û��� <s:property value="name" /><a href="user/logoff.ls?username=<s:property value="username" />" class="login-secure line">�˳���½</a>
				</span> -->
			</address>
		</div>
	</div>
</header>
	<s:include value="/jsps/common/menu.jsp" />
	<section class="mainbg">
		<div class="container">
			<div class="row">
				<div class="app-wrapper ui-corner-top">
					<div class="blue module ui-corner-top clearfix">
						<h2>��</h2>
					</div>
					<div class="content">
						<div data-bind="attr : {'class': id}" style="" class="6">
									<div class="row companydetail">
										<div class="app-wrapper ui-corner-top">
											<div class="gray module ui-corner-top clearfix">
												<h2>
													��ϸ��Ϣ<span data-bind="text : name" class="subheader line">�⽭��ʢ����ŷ����������������</span>
												</h2>
											</div>
											<div class="content">
												<div data-bind="text : id, visible : false" class="currentId" style="display: none;">6</div>
												<div class="row">
													<div class="six columns">
														<div class="row">
															<div class="two columns"><label>���� </label><input type="text" data-bind="value : distinct"></div>
															<div class="ten columns"><label>��ַ </label> <input type="text" data-bind="value : address"></div>
														</div>
														<div class="row">
															<label>�����ʼ�</label><label class="input-checkbox"> <img data-bind="attr: { 'src' : email_src }" alt="��������" src="/ls/img/20140718161333952.jpg">
															</label>
														</div>

													</div>
													<div class="six columns">
														<label>��˾���</label>
														<textarea data-bind="text : name" name="ex-textarea-4" class="tall">�⽭��ʢ����ŷ����������������</textarea>
													</div>
												</div>
												<div class="row">
													<div class="three columns">
														<div class="app-wrapper ui-corner-top">
															<div class="module ui-corner-top clearfix">
																<h2>�ͻ���ע��</h2>
															</div>
															<div class="content">
																<ul>
																	<li data-bind="foreach : problems">
																	<div class="row">
																		<div class="ten columns">
																			<label class="btn btn-block btn-lg btn-success">
																			<span data-bind="text : $data">��ע��1</span>
																		</label>
																		</div>
																		<div class="two columns">
																			<button class="tiny blue button">ɾ��</button>
																		</div>
																	</div>
																		
																	
																	<div class="row">
																		<div class="ten columns">
																			<label class="btn btn-block btn-lg btn-success">
																			<span data-bind="text : $data">��ע��2</span>
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
																			<select data-bind="options:$root.allProblemsConstant, optionsValue : 'id', optionsText : 'name', value : $parent.selectedProblem"><option value="1">��ע��1</option><option value="2">��ע��2</option><option value="3">��ע��3</option><option value="4">��ע��4</option><option value="5">��ע��5</option> </select> 
																		</div>
																		<div class="two columns">
																			<a data-bind="click: $root.addProblem" class="tiny blue button" href="#">����</a>
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
																<label for="ex-chx-a" class="input-checkbox selected"> <input type="checkbox" value="1" id="ex-chx-a" name="ex-checkbox"> ��һ�ι�ͨ
																</label> <label for="ex-chx-b" class=".selected input-checkbox"> <input type="checkbox" value="2" id="ex-chx-b" name="ex-checkbox"> �ڶ��ι�ͨ
																</label>
															</div>
														</div>
													</div>
													<div class="six columns">
														<div class="app-wrapper ui-corner-top">
															<div class="module ui-corner-top clearfix">
																<h2>�������(�ĵ����)</h2>
																<h2 class="right">
																	<a class="nice radius blue tiny button" href="">����</a>
																</h2>
															</div>
															<div class="content">
																<textarea name="ex-textarea-4" class="tall">������δ�ɹ���ͬ־����Ŭ����</textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<s:include value="/jsps/common/footer.jsp" />

	<script>
		$(document).ready(function() {
		});
	</script>
</body>
</html>
