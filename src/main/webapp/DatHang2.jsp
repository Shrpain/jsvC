<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.giohangbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li><a href="menu.jsp">Trang chủ</a></li>
				<li><a href="giohang.jsp">Giỏ hàng</a></li>
				<li><a href="thanhtoan.jsp">Thanh toán</a></li>
				<li><a href="lichsu.jsp">Lịch sử mua hàng</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%
				if (session.getAttribute("dn") != null) {
				%>
				<li><a href="#"><span class="glyphicon glyphicon-user">Hi!<%=session.getAttribute("dn")%></span>
				</a></li>
				<li><a href="LogOut.jsp"><span
						class="glyphicon glyphicon-log-out"></span>Đăng xuất</a></li>
				<%
				} else {
				%>
				<li><a href="Log.jsp"><span
						class="glyphicon glyphicon-log-out"></span>Đăng nhập</a></li>
				<li><a href="dangki.jsp"><span
						class="glyphicon glyphicon-log-in"></span>Đăng kí</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</nav>

</body>
</html>
