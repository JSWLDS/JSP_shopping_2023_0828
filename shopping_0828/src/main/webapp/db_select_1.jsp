<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style4.css?ver=1.0">
</head>
<body>
<header> <jsp:include page="header.jsp" /> </header>
<nav> <jsp:include page="nav.jsp" /> </nav>

<section>
<h2>회원목록조회</h2>
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>전화번호</td>
			<td>주소</td>
			<td>가입일자</td>
			<td>고객등급</td>
			<td>거주지역</td>
		</tr>
		<%
			Connection conn = null;
			Statement stmt = null;
			
			try{
				
				String sql = "SELECT custno, custname, phone, address, TO_CHAR(joindate, 'YYYY-MM-DD'), DECODE(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') AS RANK, city FROM member_tbl_02 ORDER BY 1";
				conn = Util.getConnection();
				stmt = conn.createStatement();
				
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					%>
					
					<tr>
						<td><a href="insert.jsp?custno=<%= rs.getString(1) %>"><%= rs.getString(1) %></a></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getString(4) %></td>		
						<td><%= rs.getString(5) %></td>
						<td><%= rs.getString(6) %></td>
						<td><%= rs.getString(7) %></td>
						
					</tr>
					
					<%
				}
				
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</section>
<footer> <jsp:include page="footer.jsp" /> </footer>
</body>
</html>