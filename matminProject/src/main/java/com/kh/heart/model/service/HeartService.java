package com.kh.heart.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.heart.model.dao.HeartDao;
import com.kh.heart.model.vo.Heart;

public class HeartService {
	
	public ArrayList<Heart> selectHeartListByMem(String memNo) {
		Connection conn = getConnection();
		
		ArrayList<Heart> list = new HeartDao().selectHeartListByMem(conn, memNo);
		
		close(conn);
		
		return list;
	}

}
