package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	private static Connection conn = null;
	
	/**
	 * 생성자
	 */
	private DBConn() {
	}
	
	/**
	 * DB연결 시작 메소드
	 * @return url, user, pwd 정보를 담은 Connection 리턴
	 */
	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@//127.0.0.1/XE"; // 아이피주소 입력해 주세요...
		String user = ""; // 아이디 입력해 주세요...
		String pwd = ""; // 비밀번호 입력해 주세요...

		if (conn == null) {

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, pwd);

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return conn;
	}
	
	/**
	 *  DB연결 종료 메소드
	 */
	public static void close() {
		if (conn == null)
			return;
		
		try {
			if (!conn.isClosed())
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		conn = null;
	}

}
