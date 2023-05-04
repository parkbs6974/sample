<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mystudy.ajax.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.ajax.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <jsp:useBean id="cartDAO" class="com.mystudy.ajax.dao.CartDAO" scope="session"/> --%>
<%
	request.setCharacterEncoding("UTF-8");
	String cartNum = request.getParameter("cartNum");
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	
	if (id == null) {
		%>
		<script>
		alert("로그인을 해주세요");
		history.back();
		</script>
		<%
			return;
		}
	pageContext.setAttribute("list", CartDAO.cartList(id));
	System.out.println(cartNum);
	List<CartVO> list = new ArrayList<CartVO>();
	String[] strSplit = cartNum.split(",");
	for (String str2 : strSplit) {
		System.out.println(str2);
		list.add(CartDAO.order(Integer.parseInt(str2)));
	}
	
	pageContext.setAttribute("list", list);
	
	int balance = UsersDAO.balanceList(id);

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
#product > .list > table tr > td:nth-child(1) { width: 15%; padding: 0; }
#product > .list > table tr > td:nth-child(2) { width: 35%; }
#product > .list > table tr > td:nth-child(3) { width: 35%; }
#product > .list > table tr > td:nth-child(4) { width: 15%; }
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


</style>
</head>
<body>
<%@ include file="common/userHeader.jspf" %>
    <div id="wrapper">
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
                    <h1>결제하기</h1>
                </nav>
                <table>
                	<c:set var="total" value="${0}"/>
                	<c:set var="cnt" value="${0}"/>
                	<c:forEach var="vo" items="${list }">
                	<c:set var="total" value="${total + vo.goodsSale * vo.cnt}"/>
                	<c:set var="cnt" value="${cnt + 1}"/>
                    <tr>
                    <div onclick="location.href='goodsDetail.jsp?goodsNum='+${vo.goodsNum}" style="cursor:hand">
                        <td><a href="" class="thumb">
                           <img src="images/${vo.goodsVO.goodsImg }" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">${vo.goodsName }</h3>
                            <a href="#" class="desc">${vo.goodsVO.goodsCont }</a>
                        </td>
                        </div>
                        <td class="cntControl">
	             				<input name="chk" type="checkbox" class="chk" value="${vo.cartNum}" checked="checked" hidden="hidden">
                            	<input name="cntVal" class="cnt-btn" value="${vo.cnt }" size="3">
                            	<input name="cartNum" type="hidden" value="${vo.cartNum }">
                        </td>
                        <td>
                            <ul>
                                <li><ins class="dis-price">${vo.goodsSale * vo.cnt }</ins></li>
                                <li>
                                   	<del class="org-price">${vo.goodsVO.goodsPrice * vo.cnt }</del>
                                   	<fmt:parseNumber var="percent" integerOnly = "true" value="${(vo.goodsVO.goodsPrice - vo.goodsSale) * 100 / vo.goodsVO.goodsPrice}" />
                                    <span class="discount">${percent}%</span>
                                </li>
                                <li><span class="free-delivery">무료배송</span></li>
                            </ul>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
                <table>
	                <tr>
		                <th>적립금</th>
		                <td><%=balance%> <input type="button" value="적립금 충전하기" onclick="javascript:location.href='balance.jsp'"></td>
	                </tr>
	                <tr>
		                <th>총 상품 금액</th>
		                <td>${total}</td>
	                </tr>
	                <tr>
		                <th>총 배송비</th>
		                <td>모든 상품 무료 배송</td>
	                </tr>
	                <tr>
		                <th>총 결제 금액</th>
		                <td>${total}</td>
	                </tr>
	                <tr>
		                <th colspan="2">
		                <form>
             				<input id="cartNum" name="cartNum" type="hidden" value="${vo.cartNum }">
             				<input name="goOrder" type="submit" value="총 ${cnt}개 주문하기" onclick="javascript:orderOk(this.form);return false;">
             				<input name="goBack" type="submit" value="장바구니로 돌아가기" onclick="javascript:history.back();return false;">
                        </form>
		                </th>
	                </tr>
                </table>
            </section>
        </main>
        <%@ include file="common/userFooter.jspf" %>
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

	function orderOk(frm){
		
		var cartNumArray = [];
		var chk_arr = $("input[name='chk']");
		
	    for( var i=0; i<chk_arr.length; i++ ) {
	        if( chk_arr[i].checked == true ) {
	        	cartNumArray.push(chk_arr[i].value);
	        }
	    }
		$(".chk:checked").each(function(){
			console.log("cartNumArray : " + cartNumArray);
		});
		
		$("#cartNum").val(cartNumArray);
		
		frm.action="orderOk.jsp";
		frm.submit();
	}

	 
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
  	
  	var total = ${total};
  	console.log(total);

</script>
</body>
</html>