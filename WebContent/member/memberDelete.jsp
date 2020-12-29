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
	width: 60px;
	height: 40px;
	/* border-radius: 20px; */
}

ul {
	list-style-type: none;
}

#outmember {
	position: absolute;
	top: 300px;
	left: 600px;
	width: 350px;
	border: 1px solid purple;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<div id="outmember">
		<h1>♥회원탈퇴♥</h1>
		<form action="member/memberout2.jsp" method="get">
			<ul>
				<li><label for="패스워드">비밀번호 입력</label><br> <input
					type="password" name="pw" required="required" autofocus="autofocus"
					placeholder="비밀번호 입력란" onclick="alert('패스워드가 틀렸습니다.')"></li>
				<li><input type="image" src="images/submit.jpg" class="kh01">
				</li>
			</ul>
		</form>
	</div>
</body>
</html>