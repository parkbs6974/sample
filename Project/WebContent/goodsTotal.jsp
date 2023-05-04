<%@page import="com.mystudy.ajax.vo.GoodsVO"%>
<%@page import="com.mystudy.ajax.dao.GoodsDAO"%>
<%@page import="com.mystudy.ajax.vo.TotalVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.ajax.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	pageContext.setAttribute("goodsList",GoodsDAO.goodsAll());
%>
<!DOCTYPE html>
<html>
<head>
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
<script>
	function sendData(frm) {
			frm.submit();
		}
</script>
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
</style>
</head>
<body>
	<%@ include file="common/adminHeader.jspf" %>
        <%-- 카테고리 --%>
        <main id="product">
        <aside>
                <ul class="category">
                    <li>
                        <i class="fa fa-bars" aria-hidden="true"></i>카테고리
                    </li>
                        <li>
                        <a href="goods_list.jsp?goodsMenu=walk">
                            <i class="fas fa-tshirt" aria-hidden="true"></i>산책용품
                            </i>
                        </a>
                    </li>
                    <li>
                        <a href="goods_list.jsp?goodsMenu=toy">
                            <i class="fas fa-laptop" aria-hidden="true"></i>장난감
                            </i>
                        </a>
                    </li>
                    <li>
                        <a href="goods_list.jsp?goodsMenu=food">
                            <i class="fas fa-utensils" aria-hidden="true"></i>간식
                            </i>
                        </a>
                    </li>
                    <li>
                        <a href="goods_list.jsp?goodsMenu=shower">
                            <i class="fas fa-home" aria-hidden="true"></i>샤워용품
                            </i>
                        </a>
                    </li>
                </ul>
            </aside>
            <%-- 내용쓸곳! --%>
          	<section>
                <nav>
                    <h1>정산</h1>
                </nav>
                <form action="goodsTotal_ok.jsp" class="center">
                	<input type="number" name="goodsNum">
                	<input type="button" value="물품매출확인" onclick="sendData(this.form)">
                </form>
                <table>
				  <thead>
				    <tr>
				  		<th>물품번호</th>
				  		<th>물품이름</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach var="list" items="${goodsList }">
				  	<tr>
				    	<td>${list.goodsNum }</td>
				    	<td>${list.goodsName }</td>
				  	</tr>
                </c:forEach>
				  </tbody>
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
</script>

</body>
</html>