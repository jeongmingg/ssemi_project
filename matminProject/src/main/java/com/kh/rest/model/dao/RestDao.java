package com.kh.rest.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.search.model.vo.Search;

public class RestDao {
	
	private Properties prop = new Properties();
	
	public RestDao() {
		try {
			prop.loadFromXML(new FileInputStream(RestDao.class.getResource("/db/sql/rest-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Search> searchKeywordList(Connection conn, String keyword) {
		// select문 => ResultSet(여러행) => ArrayList<Rest>에 담기
		
		ArrayList<Search> list = new ArrayList<Search>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		System.out.println(keyword);
		
		String sql = prop.getProperty("searchKeywordList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				System.out.println("eddd");
				list.add(new Search(rset.getString("rest_no"),
								  rset.getString("rest_name"),
								  rset.getDouble("rest_avg"),
								  rset.getInt("heart"),
								  rset.getString("rest_img_url")));
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
