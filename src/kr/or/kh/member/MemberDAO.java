package kr.or.kh.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private MemberDTO memberdto;
	private ArrayList<MemberDTO> memberList;
	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
	private int cnt;
	private ResultSet rs;

	public MemberDAO() {
		memberdto = new MemberDTO();
		memberList = new ArrayList<MemberDTO>();
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

	public int memberRegister(MemberDTO memberdto) throws SQLException {
		conn = getConnection();
		sql = "insert into membersuk(id, pwd, addr, tel) values(?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberdto.getId());
		pstmt.setString(2, memberdto.getPwd());
		pstmt.setString(3, memberdto.getAddr());
		pstmt.setString(4, memberdto.getTel());

		cnt = pstmt.executeUpdate();

		return cnt;
	}

	public ArrayList<MemberDTO> memberList() throws SQLException {
		conn = getConnection();
		sql = "select id, pwd, addr, tel from membersuk";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		memberList = new ArrayList<MemberDTO>();
		while (rs.next()) {
			memberdto = new MemberDTO();
			memberdto.setId(rs.getString("id"));
			memberdto.setPwd(rs.getString("pwd"));
			memberdto.setAddr(rs.getString("addr"));
			memberdto.setTel(rs.getString("tel"));
			memberList.add(memberdto);
		}
		return memberList;
	}

	public int memberDelete(String deleteId) throws SQLException {
		conn = getConnection();
		sql = "delete form membersuk where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteId);

		cnt = pstmt.executeUpdate();

		return cnt;
	}

	public MemberDTO memberLogin(String id, String pwd) throws SQLException {
		conn = getConnection();
		sql = "select id, pwd from membersuk where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			memberdto.setId(rs.getString("id"));
			memberdto.setPwd(rs.getString("pwd"));
		}

		return memberdto;
	}

}