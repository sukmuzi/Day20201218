<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-image: url("images/yellow.jpg");
	background-repeat: no-repeat;
	background-size: 2000px;
	background-attachment: fixed;
	width: 1500px;
	height: 1000px;
}

.kh01 {
	width: 70px;
	height: 50px;
	/* border-radius: 20px; */
}

#memberUpdateForm {
	position: absolute;
	top: 300px;
	left: 600px;
	width: 400px;
	border: 1px solid purple;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<div id="memberUpdateForm">
		<h1>회원 수정 폼</h1>
		<form action="member/memberUpdateConfirm.jsp" method="get">
			<ul>
				<li><label for="아이디">아이디</label> <input type="text" name="id"
					autofocus="autofocus" required="required"
					placeholder="수정할 아이디를 입력해주세요."></li>
				<li><input type="image" src="images/update.jpg" class="kh01">
				</li>
			</ul>
		</form>
	</div>
</body>
</html>