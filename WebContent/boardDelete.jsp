<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String no1 = request.getParameter("no");
		int no = Integer.parseInt(no1);
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123",
				"alstjr95!");

		String sql = "delete from boardsuk where no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);

		int cnt = pstmt.executeUpdate();
	%>
	<%=no%> 게시물이 삭제되었습니다.
	<%
		response.sendRedirect("index.jsp?page=boardList");
	%>
</body>
</html>