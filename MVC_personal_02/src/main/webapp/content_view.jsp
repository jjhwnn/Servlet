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
		<table border="1">
			<tr>
				<td align="right">번호 : </td>
				<td><input type = "text" name = "pId" value="${content_view.pId }" readonly="readonly"></td>
			</tr>
			<tr>
				<td align="right">이름 : </td>
				<td><input type = "text" name = "pName" value="${content_view.pName }"></td>
			</tr>
			<tr>
				<td align="right">전화번호 : </td>
				<td><input type = "text" name = "pTel" value="${content_view.pTel }"></td>
			</tr>
			<tr>
				<td align="right">주소 : </td>
				<td><input type = "text" name = "pAddress" value="${content_view.pAddress }"></td>
			</tr>
			<tr>
				<td align="right">전자우편 : </td>
				<td><input type = "text" name = "pEmail" value="${content_view.pEmail }"></td>
			</tr>
			<tr>
				<td align="right">관계 : </td>
				<td><input type = "text" name = "pRel" value="${content_view.pRel }"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="수정">
				<button><a href="delete.do?pId=${content_view.pId }">삭제</a></button>
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>