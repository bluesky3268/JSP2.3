<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // Date객체의 시간 값을 지정한 양식으로 출력하기 위해 SimpleDateFormat객체 생성
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보</title>
</head>
<body>
세션ID : <%=session.getId() %><br>
<% time.setTime(session.getCreationTime()); %> <!-- 세션의생성시간을 Date의 객체의 매개변수인 time에 저장한다. -->
세션생성시간 : <%=formatter.format(time) %><br>
<% time.setTime(session.getLastAccessedTime());  %>
최근접근시간 : <%=formatter.format(time) %>
</body>
</html>