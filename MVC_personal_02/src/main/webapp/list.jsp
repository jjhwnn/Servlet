<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>MVC 주소록</h2>
	<form action="search.do">
		검색 : 
			<select name="sel">
				<option value="pName">이름</option>
				<option value="pTel">전화번호</option>
				<option value="pAddress">주소</option>
				<option value="pEmail">이메일</option>
				<option value="pRel">관계</option>
			</select>
			<input type="text" name="search" size="20">
			<input type="submit" value="검색">	
	</form>		

		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>전자우편</th>
				<th>관계</th>
			</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td><a href="content_view.do?pId=${dto.pId }">${dto.pId }</a></td>
					<td>${dto.pName }</td>
					<td>${dto.pTel }</td>
					<td>${dto.pAddress }</td>
					<td>${dto.pEmail }</td>
					<td>${dto.pRel }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6"><a href="write_view.do">주소록 등록</a></td>
			</tr>
		</table>
</body>
</html>