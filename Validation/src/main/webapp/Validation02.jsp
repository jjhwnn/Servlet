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
		if(form.id.value == ""){
			alert("아이디를 입력해주세요.")
			form.id.focus()
			return false
		}else if(form.pw.value == ""){
			alert("비밀번호를 입력해주세요.")
			form.pw.focus()
			return false
		}
		/*  function 은 false 를 만나면 더이상 진행하지 않는다. */
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