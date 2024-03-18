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
	
	public ArrayList<Heart> deleteHeart(String memNo, String restNo) {
		Connection conn = getConnection();
		
		int result = new HeartDao().deleteHeart(conn, memNo, restNo);
		
		ArrayList<Heart> list = new ArrayList<Heart>();
		
		if(result > 0) {
			commit(conn);
			
			list = new HeartDao().selectHeartListByMem(conn, memNo);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Heart> selectHeartByRest(String rpage) {
		Connection conn = getConnection();
		
		ArrayList<Heart> list = new HeartDao().selectHeartByRest(conn, rpage);
		
		close(conn);
		
		return list;
	}

}
