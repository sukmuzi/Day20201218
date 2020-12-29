<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<c:forEach items="${list }" var="board">
				<tr>
					<td><a href="editForm.bo?no=${board.no }">${board.no }</a></td>
					<td>${board.title }</td>
					<td>${board.content }</td>
					<td>${board.author }</td>
					<td>${board.nal }</td>
					<td>${board.readcount }</td>
					<td><a href="boardDelete.bo?no=${board.no }">삭제</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7"><jsp:include page="page.jsp" flush="true" /></td>
			</tr>

		</table>
	</div>
	<a href="index.jsp?page=board/boardWrite"
		style="position: relative; left: -200px;">글쓰기</a>
	<a href="index.jsp?page=board/boardSearchForm"
		style="position: relative; left: -200px;">검색</a>
	<a href="index.jsp?page=board/boardUpdateForm"
		style="position: relative; left: -200px;">수정</a>
</body>
</html>