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
.kh01 {
	width: 60px;
	height: 40px;
	border-radius: 15px;
}
</style>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<%
		String searchTitle = request.getParameter("searchTitle");
		int no = 0;
		String title = null;
		String content = null;
		String author = null;
		String nal = null;
		int readcount = 0;

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123",
				"alstjr95!");
		String sql = "select no, title, content, author, nal, readcount from boardsuk where title = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchTitle);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			no = rs.getInt("no");
			title = rs.getString("title");
			content = rs.getString("content");
			author = rs.getString("author");
			nal = rs.getString("nal");
			readcount = rs.getInt("readcount");
		}
	%>
	<div id="boardUpdate">
		<form action="boardUpdate.jsp" method="get">
			<ul>

				<li><label for="번호">번호</label> <input type="number" name="no"
					value="<%=no%>" readonly="readonly"></li>
				<li><label for="제목">제목</label> <input type="text" name="title"
					value="<%=title%>"><input type="hidden" name="searchTitle"
					value="<%=searchTitle%>"></li>
				<li><label for="내용">내용</label> <textarea rows="20" cols="80"
						name="content"></textarea></li>
				<li><label for="작성자">작성자</label> <input type="text"
					name="author" value="<%=author%>"></li>
				<li><label for="날짜">날짜</label> <input type="date" name="nal"
					value="<%=nal%>"></li>
				<li><label for="조회수">조회수</label> <input type="text"
					name="readcount" value="<%=readcount%>" readonly="readonly"></li>
				<li><input type="image" src="images/update.png" class="kh01">
					<input type="reset" value="되돌리기"></li>
			</ul>
		</form>
	</div>
</body>
</html>