<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
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
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		String custno_max = "";	
		
		String custno = request.getParameter("custno");
		String custname = null;
		String phone = null;
		String address = null;
		String joindate = null;
		String grade = null;
		String city = null; 
		String title = "홈쇼핑 회원 정보 등록";
		String updateBool = "0";
		
		
		if(custno != null) {
			sql = "SELECT custname, phone, address, TO_CHAR(joindate, 'YYYYMMDD'), grade, city FROM member_tbl_02 WHERE CUSTNO = " + custno;
			
			conn = Util.getConnection();
			stmt = conn.createStatement(); 
			rs = stmt.executeQuery(sql);
			
			rs.next();
			
			custname = rs.getString(1);
			phone = rs.getString(2);
			address = rs.getString(3);
			joindate = rs.getString(4);
			grade = rs.getString(5);
			city = rs.getString(6);
			
			title = "홈쇼핑 회원 정보 수정";
			updateBool = "1";
		}
		


			try{
				
				sql = "select max(custno)+1 from member_tbl_02";
				conn = Util.getConnection();
				stmt = conn.createStatement();
				
				rs = stmt.executeQuery(sql);
				rs.next();
				custno_max = rs.getString(1);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			%>
	<h2><%= title %></h2>
	<form name="form1" method="post" action="action.jsp">
		<input type="hidden" name=updateBool value="<%= updateBool %>"/>
		<table border="1">
			<tr>
				<td>회원번호(자동발생)</td>
				<td><input type="text" name="custno" value="<%= custno == null ? custno_max : custno  %>" <% if(custno != null){%>readonly<% } %>  /></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname" value="<%= custname == null ? "" : custname %>"/></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone" value="<%= phone == null ? "" : phone %>"/></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address" value="<%= address == null ? "" : address %>"/></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate" value="<%= joindate == null ? "" : joindate %>"/></td>
			</tr>
			<tr>
				<td>고객등급(A:VIP, B:일반, C:직원)</td>
				<td><input type="text" name="grade" value="<%= grade == null ? "" : grade %>"/></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city" value="<%= city == null ? "" : city %>"/></td>
			</tr>

			<tr>
				<td colspan="2">
				<%
					String inputValue = "등록"; 
					
					if(custno != null) {
						inputValue = "수정";
					}
				%>
					<input type="submit" value="<%= inputValue %>" onclick="return is()" />
					<input type="button" value="조회" onclick="location.href='db_select_1.jsp'" />
				</td>
				
			</tr>
		</table>
	</form>
	
</section>
<script type="text/javascript" src = "inspection.js"></script>
<footer> <jsp:include page="footer.jsp" /> </footer>
</body>
</html>