package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.ImgFile;
import com.kh.common.model.vo.PageInfo;

import static com.kh.common.JDBCTemplate.*;

public class BoardService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new BoardDao().selectListCount(conn);
			
		close(conn);
		return listCount;
		}
	
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectBoardList(conn, pi);
		
		close(conn);
		return list;
	}
	
//	public Board selectBoard(int boardNo) {
//		Connection conn = getConnection();
//		
//		Board b = new BoardDao().selectBoard(conn, boardNo);
//	
//		close(conn);
//		return b;
//	}
	
	public int insertBoard(Board b, ImgFile img) {
			Connection conn = getConnection();
			
			// Board테이블 인서트
			
			int result1 = new BoardDao().insertBoard(conn, b);
			int result2 = 1;
			
			if(img != null) {
				result2 = new BoardDao().insertBImgFile(conn, b, img);
			}
			
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
		
			return result1 * result2;
	}
}
