package com.kh.review.model.Service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.vo.ImgFile;
import com.kh.review.model.Dao.ReviewDao;
import com.kh.review.model.vo.Review;

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

	public int insertReview(String rno,  String memNo, int rvwStar, String rvwCont) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().insertReview(conn, rno, memNo, rvwStar, rvwCont);
		
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		} return result;
	}
}
