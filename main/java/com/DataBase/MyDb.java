package com.DataBase;

import java.sql.*;

public class MyDb {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private String url;

	public MyDb() {
	}

	public void getConn(String dbname, String uid, String pwd) throws Exception {
		try {
			url = "jdbc:mysql://localhost:3306/" + dbname + "?characterEncoding=utf8";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, uid, pwd);
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch (Exception ex) {
			System.err.println("conn error!" + ex.getMessage());
		}
	}

	public ResultSet executeQuery1(String sql) throws Exception {
		rs = null;
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println("query error!" + ex.getMessage());
		}
		return rs;
	}

	public void executeUpdate2(String sql) throws Exception {
		rs = null;
		try {
			stmt.execute(sql);
		} catch (SQLException ex) {
			System.err.println("update error!" + ex.getMessage());
		}
	}

	public void closeStmt() {
		try {
			stmt.close();
		} catch (SQLException ex) {
			System.err.println("close stmt error!" + ex.getMessage());
		}
	}

	public void closeConn() {
		try {
			conn.close();
		} catch (SQLException ex) {
			System.err.println("close conn error!" + ex.getMessage());
		}
	}

	public boolean matchUser(String id, String passwd) throws Exception {
//    String sql = "select user_password from users where user_id=" + id;
		String sql = null;
		sql = String.format("select user_password from users where user_id='%s'", id);
		boolean flag = false;

		try {
			ResultSet rs = stmt.executeQuery(sql);
			String tmp;
			while (rs.next()) {
				tmp = rs.getString("user_password");
				if (tmp.equals(passwd)) {
					flag = true;
				}
			}
		} catch (SQLException ex) {
			System.err.println("query error!" + ex.getMessage());
		}
		return flag;
	}

	public boolean addUser(String id, String passwd, String nickname, String email, String ques, String ans)
			throws Exception {
		// String sql = "insert into users values("+id+','+passwd + ')';
		String sql = null;
		sql = String.format("select user_password from users where user_id='%s'", id);
		boolean flag = false;
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			return flag;
		}
		sql = null;
		sql = String.format("insert into users values('%s','%s','%s','%s','%s','%s')", id, passwd, nickname, email,
				ques, ans);
		flag = false;

		try {
			int count = stmt.executeUpdate(sql);
			flag = count > 0 ? true : false;
		} catch (SQLException ex) {
			System.err.println("add error!" + ex.getMessage());
		}
		return flag;
	}

	public boolean matchAdmin(String id, String passwd) throws Exception {
		String sql = "select admin_password from admins where admin_id=" + id;

		boolean flag = false;

		try {
			ResultSet rs = stmt.executeQuery(sql);
			String tmp;
			while (rs.next()) {
				tmp = rs.getString("admin_password");
				if (tmp.equals(passwd)) {
					flag = true;
				}
			}
		} catch (SQLException ex) {
			System.err.println("query error!" + ex.getMessage());
		}
		return flag;
	}
}
