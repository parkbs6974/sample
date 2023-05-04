<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
	<link rel="stylesheet" href="css/common.css"> 
</head>
<style>
.btn-group .button {
  background-color: #8aa1a1;
  border: 1px solid #8aa1a1;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  float: left;
  margin: 4px;
}

.btn-group .button:not(:last-child) {
  border-right: none; /* Prevent double borders */
}

.btn-group{
    height:300px;
	margin-left: 450px;
	margin-top: 50px;
}

.logout{
	font-size: 20px;
	text-align: center;
	margin-top: 10%;
}

</style>
<body>
	<header>
            <div class="top">
                <div>
                    <a href="">로그인</a>
                    <a href="">회원가입</a>
                    <a href="">마이페이지</a>
                    <a href="">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        장바구니
                    </a>
                </div>
            </div>
            <%-- 헤더로고 --%>
            <div class="logo">
                <div>
                    <a href="main.jsp">
                        <img src="images/listmain.jpg" alt="헤더로고" width="100px" height="100px">
                    </a>
                    <form action="#">
                        <input type="text" name="search">
                        <%-- 검색창 --%>
                        <button>
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
            <div class="menu">
                <div>
                    <ul>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                    </ul>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">사용후기</a></li>
                        <li><a href="#">문의게시판</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                </div>
            </div>
        </header>
		<main>
			<div class="logout">
				성공적으로 로그아웃 되었습니다.<br><br>
			</div>
			
			<div class="btn-group">
				<button class="button" onclick="location.href='login.jsp'">로그인하기</button>
				<button class="button" onclick="location.href='main.jsp'">메인으로 이동</button>
			</div>
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