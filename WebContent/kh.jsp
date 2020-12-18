<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery.innerfade.js"></script>

<style type="text/css">
.khb {
	width: 600px;
	height: 400px;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<div id="mainpage">
		<ul id="portfolio">
			<li><a href="index.jsp?page=haksaInfo"> <img
					src="images/44.jpg" title="학사소개" class="khb" />
			</a></li>
			<li><a href="index.jsp?page=boardWrite"> <img src="images/11.jpg"
					title="커뮤니티" class="khb" />
			</a></li>
			<li><a href="#"> <img src="images/22.jpg"
					title="모집과정" class="khb" />
			</a></li>
			<li><a href="#"> <img src="images/33.jpg"
					title="포트폴리오" class="khb" />
			</a></li>

		</ul>

	</div>

	<script>
		$('#portfolio').innerfade({
			speed : 'slow',
			timeout : 4000,
			type : 'sequence',
			containerheight : '220px'
		});
	</script>
</body>
</html>