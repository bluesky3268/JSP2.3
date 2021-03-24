<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09.util.Cookies" %>
<%
	Cookies cookies = new Cookies(request);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 여부 확인</title>
</head>
<body>
<%
	if(cookies.exists("AUTH")){
%>
로그인 상태
<%}else { %>
로그인 하지 않은 상태
<%} %>
</body>
</html>