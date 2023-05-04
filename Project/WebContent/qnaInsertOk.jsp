
<%@page import="com.mystudy.ajax.dao.QnaDAO"%>
<%@page import="com.mystudy.ajax.vo.QnaVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:useBean id="qna" class="com.mystudy.ajax.vo.QnaVO" scope="session"/>  

<%
	
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");
	
	// 파일 저장 위치
	String path = "c:/MyStudy/temp";
	try{
	//1. MultipartRequest 객체 생성
	MultipartRequest mr = new MultipartRequest(
	request, path, (10 * 1024 * 1024),
	"UTF-8", new DefaultFileRenamePolicy());
	
	
	//전달받은 데이터 VO 에 저장 후 DB에 입력 처리(DB 연동 작업)
	QnaVO qvo = new QnaVO();
	qvo.setId(mr.getParameter("id"));
	qvo.setQuesTitle(mr.getParameter("quesTitle"));
	qvo.setQuesCont(mr.getParameter("quesCont"));
	qvo.setPwCheck(mr.getParameter("pwCheck"));
	
	//첨부파일 유무
	if (mr.getFile("queFile") == null){ 
		System.out.println(">> 첨부파일 없음");
		qvo.setqueFile("");
	} else{
		System.out.println(">> 첨부파일 있음~~~~");
		qvo.setqueFile(mr.getFilesystemName("queFile"));
	}
	System.out.println("qvo" + qvo);
	
	
	int result = QnaDAO.insertBoard(qvo);
	response.sendRedirect("qnaMain.jsp");
	}catch (Exception e){
		e.printStackTrace();
		request.setAttribute("chk", "null");
		RequestDispatcher rd = request.getRequestDispatcher("qnaInsert.jsp");
		rd.forward(request, response);
		return;
	}
	
%>

