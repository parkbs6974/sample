<%@page import="java.util.List"%>
<%@page import="com.mystudy.ajax.dao.QnaDAO"%>
<%@page import="com.mystudy.ajax.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	QnaVO vo = (QnaVO)session.getAttribute("qvo");
	
	
	String cPage = request.getParameter("cPage");
	String quesNum =  request.getParameter("quesNum");
	int qNum = Integer.parseInt(quesNum);
	QnaVO qvo = QnaDAO.selectOne(qNum);
	System.out.println(qvo);
	
	List<QnaVO> list = QnaDAO.getCommList(qNum);
	System.out.println("> Comment list : " + list);
	
	session.setAttribute("qvo", qvo); 
	pageContext.setAttribute("c_list", list);
	
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
            <link rel="stylesheet"
                href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
            <link rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
            <link rel="stylesheet" href="css/common.css">
            <link rel="stylesheet" href="css/product.css">
            <link rel="stylesheet" href="css/qnaborder.css">
            <link rel="stylesheet" href="css/writeQna.css">
	<style>
	textarea {
		width: 100%;
		height: 100%;
	}
	.comment {
	  padding: 10px;
	  border: 1px solid #ccc;
	  border-radius: 5px;
	  background-color: #f5f5f5;
	  font-size: 14px;
	  line-height: 1.5;
	}
	
	.comment form {
	  display: inline-block;
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
	<section class="#">
		<div class="board_wrap">
			<div class="board_title">
				<strong>문의 사항</strong>
				<p>문의사항 빠르고 정확하게 안내해드립니다.</p>
			</div>
			<div class="board_view_wrap">
				<div class="board_view">
					<div class="title">배송관련</div>
					<div class="info">
						<dl>
							<dt>번호</dt>
							<dd>${qvo.quesNum }</dd>
						</dl>
						<dl>
							<dt>글쓴이</dt>
                            <dd>${qvo.id }</dd>
                        </dl>
                        <dl>
                            <dt>작성일</dt>
                            <dd>${qvo.queDate }</dd>
                        </dl>
                    </div>
                    <div class="cont">
                                    ${qvo.quesCont }
                                </div>
                                
                                <div class="file">
                                	<dt>첨부파일 : ${qvo.queFile }</dt>
                                	<td>
										<c:if test="${empty qvo.queFile }">첨부파일없음</c:if>
										<c:if test="${not empty qvo.queFile }">
										<a href="download.jsp?filename=${qvo.queFile }">${qvo.queFile }</a>
										</c:if>
									</td>
                                </div>
                            </div>
                            <div class="bt_wrap">
                                <a href="adminQnaMain.jsp" class="on">목록</a>
                             	<a href="qnaDelete.jsp" class="on" onclick="delete_go(this.form)" >삭제</a>
                            </div>
                        </div>
                    </div>
					<script>
						function delete_go(frm) {
							let isDelete = confirm("삭제하시겠습니까?");
							if (isDelete) {
								frm.submit();
							} else {
								history.back();
							}
						}
						function update_go(frm){
							let isUpdate = confirm("수정하기로 이동할까요?");
							if (isUpdate){
								frm.submit();
							} else{
								history.back();
							}
						}
					</script>
					<form action="commWrite.jsp" method="post">
						<div class="card-header bg-light">
						     <i class="fa fa-comment fa"></i> REPLY
						</div>
						<div class="card-body">
							<ul class="list-group list-group-flush">
							    <li class="list-group-item">
								<textarea name="commCont" rows="5"></textarea>
							    </li>
							</ul>
							<input type="submit" value="댓글저장">
							<input type="hidden" name="quesNum" value="${qvo.quesNum }">
						</div>
					</form>
					
					<%-- 게시글에 연결된 댓글 표시(출력) --%>
					<c:forEach var="CommentsVO" items="${c_list }">
					<div class="comment">
						<form action="CommDelete.jsp" method="get">
							관리자: ${CommentsVO.commCont } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성 시간 : ${CommentsVO.commDate } 
							<input type="submit" value="댓글삭제">
							<input type="hidden" name="commNum" value="${CommentsVO.commNum }">
							<input type="hidden" name="quesNum" value="${qvo.quesNum }">
						</form>
					</div>
					</c:forEach>
                </section>
            </main>
            <%@ include file="common/adminFooter.jspf" %>
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
            </script>

    </body>

    </html>