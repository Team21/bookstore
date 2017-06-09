<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bootstrap 实例 - 模态框（Modal）插件</title>
<link rel="stylesheet"
	href='<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>'>
<script
	src='<c:url value="/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>'></script>
</head>
<body>
	<h2>创建模态框（Modal）</h2>
	<!-- 按钮触发模态框 -->
	<button class="btn btn-primary btn-lg" data-toggle="modal"
		data-target="#myModal">开始演示模态框</button>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">登录</h3>
				</div>

				<div class="modal-body">

					<p style="color: red; font-weight: 900; text-align: center">${msg }</p>
					<form class="form-horizontal" role="form"
						action="<c:url value='/UserServlet'/>" method="post" target="_top">
						<input type="hidden" name="method" value="login" />
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">用户名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="username"
									name="username" placeholder="请输入名字">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">验证码</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="verifyCode"
									name="verifyCode" placeholder="验证码"> <br> <img
									id="vCode" src="<c:url value='/VerifyCodeServlet'/>" border="2" />
								<button type="button" class="btn btn-link" id=verifyCodeChange>看不清？换一张</button>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="returnHome">返回主页</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">登录</button>
						</div>
					</form>

				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>



	<script type="text/javascript">
		$("#verifyCodeChange").click(
				function() {
					var ele = document.getElementById("vCode");
					ele.src = "<c:url value='/VerifyCodeServlet'/>?xxx="
							+ new Date().getTime();
				});

		$("#returnHome").click(function() {
			window.location.href = "<c:url value='/jsps/main.jsp'/>";
		});
	</script>
</body>
</html>