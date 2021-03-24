<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	
	if(id.equals(pwd)){
		session.setAttribute("MEMBERID", id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
로그인 성공
</body>
</html>
<%}else{%>
<script>
	alert("로그인 실패")
	history.go(-1);
</script>
<%}%>