<%@page import="com.mystudy.ajax.dao.AdminDAO"%>
<%@page import="com.mystudy.ajax.vo.AdminVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.getAttribute("adminname");
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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<style>
	a:visited {
  color : black;
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
<script>
	function sendData(frm) {
		frm.submit();
	}

	function list_go() {
		location.href = "adminMain.jsp";
	}
	let chk = "${chk }";
	if(chk == "null"){
		alert("입력정보없음, 다시입력하세요");
	}
</script>
<body>
	<%@ include file="common/adminHeader.jspf" %>
        <%-- 카테고리 --%>
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
			<div class="container">
				<form name="newProduct" action="goodsInsert_ok.jsp" class="form-horizontal" method="post" 
				enctype="multipart/form-data">
					
					<div class="form-group row">
						<label class="col-sm-2">상품 이름</label>
						<div class="com-sm-3">
							<input type="text" id="name" name="goodsName" class="form-control">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">상세 내용</label>
						<div class="com-sm-5">
							<textarea name="goodsCont" cols="50" rows="2" class="form-control"></textarea>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="com-sm-3">
							<input type="text" id="unitPrice" name="goodsPrice" class="form-control">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">할인가</label>
						<div class="com-sm-3">
							<input type="text" id="unitPrice" name="goodsSale" class="form-control">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">분류</label>
						<div class="com-sm-3">
							<input type="text" name="goodsMenu" class="form-control">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">상품 이미지</label>
						<div>
							<input type="file" name="goodsImg" class="form-control">
						</div>
					</div>
						
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" class="btn btn-primary" value="저장" onclick="sendData(this.form)">
							<input type="reset" class="btn btn-primary" value="초기화">
							<input type="button" class="btn btn-primary" value="목록보기" onclick="list_go()">
						</div>
					</div>
					
				</form>
			</div>
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