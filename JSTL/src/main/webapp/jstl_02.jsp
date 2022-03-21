<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	 변수 설정				scope : 영역(page, request, session, application 중 하나)
	 						- 변수가 저장되는 영역 설정
	 						- scope생략시 디폴트는 page
	 						
	--%>
	<c:set var="code" value="1111" scope="request"/>
	<c:set var="productName" value="온도습도계" scope="request"/>
	<c:set var="price" value="15,000" scope="request"/> <%-- 문자String으로 인식 --%>
	<jsp:forward page="jstl_03.jsp"/>
	
</body>
</html>