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
	
	String url_mysql = "jdbc:mysql://localhost:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	//servertimezone 이 다르면 now 쓸때 다른나라 시간 나옴 
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String id = request.getParameter("id"),name = request.getParameter("name"),tel = request.getParameter("tel"),address = request.getParameter("address");
	
	
	/* 	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql); */
	
	//String query = "update purchaserinfo set name = '" +name +"', tel = '" + tel + "', address = '"+address+ "' "+  " where userid = '" + id+ "'";
	
	session.setAttribute("id", id);
	session.setAttribute("name", name);
	session.setAttribute("address", address);
	session.setAttribute("tel", tel);
	
	PreparedStatement ps = null;
	//String query = "select userid from wtest";
	
	//id 가 문자면  '" + id + "'"; 로 마무리
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		Statement stmt_mysql = conn_mysql.createStatement();
		
		String A = "delete from purchaserinfo where userid = ?";
		
		
		ps = conn_mysql.prepareStatement(A);
		ps.setString(1, id);
		
		ps.executeUpdate();

	
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
	}
	response.sendRedirect("purchaserDelete_04.jsp");
%>
</body>
</html>