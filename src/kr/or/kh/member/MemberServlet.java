package kr.or.kh.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.mb")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDTO memberdto;
	private MemberDAO memberdao;
	private int cnt;
	private ArrayList<MemberDTO> memberList;
	private HttpSession session;

	public MemberServlet() {
		memberdto = new MemberDTO();
		memberdao = new MemberDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		session = request.getSession();
		if (command.equals("/memberRegister.mb")) {
			memberdto.setId(request.getParameter("id"));
			memberdto.setPwd(request.getParameter("pwd"));
			memberdto.setAddr(request.getParameter("addr"));
			memberdto.setTel(request.getParameter("tel"));
			try {
				cnt = memberdao.memberRegister(memberdto);
				out.print(cnt + "건 회원이 등록되었습니다.");
				response.sendRedirect("memberList.mb");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberList.mb")) {
			try {
				memberList = memberdao.memberList();
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=member/memberList");
				request.setAttribute("memberList", memberList);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (command.equals("/memberLogin.mb")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			try {
				memberdto = memberdao.memberLogin(id, pwd);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (!(id.equals(memberdto.getId()))) {
				out.print("<script>alert('아이디가 일치하지 않습니다');history.back();</script>");
			} else if (!(pwd.equals(memberdto.getPwd()))) {
				out.print("<script>alert('패스워드가 틀렸습니다.');history.back();</script>");
			} else {
				response.sendRedirect("index.jsp?page=kh");
				session = request.getSession();
				session.setAttribute("id", id);
			}
		} else if (command.equals("/memberLogout.mb")) {
			session.invalidate();
			response.sendRedirect("index.jsp?page=kh");
		}
	}

}
