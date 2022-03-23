<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
 	function del(a) {
 		var b = a.value
		location.href = "AB05.jsp?seq="+b;
		
	} 
</script>
<body>

<%
	String seq = request.getParameter("seq");

	String email = "";
	String rel ="";
	String name = "";
	String tel = "",address = "";
	session.setAttribute("seq",seq);
	
	String userid = request.getParameter("userid");
	

	
	request.setCharacterEncoding("utf-8");
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String query = "select * from addressBook where seq = '" + seq + "'";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		
		Statement stmt_mysql = conn_mysql.createStatement();
		ResultSet rs = stmt_mysql.executeQuery(query);
		
		while(rs.next()){
			name = rs.getString("name");	
			tel = rs.getString("tel");	
			address = rs.getString("address");
			email = rs.getString("email");
			rel = rs.getString("rel");
			
		}
	
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();

	}
	


%>

<h1>수정 후 확인을 눌러주세요 </h1>
	<form action="AB04.jsp" method="post" name="memberform">
		<table>
			<tr>
				<td>Seq :</td>
				<td><input type="text" name="seq" value="<%=seq%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>성명 :</td>
				<td><input type="text" name="name" value="<%=name%>"></td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><input type="text" name="tel" value="<%=tel%>"></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><input type="text" name="address" value="<%=address%>"></td>
			</tr>
			
			<tr>
				<td>전자 우편 :</td>
				<td><input type="text" name="email" value="<%=email%>"></td>
			</tr>
			<tr>
				<td>관계 :</td>
				<td><input type="text" name="rel" value="<%=rel%>"></td>
			</tr>
		</table>
		<input type="submit" value="수정">
		
		
		<input type="button" value="삭제" onclick="del(seq)">  
		
	</form>
	
</body>
</html>