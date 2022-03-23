<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력창</title>
</head>
<body>
	
	<% 
		String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
		String id_mysql = "root";
		String pw_mysql = "qwer1234";
		
		String query = "select userid, name, tel, address, insertdate from  addressBook";
	%>
	
	<h3>아래의 항목을 입력후 확인 버튼을 누르세요.</h3>
	
	<form action="AB02_1.jsp" method="post">
		<table>
				<tr>
					<td align="right">성명</td>
					<td> <input type="text" name="name" size="10"></td>
				</tr>
				<tr>
					<td align="right">전화번호</td>
					<td> <input type="text" name="tel" size="20"></td>
				</tr>
				<tr>
					<td align="right">주소</td>
					<td><input type="text" name="address" size="50"></td>
				</tr>
				<tr>
					<td align="right">전자우편</td>
					<td> <input type="text" name="email" size="50"></td>
				</tr>
				<tr>
					<td align="right">관계</td>
					<td> <input type="text" name="rel" size="50"></td>
				</tr>
				<tr>
					<td></td>
					<td> <input type="submit" value="확인"></td>
				</tr>
			</table>
			
	</form>
</body>
</html>