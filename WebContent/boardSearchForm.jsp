<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* #boardTitle { */
/* 	position: relative; */
/* 	left: -200px; */
/* } */
.kh01 {
	width: 60px;
	height: 40px;
	border-radius: 15px;
}
</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		String result = request.getParameter("result") == null ? "" : request.getParameter("result");
	%>
	<div id="boardTitle">
		<form action="boardSearch.jsp" method="get">
			<ul>
				<li><input type="hidden" name="boardTest"
					value="index.jsp?page=boardSearchForm"></li>
				<li><label for="제목">제목</label><input type="text" name="title"
					autofocus="autofocus" required="required" placeholder="제목입력"></li>
				<li><input type="image" src="images/search.png" class="kh01"></li>
			</ul>
		</form>
		<%
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String no = request.getParameter("no") == null ? "" : request.getParameter("no");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String author = request.getParameter("author");
			String nal = request.getParameter("nal");
			String readcount = request.getParameter("readcount");

			if (no.equals("") || no == null || no.equals("null") || no.equals("0")) {
				out.print("");
			} else {
		%>
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
				out.print("<tr><td>" + no + "</td><td>" + title + "</td><td>" + content + "</td><td>" + author
							+ "</td><td>" + nal + "</td><td>" + readcount + "</td></tr>");
				}
			%>
		</table>
	</div>
	<div>
		<a href="index.jsp?page=boardList">목록</a> 
		<a href="index.jsp?page=boardWrite">글쓰기</a>
	</div>
</body>
</html>