package com.kh.review.model.Dao;

import java.io.Closeable;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.vo.ImgFile;
import com.kh.review.model.vo.Review;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Review> selectReviewList(Connection conn, String rpage){
		
		ArrayList<Review> list = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, rpage);			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getString("review_no"),
						            rset.getString("rest_no"),
						            rset.getString("nickname"),
						            rset.getString("review_cont"),
						            rset.getString("review_date"),
						            rset.getInt("review_like"),
						            rset.getInt("review_dislike"),
						            rset.getInt("rate_taste"),
						            rset.getInt("rate_price"),
						            rset.getInt("rate_service"),
						            rset.getInt("rate_avg")));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return list;
		

	}
	
	public ArrayList<ImgFile> selectImgFile(Connection conn, String rpage){
		ArrayList<ImgFile> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgList");
		
		try {
			pstmt = conn.prepareStatement(sql);		
			rset = pstmt.executeQuery();
			
			pstmt.setString(1, rpage);
			
			
			while(rset.next()) {
				list.add(new ImgFile(rset.getString("img_file_no"),
						             rset.getString("img_origin_name"),
						             rset.getString("img_change_name"),
						             rset.getString("img_file_path")));
			}
			
			System.out.println("reviewimgDao" + list);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return list;

		
		
		
	}
	
}