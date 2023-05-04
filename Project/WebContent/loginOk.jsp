<%@page import="com.mystudy.ajax.dao.GoodsDAO"%>
<%@page import="com.mystudy.ajax.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mystudy.ajax.dao.UsersDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UsersVO uvo = UsersDAO.userLogin(id, pw);
	
	
	if(id != null && uvo != null) {
		session.setAttribute("id", id);
	}
	if(pw != null && uvo != null ) {
		session.setAttribute("pw", pw);
	}
	
	if (session.getAttribute("id") != null && session.getAttribute("pw") != null ) {
		String name = GoodsDAO.idName(id);
		session.setAttribute("name", name);
		
		response.sendRedirect("main.jsp");
	} else {
		%>
		<script>
		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
		history.back();
		</script>
		<%
		return;
		}

	%>
