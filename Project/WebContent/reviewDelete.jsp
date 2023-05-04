<%@page import="com.mystudy.ajax.dao.ReviewDAO"%>
<%@page import="com.mystudy.ajax.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	ReviewVO vo = (ReviewVO)session.getAttribute("vo");
	System.out.println("vo : " + vo);
	
	ReviewDAO.delete(vo.getReviewNum());
	response.sendRedirect("reviewMain.jsp");
%>
