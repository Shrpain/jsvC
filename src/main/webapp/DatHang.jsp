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
				<li><a href="Menu.jsp">Trang chủ</a></li>
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
				<li><a href="dangxuat.jsp"><span
						class="glyphicon glyphicon-log-out"></span>Đăng xuất</a></li>
				<%
				} else {
				%>
				<li><a href="dangnhap.jsp"><span
						class="glyphicon glyphicon-log-out"></span>Đăng nhập</a></li>
				<li><a href="dangki.jsp"><span
						class="glyphicon glyphicon-log-in"></span>Đăng kí</a></li>
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
	String gia = request.getParameter("gia") ;
	Long sl =(long)0;
	if(ms!=null && ts!=null && tg!=null && anh!=null){
		giohangbo ghbo = new giohangbo();
		if(session.getAttribute("gh")==null){
			session.setAttribute("gh",ghbo);
		}
		ghbo = (giohangbo)session.getAttribute("gh");
		ghbo.ThemSach(ms, ts, tg, sl, gia, anh);
		session.setAttribute("gh",ghbo);
	}
	if(session.getAttribute("gh")!=null){
		giohangbo ghbo = (giohangbo)session.getAttribute("gh");
		int n = ghbo.ds.size();
	%>
		<section class="title-cart border-bottom border-danger border-3">
            <div class="container">
                <div class="row pt-3">
                    <div class="col-12 a-left  mb-4 fs-4">
                        <h3>GIỎ HÀNG CỦA BẠN</h3>
                    </div>
                </div>
        </section>
		<section class="product-cart border-bottom border-danger border-3">
			<div class="container">
				<div class="row mb-5">
					<form class="col-md-12" method="post">
						<div class="site-blocks-table">
							<table class="table">
								<thead>
									<tr>
										<th scope="col col-md-2 ">Sản phẩm</th>
										<th scope="col col-md-2 ">Tên sách</th>
			                            <th scope="col col-md-2">Đơn giá</th>
			                            <th scope="col col-md-2">Số lượng</th>
			                            <th scope="col col-md-2">Thành tiền</th>
			                            <th scope="col col-md-2">Xóa</th>
									</tr>
								</thead>
								
								<%for(int i=0;i<n;i++){ 
								giohangbean g = ghbo.ds.get(i);%>
	                          		<tr>
	                            		<td class="row">
	                                		<div class="col-md-6">
	                                    		<img  src="<%=g.getAnh() %>" alt="Sap" style="width: 150px; height: 150px;">
	                                		</div>
	                            		</td>
	                            		<td><div class="col-md-6 mt-5 text-start"><%=g.getTensach() %></div></td>
	                            		<td ><div class="mt-5"><%=g.getGia() %>vnđ</div></td>
	                            		<td>
	                            			<!--<div class="mt-5"><%=g.getSoluong() %></div>  --> 	                            		
						                    <form action = "xoa.jsp?ms="<%=g.getMasach()%> method="post">
						                    	<a href="xoa.jsp?tru=t&ms1=<%=g.getMasach()%>"><button type="button" class="btn warning" name="tru">-</button></a>
		    									<input type="text" name="txtsl" style="width: 40px;" id="" value="<%=g.getSoluong() %>">
		                                        <a href="xoa.jsp?cong=c&ms1=<%=g.getMasach()%>"><button type="button" class="btn warning" name="cong">+</button></a>
    										</form>
	                            		</td>
	                            		<td><div class="mt-5"><%=g.getThanhtien()%>vnđ</div></td>
	                            		<td><div class="mt-5">
	                            			<a href="xoa.jsp?ms=<%=g.getMasach()%>"> 
	                            				<i class="fa-solid fa-trash text-success"></i>
	                            			</a>
	                            		</div></td>
	                          		</tr>
									<%}%>
							</table>
						</div>
					</form>
				</div>
			</div>
		</section>
		<div class="container">
			<div class="row">
				<div class="col-md-8"></div>
				<div class="col-md-4 right">
					<div align='left' style="font-size: 18px"><strong >Tổng tiền:<%=ghbo.Tongtien()%>vnđ </strong></div>
					<a href="thanhtoan.jsp?tt=<%=ghbo.Tongtien()%>"><button type="button" class="btn warning">Thanh toán</button></a>
					<a href="Menu.jsp"><button type="button" class="btn warning" name="Mua thêm">Mua thêm</button></a>
					<a href="xoa.jsp?xoa=x"><button type="button" class="btn warning" name="xoaAll">Xóa hết</button></a>
				</div>
			</div>
		</div>
		<%}else{%>
			<div align="center">Không có sản phẩm nào!</div>
			<div align="center"><a href="Menu.jsp"><button type="button" class="btn btn-success w-100" name="Mua thêm">Mua thêm</button></a></div>
		<%} %>
</body>
</html>
