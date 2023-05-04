<%@page import="com.mystudy.common.Paging"%>
<%@page import="com.mystudy.ajax.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.ajax.dao.ReviewDAO"%>
<%@page import="com.mystudy.ajax.vo.GoodsVO"%>
<%@page import="com.mystudy.ajax.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String id = (String) session.getAttribute("id");
	String pw = (String) session.getAttribute("pw");
	String name = (String) session.getAttribute("name");
	int goodsNum = Integer.parseInt(request.getParameter("goodsNum"));
	session.setAttribute("goodsVO", GoodsDAO.goodsDetail(goodsNum));
		
	
Paging p = new Paging();
	
	//1. 전체 게시물 수량 구하기
	p.setTotalRecord(ReviewDAO.getTotalCount());
	p.setTotalPage();
	
	System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
	
	//2. 현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	System.out.println("> cPage : " + cPage);
	System.out.println("> Paging nowPage : " + p.getNowPage());
	
	//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
	p.setEnd(p.getNowPage() * p.getNumPerPage());
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
	
	//3-1. (선택적) 끝번호가 데이터 건수보다 크면 데이터 건수와 동일하게 처리
	if (p.getEnd() > p.getTotalRecord()) {
		p.setEnd(p.getTotalRecord());
	}
	System.out.println(">> 시작번호(begin) : " + p.getBegin());
	System.out.println(">> 끝번호(end) : " + p.getEnd());
	
	//------- 블록(Block) 계산하기 ---------
	//4. 블록 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
	//4-1. 시작페이지, 끝페이지 구하기
	int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
	p.setBeginPage(beginPage);
	p.setEndPage(beginPage + p.getPagePerBlock() - 1);
	
	//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
	// 끝페이지를 전체페이지 수로 변경 처리
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	int begin = p.getBegin();
	int end = p.getEnd();
	
	System.out.println(">> beginPage : " + p.getBeginPage());
	System.out.println(">> endPage : " + p.getEndPage());
	
	   pageContext.setAttribute("pvo", p); //페이지 관련 데이터
	   List<ReviewVO> list = ReviewDAO.reViewDetailPage(goodsNum, begin, end);
		System.out.println(">> 현재페이지 글목록(list) : " + list);
		session.setAttribute("reviewList", list);
	
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

        #product > .view > .info > .information > nav {
            border-bottom: 1px solid #eaeaea;
            padding-bottom: 10px;
            margin-bottom: 12px;
            overflow: hidden;
        }

        #product > .view > .info > .information > nav > h1 {
            float: left;
            color: #0231a6;
            font-weight: bold;
            font-size: 1.5em;
        }

        #product > .view > .info > .information > nav > h2 {
            float: right;
            color: #777;
            margin-top: 8px;
        }

        #product > .view > .info > .information > nav > h3 {
            font-size: 18px;
            font-weight: bold;
            color: #1e2732;
        }

        #product > .view > .info > .information > nav > p {
            font-size: 14px;
            color: #474747;
            line-height: 36px;
            letter-spacing: -1px;
        }

        #product > .view > .info > .information > nav:nth-child(2) > .rating > a {
            color: #346aff;
            text-decoration: underline;
        }

        #product > .view > .info > .information  .org_price > del {
            font-size: 18px;
            color: #aaa;
        }

        #product > .view > .info > .information .org_price > del::after { content: "원"; }

        #product > .view > .info > .information .org_price > span {
            color: #eb000a;
            font-size: 16px;
            margin-left: 6px;
        }

        #product > .view > .info > .information  .org_price > span::after { content: "↓"; }

        #product > .view > .info > .information  .dis_price > ins {
            font-size: 26px;
            font-weight: bold;
            text-decoration: none;
        }

        #product > .view > .info > .information  .dis_price > ins::after { content: "원"; }
        #product > .view > .info > .information  .delivery {
            font-size: 16px;
            color: #2e8de5;
        }

        #product > .view > .info > .information  .origin {
            font-size: 16px;
        }

        #product > .view > .info > .information  .arrival {
            font-size: 14px;
            margin-left: 10px;
        }
        #product > .view > .info > .information  .desc {
            display: block;
            color: #aaa;
        }

        #product > .view > .info > .information  .card > i {
            display: inline-block;
            width: 30px;
            height: 18px;
            top: 4px;
            font-size: 0;
            vertical-align: text-top;
            margin-right: 2px;
        }

        #product > .view > .info > .information .cardfree > i { background-position: -126px 0; }

        #product > .view > .info > .information .cardadd > i { background-position: -51px -21px; }

        #product > .view > .info > .information .banner { width: 100%; }

        #product > .view > .info > .summary .count {
            position: relative;
            width: 100px;
            height: 40px;
        }

        #product > .view > .info > .summary .count > button {
            position: absolute;
            width: 21px;
            height: 21px;
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

        #product > .view > .info > .summary .count > .minus_btn {
        	width: 16px;
            left: 0;
            top: 0;
            background-position: 0px -74px;
            border: 1px solid #ececec;
            color: black;
    		font-size: 16px;
    		background-color: white;
    		align-content: center;

}
        }

        #product > .view > .info > .summary .count > .plus_btn {
        	width: 16px;
            left: 300px;
            top: 0;
            background-position: 74px 200px;
            border: 1px solid #ececec;
            color: black;
            font-size: 16px;
    		background-color: red;
    		align-content: center;
        }


        #product > .view > .info > .information .total {
            overflow: hidden;
            margin-top: 16px;
        }

        #product > .view > .info > .information .total > span {
            float: right;
            display: inline-block;
            line-height: 38px;
            font-size: 24px;
            font-weight: bold;
            color: #000;
            text-align: right;
            letter-spacing: -0.5px;
        }

        #product > .view > .info > .information .total > span::after { content: "원";}

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

        #product > .view > .info > .information .button {
            overflow: hidden;
            margin-top: 16px;
        }

        #product > .view > .info > .information .button > form > input {
            float: left;
            width: 49%;
            height: 50px;
            margin: 2px;
            font-size: 20px;
            font-weight: bold;
            border-radius: 2px;
            cursor: pointer;
        }

        #product > .view > .info > .information .button  .cart {
            background: #fff;
            border: 1px solid #d9d9d9;
            color: #233594;
        }

        #product > .view > .info > .information .button > form >.order {
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
            font-size: 0px;;
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
	
	
	.bold {
		font-weight: bold;
		font-size: large;
	}
	.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}
	
	
    </style>
