package kr.or.kh.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO implements IBoard {
	private Connection conn;
	private BoardDTO boarddto;
	private String sql;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int cnt;
	private ArrayList<BoardDTO> boardList;
	private String searchTitle;

	public BoardDAO() {
		boarddto = new BoardDTO();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws SQLException {
		conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8",
				"bbr123", "alstjr95!");

		return conn;
	}

	public void boardClose() {
		try {
			conn.close();
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int boardRegister(BoardDTO boarddto) throws SQLException {
		conn = getConnection();

		sql = "insert into boardsuk(title, content, author, nal, readcount) values(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, boarddto.getTitle());
		pstmt.setString(2, boarddto.getContent());
		pstmt.setString(3, boarddto.getAuthor());
		pstmt.setString(4, boarddto.getNal());
		pstmt.setInt(5, boarddto.getReadcount());

		cnt = pstmt.executeUpdate();

		return cnt;
	}

	@Override
	public ArrayList<BoardDTO> boardList() throws SQLException {

		conn = getConnection();
		sql = "select no,title,content,author,nal,readcount from boardsuk order by no asc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		boardList = new ArrayList<BoardDTO>();

		while (rs.next()) {
			boarddto = new BoardDTO();
			boarddto.setNo(rs.getInt("no"));
			boarddto.setTitle(rs.getString("title"));
			boarddto.setContent(rs.getString("content"));
			boarddto.setAuthor(rs.getString("author"));
			boarddto.setNal(rs.getString("nal"));
			boarddto.setReadcount(Integer.parseInt(rs.getString("readcount")));
			boardList.add(boarddto);
		}
		return boardList;
	}

	@Override
	public int boardDelete(int no) throws SQLException {

		conn = getConnection();
		sql = "delete from boardsuk where no = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		cnt = pstmt.executeUpdate();

		return cnt;

	}

	@Override
	public BoardDTO boardSearch(String searchTitle) throws SQLException {
		conn = getConnection();

		sql = "select no, title, content, author, nal, readcount from boardsuk where title = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchTitle);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			boarddto.setNo(rs.getInt("no"));
			boarddto.setTitle(rs.getString("title"));
			boarddto.setContent(rs.getString("content"));
			boarddto.setAuthor(rs.getString("author"));
			boarddto.setNal(rs.getString("nal"));
			boarddto.setReadcount(rs.getInt("readcount"));
		}

		return boarddto;
	}

	@Override
	public void boardReadcount(BoardDTO boarddto) throws SQLException {
		conn = getConnection();

		sql = "update boardsuk set readcount = ? where no = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boarddto.getReadcount() + 1);
		pstmt.setInt(2, boarddto.getNo());

		cnt = pstmt.executeUpdate();
	}

	@Override
	public int boardUpdateFinal(BoardDTO boarddto, String searchTitle) throws SQLException {
		conn = getConnection();

		sql = "update boardsuk set title = ?, content = ?, author = ?, nal = ?, readcount = ? where title = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, boarddto.getTitle());
		pstmt.setString(2, boarddto.getContent());
		pstmt.setString(3, boarddto.getAuthor());
		pstmt.setString(4, boarddto.getNal());
		pstmt.setInt(5, boarddto.getReadcount());
		pstmt.setString(6, searchTitle);

		cnt = pstmt.executeUpdate();

		return cnt;
	}

	@Override
	public int totalCount() {// 페이징처리: 전체레코드 개수 구하기
		int count = 0;
		try {
			conn = getConnection();
			sql = "select count(*) from boardsuk";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}// 페이징처리: 전체레코드 개수 구하기

	@Override
	public PageTo page(int curPage) {// 페이지구현
		PageTo pageTo = new PageTo();
		int totalCount = totalCount();
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			sql = "select no, title, content, author, nal, readcount from boardsuk";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			// TYPE_SCROLL_INSENSITIVE:scroll은 가능하나, 변경된 사항은 적용되지 않음
			// 양방향, 스크롤 시 업데이트 반영안함
			// CONCUR_READ_ONLY :커서의 위치에서 정보 업데이트 불가,ResultSet의 변경이 불가능
			rs = pstmt.executeQuery();
			int perPage = pageTo.getPerPage();// 5
			int skip = (curPage - 1) * perPage;
			if (skip > 0) {
				rs.absolute(skip);
			}
			// ResultSet의 absolute메소드를 이용하여 해당 페이지의 Cursor 의 위치로 이동...
			for (int i = 0; i < perPage && rs.next(); i++) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String author = rs.getString("author");
				String nal = rs.getString("nal");
				int readCount = rs.getInt("readcount");

				BoardDTO data = new BoardDTO();
				data.setNo(no);
				data.setTitle(title);
				data.setContent(content);
				data.setAuthor(author);
				data.setNal(nal);
				data.setReadcount(readCount);
				list.add(data);
			}
			pageTo.setList(list);// ArrayList 저장
			pageTo.setTotalCount(totalCount);// 전체레코드개수
			pageTo.setCurPage(curPage);// 현재페이지
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pageTo;
	}// 페이지구현

}
