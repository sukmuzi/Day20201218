<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<%
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		String nal = request.getParameter("nal");
		String readcount = request.getParameter("readcount");
	%>
	제목:<%=title%>
	내용:<%=content%>
	작성자:<%=author%>
	날짜:<%=nal%>
	조회수:<%=readcount%>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123",
				"alstjr95!");

		String sql = "insert into boardsuk(title, content, author, nal, readcount) values(?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, author);
		pstmt.setString(4, nal);
		pstmt.setString(5, readcount);

		int cnt = pstmt.executeUpdate();
	%><br>
	<%=cnt%>건 등록완료.
	<%
		response.sendRedirect("index.jsp?page=boardList");
		conn.close();
		pstmt.close();
	%>
</body>
</html>