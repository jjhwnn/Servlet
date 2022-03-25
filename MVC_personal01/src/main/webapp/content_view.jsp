<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<form action="modify.do" method="post">
			이름 : <input type="text" name="pName" value="${content_view.seq }"><br>
			제목 : <input type="text" name="pTitle" value="${content_view.bTitle }"><br>
		</form>
		
	</body>
</html>