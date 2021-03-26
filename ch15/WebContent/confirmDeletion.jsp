<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 확인하기</title>
</head>
<body>
<form action="deleteMessage.jsp" method="post">
	<input type="hidden" name="messageId" value="${param.messageId}">
	메시지를 입력하려면 비밀번호를 입력하세요<br>
	비밀번호 : <input type="password" name="password"><br>
	<input type="submit" value="삭제하기">
</form>
</body>
</html>