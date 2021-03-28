<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더태그 이용하기</title>
</head>
<body>
<tf:header title="텍스트 제목" level="1"/>
<tf:header title="${'EL을 이용한 텍스트 제목'}" level="2"/>
<tf:header title='<%="표현식을 이용한 텍스트 제목" %>' level="3"/>
</body>
</html>