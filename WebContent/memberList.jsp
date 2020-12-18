<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#memberList {
	position: relative;
	left: -200px;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

th {
	background-color: black;
	color: white;
}

td {
	padding-left: 5px;
}
</style>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
	<div id="memberList">
		<table border="1" cellspacing="0" cellpadding="0">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>주소</th>
				<th>전화번호</th>
			</tr>
			<tr>

				<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123",
							"alstjr95!");

					String sql = "select id, pwd, addr, tel from membersuk";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = null;
					rs = pstmt.executeQuery();

					String id = null;
					String pwd = null;
					String addr = null;
					String tel = null;

					while (rs.next()) {
						id = rs.getString("id");
						pwd = rs.getString("pwd");
						addr = rs.getString("addr");
						tel = rs.getString("tel");
						out.print("<td>" + id + "</td><td>" + pwd + "</td><td>" + addr + "</td><td>" + tel + "</td>");
					}
				%>
			</tr>
		</table>
	</div>
</body>
</html>