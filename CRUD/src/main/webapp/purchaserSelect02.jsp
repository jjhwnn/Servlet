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
	<h2>고객 명단 수정 및 삭제</h2>
	
	<%--userid 정보 출력 select--%>

	<%--수정 클릭 시 수정해주는 update 페이지 생성 --%>
	<%--삭제 클릭시 삭제해주는 delete 페이지 생성 --%>
	
	<%
	String userid = request.getParameter("userid");
	String name = null;
	String tel = null;
	String address = null;
	
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
		
		String query = "select * from purchaserinfo where userid = '" + userid + "'";
		
		ResultSet rs = stmt_mysql.executeQuery(query);
		
		while(rs.next()){
			// getString() 괄호 안에 컬럼명 또는 숫자를 붙여줌
			userid = rs.getString("userid");
			name = rs.getString("name");
			tel = rs.getString("tel");
			address = rs.getString("address");
		}
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
	}
		
	%>	
	 <form action="purchaserSelectUpdate.jsp">
		<table>
			<tr>
				<td align="right">User ID : </td> <td><input type = "text" name="userid" value="<%=userid %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td align="right">성명 : </td><td><input type = "text" name="name" value="<%=name %>"></td>
			</tr>
			<tr>
				<td align="right">전화번호 : </td><td><input type = "text" name="tel" value="<%=tel %>"></td>
			</tr>
			<tr>
				<td align="right">주소 : </td><td><input type = "text" name="address" value="<%=address %>"></td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="수정">
		<button><a href = "purchaserSelectDelete.jsp?userid=<%=userid%> ">삭제</a></button>
	</form>

</body>
</html>