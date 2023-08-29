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
<h2>회원매출조회</h2>
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>고객등급</td>
			<td>매출</td>
		</tr>
		<%
			Connection conn = null;
			Statement stmt = null;
			
			try{
				
				String sql = "SELECT mem.custno, mem.custname, DECODE(mem.grade, 'A', 'VIP', 'B', '일반', 'C', '직원') AS RANK, SUM(mon.price) SALES "+	 
					"	FROM member_tbl_02 mem "+
					"	INNER "+
						"	JOIN money_tbl_02 mon ON MEM.CUSTNO = MON.CUSTNO "+
						"group by mem.custno, mem.custname, mem.grade" +
					"	ORDER BY 4 DESC";
				conn = Util.getConnection();
				stmt = conn.createStatement();
				
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					if(rs.getInt(4) != 0){
					%>
					
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getInt(4) %></td>		
					</tr>
					
					<%
					}
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