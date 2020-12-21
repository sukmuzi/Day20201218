<%@page import="kr.or.kh.board.BoardDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="boardSearch" class="kr.or.kh.board.BoardDAO"
	scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BoardDTO boarddto = (BoardDTO) request.getAttribute("boarddto");
		boardSearch.boardReadcount(boarddto);
	%>
	<div id="boardSearch">
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
			<tr>
				<td><%=boarddto.getNo()%></td>
				<td><%=boarddto.getTitle()%></td>
				<td><%=boarddto.getContent()%></td>
				<td><%=boarddto.getAuthor()%></td>
				<td><%=boarddto.getNal()%></td>
				<td><%=boarddto.getReadcount() + 1%></td>
				<td></td>
			</tr>
		</table>
		<a href="boardList.bo">목록으로</a>
	</div>
</body>
</html>