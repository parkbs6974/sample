

<%@page import="com.mystudy.ajax.dao.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int commNum = Integer.parseInt(request.getParameter("commNum"));
	
	int quesNum = Integer.parseInt(request.getParameter("quesNum")); 
	
	System.out.println("quesNum : " + quesNum);
	
	System.out.println("commNum : " + commNum);
	

	
	// 세션(session)에 있는 데이터 확인
	String cPage = (String) session.getAttribute("cPage");
	
	QnaDAO.deleteComment(commNum);
	
	System.out.println("삭제 완료");
	response.sendRedirect("adminQnaView.jsp?quesNum=" + quesNum+ "&cPage=" + cPage);
%>