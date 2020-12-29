<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery.effects.core.js"></script>
<link href="css/haksainfo.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>학사관리</title>
</head>
<body>
	<div id="menu">
		<div class="item daegu1">
			<img src="images/bubble.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>register</h2>
			<ul>
				<li><a href="student/student.jsp">student</a></li>
				<li><a href="professor/professor.jsp">professor</a></li>
				<li><a href="managers/manager.jsp">manager</a></li>
			</ul>
		</div>
		<div class="item daegu2">
			<img src="images/bubble.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>search</h2>
			<ul>
				<li><a href="student/student_search_form.jsp">student</a></li>
				<li><a href="professor/professor_search_form.jsp">professor</a></li>
				<li><a href="managers/manager_search_form.jsp">manager</a></li>
			</ul>
		</div>
		<div class="item daegu3">
			<img src="images/bubble.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>delete</h2>
			<ul>
				<li><a href="student/student_delete_form.jsp">student</a></li>
				<li><a href="professor/professor_delete_form.jsp">professor</a></li>
				<li><a href="managers/manager_delete_form.jsp">manager</a></li>
			</ul>
		</div>
		<div class="item daegu4">
			<img src="images/bubble.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>list</h2>
			<ul>
				<li><a href="studentList.do">student</a></li>
				<li><a href="professorList.do">professor</a></li>
				<li><a href="managerList.do">manager</a></li>
				<li><a href="haksaList">haksaList</a></li>
			</ul>
		</div>
		<div class="item daegu5">
			<img src="images/bubble.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>update</h2>
			<ul>
				<li><a href="student/student_update_form.jsp">student</a></li>
				<li><a href="professor/professor_update_form.jsp">professor</a></li>
				<li><a href="managers/manager_update_form.jsp">manager</a></li>
			</ul>
		</div>
		<div class="item daegu6">
			<img src="images/bubble.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>
				<a href="index.jsp">main</a>
			</h2>
		</div>
	</div>
	<script src="js/haksainfo.js"></script>
</body>
</html>