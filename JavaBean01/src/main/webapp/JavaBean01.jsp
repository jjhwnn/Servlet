<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--id : 인스턴스명 --%>
<jsp:useBean id="student" class="com.javalecs.base.Student" scope="request" />

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty property="name" name="student" value="홍길동"/>
	<jsp:setProperty property="age" name="student" value="13"/>
	<jsp:setProperty property="grade" name="student" value="6"/>
	<jsp:setProperty property="studentNum" name="student" value="10"/>
	
	<jsp:forward page="JavaBean02.jsp" />
</body>
</html>