<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm
		if (form.id.value.length < 4 || form.id.value.length > 12){
			alert("아이디는 4~12자 이내로 입력 가능 합니다.")
			form.id.select()
			return false
		}else if(form.pw.value.length < 4 ){
			alert("패스워드는 4자 이상으로 입력 가능 합니다.")
			form.pw.select()
			return false
		}
		if()
		form.submit()
	}
</script>
<body>
	<form name="loginForm" action="Validation02P.jsp" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="text" name="pw"><br>
		<input type="button" value="OK" onclick="checkLogin()">
			
	</form>

</body>
</html>