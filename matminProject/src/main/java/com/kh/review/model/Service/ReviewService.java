package com.kh.review.model.Service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.vo.ImgFile;
import com.kh.review.model.Dao.ReviewDao;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.RvLike;

public class ReviewService {
	
	public ArrayList<Review> selectReviewList(String rpage){
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectReviewList(conn, rpage);
		
//		ArrayList<ImgFile> ImgList = new ReviewDao().selectImgFile();
				
		close(conn);
		return list;
	}
	
	public ArrayList<ImgFile> selectImgFile(String rpage){
		Connection conn = getConnection();
		ArrayList<ImgFile> ImgList = new ReviewDao().selectImgFile(conn, rpage);
		
		close(conn);
		return ImgList;
	}
	
	public ArrayList<Review> selectReviewListByMem(String memNo) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectReviewListByMem(conn, memNo);
		
		close(conn);
		
		return list;
	}
	
	public int deleteReview(String rvno) {
		Connection conn = getConnection();
		int result = new ReviewDao().deleteReview(conn, rvno);
	

		close(conn);
		return result;
	}

	public int insertReview(String rno,  String memNo, int score, String rvwCont) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().insertReview(conn, rno, memNo, score, rvwCont);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		} return result;
	}
	
	public ArrayList<Review> selectReviewRate(String rpage){
		Connection conn = getConnection();
		
		ArrayList<Review> rate = new ReviewDao().selectReviewRate(conn, rpage);
		
		close(conn);
		return rate;
		
	}
	
	public Review selectReviewAvg(String rpage) {
		Connection conn = getConnection();
		
		Review rv = new ReviewDao().selectReviewAvg(conn, rpage);
		
		close(conn);
		return rv;
	}
	
	public boolean checkLiked(String rvNo, String logName) {
		Connection conn = getConnection();
		
		boolean liked = new ReviewDao().checkLiked(conn, rvNo, logName);
		
		close(conn);
		return liked;

	}
	
	public int insertLike(String rvNo, String logName) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().insertLike(conn, rvNo, logName);
		
		if(result > 0) {
			
			int lResult = new ReviewDao().insertRvLike(conn, rvNo);
			
			if(lResult > 0) {		
				commit(conn);
			} else {
				rollback(conn);
			}
			
		}else {
			rollback(conn);
			
		}
		close(conn);
		return result;
		}
	
	public int deleteLike(String rvNo, String logName) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteLike(conn, rvNo, logName);
		
		if(result > 0) {
			int dResult = new ReviewDao().deleteRvLike(conn, rvNo);
			
			if(dResult > 0) {		
				commit(conn);
			} else {
				rollback(conn);
			}
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public RvLike selectLike(String rvNo, String logName) {
		Connection conn = getConnection();
		
		RvLike result = new ReviewDao().selectLike(conn, rvNo, logName);
		
		close(conn);
		return result;
		}
	
	public RvLike countLike(String rvNo) {
		Connection conn = getConnection();
		
		RvLike count = new ReviewDao().countLike(conn, rvNo);
		
		System.out.println("rvLikeSERVICE : " + count);
		close(conn);
		return count;
	}
	
}


