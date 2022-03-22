<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
	
	<h3>입력에 성공하셨습니다.</h3>
	id : ${param.id}<br>	
	pw : ${param.pw}<br>	
	
</body>
</html>