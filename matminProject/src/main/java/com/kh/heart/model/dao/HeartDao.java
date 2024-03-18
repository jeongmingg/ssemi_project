package com.kh.heart.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.heart.model.vo.Heart;
import static com.kh.common.JDBCTemplate.*;

public class HeartDao {

	private Properties prop = new Properties();

	public HeartDao() {
		
		String filePath = HeartDao.class.getResource("/db/sql/heart-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Heart> selectHeartListByMem(Connection conn, String memNo) {
		ArrayList<Heart> list = new ArrayList<Heart>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHeartListByMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Heart(rset.getString("rest_no"),
					       rset.getString("rest_name"),
					       rset.getString("local_name"),
					       rset.getString("menu_name"),
						   rset.getDouble("rest_avg"),
						   rset.getInt("count_like"),
						   rset.getString("rest_img_url"),
						   rset.getDate("like_date"),
						   rset.getInt("review_count")
								   ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int deleteHeart(Connection conn, String memNo, String restNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteHeart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, restNo);
			pstmt.setString(2, memNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Heart> selectHeartByRest(Connection conn, String rpage) {
		ArrayList<Heart> list = new ArrayList<Heart>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHeartByRest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rpage);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Heart(rset.getString("rest_no"), 
								   rset.getString("mem_no")
								   ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertHeart(Connection conn, String memNo, String restNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertHeart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, restNo);
			pstmt.setString(2, memNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
