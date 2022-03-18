<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		이름 : <jsp:getProperty property="name" name="student"/>
		나이 : <jsp:getProperty property="age" name="student"/>
		학년 : <jsp:getProperty property="grade" name="student"/>
		번호 : <jsp:getProperty property="studentNum" name="student"/>
		
		<h1>Java Bean에 저장 되었습니다.</h1>
</body>
</html>