<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<%
		String no1 = request.getParameter("no");
		int no = Integer.parseInt(no1);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		String nal = request.getParameter("nal");
		String readcount = request.getParameter("readcount");
		String searchTitle = request.getParameter("searchTitle");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123",
				"alstjr95!");
		
		String sql = "update boardsuk set title = ?, content = ?, author = ?, nal = ? where title = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, author);
		pstmt.setString(4, nal);
		pstmt.setString(5, searchTitle);
		
		int cnt = pstmt.executeUpdate();
	%>
	<%
		response.sendRedirect("index.jsp?page=boardList");
	%>
</body>
</html>