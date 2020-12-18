<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="professordao" class="kr.or.kh.haksa.ProfessorDAO"
	scope="page" />
<jsp:useBean id="professordto" class="kr.or.kh.haksa.ProfessorDTO"
	scope="page" />

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-image: url("../images/back.jpg");
}

#box {
	font-size: 17px;
	color: white;
	border: 1px solid white;
	border-radius: 20px;
	width: 300px;
	padding-left: 30px;
	padding-bottom: 30px;
	padding-right: 30px;
}

a {
	color: white;
}

h1 {
	font-size: 30px;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>학생전체출력</title>
</head>
<body>
	<%
		ResultSet rs = professordao.professorListSql();
	%>
	<h1>교수 전체 출력</h1>
	<div id="box">
		<table border="1">
			<tr>
				<th style="width: 15%;">번호</th>
				<th style="width: 30%;">이름</th>
				<th style="width: 15%;">나이</th>
				<th style="width: 40%;">과목</th>
			</tr>
			<%
				while (rs.next()) {
					int no = rs.getInt("no");
					String name = rs.getString("name");
					String age = rs.getString("age");
					String subject = rs.getString("subject");
					out.print("<tr><td>" + no + "</td>" + "<td>" + name + "</td>" + "<td>" + age + "</td>" + "<td>" + subject
							+ "</td></tr>");
				}
			%>
		</table>
	</div>
	<a href="index.jsp?page=professor/professor">학생등록</a>
	<a href="index.jsp?page=haksaInfo">학사관리</a>
	<a href="../index.jsp?page=kh">메인화면</a>
</body>
</html>