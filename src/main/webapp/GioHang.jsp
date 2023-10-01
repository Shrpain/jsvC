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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="Menu.jsp">Trang Chủ</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="GioHang.jsp"><span
						class="glyphicon glyphicon-shopping-cart"></span>Giỏ Hàng</a></li>
				<li><a href="CreditCard.jsp"><span
						class="glyphicon glyphicon-credit-card"></span>Thanh Toán</a></li>
				<li><a href="HistoryPay.jsp"><span
						class="glyphicon glyphicon-th-list"></span>Lịch Sử Mua Hàng</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><button type="button" class="btn btn-info navbar-btn">
						<span class="glyphicon glyphicon-search"></span> Tìm kiếm
					</button></li>
				<%
            if (session.getAttribute("dn") != null) {
            %>
				<li><a class="nav-link" href="#"><span
						class="glyphicon glyphicon-user"></span> Xin chào <%=session.getAttribute("dn")%></a></li>
				<li><a class="nav-link" href="LogOut.jsp"><span
						class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
				<%
            } else {
            %>
				<li><a class="nav-link" href="Log.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
				<li><a class="nav-link" href="Register.jsp"><span
						class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
				<%
            }
            %>
			</ul>
		</div>
	</nav>
	<%
	String ms = request.getParameter("ms");
	String ts = request.getParameter("ts");
	String tg = request.getParameter("tg");
	String anh = request.getParameter("anh");
	String gia = request.getParameter("gia");
	Long sl = (long) 0;
	if (ms != null && ts != null && tg != null && anh != null) {
		giohangbo gbo = new giohangbo();
		if (session.getAttribute("gh") == null) {
			session.setAttribute("gh", gbo);
		}
		gbo = (giohangbo) session.getAttribute("gh");
		gbo.Themhang(ms, ts, tg, sl, Long.parseLong(gia), anh);
		session.setAttribute("gh", gbo);
	}
	if (session.getAttribute("gh") != null) {
		giohangbo gbo = (giohangbo) session.getAttribute("gh");
		int n = gbo.ds.size();
	%>
	<div class="container">
		<h2 class="mt-5">Giỏ Hàng Của Bạn</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Mã Sách</th>
					<th>Hình Ảnh</th>
					<th>Tên Sách</th>
					<th>Tác Giả</th>
					<th>Giá</th>
					<th>Số Lượng</th>
					<th>Thành Tiền</th>
					<th></th>

				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < n; i++) {
					giohangbean g = gbo.ds.get(i);
				%>
				<tr>
					<td><%= g.getMasach() %></td>
					<td><img src="<%=g.getAnh() %>" alt="Sap"
						style="width: 150px; height: 150px;"></td>
					<td><%= g.getTensach() %></td>
					<td><%= g.getTacgia() %></td>
					<td><%= g.getGia() %> VNĐ</td>
					







					<td><a href="GioHang.jsp?ms=<%=g.getMasach()%>&ts=<%=g.getTensach()%>&gia=<%=g.getGia()%>&tg=<%=g.getTacgia()%>&anh=<%=g.getAnh()%>&action=tang"
						class="btn btn-sm btn-primary"> <i class="fas fa-plus"></i></a> <span><%= g.getSoluong() %></span>
						<a href="GioHang.jsp?ms=<%=g.getMasach()%>&ts=<%=g.getTensach()%>&gia=<%=g.getGia()%>&tg=<%=g.getTacgia()%>&anh=<%=g.getAnh()%>&action=giam"
						class="btn btn-sm btn-warning"> <i class="fas fa-minus"></i></a></td>


					<td><%= g.getThanhtien() %> VNĐ</td>
					<!--   <td><a href="XoaSach.jsp?msach=<%= g.getMasach() %>">Xóa</a></td>-->
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<!-- Thêm nút để thanh toán hoặc tiếp tục mua sắm -->
		<div class="text-right">
			<a href="ThanhToan.jsp" class="btn btn-success">Thanh Toán</a> <a
				href="Menu.jsp" class="btn btn-primary">Tiếp Tục Mua Sắm</a>
		</div>
	</div>
	<%
	} else {
	%>
	<div align="center">Không có sản phẩm nào!</div>
	<div align="center">
		<a href="Menu.jsp"><button type="button"
				class="btn btn-success w-100" name="Mua thêm">Mua thêm</button></a>
	</div>
	<%
	}
	%>
</body>
</html>
