<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
			<tr>
				<td align = "right">
				사용자 ID : 
				</td>
				<td>
					${sessionScope.id }
				</td>
			</tr>
			<tr>
				<td align = "right">
				성명 : 
				</td>
				<td>
					<%=session.getAttribute("name") %>
				</td>
			</tr>
			<tr>
				<td align = "right">
				전화번호 : 
				</td>
				<td>
					<%=session.getAttribute("tel") %>
				</td>
			</tr>
			<tr>
				<td align = "right">
				주소 : 
				</td>
				<td>
					<%=session.getAttribute("address") %>
				</td>
			</tr>
			
			<tr>
			</tr>
			
			<tr>
			</tr>
			
		</table>
		<br>
		
		상기의 정보로 입력되었습니다. <br>
	지금까지 이용해주셔서 감사할 뻔 했습니다. 
			<% session.invalidate();%>
</body>
</html>