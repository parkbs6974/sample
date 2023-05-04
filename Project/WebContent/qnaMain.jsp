
<%@page import="com.mystudy.ajax.vo.QnaVO"%>
<%@page import="com.mystudy.ajax.dao.QnaDAO"%>
<%@page import="com.mystudy.common.Paging"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = (String) session.getAttribute("id");
	String pw = (String) session.getAttribute("pw");
	String name = (String) session.getAttribute("name");
	Paging p = new Paging();

	//1. 전체 게시물 수량 구하기
	p.setTotalRecord(QnaDAO.getTotalCount());
	p.setTotalPage();
	
	System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("> 전체 게시글 수 : " + p.getTotalPage());
	
	//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
	p.setEnd(p.getNowPage() * p.getNumPerPage());
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
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
	System.out.println(">> beginPage : " + p.getBeginPage());
	System.out.println(">> endPage : " + p.getEndPage());
	
	//현재 페이지 기준으로 DB 데이터(게시글 가져오기)
	List<QnaVO> list = QnaDAO.getList(p.getBegin(), p.getEnd());
	
	System.out.println("list : " + list);
	
	// 데이터를 화면에 표시(출력)
	pageContext.setAttribute("list", list); //게시글 데이터
	pageContext.setAttribute("pvo", p); //페이지 관련 데이터
	QnaVO sessionQvo = (QnaVO)session.getAttribute("qvo");
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
    <link rel="stylesheet" href="css/qnaborder.css">
    <link rel="stylesheet" href="css/paging.css">
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
                 
	<table>
		<caption>게시글 목록</caption>
		<thead>
			<tr class="title">
				<th class="no">번호</th>
				<th class="subject">제목</th>
				<th class="writer">작성자</th>
				<th class="regdate">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.quesNum } </td>
					<td><a href="qnaPassword.jsp?quesNum=${vo.quesNum }&cPage=${pvo.nowPage}">${vo.quesTitle } </a></td>
					<td>${vo.id }</td>
					<td>${vo.queDate }</td>
				</tr>
			</c:forEach>
			<c:if test="${empty list }">
				<tr>
					<td colspan="4">현재 등록된 글이 없습니다</td>
				</tr>
			</c:if>
		</tbody>
		<tfoot>
			<td colspan="4">
					<ol class="paging">
		      <%-- [이전으로]에 대한 사용가능 여부 처리 --%>
		      <c:if test="${pvo.beginPage == 1 }">
		        <li class="disable">이전으로</li>
		      </c:if>   
		      <c:if test="${pvo.beginPage != 1 }">
		        <li class="paging-item">
		          <a class="paging-link" href="qnaMain.jsp?cPage=${pvo.beginPage -1 }">이전으로</a>
		        </li>
		      </c:if>   
		                    
		      <%--블록내에 표시할 페이지 태그 작성(시작~끝 페이지) --%>   
		      <c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
		        <c:if test="${pageNo == pvo.nowPage}">
		          <li class="paging-item now">${pageNo }</li>
		        </c:if>
		        <c:if test="${pageNo != pvo.nowPage}">
		          <li class="paging-item"><a class="paging-link" href="qnaMain.jsp?cPage=${pageNo }">${pageNo }</a></li>
		        </c:if>
		      </c:forEach>
		                    
		      <%-- [다음으로]에 대한 사용가능 여부 처리 --%>
		      <c:if test="${pvo.endPage < pvo.totalPage }">
		        <li class="paging-item">
		          <a class="paging-link" href="qnaMain.jsp?cPage=${pvo.endPage + 1 }">다음으로</a>
		        </li>
		      </c:if>
		      <c:if test="${pvo.endPage >= pvo.totalPage }">
		        <li class="disable">다음으로</li>
		      </c:if>
		    </ol>
				</td>
				
		</tfoot>
	</table>
		<div class="search">
              <div>
	        <form action="qnaSearch" method="post">
	        작성자<input type="text" name="id">
	        <input type="submit" value="작성자로 검색">
	        <input type="button" value="QnA작성" onclick="location.href='qnaInsert.jsp'">
	        </form>
	         </div> 
          	
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