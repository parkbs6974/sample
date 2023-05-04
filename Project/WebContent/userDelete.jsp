
<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id");

	UsersDAO.userDelete(id);
	response.sendRedirect("userManager.jsp");

%>