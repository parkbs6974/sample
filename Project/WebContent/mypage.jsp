<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	String name = (String)session.getAttribute("name");

	if(id == null) {
		%>
		<script>
		alert("회원 전용 기능입니다.");
		history.back();
		</script>
		<%
		return;
	}
%>


<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>myPage</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link href="css/mypage.css" rel="stylesheet" />
 <link href="css/common.css" rel="stylesheet" />
<body>
	<%@ include file="common/userHeader.jspf" %>
		<main>
		<div id="page">My page<hr></div>
		   	<div><%=name %>님</div>
		    <table class="table" style="width:80%;">
		        <tr>
		            <th id="myImage" rowspan="5">
		                <img class="w3-circle" src="images/song2.png" width="180px">
		            </th>    
		            <th id="th-tag">주	문</th>
		            <th id= "th-tag">적 립 금</th>
		        </tr>
		        <tr>
		            <td>
		            	<a href="orderChk.jsp">주문 조회</a>
		            </td>
		            <td>
		            	<a href="balance.jsp">적립금 충전</a>
		            </td>
		        </tr>
		        <tr>
		            <th>회원정보</th>
		            <th>내가 쓴 게시글</th>    
		        </tr>
		        <tr>
		            <td rowspan="2">
		            	<a href="modifyMemberPw.jsp">회원정보 수정하기</a>
		            </td>
		            <td>
		            	<a href="qnaMain.jsp">문의 게시글</a>
		            </td>
		        </tr>
		        
		    <tr>
		         <td>
		         	<a href="reviewMain.jsp">후기 게시글</a>
		         </td>    
		    </tr>
		    </table>
		    
		    <div class= "delete">
		    	<a href="deleteMember.jsp"><p style="color: red;">회원탈퇴</p></a>
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