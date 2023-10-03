<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	giohangbo ghbo = (giohangbo) session.getAttribute("gh");
	String ms = request.getParameter("ms");
	String ms1 = request.getParameter("ms1");
	String tru = request.getParameter("tru");
	String cong = request.getParameter("cong");
	String[] itemsToDelete = request.getParameterValues("itemToDelete");
	if (ms != null) {
		ghbo.Xoahang(ms);
	}
	String xoaall = request.getParameter("xoa");
	if (xoaall != null) {
		session.removeAttribute("gh");
	}
	if (tru != null) {
		ghbo.tru(ms1);
	}
	if (cong != null) {
		ghbo.Cong(ms1);
	}
	
	if(itemsToDelete != null){
		if (ghbo != null) {
            // Xóa các mặt hàng đã chọn
            for (String itemIndex : itemsToDelete) {
                int index = Integer.parseInt(itemIndex);
                ghbo.XoaMuc(index);
            }
            
            // Lưu lại giỏ hàng đã cập nhật
            session.setAttribute("gh", ghbo);
        }
	}
	if (request.getParameter("deleteAll") != null) {
        
        if (ghbo != null) {
            ghbo.XoaALL();
            session.setAttribute("gh", ghbo);
        }
    }

	response.sendRedirect("DatHang.jsp");
	%>
</body>
</html>
