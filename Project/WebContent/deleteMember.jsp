<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		String pw = (String)session.getAttribute("pw");
		System.out.println("id" + id + "pw" + pw);
    %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>deleteMember</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link href="css/deleteMember.css" rel="stylesheet" />
 <link href="css/common.css" rel="stylesheet" />
<body>
	<%@ include file="common/userHeader.jspf" %>
		<main>
			<div class="notice">
				<h3>::회원 탈퇴 페이지::</h3>
				<form action="controller?type=deleteMember" method="post">
					<div class="inform"><strong>비밀번호를 입력하세요.</strong></div>
					<input type="password" id="pw" name="pw">
					<input type="hidden" id="id" name="id" value="${id }">
					<div class="btn-group">
						<input type="submit" class="button">
						<button class="button" onclick="history.back()">뒤로가기</button>
					</div>
				</form>
			</div>
	   </main>
	    <%@ include file="common/userFooter.jspf" %>
        <div style="position:fixed; bottom:35px; right:30px; z-index:99;"> 
		<a href="#doz_header" class="btn_gotop">
  		<img src="images/top.jpg" style="width:80px"> 
  		</a>
  		</div>
  <script>
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});
</script>
	   
	    
    
</body>
</html>