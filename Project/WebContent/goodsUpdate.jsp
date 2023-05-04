<%@page import="com.mystudy.ajax.vo.GoodsVO"%>
<%@page import="com.mystudy.ajax.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int goodsNum = Integer.parseInt(request.getParameter("goodsNum"));
	GoodsVO vo = GoodsDAO.goodsDetail(goodsNum);
	session.setAttribute("vo", vo);
	session.getAttribute("adminname");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>errr mainpage</title>
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
        #product > .view > article {
            width: 100%;
            height: auto;
            overflow: hidden;
        }        

        #product > .view > .info > div {
            float: left;
            width: 50%;
            height: 100%;
            padding: 10px;
            box-sizing: border-box;
        }

        #product > .view > .info > .image > img { width: 100%; }

        #product > .view > .info > .summary > nav {
            border-bottom: 1px solid #eaeaea;
            padding-bottom: 10px;
            margin-bottom: 12px;
            overflow: hidden;
        }

        #product > .view > .info > .summary > nav > h1 {
            float: left;
            color: #0231a6;
            font-weight: bold;
            font-size: 1.5em;
        }

        #product > .view > .info > .summary > nav > h2 {
            float: right;
            color: #777;
            margin-top: 8px;
        }

        #product > .view > .info > .summary > nav > h3 {
            font-size: 18px;
            font-weight: bold;
            color: #1e2732;
        }

        #product > .view > .info > .summary > nav > p {
            font-size: 14px;
            color: #474747;
            line-height: 36px;
            letter-spacing: -1px;
        }

        #product > .view > .info > .summary > nav:nth-child(2) > .rating > a {
            color: #346aff;
            text-decoration: underline;
        }

        #product > .view > .info > .summary .org_price > del {
            font-size: 18px;
            color: #aaa;
        }

        #product > .view > .info > .summary .org_price > del::after { content: "원"; }

        #product > .view > .info > .summary .org_price > span {
            color: #eb000a;
            font-size: 16px;
            margin-left: 6px;
        }

        #product > .view > .info > .summary .org_price > span::after { content: "↓"; }

        #product > .view > .info > .summary .dis_price > ins {
            font-size: 26px;
            font-weight: bold;
            text-decoration: none;
        }

        #product > .view > .info > .summary .dis_price > ins::after { content: "원"; }
        #product > .view > .info > .summary .delivery {
            font-size: 16px;
            color: #2e8de5;
        }

        #product > .view > .info > .summary .origin {
            font-size: 16px;
        }

        #product > .view > .info > .summary .arrival {
            font-size: 14px;
            margin-left: 10px;
        }
        #product > .view > .info > .summary .desc {
            display: block;
            color: #aaa;
        }

        #product > .view > .info > .summary .card > i {
            display: inline-block;
            width: 30px;
            height: 18px;
            top: 4px;
            font-size: 0;
            vertical-align: text-top;
            margin-right: 2px;
        }

        #product > .view > .info > .summary .cardfree > i { background-position: -126px 0; }

        #product > .view > .info > .summary .cardadd > i { background-position: -51px -21px; }

        #product > .view > .info > .summary .banner { width: 100%; }

        #product > .view > .info > .summary .count {
            position: relative;
            width: 100px;
            height: 40px;
        }

        #product > .view > .info > .summary .count > button {
            position: absolute;
            width: 21px;
            height: 21px;
            background-image: url(./img/ico_sprites.png);
            font-size: 0;
            background-color: transparent;
            border: none;
        }

        #product > .view > .info > .summary .count > input[name=num] {
            position: absolute;
            left: 30px;
            top: 0;
            width: 30px;
            height: 21px;
            border: 1px solid #ececec;
            font-size: 14px;
            text-align: center;
        }

        #product > .view > .info > .summary .count > .decrease {
            left: 0;
            top: 0;
            background-position: 0px -74px;
        }

        #product > .view > .info > .summary .count > .increase {
            left: 70px;
            top: 0;
            background-position: -48px -74px;
        }


        #product > .view > .info > .summary .total {
            overflow: hidden;
            margin-top: 16px;
        }

        #product > .view > .info > .summary .total > span {
            float: right;
            display: inline-block;
            line-height: 38px;
            font-size: 24px;
            font-weight: bold;
            color: #000;
            text-align: right;
            letter-spacing: -0.5px;
        }

        #product > .view > .info > .summary .total > span::after { content: "원";}

        #product > .view > .info > .summary .total > em {
            float: right;
            display: block;
            width: 100px;
            height: 22px;
            padding: 10px 0 0;
            font-size: 16px;
            line-height: 22px;
            color: #5e636d;
            letter-spacing: -1px;
        }

        #product > .view > .info > .summary .button {
            overflow: hidden;
            margin-top: 16px;
        }

        #product > .view > .info > .summary .button > input {
            float: left;
            width: 49%;
            height: 50px;
            margin: 2px;
            font-size: 20px;
            font-weight: bold;
            border-radius: 2px;
            cursor: pointer;
        }

        #product > .view > .info > .summary .button > .cart {
            background: #fff;
            border: 1px solid #d9d9d9;
            color: #233594;
        }

        #product > .view > .info > .summary .button > .order {
            background: #2e8de5;
            border: 1px solid #217fd7;
            color: #fff;
        }

        #product > .view > .review > .paging > .num > a.on {
            color: #fe434c;
            font-weight: bold;
        }

        #product > .view > article > nav {
            border-bottom: 1px solid #a4a9b0;
            padding: 6px 0;
            margin-bottom: 12px;
            overflow: hidden;
        }

        #product > .view > article > nav > p {
            float: left;
            color: #777;
            margin-top: 6px;
            margin-left: 6px;
        }

        #product > .view > article > nav > h1 {
            float: left;
            color: #1e2732;
            font-weight: bold;
            font-size: 1.5em;
        }

        #product > .view > .notice > table { width: 100%; }

        #product > .view > .notice > table:nth-of-type(2) { border-top: 1px solid #ececec; }

        #product > .view > .notice > table tr > td {
             padding: 5px 0 6px 21px;
             font-size: 14px;
             color: #777;
        }

        #product > .view > .notice > table tr > td:nth-child(1) { width: 20%; color: #222; }

        #product > .view > .review > ul {
            padding: 10px;
            box-sizing: border-box;
        }

        #product > .view > .review > ul > li {
            padding-top: 16px;
            border-bottom: 1px solid #ececec;
            box-sizing: border-box;
        }

        #product > .view > .review > ul > li > div { overflow: hidden; }

        #product > .view > .review > ul > li > div > span {
            float: right;
            color: #555;
        }

        #product > .view > .review > ul > li > div >  h5 { float: left; }

        #product h5.rating {
            width: 150px;
            height: 20px;
            font-size: 0px;
            background-image: url(./img/ico_rating_star.png);
            background-repeat: no-repeat;
            background-position: 36px 0px;
            text-indent: 86px;
        }

        #product > .view > .review > ul > li > h3 {
            color: #555;
            margin-top: 6px;
        }

        #product > .view > .review > ul > li > p {
            width: 100%;
            height: 60px;
            color: #555;
            font-size: 14px;
            line-height: 19px;
            word-break: break-all;
            word-wrap: break-word;
            margin-top: 10px;
        }

        #product > .view > .review > .paging {
            width: 100%;
            padding: 30px 0;
            text-align: center;
        }

        #product > .view > .notice > .notice {
            margin: 20px 0;
            padding: 21px 26px 20px 19px;
            line-height: 20px;
            font-size: 14px;
            color: #757c8a;
            background: #fafafa;
            border-radius: 2px;
            white-space: normal;
        }

        #product > .view > .review >.paging > span > a { 
            color: #777;
            font-size: 11px;
            letter-spacing: -1px;
        }

        #product > .view > .review > .paging > .num > a {
            display: inline-block;
            min-width: 14px;
            margin: 0 2px;
            padding: 8px 9px;
            border: 1px solid #c4c4c4;
            color: #000;
            font-size: 12px;
            text-align: center;
            text-decoration: none;
        }
        #product > .view > .review > .paging > .num > a.on {
            color: #fe434c;
            font-weight: bold;
        }
        .frm {
        	 font-size: 18px;
		     font-weight: bold;
		     color: #1e2732;
        }
        .input {
        	 font-size: 13px;
		     width: 100%;
        }
        textarea {
		width: 90%;
		height: 90%;
	}
    </style>
