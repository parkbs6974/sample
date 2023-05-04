<%@page import="com.mystudy.ajax.dao.ReviewDAO"%>
<%@page import="com.mystudy.ajax.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String reviewNum = request.getParameter("reviewNum");
	System.out.println("reviewNum:" + reviewNum);
	
	ReviewVO vo = (ReviewVO)session.getAttribute("vo");
	System.out.println("vo:" + vo);
	
	String pwd = request.getParameter("pwd");
	System.out.println("pwd:" + pwd);
	System.out.println("vo.getReviewPw():" + vo.getReviewPw());
	
	if(vo.getReviewPw().equals(pwd)){
		System.out.println("일치");
		response.sendRedirect("reviewUpdate.jsp?reviewNum="+vo.getReviewNum());
	}else{
		System.out.println("불일치");
		response.sendRedirect("reviewPassword.jsp?reviewNum="+vo.getReviewNum());
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 확인중입니다</h1>
</body>
</html>