</head>
<body>
<script>
	const drawStar = (target) => {
	    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
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
	function cartInsert(){
		location.href = "cart_insert.jsp?goodsNum="+${vo.goodsNum};
	}
	
/* 	function reviewWrite(){
		let id = $(".id").val();
		if (id == null) {
			alert("회원만 작성 가능합니다.");
		} else {
			location.href='reviewWrite.jsp';	
		}
		 */

	}
	
	
	$(document).ready(function(){
		
	let quantity = $(".quan_btn").val();
	
	// 수량 버튼 조작
	$(".plus_btn").on("click", function(){
		$(".quan_btn").val(++quantity);
	});
	
	$(".minus_btn").on("click", function(){
		if(quantity > 1) {
			$(".quan_btn").val(--quantity);
		}
	});
	


</script>
    <div id="wrapper">
        	<%@ include file="common/userHeader.jspf" %>
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
            <section class="view">
                <article class="info">
                    <div class="image">
                        <img src="images/${goodsVO.goodsImg }" alt="상품이미지">
                    </div>
                    <div class="information">
                        <nav>
                            <h2>
                                상품번호 : 
                                <span>${goodsVO.goodsNum }</span>
                            </h2>
                        </nav>
                        <nav>
                            <h3>${goodsVO.goodsName}</h3>
                            <p>${goodsVO.goodsCont}</p>
                            <h5>
                                ★★★☆☆ <a href="review.jsp?goodsnum=+${goodsVO.goodsNum }">상품평보기</a>
                            </h5>
                        </nav>
                        <nav>
                            <div class="org_price">
                                <del>${goodsVO.goodsPrice}%</del>
                            <fmt:parseNumber var="percent" integerOnly = "true" value="${(goodsVO.goodsPrice - goodsVO.goodsSale) * 100 / goodsVO.goodsPrice}" />
                                <span>${percent}%</span>
                            </div>
                            <div class="dis_price">
                                <ins>${goodsVO.goodsSale}</ins>
                            </div>
                        </nav>
                        <nav>
                            <span class="delivery">무료배송</span>
                            <span class="arrival">모레(금) 7/8 도착예정</span>
                            <span class="desc">본 상품은 국내배송만 가능합니다.</span>
                        </nav>
                        <nav>
                            <span class="card cardfree">
                                <i>아이콘</i>무이자할부
                            </span>
                            <span class="card cardadd">
                                <i>아이콘</i>&nbsp&nbsp카드추가혜택
                            </span>
                        </nav>
                        <nav>
                            <span class="origin">원산지-상세설명 참조</span>
                        </nav>
                        <div class="total">
                            <span>${goodsVO.goodsSale}</span>
                            <em>총 상품금액</em>
                        </div>
                        <div class="button">
                        	<form action="cart_insert.jsp">
                            <input type="hidden" name="goodsNum" value="${goodsVO.goodsNum}">
                            <input type="submit" class="cart" value="장바구니 담기">
                            </form>
                        </div>
                    </div>
                </article>
                <article class="detail">
                    <nav><h1>상품정보</h1></nav>
                    <img src="images/${goodsVO.goodsImg }" alt="상세페이지1">
                </article>
                <article class="notice">
                    <nav>
                        <h1>상품 정보 제공 고시</h1>
                        <p>[전자상거래에 관한 상품정보 제공에 관한 고시] 항목에 의거 등록된 정보입니다.</p>
                    </nav>
                    <table>
                        <tr>
                            <td>상품번호</td>
                            <td>11111111111</td>
                        </tr>
                        <tr>
                            <td>상품상태</td>
                            <td>새상품</td>
                        </tr>
                        <tr>
                            <td>부가세 면세여부</td>
                            <td>과세상품</td>
                        </tr>
                        <tr>
                            <td>영수증발행</td>
                            <td>발행가능 - 신용카드 전표, 온라인 현금영수증</td>
                        </tr>
                        <tr>
                            <td>사업자구분</td>
                            <td>사업자 판매자</td>
                        </tr>
                        <tr>
                            <td>브랜드</td>
                            <td>블루포스</td>
                        </tr>
                        <tr>
                            <td>원산지</td>
                            <td>국내생산</td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>제품소재</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>색상</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>치수</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>제소사/수입국</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>제조국</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>취급시 주의사항</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>제조연월</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>품질보증기준</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>A/S 책임자와 전화번호</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>주문후 예상 배송기간</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                구매, 교환, 반품, 배송, 설치 등과 관련하여 추가비용, 제한조건 등의 특이사항이 있는 경우
                            </td>
                        </tr>
                    </table>
                    <p class="notice">
                        소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 제1항 또는 제3항에 따라 청약철회를 하고
                        동법 제 18조 제1항 에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구 하고 결제 대금의
                        환급이 3영업일을 넘게 지연된 경우, 소비자 는 전자상거래등에서 소비자보호에 관한 법률 제18조
                        제2항 및 동법 시행령 제21조 2에 따라 지연일수에 대하여 전상법 시행령으로 정하는 이율을 곱하여
                        산정한 지연이자(“지연배상금”)를 신청할 수 있습니다. 아울러, 교환∙반품∙보증 및 결제대금의
                        환급신청은 [나의쇼핑정보]에서 하실 수 있으며, 자세한 문의는 개별 판매자에게 연락하여 주시기 바랍니다.
                    </p>
                </article>
                <article class="review">
                    <nav><h1>상품리뷰</h1></nav>
                    <ul>
                     <c:forEach var="list" items="${reviewList }">
                        <li>
                            <div>
                            <div class="star-ratings">
                            <c:if test="${list.reviewStar == 5 }">
							<div class="star-ratings-fill space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
							</c:if>
							<c:if test="${list.reviewStar == 4 }">
							<div class="star-ratings-fill space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
							</c:if>
							<c:if test="${list.reviewStar == 3 }">
							<div class="star-ratings-fill space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span>
							</div>
							</c:if>
							<c:if test="${list.reviewStar == 2 }">
							<div class="star-ratings-fill space-x-2 text-lg">
								<span>★</span><span>★</span>
							</div>
							</c:if>
							<c:if test="${list.reviewStar == 1 }">
							<div class="star-ratings-fill space-x-2 text-lg">
								<span>★</span>
							</div>
							</c:if>
						</div>
							 <span>${list.id } ${list.reviewDate }</span>
                            </div>
                            <a class="bold">${goodsVO.goodsName }</a>
                            <p> ${list.reviewCont }</p>
                        </li>
                        </c:forEach>
                    </ul>
                    <div class="paging">
                        <span class="prev">
                        	<%-- [이전으로]에 대한 사용가능 여부 처리 --%>
							<c:if test="${pvo.beginPage == 1 }">
								<a class="disable">이전으로</a>
							</c:if>	
							<c:if test="${pvo.beginPage != 1 }">
								<a href="goodsDetail.jsp?cPage=${pvo.beginPage - 1 }&goodsNum=${goodsVO.goodsNum}">이전으로</a>
							</c:if>	
                        </span>
                        <span class="num">
                           <c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
							<c:if test="${pageNo == pvo.nowPage}">
								<a class="on">${pageNo }</a>
							</c:if>
							<c:if test="${pageNo != pvo.nowPage}">
								<a href="goodsDetail.jsp?cPage=${pageNo }&goodsNum=${goodsVO.goodsNum}">${pageNo }</a>
							</c:if>
						
						   </c:forEach>
                        </span>
                        <span class="next">
                           <c:if test="${pvo.endPage < pvo.totalPage }">
								<a href="goodsDetail.jsp?cPage=${pvo.endPage + 1 }&goodsNum=${goodsVO.goodsNum}">다음으로</a>
							</c:if>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<a class="disable">다음으로</a>
							</c:if>
                        </span>
                        <input type="button" value="글쓰기" onclick="location.href='reviewWrite.jsp'">
                        <%-- <input type="hidden" value="<%=id%>" class="id" name="id"> --%>
                    </div>
                </article>
            </section>
        </main>
		<%@ include file="common/userFooter.jspf" %>
        <button type="button" id="top">상단이동</button>
    </div>
</body>
</html>