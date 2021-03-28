<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select 태그 사용</title>
</head>
<body>
<tf:select name="code" rgb="RGB모드" wb="흑백모드" night="야간모드"/>
<tf:select name="genre" rock="락" ballad="발라드" hiphop="힙합"/>
</body>
</html>