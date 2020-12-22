<%@page import="kr.or.kh.board.BoardDTO"%>
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
	<div id="boardUpdate">
		<%
			String searchTitle = request.getParameter("searchTitle");
			BoardDTO boarddto = (BoardDTO) request.getAttribute("boarddto");
		%>
		<form action="boardUpdateFinal.bo" method="get">
			<ul>

				<li><label for="번호">번호</label> <input type="number" name="no"
					value="<%=boarddto.getNo()%>" readonly="readonly"></li>
				<li><label for="제목">제목</label> <input type="text" name="title"
					value="<%=boarddto.getTitle()%>"><input type="hidden"
					name="searchTitle" value="<%=searchTitle%>"></li>
				<li><label for="내용">내용</label> <textarea rows="20" cols="80"
						name="content"></textarea></li>
				<li><label for="작성자">작성자</label> <input type="text"
					name="author" value="<%=boarddto.getAuthor()%>"></li>
				<li><label for="날짜">날짜</label> <input type="date" name="nal"
					value="<%=boarddto.getNal()%>"></li>
				<li><label for="조회수">조회수</label> <input type="text"
					name="readcount" value="<%=boarddto.getReadcount()%>"
					readonly="readonly"></li>
				<li><input type="image" src="images/update.png" class="kh01">
					<input type="reset" value="되돌리기"></li>
			</ul>
		</form>
	</div>
</body>
</html>