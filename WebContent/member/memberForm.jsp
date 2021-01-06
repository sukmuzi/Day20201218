<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#memberForm {
	width: 400px;
	border: 1px solid orange;
	text-align: right;
	padding-right: 120px;
}

ul {
	list-style-type: none;
}

.kh01 {
	width: 100px;
	height: 40px;
}

.reset {
	font-size: 15px;
	text-align: center;
}

h1 {
	padding-left: 120px;
	text-align: center;
	color: purple;
}
</style>
<script src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function idcheck() {
		var id = $('#idVal').val();
		if (id == "") {
			alert('아이디를 입력해주세요.');
		} else if (id == " ") {
			alert('아이디를 입력해주세요.');
		} else {
			window.open("idcheck.mb?id=" + id, "win01", "width=400 height=500");
		}
		//alert(id);
	}
</script>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<div id="memberForm">
		<h1>회원가입</h1>
		<form action="memberRegister.mb" method="get">
			<ul>
				<li><label for="아이디">아이디</label> <input type="text" name="id"
					id="idVal" size="20" maxlength="10" autofocus="autofocus"
					required="required" placeholder="아이디 입력"><input
					type="button" value="중복확인" onclick="idcheck()"></li>
				<li><label for="패스워드">패스워드</label> <input type="password"
					name="pwd" size="20" maxlength="10" placeholder="패스워드 입력"></li>
				<li><label for="주소">주소</label> <input type="text" name="addr"
					size="20" maxlength="100" placeholder="주소 입력"></li>
				<li><label for="핸드폰번호">핸드폰</label> <input type="text"
					name="tel" size="20" maxlength="20" placeholder=""></li>
				<br>
				<li><input type="image" src="images/member.png" class="kh01">
					<a href="index.jsp?page=kh"><img src="images/cancel.PNG"
						class="kh01"></a></li>
			</ul>
		</form>
	</div>
</body>
</html>