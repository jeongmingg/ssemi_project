package com.kh.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	// 1. Connection 객체 생성한 후 해당 Connection 객체를 반환해주는 getConnection 메소드
	public static Connection getConnection() {
		
		Connection conn = null; // try문 밖에 써야함
		Properties prop = new Properties();
		// Map계열 컬렉션이기 때문에 (key-value)가 들어있음
		// 외부 파일을 읽어드려서 prop채워주어야함. load / loadfromxml 이 있음
		
		// 읽어들이고자 하는 classes 폴더 내에 driver.properties 파일의 물리적인 경로
		String filePath = JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath();
		// "C:/05_server-workspace2/jspProject/WebContent/WEB-INF/classes/db/driver/driver.properties"
		try {
			// prop.load(new FileInputStream("driver.properties 파일의 경로"));
			prop.load(new FileInputStream(filePath)); 
			// "/"라고 쓰면 현재 이 프로젝트에서 클래스파일들이 모여있는 폴더를 가리킴(classes)
			  
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try {
			// jdbc driver 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 접속하고자 하는 db의 url, 계정명, 비밀번호 제시해서 Connection 객체 생성
			conn = DriverManager.getConnection(prop.getProperty("url"),
												prop.getProperty("username"),
												prop.getProperty("password"));
			
			conn.setAutoCommit(false); // 디폴트값 : true
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			return conn;
	}
	
	// 2_1. Connection 객체 전달 받아서 commit 시켜주는 commit 메소드
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
					conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 2_2. 			""			rollback 시켜주는 rollback 메소드
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3_1. Connection 객체 전달 받아서 반납시켜주는 close 메소드
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
	}
	// 3_2. Statement 객체 전달 받아서 반납시켜주는 close 메소드
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3_3. ResultSet 객체 전달 받아서 반납시켜주는 close 메소드
	public static void close(ResultSet rset) {
		try {
			if(rset != null && rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}