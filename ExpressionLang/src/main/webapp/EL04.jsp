<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>상품정보</h3>
	
	<%-- PRODUCT객체로 접근후 name필드로 접근 --%>
	상품명 : ${PRODUCT.name } <br>
	가격 : ${PRODUCT.value } <br>
</body>
</html>