<%@page import="com.mystudy.ajax.vo.UsersVO"%>
<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	String id = request.getParameter("id");
	String name = (String)session.getAttribute("name");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 비밀번호 폼</title>
</head>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
	}
	
input[type=text], input[type=password] {
    min-height: 40px;
    line-height: 40px;
    padding: 0 10px;
    border: 0;
    background: #dfe9e8;
    color: #477a7b;
    font-size: 15px;
    }
    
    .btn-group {

    margin-left: 550px !important;
}   
</style>
<link href="css/joinOk.css" rel="stylesheet" />
<link href="css/common.css" rel="stylesheet" />

<body style="font-family:Pretendard-Regular">
<%@ include file="common/userHeader.jspf" %>
		<main>
		<form action="controller?type=pwCheck" method="post">
			<div class= "all">
				<div class="complete">
					<div style="font-size: 20px;">비밀번호를 입력해주세요.<br><br></div>
					 <input type="text" name="pw" placeholder="비밀번호 입력" required>
					 <input type="hidden" name="id" value="${id }">
				</div>
				<div class="btn-group">
					 <button class="button" id="insertPw">확 인</button>
				</div>
			</div>	
			</form>			
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
<script>
/* 	function insertPw() {
		frm.submit();
		 onclick="insertPw(this.form)"
	} */
		
</script>

</html>