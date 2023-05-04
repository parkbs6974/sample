<%@page import="com.mystudy.ajax.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	System.out.println("id : " + id);
	String idCheck = UsersDAO.idChk(id);
	System.out.println(idCheck);
	if(id.length()!= 0  && idCheck == null ) {
		%>
<script>		
		alert("사용할 수 있는 ID입니다.");
		history.back();
</script>	
<%	
	return;

	} else {
		
%>
<script>		
		alert("사용할 수 없는 ID입니다.");
		history.back();
</script>	
<%			
	
	return;
	
	}
	

%>