<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMBER테이블에 레코드 삽입하기</title>
</head>
<body>
<form action="/ch14/insert/insert.jsp" method="post">
	<table border="1">
		<tr>
			<td>ID</td>
			<td><input type="text" name="memberID" size="10"></td>
			<td>PASSWORD</td>
			<td><input type="password" name="password" size="10"></td>
		</tr>
		<tr>
			<td>NAME</td>
			<td><input type="text" name="name" size="10"></td>
			<td>EMAIL</td>
			<td><input type="text" name="email" size="10"></td>
		</tr>
		<tr>
			<td colspan="4"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>
</body>
</html>