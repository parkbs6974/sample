
<%@page import="com.mystudy.ajax.vo.UsersVO"%>
<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.mystudy.ajax.dao.ReviewDAO"%>
<%@page import="com.mystudy.ajax.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");
	
	// 파일 저장 위치
	String path = "c:/MyStudy/60_web/Project/WebContent/uploaded";
	
	String id = (String) session.getAttribute("id");
	
	try{
	//1. MultipartRequest 객체 생성
	MultipartRequest mr = new MultipartRequest(
	request, path, (10 * 1024 * 1024),
	"UTF-8", new DefaultFileRenamePolicy());
	
	String pwd = mr.getParameter("reviewPw");
	System.out.println("pwd:" + pwd);
	
	UsersVO vo = UsersDAO.userLogin(id, pwd);
		if(vo == null){
			System.out.println("불일치");
			%> 
			<script>
			alert("회원만 작성 가능합니다.");
			history.back();
			</script>
			<%
		return; }	
		
	
	//전달받은 데이터 VO 에 저장 후 DB에 입력 처리(DB 연동 작업)
	ReviewVO rvo = new ReviewVO();
	rvo.setGoodsMenu(mr.getParameter("goodsMenu"));
	rvo.setReviewCont(mr.getParameter("reviewCont"));
	rvo.setGoodsNum((Integer.parseInt(mr.getParameter("goodsNum")))); 
	rvo.setReviewStar((Integer.parseInt(mr.getParameter("reviewStar"))));   
	rvo.setId(id);	
	rvo.setReviewTitle(mr.getParameter("reviewTitle"));
	rvo.setReviewPw(mr.getParameter("reviewPw"));
	System.out.println("rvo : " + rvo);
	String menu = mr.getParameter("goodsMenu");
	
	if (mr.getFile("reviewFile") == null){ 
		System.out.println(">> 첨부파일 없음");
		rvo.setReviewFile("");
	} else{
		System.out.println(">> 첨부파일 있음~~~~");
		rvo.setReviewFile(mr.getFilesystemName("reviewFile"));
	} 
	System.out.println("rvo" + rvo);
	
	ReviewDAO.insertReview(rvo);
	response.sendRedirect("controller?type=" + menu);
	}catch(Exception e){
		e.printStackTrace();
		request.setAttribute("chk", "null");
		RequestDispatcher rd = request.getRequestDispatcher("reviewWrite.jsp");
		rd.forward(request, response);
		return;
	}
	
%>