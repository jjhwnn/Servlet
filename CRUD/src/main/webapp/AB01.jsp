<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<script type="text/javascript">
		function insert() {
			location.href = "AB02.jsp";
		}
	</script>
	<body>
		<%-- 
		주소록 검색하기
		- 폼태그로  이름/전화번호/주소/관계와 검색 입력란을 작성
		- 검색하면 select쿼리를 호출하여 키워드 검색 시 키워드에 들어간 레코드 모두 나오도록 구현
		 --%>
		<h3>주소록 명단 리스트 </h3>
		 
		<form action="AB01_1.jsp">
			검색 선택 : 
					<select name="sel">
						<option value="name">이름</option>
						<option value="tel">전화번호</option>
						<option value="address">주소</option>
						<option value="rel">관계</option>
					</select>
					<input type="text" name="search" size="20">
					<input type="submit" value="검색">				
		</form> 
		<br>
	<%
		request.setCharacterEncoding("utf-8");
		String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
		String id_mysql = "root";
		String pw_mysql = "qwer1234";
	
		PreparedStatement ps = null;
		
		String query = "select * from addressbook";
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
			
			Statement stmt_mysql = conn_mysql.createStatement();
			ResultSet rs = stmt_mysql.executeQuery(query);
			int cnt = 0 ;
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
						<a href ="AB03.jsp?seq=<%=rs.getString(1)%>">
						<%=rs.getString(1)%>
						</a>
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
	
	<%	
				cnt++;
			}
	%>		
			</table>
			<br>
			<div align="left" style = "width :29%">
			
					<form action="#">
						<input type="button" value="입력" onclick="insert()">
					</form>
			</div>
			<h3> 총 인원은 <%=cnt %> 입니다.</h3>
	<%
		
			conn_mysql.close();
	
		}catch(Exception e){
			e.printStackTrace();
			e.getMessage();
			
		}
	
	%>	
	
		 
	</body>
</html>
