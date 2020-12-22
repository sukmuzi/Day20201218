package kr.or.kh.board;

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

@WebServlet("*.bo")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDTO boarddto;
	private BoardDAO boarddao;
	private int cnt;
	private ArrayList<BoardDTO> boardList;
	private String searchTitle;

	public BoardServlet() {
		boarddto = new BoardDTO();
		boarddao = new BoardDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if (command.equals("/boardRegister.bo")) {
			boarddto.setTitle(request.getParameter("title"));
			boarddto.setContent(request.getParameter("content"));
			boarddto.setAuthor(request.getParameter("author"));
			boarddto.setNal(request.getParameter("nal"));
			boarddto.setReadcount(Integer.parseInt(request.getParameter("readcount")));
			try {
				cnt = boarddao.boardRegister(boarddto);
				out.print(cnt + "건 등록되었습니다.");
				response.sendRedirect("boardList.bo");

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (command.equals("/boardList.bo")) {
			try {
				boardList = boarddao.boardList();
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=board/boardList");
				request.setAttribute("boardList", boardList);
				dis.forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardDelete.bo")) {
			String no1 = request.getParameter("no");
			int no = Integer.parseInt(no1);
			try {
				cnt = boarddao.boardDelete(no);
				response.sendRedirect("boardList.bo");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (command.equals("/boardSearch.bo")) {
			String searchTitle = request.getParameter("searchTitle");
			String readcount = request.getParameter("readcount");
			try {
				boarddto = boarddao.boardSearch(searchTitle);
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=board/boardSearch");
				request.setAttribute("boarddto", boarddto);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (command.equals("/boardUpdateSearch.bo")) {
			searchTitle = request.getParameter("searchTitle");
			try {
				boarddto = boarddao.boardSearch(searchTitle);
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=board/boardUpdateConfirm");
				request.setAttribute("boarddto", boarddto);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (command.equals("/boardUpdateFinal.bo")) {
			searchTitle = request.getParameter("searchTitle");
			boarddto.setNo(Integer.parseInt(request.getParameter("no")));
			boarddto.setTitle(request.getParameter("title"));
			boarddto.setContent(request.getParameter("content"));
			boarddto.setAuthor(request.getParameter("author"));
			boarddto.setNal(request.getParameter("nal"));
			boarddto.setReadcount(Integer.parseInt(request.getParameter("readcount")));
			try {
				cnt = boarddao.boardUpdateFinal(boarddto, searchTitle);
				boardList = boarddao.boardList();
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=board/boardList");
				request.setAttribute("boardList", boardList);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
