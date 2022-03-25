<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>One Line 게시판</h3>
		<form action="write.do" method="post">
			이름 : <input type="text" name="pName" size="20"><br>
			제목 : <input type="text" name="pTitle" size="20"><br>
			<input type="submit" value="입력">
			<a href="list.do">목록보기</a>
		</form>

</body>
</html>