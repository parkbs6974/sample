<%@page import="com.mystudy.ajax.vo.OrderGoodsVO"%>
<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mystudy.ajax.dao.CartDAO"%>
<%@page import="com.mystudy.ajax.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String) session.getAttribute("id");
	String pw = (String) session.getAttribute("pw");
	String name = (String) session.getAttribute("name");
	String cartNum = request.getParameter("cartNum");
	
	int balance = UsersDAO.balanceList(id);
	String address = UsersDAO.address(id);
	
	System.out.println(cartNum);
	List<CartVO> list = new ArrayList<CartVO>();
	String[] strSplit = cartNum.split(",");
	for (String str2 : strSplit) {
		list.add(CartDAO.order(Integer.parseInt(str2)));
	}
	int total = 0;
	for (int i = 0; i < list.size(); i++) {
		total += list.get(i).getGoodsSale()*list.get(i).getCnt();
	}
	System.out.println(total);
	System.out.println(list.get(0).getGoodsNum());
	pageContext.setAttribute("list", list);
	
	if (balance < total) {
		%>
		<script>
			alert("물품 금액보다 적립금이 적습니다.\n적립금을 충전해주세요.");
			history.back();
		</script>
		<%	return; }
	
	String goodsSale = Integer.toString(total);
	UsersDAO.orderInsert(id, goodsSale, address);
	int orderNum = CartDAO.orderNumSelect(id, goodsSale);
	
	for (int i = 0; i < list.size(); i++) {
		OrderGoodsVO vo = new OrderGoodsVO();
		vo.setId(id);
		vo.setCnt(list.get(i).getCnt());
		vo.setOrderNum(orderNum);
		vo.setGoodsNum(list.get(i).getGoodsNum());
		CartDAO.insertOrderGoods(vo);
		CartDAO.deleteGoods(id, list.get(i).getCartNum());
		UsersDAO.balanceMinus(id, pw, Integer.parseInt(goodsSale));
	}
	
	System.out.print("완료");
	response.sendRedirect("controller?type=shower");
%>