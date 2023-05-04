<%@page import="com.mystudy.ajax.vo.QnaVO"%>
<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 테스트 */
	String cPage = request.getParameter("cPage");
	System.out.println("cPage" + cPage);
	String quesNum = request.getParameter("quesNum");
	System.out.println("quesNum" + quesNum);
	


	request.setCharacterEncoding("UTF-8");
	
	
	QnaVO vo = (QnaVO)session.getAttribute("vo");
	/* int qnaNum = sessionQvo.getQuesNum(); */

	String pw = request.getParameter("pwd");
	System.out.println("pw : " + pw);
	
	System.out.println("vo : " + vo);
	System.out.println(" ${vo.getQuesNum()} : " + vo.getQuesNum());
	/* <td><a href="View_QnA.jsp?quesNum=${vo.quesNum }&cPage=${pvo.nowPage}" */
	if(vo.getPwCheck().equals(pw)){
		System.out.println("일치");
		response.sendRedirect("qnaView.jsp?quesNum="+vo.getQuesNum());
	}else{
		System.out.println("불일치");
		response.sendRedirect("qnaPassword.jsp?quesNum="+vo.getQuesNum());
	}
%>    
    <%-- href="qnaView.jsp?quesNum=${vo.quesNum }&cPage=${pvo.nowPage}" --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호가 일치 합니다</title>
</head>
<body>
	<h1>비밀번호 일치</h1>
	
</body>
</html>