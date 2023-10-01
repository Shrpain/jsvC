<%@page import="tam.CgioHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Thanh Toán</title>
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
	<div class="container">
	<%
    // Tạo hoặc lấy đối tượng giỏ hàng từ phiên làm việc
    CgioHang g = (CgioHang) session.getAttribute("gh");
    
    if (g == null) {
        g = new CgioHang();
        session.setAttribute("gh", g);
    }
    %>
        <div class="row">
            <div class="col-md-6">
                <h2 class="mt-5">Phương Thức Thanh Toán</h2>
                <!-- Hiển thị thông tin thanh toán -->
                <p>Tên người nhận: Ngân hàng VPBANK</p>
                <p>Số tài khoản: 30204102003</p>
                <p>Tổng tiền cần thanh toán: <%= g.Tong() %> VND</p>
            </div>
            <div class="col-md-6">
    <h2 class="mt-5">Mã QR thanh toán</h2>
    <img src="https://img.vietqr.io/image/970432-30204102003- qr_only, compact, compact2.png" width="250" height="250"/>
    <div id="qrcode"></div>
</div>

<script>
    // Gọi API từ trang web https://api.vietqr.io/v2/banks
    $.ajax({
        url: "https://api.vietqr.io/v2/banks",
        method: "GET",
        success: function(response) {
            // Xử lý dữ liệu trả về từ API
            var bankInfo = response;

            // Sử dụng dữ liệu từ API để tạo mã QRCode
            var qrData = "Số tài khoản: " + bankInfo.code + "\nSố tiền: <%= g.Tong() %> VND";

            // Tạo mã QRCode từ dữ liệu API
            var qrcode = new QRCode(document.getElementById("qrcode"), {
                text: qrData,
                width: 128,
                height: 128
            });
        },
        error: function(error) {
            console.error("Lỗi khi gọi API ngân hàng: " + error);
        }
    });
</script>

        </div>
        
    </div>
    
    
    <!-- Thêm link đến Bootstrap JS và jQuery (nếu cần) để sử dụng các tính năng Bootstrap -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
