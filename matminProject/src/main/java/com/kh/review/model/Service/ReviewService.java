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

}