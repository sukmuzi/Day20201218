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
	<div id="boardUpdateForm">
		<form action="boardUpdateConfirm.jsp" method="get">
			<ul>
				<li><label for="수정할제목">수정할 제목</label> <input type="text"
					name="searchTitle" autofocus="autofocus" required="required"
					placeholder="제목입력"></li>
				<li><input type="image" src="images/update.png" class="kh01"></li>
			</ul>
		</form>
	</div>
</body>
</html>