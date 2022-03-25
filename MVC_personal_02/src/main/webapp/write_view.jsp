<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="write.do">
		<table border="1">
			<tr>
				<td align="right">이름 : </td>
				<td><input type = "text" name = "pName"></td>
			</tr>
			<tr>
				<td align="right">전화번호 : </td>
				<td><input type = "text" name = "pTel"></td>
			</tr>
			<tr>
				<td align="right">주소 : </td>
				<td><input type = "text" name = "pAddress"></td>
			</tr>
			<tr>
				<td align="right">전자우편 : </td>
				<td><input type = "text" name = "pEmail"></td>
			</tr>
			<tr>
				<td align="right">관계 : </td>
				<td><input type = "text" name = "pRel"></td>
			</tr>
			<tr rowspan="2">
				<td><input type="submit" value="등록"></td>
			</tr>
		</table>
	
	</form>
</body>
</html>