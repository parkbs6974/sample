<%@page import="com.mystudy.ajax.vo.UsersVO"%>
<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:useBean id="vo" class="com.mystudy.ajax.vo.UsersVO" scope="session"/> --%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	System.out.println(id +", " + pw);
	System.out.println(UsersDAO.userLogin(id, pw));
	UsersVO vo = UsersDAO.userLogin(id, pw);
/* 	pageContext.setAttribute("vo", UsersDAO.userLogin(id, pw)); */

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/join.css">
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <%@ include file="common/userHeader.jspf" %>
        <main id="member">
            <div class="registerSeller">
                <nav>
                    <h1>회원정보 수정</h1>
                </nav>
                <form action="modifyMemberOk.jsp" method="post">
                        <table>
                            <caption>회원정보</caption>

                            <tr>
                                <th>
                                    <span class="essential"></span>
                                    아이디
                                </th>
                                <td>
                                    <input type="text" name="id" placeholder="아이디 입력" value="<%=vo.getId() %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential"></span>
                                    비밀번호
                                </th>
                                <td>
                                    <input type="password" name="pw" placeholder="비밀번호 입력" value="<%=vo.getPw() %>" >
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    이름
                                </th>
                                <td>
                                    <input type="text" name="name" placeholder="이름(닉네임)" value="<%=vo.getName() %>">
                                    <span class="memberName">&nbsp;&nbsp;</span>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    전화번호
                                </th>
                                <td>
                                    <input type="text" name="phone" placeholder="전화번호 입력" value="<%=vo.getPhone() %>">
                                    <span class="phone"> &nbsp;&nbsp;</span>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    이메일
                                </th>
                                <td>
                                    <input type="email" name="email" placeholder="이메일 입력" value="<%=vo.getEmail() %>">
                                </td>
                            </tr>
                            <tr class="addr">
                                <th>주소</th>
                                <td>
                                    <div>
                                        <input type="text" name="address" id="addr1" size="50" placeholder="주소 입력" value="<%=vo.getAddress() %>">
                                    </div>
                                </td>
                            </tr>
                        </table>
                    <div>
                        <input type="submit" class="join" value="회원정보 수정">
                    </div>
                </form>
            </div>
        </main>
        <%@ include file="common/userFooter.jspf" %>
    </div>
</body>
</html>