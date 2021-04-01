<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Connection Test</title>
</head>
<body>
	<%
		try(Connection conn = ConnectionProvider.getConnection()){
			out.println("연결성공");
		}catch(SQLException ex){
			out.println("커넥션 연결실패 : " + ex.getMessage());
			application.log("커넥션 연결실패", ex);
		}
	%>
</body>
</html>