<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
ul#leftmenu {
	position: fixed;
	top: 200px;
	left: 0px;
	z-index: 9999;
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}

ul#leftmenu li {
	width: 100px;
	margin-bottom: 2px;
}

ul#leftmenu li a {
	background-color: #ccc;
	color: #fff;
	text-decoration: none;
	display: block;
	width: 140px;
	padding: 10px 0 10px 10px;
	-webkit-border-bottom-right-radius: 20px;
	-webkit-border-top-right-radius: 20px;
	margin-left: -1px;
	opacity: 0.6;
}

ul#leftmenu .daegu1 a {
	background-color: red;
}

ul#leftmenu .daegu2 a {
	background-color: orange;
}

ul#leftmenu .daegu3 a {
	background-color: pink;
}

ul#leftmenu .daegu4 a {
	background-color: green;
}

ul#leftmenu .daegu5 a {
	background-color: blue;
}

ul#leftmenu .daegu6 a {
	background-color: purple;
}
</style>
<script src="js/jquery-1.10.2.js"></script>
<meta charset="UTF-8">
<title>KH정보교육원</title>
</head>
<body>
	<ul id="leftmenu">
		<li class="daegu1"><a href="index.jsp?page=haksaInfo">학사관리</a></li>
		<li class="daegu2"><a href="index.jsp?page=boardList">커뮤니티</a></li>
		<li class="daegu3"><a href="">컴퓨터공학과</a></li>
		<li class="daegu4"><a href="">행정학과</a></li>
		<li class="daegu5"><a href="">국어국문학과</a></li>
		<li class="daegu6"><a href="">대구가톨릭대학교</a></li>
	</ul>
	<script src="js/left.js"></script>
</body>
</html>
