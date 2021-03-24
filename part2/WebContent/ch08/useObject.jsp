<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="ch08.member.MemberInfo" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사말</title>
</head>
<body>
<%=member.getId() %> <%=member.getName() %> 회원님 반갑습니다.
</body>
</html>