<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkForm() {
		alert("아이디 :" + document.loginForm.id.value + "\n비밀번호 :" + document.loginForm.passwd.value
		)
	}
	/* js는 body를 document라고 한다.  */
</script>
<body>
	<form name="loginForm" action="#">
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="text" name="passwd"></p>
		<p><input type="button" value="전송" onclick="checkForm()"> </p>		
		
	</form>
</body>
</html>