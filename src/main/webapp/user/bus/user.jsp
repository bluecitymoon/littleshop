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
<title>User Management</title>

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
						<h2>搜索</h2>
					</div>
					<div class="content">
						<div class="row">
							<div class="three columns"></div>
							<div class="six columns">
								<div class="row collapse">
									<div class="eight columns">
										<input id="userNameInput" type="text" class="addon-postfix" placeholder="" data-bind="value : userName" />
									</div>
									<div class="four columns">
										<button class="small nice blue button postfix" data-bind="click : searchUser">搜索</button>
									</div>
								</div>
							</div>
							<div class="three columns"></div>
							<br>
						</div>
					</div>
				</div>

				<div class="row">

					<div class="seven columns">
						<div class="app-wrapper ui-corner-top" data-bind="visible : users().length > 0">
							<div class="blue module ui-corner-top clearfix">
								<h2>用户列表</h2>
							</div>
							<div class="content">
								<div class="row">
									<table class="infoTable">
										<thead>
											<tr>
												<th>编号</th>
												<th>姓名</th>
												<th>账号</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody data-bind="foreach : users">
											<tr data-bind="click : $root.showLocation">
												<td style="text-align: center" data-bind="text : id"></td>
												<td style="text-align: center" data-bind="text : name"></td>
												<td style="text-align: center" data-bind="text : username"></td>
												<td style="text-align: center"><a data-bind="click : $root.changePassword">更换密码</a> <a data-bind="click : $root.changePassword">删除</a> <a data-bind="click : $root.changePassword">更改信息</a></td>
											</tr>
										</tbody>
									</table>
									<br>
								</div>
							</div>
						</div>

					</div>
					<div class="five columns">
						<div class="app-wrapper ui-corner-top" id="createUserDiv">
							<div class="blue module ui-corner-top clearfix">
								<h2>创建或者修改用户信息</h2>
							</div>
							<div class="content">
								<div id="createUserPop" title="创建新的用户">
									<div class="row">
										<div class="six columns">

											<input type="text" id="user_id" data-bind="value : user_id" style="display: none" /> <label class="required">用户名</label> <input type="text" id="userName_new" data-bind="value : userName_new" />
										</div>
										<div class="six columns">
										<label>姓名</label> <input type="text" id="name_new" data-bind="value : name_new" />
										
										</div>

										
									</div>
									<div class="row">
										<div class="six columns">
											<label class="required">密码</label> <input type="password" id="password_new" data-bind="value : password_new" />
										</div>
										<div class="six columns">
											<label class="required">密码再一次</label> <input type="password" id="password_new" data-bind="value : password_new_again" />
										</div>
									</div>
									<hr>
									<div class="row">
										<p class="mb0">
											<a id="searchBtn" class="blue button mb0" href="#0" data-bind="click : saveOrUpdateUser">保存</a> <a class="tertiary line" href="#0">关闭</a>
										</p>
									</div>
									<div class="row"></div>
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
		$(document).ready( function() {
					var UserModel = function() {
						var self = this;
						self.user_id = ko.observable("");
						self.userName_new = ko.observable("");
						self.name_new = ko.observable("");
						self.password_new = ko.observable("");
						self.password_new_again = ko.observable("");
						self.userName = ko.observable("");
						self.userNameList = ko.observableArray([]);
						self.users = ko.observableArray([]);
						self.locations = ko.observableArray([]);
						self.searchUser = function() {
							$.ajax({	url : '/ls/ajaxFindUser.ls',
										data : {
											userName : self.userName()
										},
										success : function(data) {
											self.users.removeAll();

											for ( var i in data) {
												user = new User(data[i].id, data[i].name, data[i].username);
												self.users.push(user);
											}
										}
									});
						};
						self.showLocation = function(target) {
							alert('test');
						};
						
						self.assignLocation = function(target, event) {
							$('#assignLocationPopup').dialog({});
						};
						
						self.loadUserAccouts = function() {
							//apply country auto-complete 
							$.ajax({                        
								  url: '/ls/users/getAllUserAccounts.ls',
								  async: false,      
								  success: function(data) {   
									  $("#userNameInput").autocomplete({ source: data, minLength: 2 });
								  }
								});
						};
						
						self.loadAllUsers = function() {
							//load all
							$.ajax({                        
								  url: '/ls/users/loadAllUsers.ls',
								  async: false,      
								  success: function(data) {   
									  	self.users.removeAll();

										for ( var i in data) {
											user = new User(data[i].id, data[i].name, data[i].username);
											self.users.push(user);
										}	
								  }
								});
						};
						
						self.changePassword = function() {
							alert('TODO');
						};
						
						self.saveOrUpdateUser = function() {
							
						};

					};
					var model = new UserModel();
					model.loadUserAccouts();
					model.loadAllUsers();
					ko.applyBindings(model);
					
				});
	</script>
</body>
</html>
