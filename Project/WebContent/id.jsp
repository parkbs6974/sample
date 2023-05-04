<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String id = (String) session.getAttribute("id");
   //id = "kim";
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
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/common.css">
    <title>아이디 찾기</title>
 </head>
  <body>
 		 <header>
            <%-- 헤더로고 --%>
            <div class="logo"> <!--div logo-bar지움(css포함) -->
                    <a href="main.jsp" >
                        <img src="images/listmain.jpg" alt="헤더로고" width="100px" height="100px" class="maingo">
                    </a>
            </div>
        </header>  
	     <main>
         <form action="controller?type=idSearch" method="POST">
		    <div style="font-size:32pt; text-align: center; margin: 10px;">	아이디</div>
		     <table style="margin-left:auto; margin-right:auto;">
			   	<tr>
		   			<td width="300">
			      		<div class="input-box">
			          		<input id="username" type="text" name="name" placeholder="이름" required>
			          		<label for="username">이름</label>
			      		</div>
			      	</td>
			      </tr>
			      <tr>
			      	<td>
			      		<div class="input-box">
			        	  <input id="password" type="email" name="email" placeholder="이메일" required>
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
				      	<a href="pwd.jsp">비밀번호 찾기</a>
			      	</div>
			      	<div class="submit" style="cursor: pointer">
			      		<input type="submit" value="아이디 찾기">
			      	</div>
			      </td>
			      </tr>
			      	<tr height="300">
			      	</tr>
			  </table>
			</form>
       </main>
		 <footer>
            <ul>
                <li><a href="#">회사소개</a></li>
            </ul>
            <div>
                <p><img src="images/listmain.jpg" alt="푸터로고" width="80px" height="80px"></p>
                <p>
                    <strong>(주)KMARKET</strong>
                    <br>
                    서울시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)
                    <br>
                    대표이사 : 홍길통
                    <br>
                    사업자등록번호 : 220-81-83676 사업자정보확인
                    <br>
                    통신판매업신고 : 강남 10630호 Fax : 02-589-8842
                </p>
                <p>
                    <strong>고객센터</strong>
                    <br>
                    Tel : 1234-5678 (평일 09:00~18:00)
                    <br>
                    스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)
                    <br>
                    경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층
                    <br>
                    Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr
                    <br>
                </p>
            </div>
        </footer>
        <div style="position:fixed; bottom:35px; right:30px; z-index:99;"> 
		<a href="#doz_header" class="btn_gotop">
  		<img src="images/top.jpg" style="width:80px"> 
  		</a>
  		</div>
  		
 <script type="text/javascript">
  		$("#name").focusout(function(){
  			
	     if($('#name').val() == ""){
	   		$('#check').text('이름을 입력해주세요.');
	   	  	$('#check').css('color', 'red');
	   
	     }else{
	    	 $('#check').hide();
	     }
	     });
	     
  		$("#email").focusout(function(){
	     if($('#email').val() == ""){
	   		$('#check').text('이메일을 입력해주세요');
	   	  	$('#check').css('color', 'red');
	     }else{
	    	 $('#check').hide();
	     }
	     });
</script>

</body>
</html>