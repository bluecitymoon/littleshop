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
<title>分配区域</title>

<s:include value="/jsps/common/head.jsp" />

</head>
<body>
	<header id="brand">
		<div class="container">
			<div class="row">
				<div class="appname hide-on-phones">小店助手</div>
			</div>
		</div>
	</header>

	<s:include value="/jsps/common/menu.jsp" />
	<section class="mainbg">
		<div class="container">
			<div class="row">
				<div class="app-wrapper ui-corner-top">
					<div class="blue module ui-corner-top clearfix">
						<h2>划分区域</h2>
					</div>
					<div class="content">
						<div class="row">
							<div class="three columns"></div>
							<div class="six columns">
								<div class="row collapse">
									<div class="eight columns">
										<input type="text" class="addon-postfix"
											placeholder="输入员工号或者姓名来进行搜索" data-bind="value : userName" />
									</div>
									<div class="four columns">
										<button class="small nice blue button postfix"
											data-bind="click : searchUser">搜索</button>
									</div>
								</div>
							</div>
							<div class="three columns"></div>
						</div>
					</div>
				</div>

				<div class="app-wrapper ui-corner-top"
					data-bind="visible : users().length > 0">
					<div class="blue module ui-corner-top clearfix">
						<h2>用户信息</h2>
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
										<td style="text-align: center">
											<button class="small blue button"
												data-bind="click : $root.assignLocation">已划分的区域</button>
											<button class="small blue button"
												data-bind="click : $root.assignLocation">分配新的区域</button>
											<button class="small blue button"
												data-bind="click : $root.assignLocation">修改密码</button>
										</td>
									</tr>
								</tbody>
							</table>
							<br>
						</div>
					</div>
				</div>
				<div id="assignLocationPopup" style="display: none;">
					<form>
						<fieldset>
							<legend>江苏</legend>
							<div class="row">
								<div class="ten columns">
									<label class="input-checkbox" for="checkbox-2"> <input
										type="checkbox" id="checkbox-2" name="checkbox-group"><b>全选</b>
									</label> <label class="input-checkbox" for="checkbox-2"> <input
										type="checkbox" id="checkbox-2" name="checkbox-group">苏州
									</label>
								</div>
							</div>

						</fieldset>
					</form>
					
					<hr>
					
					<div class="span">
						<div class="row">
							<div class="four columns">
								<label class="input-checkbox" for="jiangsu"> <input type="checkbox" id="jiangsuAll" name="jiangsu"><b>选择全部</b></label>
								<div data-bind="foreach : locations">
									<label class="input-checkbox" for="jiangsu"> <input type="checkbox" name="jiangsu"><span data-bind="text : name"></span></label>
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
		$(document).ready(
				function() {
					var AssignLocationModel = function() {
						var self = this;
						self.userName = ko.observable("");
						self.users = ko.observableArray([]);
						self.locations = ko.observableArray([]);
						self.searchUser = function() {
							$.ajax({
										url : '/ls/ajaxFindUser.ls',
										data : {
											userName : self.userName()
										},
										success : function(data) {
											self.users.removeAll();

											for ( var i in data) {
												user = new User(data[i].id,
														data[i].name,
														data[i].username);
												self.users.push(user);
											}
											
											console.debug(JSON.stringify(data));
										}
									});
							//self.users.push(new User('1', '刘晓雪'));
						};
						self.showLocation = function(target) {
							alert('test');
						};
						
						self.assignLocation = function(target, event) {
							$('#assignLocationPopup').dialog({});
						};

					};

					ko.applyBindings(new AssignLocationModel());
				});
	</script>
</body>
</html>
