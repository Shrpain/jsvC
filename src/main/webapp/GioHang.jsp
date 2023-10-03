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

</head>
<body>

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
		response.sendRedirect("DatHang.jsp");
	}
	
	%>

</body>
</html>
