<%@page import="com.mystudy.ajax.dao.AdminDAO"%>
<%@page import="com.mystudy.ajax.vo.AdminVO"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("passwd");
String tid = "admin";
// 여기에서 엉뚱한 값을 체크해야 하는데 생략함
AdminVO avo = AdminDAO.adminOne(pass);
System.out.println("avo : " + avo);


// 아이디, 패스워드 체크
if(!id.equals(tid)){
	request.setAttribute("chk", "idfail");
	RequestDispatcher rd = request.getRequestDispatcher("aLogin.jsp");
	rd.forward(request, response);
	return;
}else{
	if (avo == null) {
		request.setAttribute("chk", "pwfail");
		RequestDispatcher rd = request.getRequestDispatcher("aLogin.jsp");
		rd.forward(request, response);
		return;
	}
	response.sendRedirect("adminMain.jsp");  // 로그인 체크 이후 돌아갈 곳
	session.setAttribute("adminname", avo.getName());
}

%>