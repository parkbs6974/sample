<%@page import="com.mystudy.ajax.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cartNum = Integer.parseInt(request.getParameter("cartNum"));
	String id = (String)session.getAttribute("id");
	
	CartDAO.deleteGoods(id, cartNum);
	
	response.sendRedirect("cart.jsp");

%>
