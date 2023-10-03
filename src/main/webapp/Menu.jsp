<%@page import="bo.giohangbo"%>
<%@page import="bean.LoaiBean"%>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
            <li><a href="DatHang.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>Giỏ Hàng(<%=slg %>) </a></li>
            <li><a href="CreditCard.jsp"><span class="glyphicon glyphicon-credit-card"></span>Thanh Toán</a></li>
            <li><a href="HistoryPay.jsp"><span class="glyphicon glyphicon-th-list"></span>Lịch Sử Mua Hàng</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><button type="button" class="btn btn-info navbar-btn"><span class="glyphicon glyphicon-search"></span> Tìm kiếm</button></li>
            <%
            if (session.getAttribute("dn") != null) {
            %>
            <li><a class="nav-link" href="#"><span class="glyphicon glyphicon-user"></span> Xin chào <%=session.getAttribute("dn")%></a></li>
            <li><a class="nav-link" href="LogOut.jsp"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
            <%
            } else {
            %>
            <li><a class="nav-link" href="Log.jsp"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
            <li><a class="nav-link" href="Register.jsp"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
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
            <table class="table">
                <%
                ArrayList<sachbean> ds = sbo.getsach();
                request.setCharacterEncoding("utf-8");
                response.setCharacterEncoding("utf-8");
                String ml = request.getParameter("ml");
                String key = request.getParameter("txttk");
                if (ml != null)
                    ds = sbo.TimMa(ml);
                else if (key != null)
                    ds = sbo.Tim(key);
                int n = ds.size();
                for (int i = 0; i < n; i++) {
                    sachbean s = ds.get(i);
                %>
                <tr>
							<td>
								<a href="#?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>&sl=<%=s.getSoluong()%>" class="text-decoration-none">
								<img alt="sach" src="<%=s.getAnh()%>" width="200px" height="250px"> <br>
								<strong>Tên sách:<%=s.getTensach() %></strong> <br></a>
								<strong>Tác giả:<%=s.getTacgia() %></strong> <br>
								<strong>Giá:<%=s.getGia() %>vnd</strong> <br>
								<strong>Số lượng sách:<%=s.getSoluong() %></strong> <br>
								<a href="GioHang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>">
									<button type="button" class="btn btn-success">Đặt hàng</button>
								</a>
							</td>
							<%i++; if(i<n){ s=ds.get(i); %>
							<td>
								<a href="#?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>&sl=<%=s.getSoluong()%>" class="text-decoration-none">
								<img alt="sach" src="<%=s.getAnh()%>" width="200px" height="250px"> <br>
								<strong>Tên sách:<%=s.getTensach() %></strong> <br></a>
								<strong>Tác giả:<%=s.getTacgia() %></strong> <br>
								<strong>Giá:<%=s.getGia() %>vnd</strong> <br>
								<strong>Số lượng sách:<%=s.getSoluong() %></strong> <br>
								<a href="GioHang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>">
									<button type="button" class="btn btn-success">Đặt hàng</button>
								</a>
							</td>
							<%i++; if(i<n){ s=ds.get(i); %>
							<td>
								<a href="#?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>&sl=<%=s.getSoluong()%>" class="text-decoration-none">
								<img alt="sach" src="<%=s.getAnh()%>" width="200px" height="250px"> <br>
								<strong>Tên sách:<%=s.getTensach() %></strong> <br></a>
								<strong>Tác giả:<%=s.getTacgia() %></strong> <br>
								<strong>Giá:<%=s.getGia() %>vnd</strong> <br>
								<strong>Số lượng sách:<%=s.getSoluong() %></strong> <br>
								<a href="GioHang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>">
									<button type="button" class="btn btn-success">Đặt hàng</button>
								</a>
							</td>
							
						</tr>
                <%}%>
                <%}%>
                 <%}%>
            </table>
        </td>
        <td>
            <form action="Menu.jsp" method="post">
                <input type="text" name="txttk"><br>
                <input type="submit" name="th" value="search">
            </form>
        </td>
    </tr>
</table>
</body>
</html>
