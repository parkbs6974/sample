<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
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
                    <h1> 회원가입</h1>
                </nav>
                <form method="post" name="allCheck" >
                    <section>
                        <table>
                            <caption>필수 정보입력</caption>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    아이디
                                </th>
                                <td>
                                <form name="idChk">
                                    <input id="id" type="text" name="id" placeholder="아이디 입력" maxlength="30" required>
                                	<input type="button" class="checkId" onclick="idChk(idChk)" value="중복 확인" > 
                                	<!-- 아이디 중복 체크 여부 -->
									<input type="hidden" name="idDuplication" value="inUncheck" />
                                </form>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    비밀번호
                                </th>
                                <td>
                                    <input type="password" class="pwd" name="pw" id="pw1" placeholder="비밀번호 입력" required  maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    비밀번호확인
                                </th>
                                <td>
                                    <input type="password" class="pwd" name="pw" id="pw2" placeholder="비밀번호 확인" required  maxlength="50">
                                    <span class="msgPass">&nbsp;&nbsp;비밀번호 재입력</span>
                                </td>
                            </tr>
                        </table>
                    </section>
                    <section>
                        <table>
                            <caption>회원정보 입력</caption>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    이름
                                </th>
                                <td>
                                    <input type="text" name="name" placeholder="이름(닉네임) 입력" required  maxlength="20">
                                    <span class="memberName">&nbsp;&nbsp;</span>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    전화번호
                                </th>
                                <td>
                                    <input type="text" name="phone" placeholder="전화번호 입력" required maxlength="20">
                                    <span class="phone"> &nbsp;&nbsp;  -포함 13자리를 입력하세요. 예) 010-1111-1111</span>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>
                                    이메일
                                </th>
                                <td>
                                    <input type="email" name="email" placeholder="이메일 입력"  maxlength="50">
                                </td>
                            </tr>
                            <tr class="addr">
                                <th>주소</th>
                                <td>
                                    <div>
                                        <input type="text" name="address" id="addr1" size="50" placeholder="주소 입력" maxlength="50">
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </section>
                    <div>
                        <input name="idCheck" type="button" class="join" value="회원가입" onclick="javascript:joinOk(allCheck)">
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
		$("input[name='idCheck']").val("확인");
	}
	
    $('.pwd').focusout(function () {
        var pwd1 = $("#pw1").val();
        var pwd2 = $("#pw2").val();
  
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
                location.href="join.jsp?=" +pwd1val;
            }
        }
       
    });
	
	function joinOk(frm) {
		if ($("input[name='idCheck']").val()!="확인") {
			alert("아이디 체크를 해주세요.");
			frm.action="history.back()";
		}  else {
			frm.action="joinOk.jsp";
			frm.submit();
		}
	}

    
	
	/* function pwChk(frm){
		let pw1 = $("#pw1").val();
		let pw2 = $("#pw2").val();
		if(pw1.equals(pw2)){
			location.href="idcheckForm.jsp?id=" +idval;
		} else{
			alert("비밀번호가 일치하지 않습니다.");
			history.back();
		}
	} */
</script>
</html>
