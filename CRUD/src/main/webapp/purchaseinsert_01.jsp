<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 아래의 항목을 입력 후 확인 버튼을 누르세요!</h3>	
	<form action="purchaseinsert_02.jsp" method="post">
		<table>
			<tr>
				<td align = "right">
				사용자 ID : 
				</td>
				<td>
				<input type="text" name="id" >
				</td>
			</tr>
			<tr>
				<td align = "right">
				성명 : 
				</td>
				<td>
				<input type="text" name="name" >
				</td>
			</tr>
			<tr>
				<td align = "right">
				전화번호 : 
				</td>
				<td>
				<input type="text" name="tel" >
				</td>
			</tr>
			<tr>
				<td align = "right">
				주소 : 
				</td>
				<td>
				<input type="text" name="address" >
				</td>
			</tr>
			
			<tr>
			</tr>
			
			<tr>
				<td></td>
				<td>
					<br><br>
					<input type="submit" value="화인">
				</td>
			</tr>
	
		</table>
		
	</form>

</body>
</html>