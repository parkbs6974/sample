<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/login.css">
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
		     <form action="controller?type=login" method="POST">
		     <table style="margin-left:auto; margin-right:auto;">
		     	<caption style="font-size:32pt">login</caption>
			   	<tr>
		   			<td width="300">
			      		<div class="input-box">
			          		<input id="username" type="text" name="id" placeholder="아이디">
			          		<label for="username">아이디</label>
			      		</div>
			      	</td>
			      </tr>
			      <tr>
			      	<td>
			      		<div class="input-box">
			        	  <input id="password" type="password" name="pw" placeholder="비밀번호">
			          	  <label for="password">비밀번호</label>
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
				      	<a href="id.jsp">아이디 찾기 | </a>
				      	<a href="pwd.jsp">비밀번호 찾기</a>
			      	</div>
			      	<div class="submit" style="cursor: pointer">
			      		<input type="submit" value="로그인">
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