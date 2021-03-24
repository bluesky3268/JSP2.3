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
<title>Cookies 사용 예 - cookie 읽기</title>
</head>
<body>
name쿠키 = <%=cookies.getValue("name") %><br>
<%if(cookies.exists("id")){ %>
id쿠키 = <%=cookies.getValue("id") %><br>
<%} %>
</body>
</html>