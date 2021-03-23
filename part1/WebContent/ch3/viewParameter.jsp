<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
<b>request.getParameter()메소드 사용</b><br>
name파라미터 = <%=request.getParameter("name") %>
address파라미터 = <%=request.getParameter("address") %>
<br><br>
<b>request.getParameterValues()메소드 사용</b><br>
<%
	String[] values = request.getParameterValues("pet");
	if(values != null){
		for(int i = 0; i < values.length; i++){
%>
<%=values[i] %>

<%			
		}
	}
%>
<br>
<p>
<b>request.getParameterNames()메소드 사용</b><br>
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()){
		String name = (String)paramEnum.nextElement();
%>
<%=name %>
<%		
	}
%>
<br>
<p>
<b>request.getParameterMap()메소드 사용</b><br>
<%
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[])parameterMap.get("name");
	if(nameParam != null){
%>
name = <%=nameParam[0] %>
<%} %>
</body>
</html>