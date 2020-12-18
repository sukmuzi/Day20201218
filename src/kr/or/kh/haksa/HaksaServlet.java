package kr.or.kh.haksa;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class HaksaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDTO studentdto;
	private StudentDAO studentdao;
	private ProfessorDTO professordto;
	private ProfessorDAO professordao;
	private ManagerDTO managerdto;
	private ManagerDAO managerdao;
	private Connection conn;
	private int cnt;
	private PrintWriter out;
	private ResultSet rs;
	private String searchName;

	public HaksaServlet() {
		studentdto = new StudentDTO();
		try {
			studentdao = new StudentDAO();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		out = response.getWriter();

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if (command.equals("/studentRegister.do")) { // 등록
			String age = request.getParameter("age");
			String name = request.getParameter("name");
			String hakbun = request.getParameter("hakbun");

			studentdto.setAge(age);
			studentdto.setName(name);
			studentdto.setHakbun(hakbun);

			try {
				conn = studentdao.getConnection();
				studentdao.studentRegisterSql(studentdto);
				cnt = studentdao.studentExecuter();

				out.print("<script>alert('등록되었습니다.');location.href='student/studentList.jsp';</script>");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					out.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		} else if (command.equals("/studentList.do")) { // 리스트 출력
			response.sendRedirect("student/studentList.jsp");

		} else if (command.equals("/studentDelete.do")) {
			String deleteName = request.getParameter("name");
			try {
				cnt = studentdao.studentDeleteSql(deleteName);
				out.print(cnt + "건 삭제되었습니다.");
				response.sendRedirect("student/studentList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/studentSearch.do")) {
			String searchName = request.getParameter("name");
			try {
				rs = studentdao.studentSearchSql(searchName);
				out.print("학생검색결과");
				out.print("<table border=1 cellspacing=0 cellpadding=0>");
				out.print("<tr>");
				out.print("<th>번호</th> <th>나이</th> <th>이름</th><th>학번</th>");
				out.print("</tr>");

				while (rs.next()) {
					out.print("<tr>");
					out.print("<td>" + rs.getInt("no") + "</td>");
					out.print("<td>" + rs.getString("age") + "</td>");
					out.print("<td>" + rs.getString("name") + "</td>");
					out.print("<td>" + rs.getString("hakbun") + "</td>");
					out.print("</tr>");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/studentUpdate.do")) {// 학생수정
			searchName = request.getParameter("name");
			try {
				rs = studentdao.studentSearchSql(searchName);
				while (rs.next()) {
					studentdto.setNo(rs.getInt("no"));
					studentdto.setAge(rs.getString("age"));
					studentdto.setName(rs.getString("name"));
					studentdto.setHakbun(rs.getString("hakbun"));
				}
				response.sendRedirect("studentConfirm.do?");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/studentConfirm.do")) {
			out.print("<style>");
			out.print("ul{list-style-type:none;}");
			out.print("</style>");
			out.print("번호:" + studentdto.getNo() + "나이:" + studentdto.getAge() + "이름:" + studentdto.getName() + "학번:"
					+ studentdto.getHakbun() + "<br>");
			out.print("정말로 수정하시겠습니까?");
			out.print("<h1>최종수정 하기전 내용입니다.</h1>");
			out.print("<form action=studentUpdateFinal.do method=get>");
			out.print("<input type=hidden name=updateName value=" + searchName + ">");
			out.print("<ul>");
			out.print("<li><label for=나이변경>나이변경</label>");
			out.print("<input type=number name=age >");
			out.print("</li>");
			out.print("<li><label for=이름변경>이름변경</label>");
			out.print("<input type=text name=name >");
			out.print("<li>");
			out.print("<li><label for=학번변경>학번변경<label>");
			out.print("<input type=text name=hakbun>");
			out.print("</li>");
			out.print("<li><input type=image src=images/update.png class=kh01>");
			out.print("</li>");
			out.print("</ul>");
			out.print("</form>");
		} else if (command.equals("/studentUpdateFinal.do")) {// 학생최종수정
			String updateName = request.getParameter("updateName");
			studentdto.setAge(request.getParameter("age"));
			studentdto.setName(request.getParameter("name"));
			studentdto.setHakbun(request.getParameter("hakbun"));
			try {
				cnt = studentdao.studentUpdateSql(updateName, studentdto);
				out.print(cnt + "건 학생이 수정되었습니다.");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/professorRegister.do")) {
			String age = request.getParameter("age");
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");

			professordto.setAge(age);
			professordto.setName(name);
			professordto.setSubject(subject);

			try {
				conn = professordao.getConnection();
				professordao.professorRegisterSql(professordto);
				cnt = professordao.professorExecuter();

				out.print("<script>alert('등록되었습니다.');location.href='professor/professorList.jsp';</script>");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					out.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else if (command.equals("/professorList.do")) { // 리스트 출력
			response.sendRedirect("professor/professorList.jsp");

		} else if (command.equals("/professorDelete.do")) {
			String deleteName = request.getParameter("name");
			try {
				cnt = professordao.professorDeleteSql(deleteName);
				out.print(cnt + "건 삭제되었습니다.");
				response.sendRedirect("professor/professorList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (command.equals("/professorSearch.do")) {
			String searchName = request.getParameter("name");
			try {
				rs = professordao.professorSearchSql(searchName);
				out.print("교수 검색결과");
				out.print("<table border=1 cellspacing=0 cellpadding=0>");
				out.print("<tr>");
				out.print("<th>번호</th> <th>나이</th> <th>이름</th><th>과목</th>");
				out.print("</tr>");

				while (rs.next()) {
					out.print("<tr>");
					out.print("<td>" + rs.getInt("no") + "</td>");
					out.print("<td>" + rs.getString("age") + "</td>");
					out.print("<td>" + rs.getString("name") + "</td>");
					out.print("<td>" + rs.getString("subject") + "</td>");
					out.print("</tr>");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/professorUpdate.do")) {// 학생수정
			searchName = request.getParameter("name");
			try {
				rs = professordao.professorSearchSql(searchName);
				while (rs.next()) {
					professordto.setNo(rs.getInt("no"));
					professordto.setAge(rs.getString("age"));
					professordto.setName(rs.getString("name"));
					professordto.setSubject(rs.getString("subject"));
				}
				response.sendRedirect("professorConfirm.do?");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/professorConfirm.do")) {
			out.print("<style>");
			out.print("ul{list-style-type:none;}");
			out.print("</style>");
			out.print("번호:" + professordto.getNo() + "나이:" + professordto.getAge() + "이름:" + professordto.getName()
					+ "과목:" + professordto.getSubject() + "<br>");
			out.print("정말로 수정하시겠습니까?");
			out.print("<h1>최종수정 하기전 내용입니다.</h1>");
			out.print("<form action=professorUpdateFinal.do method=get>");
			out.print("<input type=hidden name=updateName value=" + searchName + ">");
			out.print("<ul>");
			out.print("<li><label for=나이변경>나이변경</label>");
			out.print("<input type=number name=age >");
			out.print("</li>");
			out.print("<li><label for=이름변경>이름변경</label>");
			out.print("<input type=text name=name >");
			out.print("<li>");
			out.print("<li><label for=과목변경>과목변경<label>");
			out.print("<input type=text name=subject>");
			out.print("</li>");
			out.print("<li><input type=image src=images/update.png class=kh01>");
			out.print("</li>");
			out.print("</ul>");
			out.print("</form>");
		} else if (command.equals("/professorUpdateFinal.do")) {
			String updateName = request.getParameter("updateName");
			professordto.setAge(request.getParameter("age"));
			professordto.setName(request.getParameter("name"));
			professordto.setSubject(request.getParameter("subject"));
			try {
				cnt = professordao.professorUpdateSql(updateName, professordto);
				out.print(cnt + "건 학생이 수정되었습니다.");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/managerRegister.do")) {
			String age = request.getParameter("age");
			String name = request.getParameter("name");
			String part = request.getParameter("part");

			managerdto.setAge(age);
			managerdto.setName(name);
			managerdto.setPart(part);

			try {
				conn = managerdao.getConnection();
				managerdao.managerRegisterSql(managerdto);
				cnt = managerdao.managerExecuter();

				out.print("<script>alert('등록되었습니다.');location.href='managers/managerList.jsp';</script>");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					out.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else if (command.equals("/managerList.do")) { // 리스트 출력
			response.sendRedirect("managers/managerList.jsp");

		} else if (command.equals("/managerDelete.do")) {
			String deleteName = request.getParameter("name");
			try {
				cnt = managerdao.managerDeleteSql(deleteName);
				out.print(cnt + "건 삭제되었습니다.");
				response.sendRedirect("managers/managerList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (command.equals("/managerSearch.do")) {
			String searchName = request.getParameter("name");
			try {
				rs = managerdao.managerSearchSql(searchName);
				out.print("관리자 검색결과");
				out.print("<table border=1 cellspacing=0 cellpadding=0>");
				out.print("<tr>");
				out.print("<th>번호</th> <th>나이</th> <th>이름</th><th>부서</th>");
				out.print("</tr>");

				while (rs.next()) {
					out.print("<tr>");
					out.print("<td>" + rs.getInt("no") + "</td>");
					out.print("<td>" + rs.getString("age") + "</td>");
					out.print("<td>" + rs.getString("name") + "</td>");
					out.print("<td>" + rs.getString("part") + "</td>");
					out.print("</tr>");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/managerUpdate.do")) {// 학생수정
			searchName = request.getParameter("name");
			try {
				rs = managerdao.managerSearchSql(searchName);
				while (rs.next()) {
					managerdto.setNo(rs.getInt("no"));
					managerdto.setAge(rs.getString("age"));
					managerdto.setName(rs.getString("name"));
					managerdto.setPart(rs.getString("part"));
				}
				response.sendRedirect("managerConfirm.do?");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/managerConfirm.do")) {
			out.print("<style>");
			out.print("ul{list-style-type:none;}");
			out.print("</style>");
			out.print("번호:" + managerdto.getNo() + "나이:" + managerdto.getAge() + "이름:" + managerdto.getName() + "부서:"
					+ managerdto.getPart() + "<br>");
			out.print("정말로 수정하시겠습니까?");
			out.print("<h1>최종수정 하기전 내용입니다.</h1>");
			out.print("<form action=managerUpdateFinal.do method=get>");
			out.print("<input type=hidden name=updateName value=" + searchName + ">");
			out.print("<ul>");
			out.print("<li><label for=나이변경>나이변경</label>");
			out.print("<input type=number name=age >");
			out.print("</li>");
			out.print("<li><label for=이름변경>이름변경</label>");
			out.print("<input type=text name=name >");
			out.print("<li>");
			out.print("<li><label for=부서변경>부서변경<label>");
			out.print("<input type=text name=part>");
			out.print("</li>");
			out.print("<li><input type=image src=images/update.png class=kh01>");
			out.print("</li>");
			out.print("</ul>");
			out.print("</form>");
		} else if (command.equals("/managerUpdateFinal.do")) {// 학생최종수정
			String updateName = request.getParameter("updateName");
			managerdto.setAge(request.getParameter("age"));
			managerdto.setName(request.getParameter("name"));
			managerdto.setPart(request.getParameter("part"));
			try {
				cnt = managerdao.managerUpdateSql(updateName, managerdto);
				out.print(cnt + "건 학생이 수정되었습니다.");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
