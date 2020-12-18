<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123",
				"alstjr95!");
		String sql = "select id, pwd from membersuk where id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		String iddb = null;
		String pwdb = null;

		while (rs.next()) {
			iddb = rs.getString("id");
			pwdb = rs.getString("pwd");
		}

		if (!(id.equals(iddb))) {
			out.print("아이디가 일치하지 않습니다.<br>");
		} else if (!(pwd.equals(pwdb))) {
			out.print("패스워드가 일치하지 않습니다.<br>");
		} else {
			out.print(id + "님 환영합니다.");
			session.setAttribute("id", id);
		}
		response.sendRedirect("index.jsp?page=kh");
	%>
</body>
</html>