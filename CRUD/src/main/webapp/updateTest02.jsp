<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String strUserid = "";
	ArrayList<String> arr = new ArrayList<String>();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		
	String url_mysql = "jdbc:mysql://192.168.150.246:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	//servertimezone 이 다르면 now 쓸때 다른나라 시간 나옴 
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
/* 	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql); */
	
	String query = "select userid from wtest where id = " + id;
//	String query = "select userid from wtest";
	
	//id 가 문자면  '" + id + "'"; 로 마무리
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		
		Statement stmt_mysql = conn_mysql.createStatement();
		ResultSet rs = stmt_mysql.executeQuery(query);
		
/* 		String A = "insert into purchaserinfo (userid,name,tel,address,insertdate";
		String B = ") values (?,?,?,?,now())"; */
		// 띄어 쓰기 기술 안하면 오류남
		
		while(rs.next()){
			
			strUserid = rs.getString(1);
		}

		conn_mysql.close();
		session.setAttribute("OLD", strUserid);
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
		
	}
	
%>
	<h3>수정 후 확인 버튼을 누르세요</h3>
	<form action="updateTest03.jsp" method="post">
		사용자 ID : <input type="text" name="userid" size="10" value="<%=strUserid%>"><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>