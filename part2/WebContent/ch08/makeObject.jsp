<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request" class="ch08.member.MemberInfo"/>
<%
	member.setId("abc");
	member.setName("abc");
%>
<jsp:forward page="/ch08/useObject.jsp"/>