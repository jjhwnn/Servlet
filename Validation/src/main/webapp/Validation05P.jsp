<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
	아이디 : ${param.id} <br>
	비밀번호 : ${param.pw} <br>
	이름 : ${param.name} <br>
	연락처 : ${param.phone1} - ${param.phone2} - ${param.phone3} <br>  
	이메일 : ${param.email} <br> 
	

</body>
</html>