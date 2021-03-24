<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("oneh", "1time");
	cookie.setMaxAge(60*60);
	response.addCookie(cookie);
	// 쿠키의 유효시간을 1달정도로 여유롭게 잡고 접속시 아이디 쿠키가 존재하면 쿠키값을 로그인 폼에 출력해서 아이디 기억하기 기능을 구현할 수도 있다.
	// 로그인 정보를 쿠키에 보관하여 자동로그인 기능 또한 구현할 수 있다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 유효시간 설정</title>
</head>
<body>
쿠키이름
<%=cookie.getName() %>의 유효시간은 1시간 (60*60) 

</body>
</html>