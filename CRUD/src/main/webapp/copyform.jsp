<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<%
	request.setCharacterEncoding("utf-8");
	String url_mysql = "jdbc:mysql://192.168.150.246:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	//servertimezone 이 다르면 now 쓸때 다른나라 시간 나옴 
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
		
		
		
/* 		pre 쓸때 주석 

		String A = "update purchaserinfo set name = ?, tel = ? , address = ? where userid = '" + id+ "'";
		
		ps = conn_mysql.prepareStatement(A);
		ps.setString(1,name );
		ps.setString(2,tel );
		ps.setString(3,address );

		ps.executeUpdate();
 */
		
	
		conn_mysql.close();

	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
		
	}
	
	
/*  statement 주석 
	String query = "select name from purchaserinfo where userid = '" + id+ "'";

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		
		Statement stmt_mysql = conn_mysql.createStatement();
		ResultSet rs = stmt_mysql.executeQuery(query);
		
		
		while(rs.next()){
			name = rs.getString("name");	
		}
	
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();

		
	} */
%>	
</body>
</html>