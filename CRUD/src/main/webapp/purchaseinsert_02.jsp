<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
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
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	
	SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss", Locale.KOREA );
	Date currentTime = new Date ();
	String dTime = formatter.format ( currentTime );

	

	int result = 0;
	
	String url_mysql = "jdbc:mysql://192.168.150.246:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	//servertimezone 이 다르면 now 쓸때 다른나라 시간 나옴 
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	PreparedStatement ps = null;
	

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		
		//Statement stmt_mysql = conn_mysql.createStatement();
		
		String A = "insert into purchaserinfo (userid,name,tel,address,insertdate";
		String B = ") values (?,?,?,?,now())";
		// 띄어 쓰기 기술 안하면 오류남
		
		ps = conn_mysql.prepareStatement(A+B);
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, tel);
		ps.setString(4, address);
		//ps.setString(5, dTime);
		// 1 은 물음표 개수 물음표 2개면 2도 있어야됨  
		ps.executeUpdate();

		conn_mysql.close();
		
		result =1;
		
	}catch(Exception e){
		e.printStackTrace();
		result =0;
		e.getMessage();
		
	}
	session.setAttribute("id", id);
	session.setAttribute("name", name);
	session.setAttribute("tel", tel);
	session.setAttribute("address", address);
	session.setAttribute("result", result);
	

	
	
	response.sendRedirect("purchaseinsert_03.jsp");
%>

</body>
</html>