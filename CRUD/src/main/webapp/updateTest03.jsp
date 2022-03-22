<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userid = request.getParameter("userid");

	session.setAttribute("NEW", userid);
	
	String url_mysql = "jdbc:mysql://192.168.150.246:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	//servertimezone 이 다르면 now 쓸때 다른나라 시간 나옴 
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	PreparedStatement ps = null;
	
	String newId = (String)session.getAttribute("NEW");
	String oldId = (String)session.getAttribute("OLD");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
		
		String A = "update wtest set userid = ? where userid = ?";
		
		// 띄어 쓰기 기술 안하면 오류남
		
		ps = conn_mysql.prepareStatement(A);
		ps.setString(1, newId);
		ps.setString(2, oldId);
		// 1 은 물음표 개수 물음표 2개면 2도 있어야됨  
		ps.executeUpdate();

		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		
	}
	

	response.sendRedirect("updateTest04.jsp");
	
%>

</body>
</html>