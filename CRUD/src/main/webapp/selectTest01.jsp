<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객명단 리스트</title>
</head>
<body>
	<h3>고객명단 리스트</h3>

	<%
	String url_mysql = "jdbc:mysql://localhost/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	
	String query = "select * from wtest";
	
	Connection conn_mysql = null;
	Statement stmt_mysql = null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		stmt_mysql = conn_mysql.createStatement();
		
		rs = stmt_mysql.executeQuery(query);
	%>	
		<table border="1">
			<tr>
				<th>번호</th><th>User ID</th>
			</tr>
	<%
		int count = 0;
		while(rs.next()){
			// 데이터가 없을 때 까지 계속 출력해줌
	%>
			<tr>
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
			</tr>
			
	<%		
			count++;
		}
	%>
		</table>
		<br>
		총 고객은 <%=count %>명 입니다.
	<%
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
	}
	
		
	%>

	
</body>
</html>