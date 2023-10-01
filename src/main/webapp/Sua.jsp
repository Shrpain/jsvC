<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Quản lý giỏ hàng</title>
</head>
<body>
<%
    giohangbo gbo = (giohangbo) session.getAttribute("gh");
    String ms = request.getParameter("ms");
    String ms1 = request.getParameter("ms1");
    String sua = request.getParameter("sua");
    String xoa = request.getParameter("xoa");
    String xoaall = request.getParameter("xoaall");
    
    if (ms != null) {
        gbo.Xoahang(ms);
    }
    
    if (sua != null && ms1 != null) {
        gbo.Sua(ms1, sua);
    }
    
    if (xoaall != null) {
        session.removeAttribute("gh");
    }
    
    response.sendRedirect("GioHang.jsp");
%>
</body> 
</html>
