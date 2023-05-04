<%@page import="com.mystudy.ajax.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));

	ReviewDAO.adminReviewDelete(reviewNum);
	response.sendRedirect("reviewManager.jsp");
%>