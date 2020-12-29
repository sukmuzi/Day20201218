<%@page import="kr.or.kh.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
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
			<%
				ArrayList<MemberDTO> memberList = (ArrayList<MemberDTO>)request.getAttribute("memberList");
				for (int i = 0; i < memberList.size(); i++) {
					MemberDTO memberDTO = memberList.get(i);
			%>

			<tr>
				<td><%=memberDTO.getId()%></td>
				<td><%=memberDTO.getPwd()%></td>
				<td><%=memberDTO.getAddr()%></td>
				<td><%=memberDTO.getTel()%></td>

			</tr>
			<%
				}
			%>
		</table>
		<a href="index.jsp?page=member/memberUpdateForm">멤버수정</a>
	</div>
</body>
</html>