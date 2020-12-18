package kr.or.kh.haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfessorDAO extends HaksaDAO {

	public ProfessorDAO() throws ClassNotFoundException {
		
	}	

	public void professorRegisterSql(ProfessorDTO professordto) throws SQLException {
		sql = "insert into professorsuk(age, name, subject) values(?, ?, ?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, professordto.getAge());
		pstmt.setString(2, professordto.getName());
		pstmt.setString(3, professordto.getSubject());
	}

	public int professorExecuter() throws SQLException {
		cnt = pstmt.executeUpdate();

		return cnt;
	}

	public ResultSet professorExecuter(ResultSet rs) throws SQLException {
		rs = pstmt.executeQuery();

		return rs;
	}

	public ResultSet professorListSql() throws SQLException {
		conn = getConnection();
		sql = "select no, age, name, subject from professorsuk";
		pstmt = conn.prepareStatement(sql);
		rs = professorExecuter(rs);

		return rs;
	}

	public int professorDeleteSql(String deleteName) throws SQLException {
		conn = getConnection();
		sql = "delete from professorsuk where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteName);
		cnt = professorExecuter();

		return cnt;
	}

	public ResultSet professorSearchSql(String searchName) throws SQLException {
		conn = getConnection();
		sql = "select no, age, name, subject from professorsuk where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchName);
		rs = professorExecuter(rs);

		return rs;
	}

	public int professorUpdateSql(String updateName, ProfessorDTO professordto) throws SQLException {
		conn = getConnection();
		sql = "update managersuk set age = ?, name = ?, subject = ? where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, professordto.getAge());
		pstmt.setString(2, professordto.getName());
		pstmt.setString(3, professordto.getSubject());
		pstmt.setString(4, updateName);
		cnt = professorExecuter();

		return cnt;
	}
}
