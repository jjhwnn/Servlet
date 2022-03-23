<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%

request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String rel = request.getParameter("rel");
	
	
	session.setAttribute("seq", seq);
	session.setAttribute("name", name);
	session.setAttribute("tel", tel);
	session.setAttribute("address", address);
	session.setAttribute("email", email);
	session.setAttribute("rel", rel);
	
                                                   
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql="qwer1234";
	
PreparedStatement ps = null;   

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
	Statement stmt_mysql = conn_mysql.createStatement();
	                               
	String A ="update addressBook set name = ?, tel=?, address=?, email= ?, rel =? where seq = ?";
	/* SQL 문장      ?에 ~~를 넣겠다는 의미./ */
	
	ps = conn_mysql.prepareStatement(A);
	ps.setString(1,name);
	ps.setString(2,tel);
	ps.setString(3,address);
	ps.setString(4,email);
	ps.setString(5,rel);
	ps.setString(6,seq);
	
	ps.executeUpdate();   
	
	conn_mysql.close(); 
	
}catch(Exception e){
	e.printStackTrace();
}

response.sendRedirect("AB01.jsp"); 

%>