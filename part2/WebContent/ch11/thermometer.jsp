<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch11.Thermometer" %>    
<%
	Thermometer thermometer = new Thermometer();
	request.setAttribute("t", thermometer);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온도 변환 예제</title>
</head>
<body>
${t.setCelsius('서울', 27.3)}
서울의 온도 : 섭씨 ${t.getCelsius('서울')}도 / 화씨 ${t.getFahrenheit('서울')}도
<br>
<br>
정보: ${t.info} 
</body>
</html>