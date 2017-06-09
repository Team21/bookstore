<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>top</title>
<link rel="stylesheet"
	href='<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>'>
<script
	src='<c:url value="/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>'></script>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	background: #51acf9;
}

a {
	text-transform: none;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>

<body>
	<h1 style="text-align: center; font-family: 楷体">网上书店</h1>
	<div style="font-size: 10pt;">
		<c:choose>
			<c:when test="${empty sessionScope.session_user }">

				<ul class="nav nav-pills">
					<li><a style="font-size: 18; font-weight: 900; color: black"
						href="<c:url value='/jsps/user/login.jsp'/>" target="_parent">登录</a></li>
					<li><a style="font-size: 18; font-weight: 900; color: black"
						href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent">注册</a></li>

				</ul>


			</c:when>
			<c:otherwise>
				
					<ul class="nav nav-pills">
						<li><a style="font-size: 18; font-weight: 500; color: black"
							>您好：${sessionScope.session_user.username }</a></li>
						<li><a style="font-size: 18; font-weight: 500; color: black"
							href="<c:url value='/jsps/cart/list.jsp'/>" target="body">我的购物车</a></li>
						<li><a style="font-size: 18; font-weight: 500; color: black"
							href="<c:url value='/OrderServlet?method=myOrders'/>"
							target="body">我的订单</a></li>
						<li><a style="font-size: 18; font-weight: 500; color: black"
							href="<c:url value='/UserServlet?method=quit'/>" target="_parent">退出</a></li>
					</ul>

			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>
