<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>적립금충전</title>
    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
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
                    <h1> 적립금 충전</h1>
                </nav>
                <form action="balance_ok.jsp" method="post">
                    <section>
                        <table>
                            <caption>카드정보 입력</caption>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    카드번호
                                </th>
                                <td>
                                <form name="idChk">
                                    <input id="id" type="text" name="cardNum1" placeholder="4자리 숫자입력" maxlength="4" pattern="\d*" required> - 
                                    <input id="id" type="text" name="cardNum2" placeholder="4자리 숫자입력" maxlength="4" pattern="\d*" required> - 
                                    <input id="id" type="password" name="cardNum3" placeholder="4자리 숫자입력" maxlength="4" required>
                                </form>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                   	유효기간
                                </th>
                                <td>
                                    <input type="date" name="date" placeholder="유효기간 입력" required>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                   	cvc
                                </th>
                                <td>
                                    <input type="text" name="cvc" placeholder="cvc 입력" required pattern="\d*" maxlength="3">
                                </td>
                                
                            </tr>
                            <tr>
                            	<th>
                                    <span class="essential">*</span>
                                   	적립금 금액
                                </th>
                            	<td>
                                    <input type="number" name="balance" placeholder="적립금 금액입력" required>
                                </td>
                            </tr>
                        </table>
                    </section>
                    
                    <div>
                        <input type="submit" class="join" value="충전하기">
                    </div>
                </form>
            </div>
        </main>
       <%@ include file="common/userFooter.jspf" %>
    </div>
</body>
<script>
	function idChk(frm){
		let idval = $("#id").val();
		location.href="idcheckForm.jsp?id=" +idval;
		
	}
</script>
</html>
