<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09.util.Cookies" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if(id.equals(password)){// 아이디와 비밀번호가 같으면 로그인하는 것으로 설정
		response.addCookie(Cookies.createCookie("AUTH", id, "/", -1));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
로그인에 성공했습니다.
</body>
</html>
<%}else{%>
<script>
	alert("로그인에 실패했습니다.");
	history.go(-1);
</script>
<%}%>