<script>
	function list_go() {
		location.href = "goodsManager.jsp";
	}
	function sendData(frm) {
		frm.submit();
	}
</script>
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
            <section class="view">
                <article class="info">
                    <div class="image">
                        <img src="images/${vo.goodsImg }" alt="상품이미지">
                    </div>
                    <div class="summary">
                    <form action="goodsUpdate_ok.jsp" method="post" enctype="multipart/form-data">
                        <nav>
                            <h3 class="frm">상품명 <input class="input" type="text" name="goodsName" title="상품명" value="${vo.goodsName }"></h3>
                        </nav>
                        <nav>
                            <h3 class="frm">상품설명 <textarea name="goodsCont" title="상품설명">${vo.goodsCont }</textarea></h3>
                        </nav>
                        <nav>
                            <h3 class="frm">상품정가 <input class="input" type="text" name="goodsPrice" title="상품정가" value="${vo.goodsPrice }"></h3>
                        </nav>
                        <nav>
                            <h3 class="frm">상품할인가 <input class="input" type="text" name="goodsSale" title="상품할인가" value="${vo.goodsSale }"></h3>
                        </nav>
                        <nav>
                            <h3 class="frm">상품카테고리 <input class="input" type="text" name="goodsMenu" title="상품카테고리" value="${vo.goodsMenu }">
                            						  <input class="input" type="hidden" name="goodsNum" title="상품번호" value="${vo.goodsNum }"></h3>
                        </nav>
                        <nav>
                            <h3 class="frm">상품이미지 <input type="file" name=goodsImg title="상품이미지">${vo.goodsImg }</h3>
                        </nav>
                        <div class="button">
                            <input type="reset" value="초기화">
                            <input type="button" value="목록" onclick="list_go()">
                            <input type="button" class="cart" value="저장하기" onclick="sendData(this.form)">
                        </div>
                        </form>
                    </div>
                </article>
            </section>
        </main>
        <%@ include file="common/adminFooter.jspf" %>
</body>
</html>