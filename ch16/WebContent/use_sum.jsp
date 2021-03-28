<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sum 태그 사용</title>
</head>
<body>
<tf:sum end="10" begin="1">
	1-10까지의 합 : ${sum}
</tf:sum>
</body>
</html>