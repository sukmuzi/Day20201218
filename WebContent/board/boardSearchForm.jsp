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
<title></title>
</head>
<body>	
	<div id="boardTitle">
		<form action="boardSearch.bo" method="get">
			<ul>
				<li><input type="hidden" name="readcount"
					value="0"></li>
				<li><label for="제목">제목</label><input type="text" name="searchTitle"
					autofocus="autofocus" required="required" placeholder="제목입력"></li>
				<li><input type="image" src="images/search.png" class="kh01"></li>
			</ul>
		</form>

	</div>
	<div>
		<a href="index.jsp?page=board/boardList">목록으로</a> <a
			href="index.jsp?page=board/boardWrite">글쓰기</a>
	</div>
</body>
</html>