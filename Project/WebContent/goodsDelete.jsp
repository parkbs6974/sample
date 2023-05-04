<%@page import="com.mystudy.ajax.dao.GoodsDAO"%>
<%@page import="com.mystudy.ajax.vo.GoodsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int goodsNum = Integer.parseInt(request.getParameter("goodsNum"));
	
	//GoodsVO vo = GoodsDAO.goodsOne(goodsNum);
	//System.out.println(vo);
	
	GoodsDAO.goodsDelete(goodsNum);
	response.sendRedirect("goodsManager.jsp");
%>