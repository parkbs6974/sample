<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <%
    String id = (String) session.getAttribute("id");
	String pw = (String) session.getAttribute("pw");
	String name = (String) session.getAttribute("name");
    session.getAttribute("rvo");
    session.getAttribute("list");
    %>
    <html>

    <head>
            <meta charset="UTF-8">
            <title>으르르 쇼핑몰</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
            <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
            <link rel="stylesheet"
                href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
            <link rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
            <link rel="stylesheet" href="css/common.css">
            <link rel="stylesheet" href="css/product.css">
            <link rel="stylesheet" href="css/writeQna.css">
            <style>
      .on {
            display: inline-block;
           min-width: 80px;
           margin-left: 10px;
           padding: 10px;
           border: 1px solid #000;
           border-radius: 2px;
           font-size: 1.4rem;
               background: #000;
              color: #fff;
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
                <section class="#">
                
                <form action="reviewUpdateOk.jsp" method="post" enctype="multipart/form-data">
                    <div class="board_wrap">
                        <div class="board_title">
                            <strong>제품 리뷰</strong>
                            
                        </div>
                        <div class="board_write_wrap">
                            <div class="board_write">
                                <div class="title">
                                    <dt>제목</dt>
                                <input type="text" placeholder="제목을 입렵바랍니다" name="reviewTitle" value="${rvo.reviewTitle }">
                                </div>
                                <div class="info">
                                    <dl>
                                        <dt>글쓴이 : </dt>
                                        <dd><input type="text"  name="id" value="${rvo.id }"></dd>
                                    </dl>
                                    <dl>
                                        <dt>별점</dt>
                                        <dd><input type="number" placeholder="5점 만점입니다" name="reviewStar" max="5"value="${rvo.reviewStar }"></dd>
                                    </dl>
                                    <dl>
                                        <dt>비밀번호</dt>
                                        <dd><input type="text" placeholder="비밀번호 입력바랍니다" name="reviewPw" value="${rvo.reviewPw }"></dd>
                                    </dl>
                                </div>
                                <div class="cont">
                                    <textarea placeholder="내용 입력" name="reviewCont">${rvo.reviewCont }</textarea>
                                </div>
                            </div>
                            </fieldset>
                            <p>파일1 : <input type="file" name="newReviewFile" value="${rvo.id }"></p>
                            <div class="bt_wrap">
                               <input type="submit" class="on" value="업데이트">
                               <input type="hidden" name="reviewNum" value="${rvo.reviewNum}" />
                                <a href="reviewDelete.jsp" class="on">삭제</a>
                                <a href="reviewMain.jsp">취소</a>
                            </div>
                        </div>
                    </div>
            </form>
            
            
                </section>
            </main>
			<%@ include file="common/userFooter.jspf" %>
            <div style="position:fixed; bottom:35px; right:30px; z-index:99;">
                <a href="#doz_header" class="btn_gotop">
                    <img src="images/top.jpg" style="width:80px">
                </a>
            </div>
            <script>
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 300) {
                        $('.btn_gotop').show();
                    } else {
                        $('.btn_gotop').hide();
                    }
                });
                $('.btn_gotop').click(function () {
                    $('html, body').animate({ scrollTop: 0 }, 400);
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
            	function cartInsert(){
            		location.href = "cart_insert.jsp?goodsNum="+${vo.goodsNum};
            	}
            </script>
    </body>

    </html>