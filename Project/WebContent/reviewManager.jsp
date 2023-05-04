<%@page import="com.mystudy.ajax.dao.ReviewDAO"%>
<%@page import="com.mystudy.ajax.vo.ReviewVO"%>
<%@page import="com.mystudy.ajax.vo.GoodsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.ajax.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<ReviewVO> list = ReviewDAO.reviewAll();
	pageContext.setAttribute("reviewList", list);
%>
<!DOCTYPE html>
<html lang="en">
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
	body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
}
th,
td {
  padding: 6px 15px;
}
th {
  background: #42444e;
  color: #fff;
  text-align: left;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}
.center {
	text-align: center;
}

/* main nav mvc */
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
</style>
</head>
<body>
     <%@ include file="common/adminHeader.jspf" %>
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
            <section>
                <nav>
                    <h1>후기목록</h1>
                </nav>
                <table>
				  <thead>
				    <tr>
				    	<th>카테고리명</th>
				  		<th>ID</th>
				  		<th>제목</th>
				  		<th>내용</th>
				  		<th>첨부파일</th>
				  		<th>별점개수</th>
				  		<th>후기작성일</th>
				  		<th>삭제버튼</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach var="vo" items="${reviewList }">
				  	<tr>
				    	<td>
				    	<c:choose>
				    	<c:when test="${vo.goodsMenu == 'walk'}">산책용품</c:when>
				    	<c:when test="${vo.goodsMenu == 'shower'}">샤워용품</c:when>
				    	<c:when test="${vo.goodsMenu == 'toy'}">장난감</c:when>
				    	<c:when test="${vo.goodsMenu == 'food' }">간식</c:when>
				    	<c:otherwise>${vo.goodsMenu }</c:otherwise>
				    	</c:choose>
				    	</td>
				    	<td>${vo.id }</td>
				    	<td>${vo.reviewTitle }</td>
				    	<td>${vo.reviewCont }</td>
				    	<td>${vo.reviewFile }</td>
				    	<td>${vo.reviewStar }</td>
				    	<td>${vo.reviewDate }</td>
				    	<td>
				    		<input type="button" value="삭제" onclick="location.href='reviewManagerDelete.jsp?reviewNum=${vo.reviewNum}'">
				    	</td>
				  	</tr>
                <c:if test="${empty vo }">
					<tr>
						<td colspan="8">후기 정보가 없습니다.</td>
					</tr>
				</c:if>
				  </tbody>
                </c:forEach>
				 </table>
            </section>
        </main>
        <%@ include file="common/adminFooter.jspf" %>
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