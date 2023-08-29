
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "" ;
	
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city"); 
	String updateBool = request.getParameter("updateBool");
	
	try{
		conn = Util.getConnection();
		
		if(updateBool.equals("1")){
			sql = "UPDATE member_tbl_02 SET custname = ?, phone = ?, address= ? , joindate =  TO_DATE(?, 'YYYYMMDD'), grade = ?, city = ? where custno = " + custno;
			
		}else {
			sql = "INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city) VALUES (" + Integer.parseInt(custno) + ", ?, ?, ?, TO_DATE(?, 'YYYYMMDD'), ?, ?)";
		
		}
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);

		
		pstmt.executeUpdate();
		
		
		if(updateBool.equals("1")){
			response.sendRedirect("db_select_1.jsp");
		}else {
			response.sendRedirect("insert.jsp");
		}
		
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
