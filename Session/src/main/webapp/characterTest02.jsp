<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성격 테스트</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String food = request.getParameter("food");
	
	// session객체에 food정보 저장!!!(보통 key값은 대문자로 작성해준다)
	// pc가 아닌 서버상에 저장해준다
	// session은 Encoding과 Decoding을 모두 지원해줌
	session.setAttribute("FOOD", food);
%>
	<h2>좋아하는 동물은?</h2>
	<form action="characterTest03.jsp" method="get">
		<input type="text" name="animal">
		<br>
		<br>
		<input type="submit" value="확인">
	</form>
	
	
</body>
</html>