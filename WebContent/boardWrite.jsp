<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* body { */
/* 	background-image: url(images/back.jpg); */
/* } */
#boardWrite {
	/* 	position: absolute; */
	/* 	top: 250px; */
	/* 	left: 600px; */
	/* 	color: white; */
	
}

ul {
	list-style-type: none;
}

.content1 {
	position: absolute;
	top: 40px;
	left: 50px;
}

.content2 {
	position: relative;
	top: 0px;
	left: 10px;
}

.reset {
	position: absolute;
	top: 400px;
	width: 120px;
	height: 35px;
	background-color: orange;
	border-radius: 20px 20px;
}
</style>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
	<div id="boardWrite">
		<form action="boardRegister.jsp" method="get">
			<input type="hidden" name="readcount" value="0">
			<ul>
				<li><label for="제목">제목</label> <input type="text" name="title"
					autofocus="autofocus" required="required" placeholder="제목을입력하세요"
					size="50" maxlength="100"></li>

				<li><label for="내용" class="content1">내용</label> <textarea
						rows="20" cols="80" name="content" placeholder="내용을입력해주세요"
						class="content2"></textarea></li>

				<li><label for="작성자">작성자</label><input type="text"
					name="author" placeholder="작성자입력"></li>

				<li><label for="날짜">날&nbsp;&nbsp;&nbsp;짜</label><input
					type="date" name="nal"></li>

				<li><input type="image" src="images/write.jpg">&nbsp;&nbsp;&nbsp;<input
					type="reset" value="취소" class="reset"></li>

			</ul>
		</form>
	</div>
</body>
</html>