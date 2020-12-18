<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#loginForm {
	width: 400px;
	border: 1px solid orange;
	text-align: right;
	padding-right: 120px;
}

.kh01 {
	width: 100px;
	height: 40px;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<div id="loginForm">
		<form action="login.jsp" method="get">
			<ul>
				<li><label for="아이디">아이디</label> <input type="text" name="id"
					maxlength="20" size="20" autofocus="autofocus" required="required">
				</li>
				<li><label for="패스워드">패스워드</label> <input type="password"
					name="pwd" maxlength="20" size="20" placeholder="패스워드 입력"></li>
				<li><input type="image" src="images/login.PNG" class="kh01"></li>
			</ul>
		</form>
	</div>
</body>
</html>