<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<style>
	.margin{
		display: inline-block;
		margin: 40px 20px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center" class="margin">
	<h3>One Line 게시판</h3>
		<form action="list.do" method="post">
			<table border="1">
				<tr>
					<th>번호</th><th>이름</th><th>제목</th><th>날짜</th><th>삭제</th>
				</tr>
				<c:forEach items="${list }"	var="dto">
					<tr>
						<td>${dto.seq }</td>
						<td>${dto.pName }</td>
						<td><a href="update_view.do?seq=${dto.seq }">${dto.pTitle }</a></td>
						<td>${dto.pDate }</td>
						<td><a href="delete.do?seq=${dto.seq }">X</a></td>
					</tr>
				</c:forEach>
			<tr>
				<td colspan="5" align="center"><a href="write_view.do">글작성</a></td>
			</tr>
				
			</table>
		</form>
	</div>
</body>
</html>