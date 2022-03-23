<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>고객 명단 리스트</h2>
	
	<%
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	Connection conn_mysql = null;
	Statement stmt_mysql = null;
	ResultSet rs = null;
	
	String query = "select * from purchaserinfo";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		stmt_mysql = conn_mysql.createStatement();
		
		rs = stmt_mysql.executeQuery(query);
	%>	
		<table border="1">
			<tr>
				<th>User ID</th><th>번호</th><th>배고파요</th><th>당 떨어짐</th><th>입력일자</th>
			</tr>
	<%
		int count = 0;
		while(rs.next()){
			// 데이터가 없을 때 까지 계속 출력해줌
	%>
			<tr>
				<td><%=rs.getString(1) %></td>
														<%--
														userid의 정보를 담아 보냄
														getParameter로 받아낸다
														 --%>
				<td><a href="purchaserSelect02.jsp?userid=<%=rs.getString(1)%>"><%=rs.getString(2)%></a></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
			</tr>
	<%		
			count++;
		}
		
	%>
		</table>
		<button><a href="purchaseinsert_01.jsp">고객 입력</a></button>
		<br>
		총 고객은 <%=count %>명 입니다.
	<%
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
	}finally{
		try{
			if(rs != null){
				rs.close();
			}
			if(stmt_mysql != null){
				stmt_mysql.close();
			}
			if(conn_mysql != null){
				conn_mysql.close();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
		
	%>
</body>
</html>