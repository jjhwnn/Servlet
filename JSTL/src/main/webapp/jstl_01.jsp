<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- jstl 사용시 항상 넣어줘야 함  --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%--
	jstl core태그는 jsp페이지에서 사용되는 자바의 변수설정, 조건문, 반복문, 출력, 예외처리
	 등의 코드를 대체하기 위해 제공된다.
 --%>

<%-- var변수명 value=변수에 들어갈 데이 --%>
<c:set var = "num1" value="7"/>
<c:set var="num2" value="9"/>
<c:set var="result" value="${num1*num2 }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${num1 }과 ${num2 }의 곱은 ${result }입니다.
</body>
</html>