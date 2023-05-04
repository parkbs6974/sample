<%@page import="com.mystudy.ajax.dao.AdminDAO"%>
<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@page import="com.mystudy.ajax.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <jsp:useBean id="cartDAO" class="com.mystudy.ajax.dao.CartDAO" scope="session"/> --%>
<%
	String adminname = (String) session.getAttribute("adminname");
	if (adminname == null) {
		%>
		<script>
		alert("관리자로그인을 해주세요");
		history.back();
		</script>
		<%
			return;
		}
	int goodsNum = Integer.parseInt(request.getParameter("goodsNum"));
	System.out.println(goodsNum);
	pageContext.setAttribute("list", AdminDAO.goodsTotal(goodsNum));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>으르르 쇼핑몰</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/product.css">
<style>
#product > .list > table tr > td:nth-child(1) { width: 5%; padding: 0; }
#product > .list > table tr > td:nth-child(2) { width: 15%; }
#product > .list > table tr > td:nth-child(3) { width: 35%; }
#product > .list > table tr > td:nth-child(4) { width: 15%; }
#product > .list > table tr > td:nth-child(5) { width: 20%; }
#product > .list > table tr > td:nth-child(6) { width: 10%; }
/* #cnt { line-height: 100%;
	align-content: center; } */
	#cnt-btn { text-align: center;}

    main > aside {
	    float: left;
	    width: 215px;
	    height: 100%;
		}
	
	main > aside > .navform > .category {
	    position: relative;
	    width: 100%;
	    height: 425px;
	    background: #333949;
	}
	
	main > aside > .navform > .category > li {
	    width: 100%;
	    height: 40px;
	    line-height: 40px;
	    color: #ccc;
	    font-size: 13px;
	    font-weight: bold;
	    border-bottom: 1px solid #2b313f;
	    box-sizing: border-box;
	}
	
	main > aside > .navform > .category > li:nth-child(1){
	    padding: 0 20px;
	    color: #fff;
	    line-height: 40px;
	}
	
	main > aside > .navform > .category > li > a {
	    display: block;
	    padding: 0 20px;
	    line-height: 40px;
	    color: #ccc;
	    font-weight: bold;
	    text-decoration: none;
	    font-size: 1em;
	}
	
	main > aside > .navform > .category > li > a:hover {
	    background: #2b313f;
	    color: #fff;
	}
	
	main > aside > .navform > .category > li > a:hover + ol {
	    display: block;
	}
	
	main > aside > .navform > .category ol:hover {
	    display: block;
	}   
	
	main > aside > .navform > .category i {
	    width: 22px;
	    font-size: 16px;
	    margin-right: 12px;
	}
	
	main > aside > .navform > .category > li i.fa-angle-right{
	    float: right;
	    width: auto;
	    margin-top: 10px;
	    margin-right: 0;
	}
	
	main > aside > .navform > .category ol {
	    position: absolute;
	    left: 215px;
	    top: 0;
	    display: none;
	    width: 215px;
	    height: 100%;
	    border: 1px solid #787f89;
	    background: #fff;
	    box-sizing: border-box;
	    z-index: 10000;
	}
	
	main > aside > .navform > .category ol > li {
	    width: 100%;
	    height: 24px;
	    padding: 10px;
	    box-sizing: border-box;
	}
	
	main > aside > .navform > .category ol > li > a:hover {
	    color: #41ab47;
	    text-decoration: underline;
	}
	p {
	text-align: center;
	font-style: italic;
	font-size: 2em;
	font-weight: bold;
	}
	
	.one {
		font-size: 16px;
    font-weight: bold;
    color: #111;
    margin-bottom: 6px;
	}
	.count  {
		  width: 370px;
		  height: 120px;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  font-size: 3rem;
		  font-weight: bold;
		  background: #febf00;
		  border-radius: 1rem;
		  margin:auto;
		  padding:40px;
	
		  color: #000;
		}


</style>
<script>

