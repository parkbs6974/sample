<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String pw = (String)request.getAttribute("pw");	
%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwSearch</title>
</head>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/joinOk.css">
<body>
	<header>
            <div class="top">
                <div>
                    <a href="login.jsp">로그인</a>
                    <a href="join.jsp">회원가입</a>
                    <a href="mypage.jsp">마이페이지</a>
                    <a href="#">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        장바구니</a>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="main.jsp">
                        <img src="images/listmain.jpg" alt="로고" width="100px" height="100px">
                    </a>    
                </div>
                
            </div>
        </header> 
		<main>
			<div class= "all">
				<div class="complete">
				<c:if test="${not empty pw }">
					<div style="font-size: 20px;">회원님의 비밀번호는 <b><%=pw %></b> 입니다.<br><br></div>
				</c:if>
				<c:if test="${empty pw }">
					<div style="font-size: 20px;">입력하신 정보의 가입 내역이 없습니다.<br><br></div>
				</c:if>
				</div>
				<div class="btn-group">
					 <button style="height: 50px;" class="button" onclick="location.href='login.jsp'">로그인</button>
					 <button style="height: 50px;" class="button" onclick="location.href='id.jsp'">아이디 찾기</button>
				</div>
			</div>				
		</main>
		 <footer>
            <ul>
                <li><a href="#">회사소개</a></li>
            </ul>
            <div>
                <p>
                    <img src="images/listmain.jpg" alt="로고" width="80px">
                </p>
                <p>
                    <strong>(주) KMARKET</strong>
                    <br> 부산시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)
                    <br> 대표이사: 홍길동
                    <br> 사업자등록번호: 220-81-83676 사업자정보확인
                    <br> 통신판매업신고: 강남 10630호 Fax: 02-589-8842
                </p>
                <p>
                    <strong>고객센터</strong>
                    <br> Tel: 1234-5678 (평일: 09:00~18:00)
                    <br> 스마일클럽/SVIP 전용: 1522-5700 (365일 09:00~18:00)
                    <br> 경기도 부천시 원미구 부일로 233(상동) 투나빌딩 6층
                    <br> Fax: 051-123-4567 | Mail: kmarket@kmarket.co.kr
                </p>
            </div>
        </footer>
</body>
</html>