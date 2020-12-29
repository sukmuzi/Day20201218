<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<%
		String searchId = request.getParameter("searchId");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123",
				"alstjr95!");
		String sql = "update membersuk set id = ?, pwd = ?, addr = ?, tel = ? where id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, addr);
		pstmt.setString(4, tel);
		pstmt.setString(5, searchId);
		int cnt = pstmt.executeUpdate();
	%>
	<%=cnt%>건 멤버가 수정되었습니다.
	<%
		response.sendRedirect("../index.jsp?page=member/memberList");
	%>
</body>
</html>