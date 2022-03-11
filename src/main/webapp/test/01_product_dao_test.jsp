<%@page import="java.util.ArrayList"%>
<%@page import="com.hdmall.dao.ProductDAO"%>
<%@page import="com.hdmall.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%
	ProductDAO dao = ProductDAO.getInstance();
	ArrayList<ProductVO> data1 = dao.listProductAll();
	request.setAttribute("data", data1);
%>
	<c:forEach var="new_pro_view" items="${data}">
					${new_pro_view.id}<hr>
					${new_pro_view.cate_no}<hr>
					${new_pro_view.img}<hr>		
					${new_pro_view.name}<hr>
					${new_pro_view.context}<hr>
	</c:forEach>
</body>
</html>