package com.kh.rest.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.Category;
import com.kh.common.model.vo.PageInfo;
import com.kh.rest.model.dao.RestDao;
import com.kh.rest.model.vo.Rest;
import com.kh.search.model.vo.Search;

public class RestService {

	public ArrayList<Search> searchKeywordList(String keyword){
		
		Connection conn = getConnection();
		ArrayList<Search> list = new RestDao().searchKeywordList(conn, keyword);
		close(conn); 
		return list;
	}
	
	public ArrayList<Rest> selectAllRestList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Rest> list = new RestDao().selectAllRestList(conn, pi);
		
		close(conn);
		return list;
	}
	
	public int selectRestCount() {
		Connection conn = getConnection();
		int restCount = new RestDao().selectRestCount(conn);
		
		close(conn);
		return restCount;
	}

	public ArrayList<Rest> selectRestList(String lname){
		
		Connection conn = getConnection();
		ArrayList<Rest> list = new RestDao().selectRestList(conn, lname);
		close(conn); 
		return list;
	}
	public ArrayList<Rest> selectBannerRestList(String grade){
		
		Connection conn = getConnection();
		ArrayList<Rest> list = new RestDao().selectBannerRestList(conn, grade);
		close(conn); 
		return list;
	}

	
	public ArrayList<Category> selectCategoryList(){
		Connection conn = getConnection();
		ArrayList<Category> list = new RestDao().selectCategoryList(conn);
		close(conn);
		return list;
	}
	
	public int insertRest(Rest r, Attachment at ) {
		
		Connection conn = getConnection();
		
		int result1 = new RestDao().insertRest(conn,r);
		
		int result2 = 1;
		
		if(at !=null) {
//			result2 = new RestDao().insertRestAt(conn,at);
		}
		if(result1 >0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}
}
