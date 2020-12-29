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
.kh01 {
	width: 70px;
	height: 50px;
	/* border-radius: 20px; */
}

ul {
	list-style-type: none;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<%
		String searchId = request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123", "bbr123",
				"alstjr95!");
		String sql = "select id,pwd,addr,tel from membersuk where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchId);
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
			out.print("수정하기 전 회원목록 입니다.<br>");
			out.print("아이디 : " + id + " " + "패스워드 : " + pwd + " " + "주소 : " + addr + " " + "전화번호 : " + tel);
		}
	%>

	<form action="memberUpdate.jsp" method="get">
		<ul>
			<li><label for="아이디">아&nbsp;이&nbsp;디&nbsp;</label> <input
				type="text" name="id" size="25" autofocus="autofocus"
				required="required" placeholder="수정 할 아이디를 입력해주세요."> <input
				type="hidden" name="idSearch" value="<%=searchId%>"></li>
			<li><label for="패스워드">패스워드</label> <input type="password"
				name="pw" size="25" placeholder="수정 할 패스워드를 입력해주세요."></li>
			<li><label for="주소">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;</label>
				<input type="text" name="addr" size="25"
				placeholder="수정 할 주소를 입력해주세요."></li>
			<li><label for="폰번호">폰&nbsp;번&nbsp;호&nbsp;</label> <input
				type="text" name="tel" size="25" placeholder="수정 할 폰번호를 입력해주세요.">
			</li>
			<li><input type="image" src="../images/update2.jpg" class="kh01">
			</li>
		</ul>
	</form>
</body>
</html>