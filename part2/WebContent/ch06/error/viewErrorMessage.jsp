<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 발생</title>
</head>
<body>
해당 요청 처리과정에서 문제가 발생했습니다. <br>
빠른 시간 내 처리하겠습니다. 
<p>
에러 타입 : <%=exception.getClass().getName() %><br>
에러 메시지 : <b><%=exception.getMessage() %></b>
</body>
</html>