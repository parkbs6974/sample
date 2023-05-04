<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="com.mystudy.ajax.dao.GoodsDAO" scope="session"/>
<%
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	String name = (String)session.getAttribute("name");

	String goodsName = request.getParameter("search");
	if (goodsName.equals("") || goodsName == null) {
		%>
		<script>
		alert("검색어를 입력해주세요");
		history.back();
		</script>
		<%
			return;
		}
		pageContext.setAttribute("list", dao.getNameList(goodsName));
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

#product > .list > table .name {
    font-size: 16px;
    font-weight: bold;
    color: #111;
    margin-bottom: 6px;
}

</style>
</head>
<body>
    <div id="wrapper">
        <%@ include file="common/userHeader.jspf" %>
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
                    <h1>상품목록</h1>
                </nav>
                <table>
                	<c:forEach var="vo" items="${list }">
                    <tr onclick="location.href='goodsDetail.jsp?goodsNum='+${vo.goodsNum}" style="cursor:hand">
                        <td><a href="" class="thumb">
                            <img src="images/${vo.goodsImg }" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">${vo.goodsName }</h3>
                            <a href="#" class="desc">${vo.goodsCont }</a>
                        </td>
                        <td>
                            <ul>
                                <li><ins class="dis-price">${vo.goodsSale }</ins></li>
                                <li>
                                    <del class="org-price">${vo.goodsPrice }</del>
                                    <span class="discount">${vo.percent }%</span>
                                </li>
                                <li><span class="free-delivery">무료배송</span></li>
                            </ul>
                        </td>
                        <td>
                            <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i> 판매자
                            </h4>
                            <h5 class="badge power">판매자등급</h5>
                            <h6 class="rating star1">상품평</h6>
                        </td>
                    </tr>
                 </c:forEach>
                 <c:if test="${empty list }">
					<tr>
						<td colspan="4" class="name">해당하는 제품이 없습니다</td>
					</tr>
				</c:if>
                </table>
                
            </section>
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