package kr.or.kh.haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ManagerDAO extends HaksaDAO {	

	public ManagerDAO() throws ClassNotFoundException {
		
	}	

	public void managerRegisterSql(ManagerDTO managerdto) throws SQLException {
		sql = "insert into managersuk(age, name, part) values(?, ?, ?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, managerdto.getAge());
		pstmt.setString(2, managerdto.getName());
		pstmt.setString(3, managerdto.getPart());
	}

	public int managerExecuter() throws SQLException {
		cnt = pstmt.executeUpdate();

		return cnt;
	}

	public ResultSet managerExecuter(ResultSet rs) throws SQLException {
		rs = pstmt.executeQuery();

		return rs;
	}

	public ResultSet managerListSql() throws SQLException {
		conn = getConnection();
		sql = "select no, age, name, part from managersuk";
		pstmt = conn.prepareStatement(sql);
		rs = managerExecuter(rs);

		return rs;
	}

	public int managerDeleteSql(String deleteName) throws SQLException {
		conn = getConnection();
		sql = "delete from managersuk where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deleteName);
		cnt = managerExecuter();

		return cnt;
	}

	public ResultSet managerSearchSql(String searchName) throws SQLException {
		conn = getConnection();
		sql = "select no, age, name, part from managersuk where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchName);
		rs = managerExecuter(rs);

		return rs;
	}

	public int managerUpdateSql(String updateName, ManagerDTO managerdto) throws SQLException {
		conn = getConnection();
		sql = "update managersuk set age = ?, name = ?, part = ? where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, managerdto.getAge());
		pstmt.setString(2, managerdto.getName());
		pstmt.setString(3, managerdto.getPart());
		pstmt.setString(4, updateName);
		cnt = managerExecuter();

		return cnt;
	}
}
