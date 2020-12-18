package kr.or.kh.haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO extends HaksaDAO {
	
	public StudentDAO() throws ClassNotFoundException {

	}	

	public void studentRegisterSql(StudentDTO studentdto) throws SQLException {
		sql = "insert into studentsuk(age, name, hakbun) values(?, ?, ?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, studentdto.getAge());
		pstmt.setString(2, studentdto.getName());
		pstmt.setString(3, studentdto.getHakbun());
	}

	public int studentExecuter() throws SQLException {
		cnt = pstmt.executeUpdate();

		return cnt;
	}

	public ResultSet studentExecuter(ResultSet rs) throws SQLException {
		rs = pstmt.executeQuery();

		return rs;
	}

	public ResultSet studentListSql() throws SQLException {
		conn = getConnection();
		sql = "select no, age, name, hakbun from studentsuk";
		pstmt = conn.prepareStatement(sql);
		rs = studentExecuter(rs);

		return rs;
	}

	public int studentDeleteSql(String deleteName) throws SQLException {
		conn = getConnection();
		sql = "delete from studentsuk where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteName);
		cnt = studentExecuter();

		return cnt;
	}

	public ResultSet studentSearchSql(String searchName) throws SQLException {
		conn = getConnection();
		sql = "select no, age, name, hakbun from studentsuk where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchName);
		rs = studentExecuter(rs);

		return rs;
	}

	public int studentUpdateSql(String updateName, StudentDTO studentdto) throws SQLException {
		conn = getConnection();
		sql = "update studentsuk set age = ?, name = ?, hakbun = ? where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, studentdto.getAge());
		pstmt.setString(2, studentdto.getName());
		pstmt.setString(3, studentdto.getHakbun());
		pstmt.setString(4, updateName);
		cnt = studentExecuter();
		
		return cnt;
	}

}
