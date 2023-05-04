
<%@page import="com.mystudy.ajax.dao.QnaDAO"%>
<%@page import="com.mystudy.ajax.vo.QnaVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");

   String path = "c:/MyStudy/temp";
   try{
   //1. MultipartRequest 객체 생성
   MultipartRequest mr = new MultipartRequest(
         request, path, (10 * 1024 * 1024),
         "UTF-8", new DefaultFileRenamePolicy());
   
   //전달받은 데이터 VO 에 저장 후 DB에 수정 처리(DB 연동 작업)
   QnaVO sessionRvo = (QnaVO)session.getAttribute("qvo");
   
   
   
   //전달받은 데이터 VO 에 저장 후 DB에 입력 처리(DB 연동 작업)
   QnaVO qvo = new QnaVO();
   System.out.println(qvo.getQuesNum());
   qvo.setId(mr.getParameter("id"));
   qvo.setQuesNum(Integer.parseInt( mr.getParameter("quesNum")));
   qvo.setQuesTitle(mr.getParameter("quesTitle"));
   qvo.setQuesCont(mr.getParameter("quesCont"));
   
   
   //첨부파일 데이터 처리
   if (mr.getFile("newQueFile") == null) { //첨부파일 없으면
      qvo.setqueFile(sessionRvo.getqueFile());
      
   } else {
      qvo.setqueFile(mr.getFilesystemName("newQueFile"));
   }
   System.out.println(qvo);
   
   QnaDAO.update(qvo);
   response.sendRedirect("qnaMain.jsp"); 
	}catch (Exception e){
		e.printStackTrace();
		response.sendRedirect("qnaMain.jsp");
	}

   
%>