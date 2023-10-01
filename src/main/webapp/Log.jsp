<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Trang Chủ</a>
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
						<span class="glyphicon glyphicon-search"></span> Search
					</button></li>
				<%
				if (session.getAttribute("dn") != null) {
				%>
				<li><a class="nav-link" href="#"><span
						class="glyphicon glyphicon-user"></span> Hello <%=session.getAttribute("dn")%></a></li>
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
String acc = request.getParameter("acc");
String pw = request.getParameter("pw");

if (acc != null && pw != null) {
    if (acc.equals("admin") && pw.equals("1")) {
        session.setAttribute("dn", acc);
        response.sendRedirect("Menu.jsp");
        out.println("success"); // Trả về "success" nếu đăng nhập thành công
    } else {
        out.println("fail"); // Trả về "fail" nếu đăng nhập thất bại
    }
}
%>
<div class="container" style="max-width: 400px">
  <h2>Đăng Nhập</h2>
  <form action="Log.jsp" method="post">
    <div class="form-group">
      <label for="acc">Tài Khoản:</label>
      <input type="text" class="form-control" name="acc">
    </div>
    <div class="form-group">
      <label for="pw">Mật Khẩu:</label>
      <input type="text" class="form-control"  name="pw">
    </div>
    
    <button type="submit" class="btn btn-default">Đăng Nhập</button>
  </form>
</div>
</body>
</html>
