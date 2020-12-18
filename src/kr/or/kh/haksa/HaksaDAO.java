package kr.or.kh.haksa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HaksaDAO {
	protected String sql;
	protected PreparedStatement pstmt;
	protected Connection conn;
	protected int cnt;
	protected ResultSet rs;
	
	public HaksaDAO() throws ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
	}
	
	public Connection getConnection() throws SQLException {
		conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8",
				"bbr123", "alstjr95!");

		return conn;
	}
}
