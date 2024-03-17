package com.kh.rest.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.vo.ImgFile;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.Category;
import com.kh.common.model.vo.Location;
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

	public ArrayList<Rest> selectBannerRestList(String selectedGrade){
		
		Connection conn = getConnection();
		ArrayList<Rest> list = new RestDao().selectBannerRestList(conn, selectedGrade);
		
		close(conn); 
		return list;
	}

	public ArrayList<Category> selectCategoryList(){
		Connection conn = getConnection();
		ArrayList<Category> list = new RestDao().selectCategoryList(conn);
		close(conn);
		return list;
	}

	public Rest selectRestDetail(String rpage){
		Connection conn = getConnection();
		Rest r = new RestDao().selectRestDetail(conn, rpage);
		
		close(conn);
		return r;
	}
	
	public int insertRest(Rest r, ImgFile img ) {
		Connection conn = getConnection();
		int result1 = new RestDao().insertRest(conn, r);
		System.out.println("서비스의 " + img);
		
		int result2 = 1;
		if (img !=null){
			result2 = new RestDao().insertRestAt(conn,img);
		}
		if (result1> 0 && result2>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		close(conn);
		 return result1*result2;
		
	}
	
	public Rest selectRest(String restNo) {
		Connection conn = getConnection();
		
		Rest r = new RestDao().selectRestDetail(conn, restNo);
		
		close(conn);
		return r;	
		
	}
	
	public ArrayList<Rest> rsRecommend(String ctgName) {
		
		Connection conn = getConnection();
		ArrayList<Rest> list = new RestDao().rsRecommend(conn, ctgName);
		
		close(conn); 
		return list;
		
	}
	public int updateRest(Rest r, Attachment at) {
		Connection conn = getConnection();
		int result = new RestDao().updateRest(conn,r);
//		int result2= 1;
//		if(at != null) {
//			if(at.getRefNo() != null) {
//				result2 = new RestDao().updateAttFile(conn,at);
//			}else {
//				result2 = new RestDao().insertUpdateAttFile(conn,at);
//			}
//		}
//		if(result1 >0 && result2 >0) {
//			commit(conn);
//		}else {
			rollback(conn);
			close(conn);
			return result;
		}
	


	public ArrayList<Rest> locationSearch(String keyword, String locationName, String categoryName){
		
		Connection conn = getConnection();
		ArrayList<Rest> lcList = new RestDao().locationSearch(conn, keyword, locationName, categoryName);
		
		close(conn); 
		return lcList;
	}
	
	public ArrayList<Rest> selectMenuList(String rpage) {
		Connection conn = getConnection();
		
		ArrayList<Rest> mList = new RestDao().selectMenuList(conn, rpage);
		
		System.out.println(mList);
		close(conn);
		return mList;
		
	}
	public ArrayList<Location> selectLocationList(){
		Connection conn = getConnection();
		
		ArrayList<Location> lList = new RestDao().selectLocationList(conn);
		
		close(conn);
		return lList;
	}
	
	public ImgFile selectAttachment(String restNo) {
		Connection conn = getConnection();
		ImgFile img = new RestDao().selectAttachment(conn,restNo);
		close(conn);
		return img;
	}

	public Rest selectRestMain(String restNo) {
		Connection conn = getConnection();
		
		Rest r = new RestDao().selectRestMain(conn, restNo);
				close(conn);
		return r;
	}
}

