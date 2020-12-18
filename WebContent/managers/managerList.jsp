<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="managerdao" class="kr.or.kh.haksa.ManagerDAO"
	scope="page" />
<jsp:useBean id="managerdto" class="kr.or.kh.haksa.ManagerDTO"
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
<title>관리자전체출력</title>
</head>
<body>
	<%
		ResultSet rs = managerdao.managerListSql();
	%>
	<div id="box">
		<table border="1">
			<tr>
				<th style="width: 15%;">번호</th>
				<th style="width: 30%;">이름</th>
				<th style="width: 15%;">나이</th>
				<th style="width: 40%;">부서</th>
			</tr>
			<%
				while (rs.next()) {
					int no = rs.getInt("no");
					String name = rs.getString("name");
					String age = rs.getString("age");
					String part = rs.getString("part");
					out.print("<tr><td>" + no + "</td>" + "<td>" + name + "</td>" + "<td>" + age + "</td>" + "<td>" + part
							+ "</td></tr>");
				}
			%>
		</table>
	</div>
	<a href="index.jsp?page=managers/manager">관리자등록</a>
	<a href="index.jsp?page=haksaInfo">학사관리</a>
	<a href="../index.jsp?page=kh">메인화면</a>
</body>
</html>