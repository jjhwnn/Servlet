<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 및 삭제</title>
</head>
<body>
	<h2>글 수정 및 삭제</h2>
	<form action="modify.do" method="post">
		<table border="1">
			<tr>
				<td>번호</td>
				<td><input type="text" name="bId" size="5" value="${content_view.bId }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="bName" size="5" value="${content_view.bName }"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" size="50" value="${content_view.bTitle }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="bContent" rows="10" cols="50">${content_view.bContent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
					<button><a href="delete.do?bId=${content_view.bId }">삭제</a></button>
					<button><a href="list.do">처음으로</a></button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>