<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09.util.Cookies" %>
<%
	response.addCookie(Cookies.createCookie("name", "가나다"));
	response.addCookie(Cookies.createCookie("id", "ABCD", "ch09", -1));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookies 사용 예 - cookie 생성</title>
</head>
<body>

Cookies를 사용해서 쿠키 생성하기

</body>
</html>