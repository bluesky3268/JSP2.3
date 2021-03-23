<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본객체를 사용하여 자원 읽기</title>
</head>
<body>
<%
	String resourcePath = "ch05/message/notice.txt";
%>
자원의 실제 경로 : <br>
<%=application.getRealPath(resourcePath) %>
<br>
--------------------------------<br>
<%=resourcePath %>의 내용 <br>
--------------------------------<br>
<%


	char[] buff = new char[512];
	int len = -1;
	BufferedReader br = null;
	try{
		br = new BufferedReader(new InputStreamReader(application.getResourceAsStream(resourcePath), "UTF-8"));
		
		while((len = br.read(buff))!= -1){
			out.print(new String(buff, 0, len));
		}
	
	}catch(IOException ex){
		out.println("익셉션 발생 : " + ex.getMessage());
	}finally {
		if(br != null) 
			try{
			br.close();
		}catch(IOException ex){}
	}


	/* char[] buff = new char[512];
	int len = -1;
	
	try(InputStreamReader br = new InputStreamReader(application.getResourceAsStream(resourcePath),"UTF-8")){
		while((len = br.read(buff)) != -1){
			out.print(new String(buff, 0, len));
		}
	}catch(IOException ex){
		out.println("익셉션 발생 : " + ex.getMessage());
	} */
	
%>
</body>
</html>