const counter = ($counter, max) => {
	  let now = max;

	  const handle = setInterval(() => {
	    $counter.innerHTML = Math.ceil(max - now);
	  
	    // 목표수치에 도달하면 정지
	    if (now < 1) {
	      clearInterval(handle);
	    }
	    
	    // 증가되는 값이 계속하여 작아짐
	    const step = now / 10;
	    
	    // 값을 적용시키면서 다음 차례에 영향을 끼침
	    now -= step;
	  }, 50);
	}
	<c:set var = "total" value = "0" />
    <c:forEach var="alist" items="${list }">
    <c:set var= "total" value="${total + (alist.goodsSale * alist.cnt)}"/>
    </c:forEach>

	window.onload = () => {
	  // 카운트를 적용시킬 요소
	  const $counter = document.querySelector(".count");
	  
	  // 목표 수치
	  const max = <c:out value="${total}"/>;
	  
	  setTimeout(() => counter($counter, max), 500);
	}
</script>
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
				<%
                	if (adminname != null) { // 로그인했다면 %>
                		<a><%=adminname%>님</a>
                		<a href="logout.jsp">로그아웃</a>
                		
                <%		
                	} else {
                %>
                    <a href="">로그인</a>
				<%
					}
                %>
                    <a href="join.jsp">회원가입</a>
                    <a href="mypage.jsp">마이페이지</a>
                    <a href="cart.jsp?">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        장바구니
                    </a>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="main.jsp">
                        <img src="images/listmain.jpg" alt="헤더로고" width="100px" height="100px">
                    </a>
                    <form action="search.jsp">
                        <input type="text" name="search">
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
        <main id="product">
        <aside>
        <form method="post" class="navform" name="testForm">
                <ul class="category">
                    <li>
                        <i class="fa fa-bars" aria-hidden="true"></i>카테고리
                    </li>
                        <li>
                        <a href="javascript:void(0)" onclick="search_walk(testForm);return false;">
                            <i class="fas fa-tshirt" aria-hidden="true"></i>산책용품
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="search_toy(testForm);return false;">
                            <i class="fas fa-laptop" aria-hidden="true"></i>장난감
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="search_food(testForm);return false;">
                            <i class="fas fa-utensils" aria-hidden="true"></i>간식
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="search_shower(testForm);return false;">
                            <i class="fas fa-home" aria-hidden="true"></i>샤워용품
                        </a>
                    </li>
                </ul>
            </form>
            </aside>
            <section class="list">
                <nav>
                    <h1>물품총매출</h1>
                </nav>
                <div class="count">0</div>
            </section>
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
        <button type="button" id="top">상단이동</button>
    </div>
<script>
	$(window).scroll(function(){
		if ($(this).scrollTop() > 300){
			$('#top').show();
		} else{
			$('#top').hide();
		}
	});
	$('#top').click(function(){
		$('html, body').animate({scrollTop:0},400);
		return false;
	});

	
	$(document).ready(function(){
		//checkbox 이벤트 연결
		$(".chk").change(fnComputeOptionAll);
		
	});
	
	function fnComputeOptionAll(){
		let total = 0;
		let cnt = $('input:checkbox[name=chk]:checked').length;
	    
		var cartNumArray = [];
		
	    for( var i=0; i<chk_arr.length; i++ ) {
	        if( chk_arr[i].checked == true ) {
	        	cartNumArray.push(chk_arr[i].value);
	        }
	    }
		$(".chk:checked").each(function(){
			total += Number($(this).next().val());
			console.log(total);
			console.log("cartNumArray : " + cartNumArray);
		});
		$(".total").val(total);
		$("#buyCnt").val(cnt);
		
		return  cartNumArray;
	}
	
  	var chk_arr = $("input[name='chk']");

	function goBuy(frm){
		var cartNumArr = fnComputeOptionAll();
		console.log("cartNumArr : " + cartNumArr[0]);
		$("#cartNum").val(cartNumArr);
		console.log($("#cartNum").val(cartNumArr));
		
		frm.action="order.jsp";
		frm.submit();
	 
	function delete_item(cartNum){
		location.href="cart_delete.jsp?cartNum=" + cartNum;
	}
	
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
  	
  	
</script>
</body>
</html>