
<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@page import="com.mystudy.ajax.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cardNum1 =  Integer.parseInt(request.getParameter("cardNum1"));
	int cardNum2 =  Integer.parseInt(request.getParameter("cardNum2"));
	int cardNum3 =  Integer.parseInt(request.getParameter("cardNum3"));
	System.out.println(cardNum1);
	System.out.println(cardNum2);
	System.out.println(cardNum3);
	String date = request.getParameter("date");
	System.out.println(date);
	int cvc =  Integer.parseInt(request.getParameter("cvc"));
	System.out.println(cvc);
	String balance = request.getParameter("balance");
	System.out.println(balance);
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	String name = (String)session.getAttribute("name");
	
	UsersVO vo = new UsersVO();
	vo.setId(id);
	vo.setPw(pw);
	vo.setBalance(Integer.parseInt(balance));
	UsersDAO.balance(vo);
	System.out.println(vo);
	response.sendRedirect("mypage.jsp");
%>
