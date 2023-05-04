<%@page import="com.mystudy.ajax.dao.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//전달받은 데이터 확인(추출)
%>
	<jsp:useBean id="cvo" class="com.mystudy.ajax.vo.CommentsVO"/>
	<jsp:setProperty property="*" name="cvo"/>   
<%
	System.out.println("> cvo : " + cvo); 

	QnaDAO.insertComment(cvo);
	
	System.out.println("입력완료");
	String cPage = (String) session.getAttribute("cPage");
	response.sendRedirect("adminQnaView.jsp?quesNum=" + cvo.getQuesNum() + "&cPage=" + cPage);
%>	