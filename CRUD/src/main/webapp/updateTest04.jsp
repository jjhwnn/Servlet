<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정결과</title>
</head>
<body>
	<h3>수정 결과</h3>
	사용자 ID <%=session.getAttribute("OLD")  %> 에서 ${sessionScope.NEW }로 변경 되었습니다.<br>
	지금까지 이용해주신 여러분께 감사의 인사 드립니다.
		
	<% session.invalidate(); %>


</body>
</html>