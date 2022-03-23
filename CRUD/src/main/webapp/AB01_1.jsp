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
<%
	String sel = request.getParameter("sel");
	String search = request.getParameter("search");
	
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	PreparedStatement ps_mysql = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
		
		String query = "select * from addressBook where " + sel + " like " + "'%" + search + "%'";
		
		ResultSet rs = stmt_mysql.executeQuery(query);
%>		
		<table border = "1">
			<tr align="center">
				<th>Seq</th> <th>이름</th><th>전화번호</th> <th>주소</th><th>전자우편</th><th>관계</th>
			</tr>
<%			
		while(rs.next()){
%>			
			<tr>
				<td>
					<%=rs.getString(1)%>
				</td>
				<td>
					<%=rs.getString(2)%>
				</td>
				<td>
					<%=rs.getString(3)%>
				</td>
				<td>
					<%=rs.getString(4)%>
				</td>
				<td>
					<%=rs.getString(5)%>
				</td>
				<td>
					<%=rs.getString(6)%>
				</td>
			</tr>
		</table>
<%	
		}
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
	}	
%>



</body>
</html>