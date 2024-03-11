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
								   rset.getDouble("rest_avg"),
								   rset.getInt("count_like"),
								   rset.getString("rest_img_url"),
								   rset.getDate("like_date")
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

}
