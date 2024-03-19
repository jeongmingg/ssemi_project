package com.kh.rest.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.vo.ImgFile;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.Category;
import com.kh.common.model.vo.Location;
import com.kh.common.model.vo.Menu;
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
	
	public int insertRest(Rest r, ImgFile img, Menu menu ) {
		Connection conn = getConnection();
		 int result1 = new RestDao().insertRest(conn, r );
		 int result2= 0;
		 
		 if (result1 != 0) {
		    result2 = new RestDao().insertMenu(conn, menu);
		
		 if (img !=null){
			result2 = new RestDao().insertRestAt(conn,img);
		 }
		 if (result1> 0 && result2>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		close(conn);		
	}
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
	public int updateRest(Rest r, ImgFile img) {
		Connection conn = getConnection();
		
		int result1 = new RestDao().updateRest(conn,r);
		int result2= 1;
		
		if(img != null) {
		if(img.getImgFileNo() != null) {
				result2 = new RestDao().updateRestAt(conn,img);
			}else {
				result2 = new RestDao().insertUpdateRestAt(conn,img);
			}
		}
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} close(conn);
		
		return result1 * result2;
		
	}


	public ArrayList<Rest> locationSearch(String keyword, String locationName, String categoryName, String rsFunction, String funcState){
		
		Connection conn = getConnection();
		ArrayList<Rest> lcList = new RestDao().locationSearch(conn, keyword, locationName, categoryName, rsFunction, funcState);
		
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
<<<<<<< HEAD


	public Rest selectRestMain(String restNo) {
		Connection conn = getConnection();
		
		Rest r = new RestDao().selectRestMain(conn, restNo);
				close(conn);
		return r;
	}
//	public ArrayList<Rest> searchByKeyword(String keyword) {
//		Connection conn = getConnection();
//		ArrayList<Rest> rlist = new RestDao().searchByKeyword(conn, keyword);
//		close(conn); 
//		return rlist;
//
//	}
=======
	
	public ArrayList<Rest> contentRestList(ArrayList<String> categoryList){
		Connection conn = getConnection();
		ArrayList<Rest> list = new RestDao().contentRestList(conn, categoryList);
		
		close(conn); 
		return list;
	}
>>>>>>> 25e21cb506f2fdfa234fe59ed273812ef9eb3bd1
}

























