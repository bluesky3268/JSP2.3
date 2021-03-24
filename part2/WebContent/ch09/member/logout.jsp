<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09.util.Cookies" %>
<%
	response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
로그아웃되었습니다. 
</body>
</html>