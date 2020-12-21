<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#boardList {
	position: relative;
	left: -200px;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

th {
	background-color: black;
	color: white;
}

td {
	padding-left: 5px;
}
</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="boardList">
		<h1>게시판 목록</h1>
		<table border="1" cellspacing="0" cellpadding="0">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>&nbsp;</th>
			</tr>
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123",
						"alstjr95!");

				String sql = "select no, title, content, author, nal, readcount from boardsuk";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				int no = 0;
				String title = null;
				String content = null;
				String author = null;
				String nal = null;
				int readcount = 0;

				while (rs.next()) {
					no = rs.getInt("no");
					title = rs.getString("title");
					content = rs.getString("content");
					author = rs.getString("author");
					nal = rs.getString("nal");
					readcount = rs.getInt("readcount");
					out.print("<tr><td>" + no + "</td><td>" + title + "</td><td>" + content + "</td><td>" + author
							+ "</td><td>" + nal + "</td><td>" + readcount + "</td><td><a href=boardDelete.jsp?no="
							+ no + ">삭제</a></td></tr>");
				}
			%>
		</table>
	</div>
	<a href="index.jsp?page=board/boardWrite" style="position: relative; left: -200px;">글쓰기</a>
	<a href="index.jsp?page=board/boardSearchForm" style="position: relative; left: -200px;">검색</a>
	<a href="index.jsp?page=board/boardUpdateForm" style="position: relative; left: -200px;">수정</a>
</body>
</html>