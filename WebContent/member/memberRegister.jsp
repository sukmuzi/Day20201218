<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
		String sql = "insert into membersuk(id, pwd, addr, tel) values(?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, addr);
		pstmt.setString(4, tel);
		int cnt = pstmt.executeUpdate();
	%>

	<%=cnt%>건 회원이 가입되었습니다.
	<a href="index.jsp?page=kh">메인페이지</a>
</body>
</html>