<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.service.DeleteMessageService" %>
<%@ page import="guestbook.service.InvalidPasswordException" %>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassword= false;
	try{
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.deleteMessage(messageId, password);
	}catch(InvalidPasswordException ex){
		invalidPassword = true;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 삭제</title>
</head>
<body>
	<% if(!invalidPassword){ %>
	메시지를 성공적으로 삭제하였습니다. 
	<%}else{ %>
	입력한 비밀번호가 올바르지 않습니다. 비밀번호를 다시 확인해 주세요.
	<%} %>
	<br>
	<a href="list.jsp">[목록보기]</a>
</body>
</html>