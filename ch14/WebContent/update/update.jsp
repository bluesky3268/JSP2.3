<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException"%>
<%
	request.setCharacterEncoding("utf-8");

	String memberID = request.getParameter("memberId");
	String name = request.getParameter("name");
	
	int updateCount = 0;
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/ch14?useUnicode=true&characterEncodinng=utf8";
		String dbId = "jspexam";
		String dbPwd = "jsppw";
		
		String query = "update MEMBER set NAME = ? where MEMBERID = ?";
		
		conn = DriverManager.getConnection(jdbcDriver, dbId, dbPwd);
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, name);
		pstmt.setString(2, memberID);
		updateCount = pstmt.executeUpdate();
	}finally{
		if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
		if(conn != null)try{conn.close();}catch(SQLException e){}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름 변경</title>
</head>
<body>
<% if(updateCount > 0){ %>
<%=memberID %>의 이름을 <%=name %>으로 변경
<%}else{ %>
<%=memberID %> 아이디가 존재하지 않음
<%} %> 
</body>
</html>