<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>

<link rel="stylesheet"
	href='<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>'>
<script
	src='<c:url value="/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>'></script>
</head>

<body>
	<h1 style="text-align: center">注册</h1>
	<br>
	<br>
	<br>
	<p style="color: red; font-weight: 900; text-align: center">${msg }</p>
	<form class="form-horizontal" role="form" action="<c:url value='/UserServlet'/>" method="post">
		<input type="hidden" name="method" value="regist"/>
		<div class="form-group">
			<label for="firstname" class="col-sm-4 control-label">用户名</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="username" name="username"
					placeholder="请输入名字">
				<span style="color: red; font-weight: 900">${errors.username }</span>
			</div>
		</div>
		<div class="form-group">
			<label for="lastname" class="col-sm-4 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="password" name="password"
					placeholder="请输入密码">
				<span style="color: red; font-weight: 900">${errors.password }</span>
			</div>
		</div>
		<div class="form-group">
			<label for="lastname" class="col-sm-4 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="email" name="email"
					placeholder="请输入邮箱">
				<span style="color: red; font-weight: 900">${errors.email }</span>
			</div>
		</div>

		<br> <br>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-10">
				<button type="button" class="btn btn-default" id="returnHome">返回主页</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary">注册</button>
				
			</div>
		</div>


	</form>
	<br>


<script type="text/javascript">

	$("#returnHome").click(function(){
		window.location.href="<c:url value='/jsps/main.jsp'/>";
	});


</script>

</body>
</html>