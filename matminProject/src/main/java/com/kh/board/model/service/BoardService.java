package com.kh.board.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

public class BoardService {
	
	public int selectListCount() {
			
	Connection conn = getConnection();
	int listCount = new BoardDao().selectListCount(conn);
	
	
	
	}
}
