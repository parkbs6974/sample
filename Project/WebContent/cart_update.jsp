<%@page import="com.mystudy.ajax.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.파라미터 값 확인(추출)
 	int cnt = Integer.parseInt(request.getParameter("cntVal"));
	int cartNum = Integer.parseInt(request.getParameter("cartNum"));
	String action = request.getParameter("action");
	String id = (String) session.getAttribute("id");

	
	System.out.println("cnt:" + cnt + " cartNum:"+ cartNum + " action:" + action + " id:" + id);
	if (action.equals("+")) {
		cnt++;
	} else if (action.equals("-")) {
		cnt--;
	}
	
	CartDAO.updateCnt(id, cnt, cartNum);
	
	response.sendRedirect("cart.jsp"); 
	
%>
