<%@page import="bo.giohangbo"%>
<%@page import="bean.giohangbean"%>
<%@page import="bean.LoaiBean"%>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang Chủ</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%
long slg=0;
if(session.getAttribute("gh")!=null){
	giohangbo ghbo =new giohangbo();
	ghbo = (giohangbo)session.getAttribute("gh");
	slg = ghbo.ds.size();
}
%>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="Menu.jsp">Trang Chủ</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="DatHang.jsp"><span
						class="glyphicon glyphicon-shopping-cart"></span>Giỏ Hàng(<%=slg %>)</a></li>
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
loaibo lbo = new loaibo();
sachbo sbo = new sachbo();
%>

	<table class="table">
		<tr>
			<td width="200" valign="top">
				<table class="table table-hover">
					<%
                for (LoaiBean l : lbo.getloai()) {
                %>
					<tr>
						<td><a href="Menu.jsp?ml=<%=l.getMaloai()%>"> <%=l.getMaloai()%></a></td>
					</tr>
					<%
                }
                %>
				</table>
			</td>
			<td width="600" valign="top">
				<form method="post" action="xoa.jsp">
					<table class="table">
						<table class="table table-bordered">
							<thead>
								<tr>
								<th></th>
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
				if (session.getAttribute("gh") != null) {
					giohangbo gbo = (giohangbo) session.getAttribute("gh");
					int n = gbo.ds.size();
				for (int i = 0; i < n; i++) {
					giohangbean g = gbo.ds.get(i);
				%>
								<tr>
								
									<td><input type="checkbox" name="itemToDelete"
										value="<%= i %>"></td>
									<td><%= g.getMasach() %></td>
									<td><img src="<%=g.getAnh() %>" alt="Sap"
										style="width: 150px; height: 150px;"></td>
									<td><%= g.getTensach() %></td>
									<td><%= g.getTacgia() %></td>
									<td><%= g.getGia() %> VNĐ</td>
									<td><a href="xoa.jsp?tru=t&ms1=<%=g.getMasach()%>"><button
												type="button" class="btn warning" name="tru">-</button></a> <input
										type="text" name="txtsl" style="width: 40px;" id=""
										value="<%=g.getSoluong() %>"> <a
										href="xoa.jsp?cong=c&ms1=<%=g.getMasach()%>"><button
												type="button" class="btn warning" name="cong">+</button></a></td>


									<td><%= g.getThanhtien() %> VNĐ</td>
									<!--   <td><a href="XoaSach.jsp?msach=<%= g.getMasach() %>">Xóa</a></td>-->
								</tr>
								<%}%>
								
							</tbody>
						</table>
						<input type="submit" name="deleteSelected"
							value="Xóa Mặt Hàng Đã Chọn">
						<input type="submit" name="deleteAll" value="Xóa Tất Cả">
						
						<!-- Thêm nút để thanh toán hoặc tiếp tục mua sắm -->
						<div class="text-right">
						<h6>tong: =<%=gbo.Tongtien() %>></h6>
							<a href="ThanhToan.jsp" class="btn btn-success">Thanh Toán</a> <a
								href="Menu.jsp" class="btn btn-primary">Tiếp Tục Mua Sắm</a>
						</div><%}%>
					</table>
					</form>
			</td>
			<td>
				<form action="Menu.jsp" method="post">
					<input type="text" name="txttk"><br> <input
						type="submit" name="th" value="search">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
