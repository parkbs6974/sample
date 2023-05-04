<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
   	session.getAttribute("list");
	session.getAttribute("goodsVO");
	session.getAttribute("reviewList");
	String id = (String) session.getAttribute("id");
	String pw = (String) session.getAttribute("pw");
	String name = (String) session.getAttribute("name");
	
	if (id == null ) {
		%> 
		<script>
		alert("회원만 작성 가능합니다.");
		history.back();
		</script>
		<%
	return;}
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
 <script src="common/menu.js"></script>
 <script>
	 let chk = "${chk }";
		if(chk == "null"){
			alert("입력정보없음, 다시입력하세요");
		}
 </script>
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
                <form action="reviewWriteOk.jsp" method="post" enctype="multipart/form-data">
                    <div class="board_wrap">
                        <div class="board_title">
                            <strong>제품 리뷰</strong>
                        </div>
                        
                        
                        
                        <div class="board_write_wrap">
                            <div class="board_write">
                                <div class="title">
                     			   <dl>
                                        <dt>카테고리</dt>
                                        <select name="goodsMenu" id="">
                                            <option value="${goodsVO.goodsMenu }">
                                           	 <c:if test="${goodsVO.goodsMenu == 'walk' }">산책용품</c:if>
                                           	 <c:if test="${goodsVO.goodsMenu == 'toy' }">장난감</c:if>
                                           	 <c:if test="${goodsVO.goodsMenu == 'shower' }">샤워용품</c:if>
                                           	 <c:if test="${goodsVO.goodsMenu == 'food' }">간식</c:if>
                                            </option>
                                        </select>
                                    </dl>
                                    <dl>
                                        <dt>제품</dt>
                                        <select name="goodsNum" id="">
                                            <option value="${goodsVO.goodsNum }">${goodsVO.goodsName }</option>
                                        </select>
                                        <dl>
                                    <dt>제목</dt>
                                <input type="text" placeholder="제목을 입력바랍니다" name="reviewTitle" >
                                </dl>
                                </div>
                                <div class="info">
                                    <dl>
                                    <c:forEach var="list1" items="${reviewList }">
                                    <c:set var="list2" value="${list1.id }"></c:set>
                                    </c:forEach>
                                        <dt>글쓴이 : </dt>
                                        <dd><input type="text" name="id" value="${id}" readonly="readonly"></dd>
                                    </dl>
                                    <dl>
                                        <dt>별점</dt>
                                        <dd><input type="number" placeholder="5점 만점입니다" name="reviewStar" max="5"></dd>
                                    </dl>
                                    <dl>
                                        <dt>비밀번호</dt>
                                        <dd><input type="password" placeholder="비밀번호 입력바랍니다" name="reviewPw"></dd>
                                    </dl>
                                </div>
                                <div class="cont">
                                    <textarea placeholder="내용 입력" name="reviewCont"></textarea>
                                </div>
                            </div>
                            </fieldset>
                            <p>파일1 : <input type="file" name="reviewFile"></p>
                            <div class="bt_wrap">
                               <input type="submit" class="on" value="제출하기">
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
                const reviewStar = document.getElementById("reviewStar");

                reviewStar.checkStar("score", function() {
                  const value = parseInt(reviewStar.value);
                  if (isNaN(value) || value < 1 || value > 5) {
                    alert("별점은 1에서 5까지의 숫자만 입력바랍니다.");
                    input.value = "";
                    input.focus();
                  }
                });
                
                const form = document.querySelector("form");

                form.addEventListener("submit", function(event) {
                  const id = document.querySelector("input[name='id']").value.trim();
                  const pw = document.querySelector("input[name='reviewPw']").value.trim();
                  const star = document.querySelector("input[name='reviewPw']").value.trim();
                  const content = document.querySelector("textarea[name='reviewCont']").value.trim();

                  if (id === "" || pw === "" || content === "") {
                    alert("모든 필드를 입력해야 합니다.");
                    event.preventDefault();
                  }
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