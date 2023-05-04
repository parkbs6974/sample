<%@page import="com.mystudy.ajax.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	pageContext.setAttribute("list", GoodsDAO.getNewList());
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");

%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>errr mainpage</title>
    <meta charset="utf-8" />
    <link href="css/main.css" rel="stylesheet" />
    
    	
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">

  </head>

  <body>
  <script>
  	function search_shower(frm) {
  		frm.action = "controller?type=shower";
		frm.submit();
  	}
  	function search_walk(frm) {
  		frm.action = "controller?type=walk";
		frm.submit();
  	}
  	function search_toy(frm) {
  		frm.action = "controller?type=toy";
		frm.submit();
  	}
  	function search_food(frm) {
  		frm.action = "controller?type=food";
		frm.submit();
  	}
  	function search_click(){
  		console.log("정상작동");
  		let searchVal = document.getElementById('searchInput').value;
  		console.log(searchVal);
/*   		let addr = "search.jsp?search="+searchVal;
  		console.log(addr); */
  		location.href="search.jsp?search="+searchVal;
  	}
  	function enterkey(frm){
  		if(event.keyCode==13) {
  			search_click(frm);
  		}
  	}
  	
  	
  </script>
  <%
  	if(session.getAttribute("id")!= null){
  		id = (String)session.getAttribute("id");
  		out.println(id+"님 반갑습니다.<br>");
  		out.println("<a href='logout.jsp'>로그아웃</a>");
  	}
  
  %>
  <header class= "head">
      <div class="navbar">
      	<a class="logo" href="main.jsp">
        <img src="images/listmain.jpg" height="80px">
		</a>
		<input type="checkbox" id="menuicon">
		<label for="menuicon">
		<span></span>
		<span></span>
		<span></span>
		</label>
		<div class="sidebar">
			<div class="menubar">
			<form method="post" name="testForm">
				<hr>
				<li class="category-goods"><a href="#">전체 상품</a></li>
					<ul id="cate1">
				        <li><a href="javascript:void(0)" onclick="search_walk(testForm);return false;">산책용품</a></li>
				        <li><a href="javascript:void(0)" onclick="search_toy(testForm);return false;">장난감</a></li>
				        <li><a href="javascript:void(0)" onclick="search_food(testForm);return false;">간식</a></li>
				        <li><a href="javascript:void(0)" onclick="search_shower(testForm);return false;">샤워용품</a></li>
			      	</ul>
				<hr>
			    <li class="myinformation"><a href="#">나의 정보</a></li>
				    <ul id="cate2">
				        <% if (id != null) { // 로그인했다면 %>
                		<li><a href="logout.jsp">로그아웃</a></li>
                <%	} else { %>
                    <li><a href="login.jsp">로그인</a></li>
				<% } %>
						<li><a href="mypage.jsp">마이페이지</a></li>
				        <li><a href="cart.jsp?id=<%=id %>">장바구니</a></li>
				        <li><a href="reviewMain.jsp">후기 게시판</a></li>
				        <li><a href="qnaMain.jsp">문의사항</a></li>
		      		</ul>
		      	<hr>
			</form>
	      	</div>
		</div>
    </div>
    
    
    
    
    
    
    
	    <div>
	    	<form>
				<div class="box-container">
					<table class="elements">
						<tr>
							<form action="search.jsp">
							<td>
								<input id="searchInput" type="text" placeholder="search" onkeydown="if(event.keyCode==13){search_click(this.form);return false;}">
							</td>
							<td>
								<a id="searchClick" href="javascript:void(0)" onclick="search_click(this.form);return false;">
									<i class="material-icons">search</i>
								</a>
							</td>
							</form>
						</tr>
					</table>
		    	</div>
			</form>
	   		 <img class="dog_header" src="images/dog.jpg">
	    </div>
	</header>
	<main class="main">   
	    <h1>Our new Products</h1>
		<div class="products">
	<c:forEach var="vo" items="${list }">
      <a onclick="location.href='goodsDetail.jsp?goodsNum='+${vo.goodsNum}" style="cursor:hand">
        <img src="images/${vo.goodsImg }">
        <p class="goodsName">${vo.goodsName }</p>
        <p class="price">${vo.goodsSale }</p>
      </a>
	</c:forEach>
      <div class="clearfix"></div>
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
                    <strong>(주) kmarket</strong>
                    <br> 부산시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)
                    <br> 대표이사: 홍길동
                    <br> 사업자등록번호: 220-81-83676 사업자정보확인
                    <br> 통신판매업신고: 강남 10630호 fax: 02-589-8842
                </p>
                <p>
                    <strong>고객센터</strong>
                    <br> tel: 1234-5678 (평일: 09:00~18:00)
                    <br> 스마일클럽/svip 전용: 1522-5700 (365일 09:00~18:00)
                    <br> 경기도 부천시 원미구 부일로 233(상동) 투나빌딩 6층
                    <br> fax: 051-123-4567 | mail: kmarket@kmarket.co.kr
                </p>
            </div>
        </footer>
    </body>
</html>