<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String agree = request.getParameter("agree");
	
		switch(agree){
		
		case "agree":
			response.sendRedirect("userInsert_04.jsp");		
			break;
			
		case "disagree":
			response.sendRedirect("userInsert_01.jsp");		
			break;
		}
%>
	
</body>

</html>