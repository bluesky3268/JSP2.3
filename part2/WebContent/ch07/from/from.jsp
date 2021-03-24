<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>from.jsp 실행결과</title>
</head>
<body>
이 페이지는 from.jsp가 생성한 것입니다. 
jsp:forward 하게 되면 출력되지 않습니다. 

<jsp:forward page="/ch07/to/to.jsp"/>
</body>
</html>