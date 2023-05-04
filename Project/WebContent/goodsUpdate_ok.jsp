<%@page import="com.mystudy.ajax.dao.GoodsDAO"%>
<%@page import="com.mystudy.ajax.vo.GoodsVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB 수정 작업 처리
	전달받은 암호와 DB저장 암호가 일치하면 게시글 수정처리
	수정완료 : 게시글 상세페이지(view.jsp)로 이동
	암호가 다르면 : 수정페이지(modify.jsp)로 이동
 --%>
 <%
 	request.setCharacterEncoding("UTF-8");
 	
	//파일 저장 위치
	String path = "c:/MyStudy/temp";
	
	//1. MultipartRequest 객체 생성
	MultipartRequest mr = new MultipartRequest(
			request, path, (10 * 1024 * 1024),
			"UTF-8", new DefaultFileRenamePolicy());
	
	//전달받은 데이터 VO 에 저장 후 DB에 수정 처리(DB 연동 작업)
	GoodsVO sessionvo = (GoodsVO)session.getAttribute("vo");
	System.out.println("sessionvo : " + sessionvo);
	
	GoodsVO vo = new GoodsVO();
	vo.setGoodsNum(Integer.parseInt(mr.getParameter("goodsNum")));
	vo.setGoodsName(mr.getParameter("goodsName"));
	vo.setGoodsCont(mr.getParameter("goodsCont"));
	vo.setGoodsPrice(Integer.parseInt(mr.getParameter("goodsPrice")));
	vo.setGoodsSale(Integer.parseInt(mr.getParameter("goodsSale")));
	vo.setGoodsMenu(mr.getParameter("goodsMenu"));
	
	//첨부파일 데이터 처리
	if (mr.getFile("goodsImg") == null) { //첨부파일 없으면
		vo.setGoodsImg(sessionvo.getGoodsImg()); //원래 파일명 유지
	} else {
		vo.setGoodsImg(mr.getFilesystemName("goodsImg"));
	}
	
 	
	System.out.println("vo : " + vo);
	
	//DB데이터 수정작업(DAO에 bvo 전달해서 UPDATE)
	try{
		GoodsDAO.goodsUpdate(vo);
		
		//파일변경 되었으면 이전 파일 삭제처리()
	}catch(Exception e){
		e.printStackTrace();
	}
	//화면전환(상세페이지)
	response.sendRedirect("goodsManager.jsp");
	
	
 	
 	
 
 	
 	
 %>