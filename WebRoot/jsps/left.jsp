<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>left</title>
<link rel="stylesheet"
	href='<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>'>
<script
	src='<c:url value="/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>'></script>

<base target="body" />
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
* {
	font-size: 10pt;
	text-align: center;
}

div {
	background: #C4A93C;
	margin: 3px;
	padding: 3px;
}

a {
	text-decoration: none;
}
body {
	background: black;
}

.nav > li > a:hover,
.nav > li > a:focus {
  text-decoration: none;
  background-color: #3a3939;
}

</style>
</head>

<body>
	<ul class="nav nav-pills nav-stacked">
		<li><a style="font-size: 15;color: white"
			href="<c:url value='/BookServlet?method=findAll'/>">全部分类</a></li>
	</ul>


	<c:forEach items="${categoryList }" var="category">
		<ul class="nav nav-pills nav-stacked">
			<li><a style="font-size: 15;color: white"
				href="<c:url value='/BookServlet?method=findByCategory&cid=${category.cid }'/>">${category.cname }</a></li>
		</ul>

	</c:forEach>
</body>
</html>
