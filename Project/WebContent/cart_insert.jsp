<%@page import="com.mystudy.ajax.dao.CartDAO"%>
<%@page import="com.mystudy.ajax.vo.CartVO"%>
<%@page import="com.mystudy.ajax.dao.GoodsDAO"%>
<%@page import="com.mystudy.ajax.vo.GoodsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int goodsNum = Integer.parseInt(request.getParameter("goodsNum"));
	String id = (String) session.getAttribute("id");
	String pw = (String) session.getAttribute("pw");
	if (id== null) {
		%>
		<script>
		 	alert("로그인 후 이용해주세요.");
		 	history.back();
		</script>
		<%
	return; }
	
	GoodsVO vo = GoodsDAO.goodsDetail(goodsNum);
	System.out.println("vo : " + vo);
	CartVO cartvo = new CartVO();
	cartvo.setGoodsName(vo.getGoodsName());
	cartvo.setGoodsSale(vo.getGoodsSale());
	cartvo.setGoodsNum(vo.getGoodsNum());
	cartvo.setId(id);
	
	CartDAO.insertGoods(id, cartvo);
	
	response.sendRedirect("cart.jsp");

%>