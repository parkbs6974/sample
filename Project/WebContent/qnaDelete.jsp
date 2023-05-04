
<%@page import="com.mystudy.ajax.dao.QnaDAO"%>
<%@page import="com.mystudy.ajax.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	QnaVO vo = (QnaVO)session.getAttribute("qvo");
	System.out.println("vo : " + vo);
	
	QnaDAO.delete(vo.getQuesNum());
	response.sendRedirect("qnaMain.jsp" );
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>
	<h1>삭제 진행하겠습니다</h1>
</body>
</html>