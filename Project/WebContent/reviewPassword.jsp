<%@page import="com.mystudy.ajax.vo.ReviewVO"%>
<%@page import="com.mystudy.ajax.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	String pw = (String) session.getAttribute("pw");
	String name = (String) session.getAttribute("name");
	int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
	System.out.println("reviewNum : " + reviewNum);
	
	ReviewVO vo = ReviewDAO.searchReviewPw(reviewNum);
	System.out.println("vo" + vo);
	
	session.setAttribute("vo", vo);
	
	
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
    <link rel="stylesheet" href="css/password.css">
    <link rel="stylesheet" href="css/qnaborder.css">
    <style>
    .on{
    padding: 40px 0 10px 0;
    margin: 10;
    padding: 0;
    border: 0;
    font-size: 100%;
    font-weight: inherit;
    vertical-align: baseline;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px 0;
    background-color:blue;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 5px;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s;
    }
    .on:hover {
    background-color: #3e8e41;
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
              

          	<form action="reviewPasswordOk.jsp">
                   <div class="textcenter">
                    <br>
                    <h3 class="pageTile">비밀글보기 </h3>
                    <fieldset>
                        <legend>비밀번호 입력</legend>
                        <p class="info">이 글은 비밀글입니다. <strong>비밀번호를 입력하여 주세요</strong>.</p>
                        <br>
                        <p>
                            <input type="password" id="sercure_password" name="pwd">
                        </p>
                       <div class="button-wrapper">
                        <a class="button" href="reviewMain.jsp">뒤로가기</a>
                        <input type="hidden" name="reviewNum" value="${vo.reviewNum}" />
                        <input type="submit" class="on" >
                    </div>
                    </fieldset>
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