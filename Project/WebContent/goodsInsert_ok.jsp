
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.mystudy.ajax.dao.GoodsDAO"%>
<%@page import="com.mystudy.ajax.vo.GoodsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터 값을 DB에 저장(INSERT)하고 list.jsp 이동 --%>
<%
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");

	// 파일 저장 위치
	String path = "C:/Mystudy/temp";
	
	//1. MultipartRequest 객체 생성
	try{
	MultipartRequest mr = new MultipartRequest(
			request, path, (10 * 1024 * 1024),
			"UTF-8", new DefaultFileRenamePolicy());
	
	//전달받은 데이터 VO 에 저장 후 DB에 입력 처리(DB 연동 작업)
	GoodsVO gvo = new GoodsVO();
	gvo.setGoodsName(mr.getParameter("goodsName"));
	gvo.setGoodsCont(mr.getParameter("goodsCont"));
	gvo.setGoodsPrice(Integer.parseInt(mr.getParameter("goodsPrice")));
	gvo.setGoodsSale(Integer.parseInt(mr.getParameter("goodsSale")));
	gvo.setGoodsMenu(mr.getParameter("goodsMenu"));
	
	//첨부파일 데이터 처리
	if (mr.getFile("goodsImg") == null) { //첨부파일 없으면
		gvo.setGoodsImg("");
	} else {
		gvo.setGoodsImg(mr.getFilesystemName("goodsImg"));
	}
	
	System.out.println("gvo : " + gvo);
	
	//DB에 입력(저장) 처리
		int cnt = GoodsDAO.insert(gvo);
		System.out.println("입력 건수 : " + cnt);
		
		//화면전환(목록페이지로 이동 - 첫페이지로 가기)
		response.sendRedirect("adminMain.jsp");
	}catch (Exception e){
		e.printStackTrace();
		request.setAttribute("chk", "null");
		RequestDispatcher rd = request.getRequestDispatcher("goodsInsert.jsp");
		rd.forward(request, response);
		return;
	}
	
%>