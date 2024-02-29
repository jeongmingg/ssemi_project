package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath()));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	}
	
	
}
