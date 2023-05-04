<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String id = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");      
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/login.css">
    <title>비밀번호</title>
  </head>
  
  
  <body>
	<%@ include file="common/userHeader.jspf" %>
	     <main>
         <form action="controller?type=pwSearch" method="POST">
		    <div style="font-size:32pt; text-align: center; margin: 10px;">	비밀번호 </div>
		     <table style="margin-left:auto; margin-right:auto;">
			   	<tr>
		   			<td width="300">
			      		<div class="input-box">
			          		<input id="userId" type="text" name="id" placeholder="아이디" required>
			          		<label for="userid">아이디</label>
			      		</div>
			      	</td>
			      </tr>
			      <tr>
			      	<td>
			      		<div class="input-box">
			        	  <input id="userName" type="text" name="name" placeholder="이름" required>
			          	  <label for="name">이름</label>
			      		</div>
			      	</td>
			      </tr>
			      <tr>
			      	<td>
			      		<div class="input-box">
			        	  <input id="email" type="email" name="email" placeholder="이메일" required>
			          	  <label for="email">이메일</label>
			      		</div>
			      	</td>
			      </tr>
			      <tr>
			      	<td>
			      		<div id=join>
			      			<a href="join.jsp">회원가입</a>
			      		</div>
			      	</td>
			      </tr>
			      <tr>
			      <td>
			      	<div id="forgot">
				      	<a href="login.jsp">로그인 | </a>
				      	<a href="id.jsp">아이디 찾기</a>
			      	</div>
			      	<div class="submit" style="cursor: pointer">
			      		<input type="submit" value="비밀번호 찾기">
			      	</div>
			      </td>
			      </tr>
			      	<tr height="300">
			      	</tr>
			  </table>
			</form>
       </main>
		 <%@ include file="common/userFooter.jspf" %>
        <div style="position:fixed; bottom:35px; right:30px; z-index:99;"> 
		<a href="#doz_header" class="btn_gotop">
  		<img src="images/top.jpg" style="width:80px"> 
  		</a>
  		</div>
  </body>
</html>