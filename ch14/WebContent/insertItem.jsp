<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>    
<%@ page import="java.sql.Connection" %>    
<%@ page import="java.sql.PreparedStatement" %>    
<%@ page import="java.sql.SQLException" %>
<%
	String idValue = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmtItem = null;
	PreparedStatement pstmtDetail = null;
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/ch14?useUnicode=true&characterEncoding=utf8";
	String dbId = "jspexam";
	String dbPwd = "jsppw";
	
	Throwable occuredException = null;
	
	try{
		int id = Integer.parseInt(idValue);
		
		conn = DriverManager.getConnection(jdbcDriver, dbId, dbPwd);
		conn.setAutoCommit(false); // 트랜잭션 처리를 위해서 autoCommit을 false로
		
		pstmtItem = conn.prepareStatement("insert into ITEM values(?,?)");
		pstmtItem.setInt(1,id);
		pstmtItem.setString(2, "상품이름 "+ id);
		pstmtItem.executeUpdate();
		
		if(request.getParameter("error") != null){
			throw new Exception("의도적 예외 발생");
		}
		
		pstmtDetail = conn.prepareStatement("insert into ITEM_DETAIL values(?,?)");
		pstmtDetail.setInt(1, id);
		pstmtDetail.setString(2, "제품 상세설명 " + id);
		pstmtDetail.executeUpdate();
		
		conn.commit();
		
	}catch(Throwable e){
		if(conn!=null){
			try{
				conn.rollback();
			}catch(SQLException ex){}
		}
		occuredException = e;
	}finally{
		if(pstmtItem != null)
			try{pstmtItem.close();}catch(SQLException ex){}
		if(pstmtDetail != null)
			try{pstmtDetail.close();}catch(SQLException ex){}
		if(conn != null)
			try{conn.close();}catch(SQLException ex){}
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item 값 입력</title>
</head>
<body>
<%if(occuredException != null){ %>
에러 발생 : <%=occuredException.getMessage() %>
<%}else{ %>
데이터 입력 완료
<%} %>
</body>
</html>