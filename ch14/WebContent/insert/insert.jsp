<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>    
<%@ page import="java.sql.Connection" %>    
<%@ page import="java.sql.PreparedStatement" %>    
<%@ page import="java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");

	String memberID = request.getParameter("memberID");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/ch14?useUnicode=true&characterEncoding=utf8";
		String dbId = "jspexam";
		String dbPwd = "jsppw";
		
		conn = DriverManager.getConnection(jdbcDriver, dbId, dbPwd);
		pstmt = conn.prepareStatement("insert into MEMBER values(?,?,?,?)");
		pstmt.setString(1, memberID);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		
		pstmt.executeUpdate();
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
	
			
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 삽입</title>
</head>
<body>
MEMBER 테이블에 새로운 레코드를 성공적으로 삽입했습니다.
</body>
</html>