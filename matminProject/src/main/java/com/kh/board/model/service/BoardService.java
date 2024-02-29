package com.kh.board.model.service;

import java.sql.Connection;

import com.kh.board.model.dao.BoardDao;
import com.kh.common.model.vo.PageInfo;

import static com.kh.common.JDBCTemplate.*;

public class BoardService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new BoardDao().selectListCount(conn);
			
		close(conn);
		return listCount;
		}
	
	public void selectBoardList(PageInfo pi) {
		Connection conn = getConnection();
		new BoardDao().selectBoardList(conn, pi);
	}
	
	
}
