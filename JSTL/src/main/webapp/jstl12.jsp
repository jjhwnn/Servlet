<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>format</title>
</head>
<body>
	첫번쨰 수  : <fmt:formatNumber value="1234500" groupingUsed="true"/> <br>
	<!--  보일때만 , 찍히지 값은 숫자임-->
	두번쨰 수  : <fmt:formatNumber value="3.14159" pattern="#.##"/> <br>
	세번쨰 수  : <fmt:formatNumber value="10.5" pattern="#.00"/> <br>
	
		
</body>
</html>