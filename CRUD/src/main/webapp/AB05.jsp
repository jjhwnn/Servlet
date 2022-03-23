<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String url_mysql = "jdbc:mysql://192.168.150.132:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String seq = request.getParameter("seq");
	
	PreparedStatement ps = null;

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		Statement stmt_mysql = conn_mysql.createStatement();
		
		String A = "delete from addressBook where seq = ?";
		
		ps = conn_mysql.prepareStatement(A);
		ps.setString(1, seq);
		
		ps.executeUpdate();

		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
	}
	response.sendRedirect("AB01.jsp");
%>
</body>
</html>