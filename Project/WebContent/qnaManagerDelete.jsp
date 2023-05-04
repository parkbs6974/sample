<%@page import="com.mystudy.ajax.dao.QnaDAO"%>
<%@page import="com.mystudy.ajax.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int quesNum = Integer.parseInt(request.getParameter("quesNum"));

	QnaDAO.adminQnaDelete(quesNum);
	response.sendRedirect("qnaManager.jsp");
%>