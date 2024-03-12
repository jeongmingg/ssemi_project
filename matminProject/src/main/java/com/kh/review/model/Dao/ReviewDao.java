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
						            rset.getInt("review_rate")));
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
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return list;
	
	}
	
	
	
	public ArrayList<Review> selectReviewListByMem(Connection conn, String memNo) {
		ArrayList<Review> list = new ArrayList<Review>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewListByMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memNo);
			
			rset = pstmt.executeQuery();
			


			while(rset.next()) {
				Review r = new Review();
				
				r.setReviewNo(rset.getString("review_no"));
				r.setReviewWriter(rset.getString("nickname"));
				r.setReviewCont(rset.getString("review_cont"));
				r.setReviewDate(rset.getString("review_date"));
				r.setReviewLike(rset.getInt("review_like"));
				r.setReviewDislike(rset.getInt("review_dislike"));
				r.setReviewRate(rset.getInt("review_rate"));
				
				list.add(r);
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int deleteReview(Connection conn, String rvno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}

	public int insertReview(Connection conn, String rno, String memNo, int score, String rvwCont) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReview");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rno);
			pstmt.setString(2, memNo);
			pstmt.setString(3, rvwCont);
			pstmt.setInt(4, score);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(pstmt);
		} return result;
		
	}
	
	public ArrayList<Review> selectReviewRate(Connection conn, String rpage){
		ArrayList<Review> rate = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewRate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rpage);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				
				r.setReviewRate(rset.getInt("review_rate"));
				r.setReviewCount(rset.getInt("review_count"));
				
				rate.add(r);
				
			}

			System.out.println("reviewdap" + rate);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		} return rate;
	}
	
}
