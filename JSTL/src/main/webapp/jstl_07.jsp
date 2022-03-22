<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test= "${param.num1 == 0}">
		처음 뵙겠습니다.
	</c:if>
	<c:if test= "${param.num1 == 1}">
		반갑 습니다.
	</c:if>
	<c:if test= "${param.num1 == 2}">
		안녕하세요 
	</c:if>
	
	<c:choose>
		<c:when test="${param.num1 == 0}">
			처음 뵙겠습니다. <br>
		</c:when>
		<c:when test="${param.num1 == 1 }">
			반갑 습니다. <br>
		</c:when>
		<c:otherwise>
			안녕하세요. <br>
		</c:otherwise>
	</c:choose>

</body>
</html>