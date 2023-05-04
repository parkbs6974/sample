<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@page import="com.mystudy.ajax.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
		UsersVO uvo = UsersDAO.userLogin(id, pw);
		if(uvo != null) {
			UsersDAO.deleteMember(uvo);
			session.invalidate();
			response.sendRedirect("main.jsp");
		} else { %>
<script>			
		alert("비밀번호가 틀렸습니다.");
		history.back();
			
</script>
<%
		}

	%>
