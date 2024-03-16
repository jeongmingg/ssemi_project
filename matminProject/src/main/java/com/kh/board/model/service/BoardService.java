package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.ImgFile;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.rest.model.vo.Rest;

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
	
	public int insertBoard(Board b, ImgFile img) {
			Connection conn = getConnection();
			
			// Board테이블 인서트
			int result1 = new BoardDao().insertBoard(conn, b);
			
			// ImgFile테이블
			int result2 = 1;
			
			if(img != null) {
				result2 = new BoardDao().insertBImgFile(conn, img);
			}
			
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
		
			return result1 * result2;
	}

	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		} else { 
			rollback(conn);
		} return result;
	}
	
	public Board selectBoard(int boardNo) {
	Connection conn = getConnection();
	
	Board b = new BoardDao().selectBoard(conn, boardNo);

	close(conn);
	return b;
}
	
	public ImgFile selectImgFile(int boardNo) {
		Connection conn = getConnection();
		
		ImgFile img = new BoardDao().selectImgFile(conn, boardNo);
		
		close(conn);
		return img;
	}
	
	public int updateBoard(Board b, ImgFile img) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1;
		
		if(img != null) { // 새로운 첨부파일이 있을경우 
			if(img.getImgFileNo() != null) { // 원래있는데 수정
				result2 = new BoardDao().updateImgFile(conn, img);
			} else { // 없는상태에서 추가
				result2 = new BoardDao().insertUpdateImgFile(conn, img);
			}
			
		}
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} close(conn);
		
		return result1 * result2;
		
	}
	
	public int deleteBoard(String bno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, bno);
		
		if(result > 0) {
			commit(conn);
		} else {
			close(conn);
		} return result;
	}
	
	public ArrayList<Board> selectBoardListByMem(String memNo) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardListByMem(conn, memNo);
		
		close(conn);
		
		return list;
	}

	
	public Board selectDetailBoard(int boardNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectDetailBoard(conn,boardNo);
		
		close(conn);
		return b;
	}
	
	public ArrayList<Board>  boardSearchList(String keyWord) {
		Connection conn = getConnection();
		
		ArrayList<Board> sList = new BoardDao().boardSearchList(conn, keyWord);
		
		close(conn);
		return sList;
	}

}
