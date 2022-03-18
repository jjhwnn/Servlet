<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 가입 결과</h3>
	
		가입되었습니다.
	<br>
	
	<h2>가입내용</h2>
	
	<br>
	아이디 : <%=session.getAttribute("ID") %><br>
	비밀번호 : <%=session.getAttribute("PW") %><br>
	이름 : <%=session.getAttribute("NAME") %><br>
	
	<%session.invalidate(); %>
</body>
</html>