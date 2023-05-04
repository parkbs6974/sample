<%@page import="com.mystudy.ajax.dao.ReviewDAO"%>
<%@page import="com.mystudy.ajax.vo.ReviewVO"%>
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
   ReviewVO vo = (ReviewVO)session.getAttribute("rvo");
   System.out.println("reviewNum " +  vo.reviewNum);
   
   ReviewVO rvo = new ReviewVO();
   rvo.setReviewNum(Integer.parseInt( mr.getParameter("reviewNum")));
   rvo.setId(mr.getParameter("id"));
   rvo.setReviewCont(mr.getParameter("reviewCont"));
   rvo.setReviewStar((Integer.parseInt(mr.getParameter("reviewStar"))));   
   rvo.setReviewTitle(mr.getParameter("reviewTitle"));
   rvo.setReviewPw(mr.getParameter("reviewPw"));
   System.out.println("rvo : " + rvo);
   
    if(mr.getFile("reviewFile") == null) {//첨부파일 없으면
      rvo.setReviewFile(vo.getReviewFile());
   } else {
      rvo.setReviewFile(mr.getParameter("newReviewFile"));
   }
   ReviewDAO.update(rvo);
   System.out.println("rvo : " + rvo);
   response.sendRedirect("reviewMain.jsp" );
   }catch (Exception e){
      e.printStackTrace();
      response.sendRedirect("reviewMain.jsp");
   }
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
   <h1>업데이트중</h1>
</body>
</html>