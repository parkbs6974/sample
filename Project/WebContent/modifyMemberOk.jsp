<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	/* System.out.println("id" + id + "pw" +  pw + "name" + name + 
						"phone" +  phone + "email" + email + "address" + address); */
	
	UsersDAO.modifyMember(id, pw, name, phone, email, address);
%>
<script>
	alert("수정이 완료되었습니다.");
</script>

<%
	session.setAttribute("name", name);
	session.setAttribute("pw", pw);
	response.sendRedirect("main.jsp");

%>