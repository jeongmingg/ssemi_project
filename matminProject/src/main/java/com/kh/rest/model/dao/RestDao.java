
package com.kh.rest.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;
import com.kh.board.model.vo.ImgFile;
import com.kh.common.model.vo.Category;
import com.kh.common.model.vo.Location;
import com.kh.common.model.vo.Menu;
import com.kh.common.model.vo.PageInfo;
import com.kh.rest.model.vo.Rest;
import com.kh.search.model.vo.Search;

public class RestDao {
	
	private Properties prop = new Properties();
	
	public RestDao() {
		try {
			prop.loadFromXML(new FileInputStream(RestDao.class.getResource("/db/sql/rest-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Search> searchKeywordList(Connection conn, String keyword) {
		// select문 => ResultSet(여러행) => ArrayList<Rest>에 담기
		
		ArrayList<Search> list = new ArrayList<Search>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchKeywordList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {

				list.add(new Search(rset.getString("rest_no"),
								  rset.getString("rest_name"),
								  rset.getDouble("rest_avg"),
								  rset.getInt("heart"),
								  rset.getString("rest_img_url"),
								  rset.getString("rest_address"),
								  rset.getString("local_name"),
								  rset.getString("menu_name"),
								  rset.getInt("review_count"),
								  rset.getString("rep_menu")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
			return list;
		
		
	}
	
	public ArrayList<Rest> selectAllRestList(Connection conn , PageInfo pi){
		//데이터 담을 객체 만들기
		ArrayList<Rest> list = new ArrayList<Rest>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllRestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Rest(rset.getString("rest_no"),
									rset.getString("local_name"),
									rset.getString("rest_name"),
									rset.getString("ctg_name"),
									rset.getString("rest_address"),
									rset.getString("rest_tel"),
									rset.getInt("rest_avg")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int selectRestCount (Connection conn) {
		int restCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRestCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				restCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return restCount;
		
		
	}

	public ArrayList<Rest> selectRestList(Connection conn, String lname) {
		
		// select문 => ResultSet(여러행) => ArrayList<Rest>에 담기
		
		ArrayList<Rest> list = new ArrayList<Rest>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, lname);
			
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Rest(rset.getString("rest_no"),
								  rset.getString("rest_name"),
								  rset.getDouble("rest_avg"),
								  rset.getString("rest_img_url"),
								  rset.getString("local_name"),
								  rset.getInt("review_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
			return list;
		
	}
	

	public ArrayList<Category> selectCategoryList(Connection conn){
		
		ArrayList<Category> list = new ArrayList<Category>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getString("ctg_id"),
										rset.getString("ctg_name")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
		
	}
	
	public int insertRest(Connection conn, Rest r) {
		
		int result = 0;
		 PreparedStatement pstmt = null;
		 
		 String sql = prop.getProperty("insertRest");
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRestLocalId());
			pstmt.setString(2, r.getRestName());
			pstmt.setString(3, r.getCtgId());
			pstmt.setString(4, r.getRestAddress());
			pstmt.setString(5, r.getRestTel());
			pstmt.setString(6, r.getRestParking());
			pstmt.setString(7, r.getRestTime());
			pstmt.setString(8, r.getDt());
			pstmt.setString(9, r.getAnmial());
			pstmt.setString(10, r.getRoom());
			pstmt.setString(11, r.getBigRoom());
			
			result = pstmt.executeUpdate();
		//	System.out.println("Dao의 " + r);
		//	System.out.println("Dao의 " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		 return result;
	}
		
	public Rest selectRestDetail(Connection conn, String rpage){
		Rest r = new Rest();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRestDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rpage);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				r = new Rest(
						rset.getString("rest_no"),
						rset.getString("rest_name"),
						rset.getString("rest_address"),
						rset.getString("rest_tel"),
						rset.getString("rest_parking"),
						rset.getInt("rest_grade"),
						rset.getString("rest_time"),
						rset.getDouble("rest_avg"),
						rset.getString("rest_img_url"),
						rset.getString("local_name"),
						rset.getInt("review_count"),
						rset.getString("dt"),
						rset.getString("animal"),
						rset.getString("room"),
						rset.getString("big_room"),
						rset.getString("ctg_name"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return r;
		
	}

	public ArrayList<Rest> selectBannerRestList(Connection conn, String selectedGrade){
		ArrayList<Rest> list = new ArrayList<Rest>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBannerRestList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, selectedGrade);
			pstmt.setString(2, selectedGrade);
			pstmt.setString(3, selectedGrade);
			pstmt.setString(4, selectedGrade);
			pstmt.setString(5, selectedGrade);
			
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Rest(rset.getString("rest_no"),
								  rset.getString("rest_name"),
								  rset.getDouble("rest_avg"),
								  rset.getString("rest_img_url"),
								  rset.getInt("review_count"),
								  rset.getString("menu_name"),
								  rset.getString("menu_price"),
								  rset.getString("local_name")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertRestAt(Connection conn, ImgFile img) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRestAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getImgOriginName());
			pstmt.setString(2, img.getImgChangeName());
			pstmt.setString(3, img.getImgFilePath());
			
			result = pstmt.executeUpdate();
			//System.out.println(img);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<Rest> rsRecommend(Connection conn, String ctgName) {
		
		ArrayList<Rest> list = new ArrayList<Rest>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("rsRecommend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(ctgName.equals("전체")) {
				pstmt.setString(1, "");
			}else {
				pstmt.setString(1, ctgName);
			}
			
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Rest(rset.getString("rest_no"),
								  rset.getString("rest_name"),
								  rset.getString("rest_img_url"),
								  rset.getString("ctg_id"),
								  rset.getString("ctg_name")));
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Rest> locationSearch(Connection conn, String keyword, String locationName, String categoryName, String rsFunction, String funcState){
		
		ArrayList<Rest> lcList = new ArrayList<Rest>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("locationSearch");
			if (rsFunction != null && !rsFunction.isEmpty() && funcState != null && !funcState.isEmpty()) {
				sql += " AND " + rsFunction + "= ?";
			
	    }
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			
			if(locationName != null && !locationName.equals("전체")) {
				pstmt.setString(4, locationName);
			}else {
				pstmt.setString(4, "");
			}
			
			if(categoryName != null && !categoryName.equals("전체")) {
				pstmt.setString(5, categoryName);
			}else {
				pstmt.setString(5, "");
			}
			
			if (rsFunction != null && !rsFunction.isEmpty() && funcState != null && !funcState.isEmpty()) {
			
				pstmt.setString(6, funcState);

			}
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				lcList.add(new Rest(rset.getString("rest_no"),
						  rset.getString("rest_name"),
						  rset.getDouble("rest_avg"),
						  rset.getInt("heart"),
						  rset.getString("rest_img_url"),
						  rset.getString("rest_address"),
						  rset.getString("local_name"),
						  rset.getString("menu_name"),
						  rset.getInt("review_count"),
						  rset.getString("rep_menu"),
						  rset.getString("ctg_name")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return lcList;

	}
	
	public int updateRest(Connection conn, Rest r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getRestLocalId());
			pstmt.setString(2, r.getRestName());
			pstmt.setString(3, r.getCtgId());
			pstmt.setString(4, r.getRestAddress());
			pstmt.setString(5, r.getRestTel());
			pstmt.setString(6, r.getRestParking());
			pstmt.setString(7, r.getRestTime());
			pstmt.setString(8, r.getAnmial());
			pstmt.setString(9, r.getRoom());
			pstmt.setString(10, r.getBigRoom());
			pstmt.setString(11, r.getRestNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Rest> selectMenuList(Connection conn, String rpage){
		ArrayList<Rest> mList = new ArrayList<Rest>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMenuList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rpage);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				mList.add(new Rest(rset.getString("menu_name"),
						           rset.getString("menu_price"),
						           rset.getString("rep_menu")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return mList;
	}

	public ArrayList<Location> selectLocationList(Connection conn){
		ArrayList<Location> lList = new ArrayList<Location>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLocationList");
		
		try {
			pstmt= conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
					lList.add(new Location(rset.getString("local_id"),
											rset.getString("local_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return lList;
	}
	
	public ImgFile selectAttachment(Connection conn, String restNo) {
		ImgFile img = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, restNo);
			rset = pstmt.executeQuery();

				if (rset.next()) {
					img = new ImgFile(rset.getString("img_file_no"), 
										rset.getString("img_origin_name"),
										rset.getString("img_change_name"), 
										rset.getString("img_file_path"));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return img;
	}

	public ArrayList<Rest> contentRestList(Connection conn, ArrayList<String> categoryList){
		ArrayList<Rest> list = new ArrayList<Rest>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("contentRestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Rest(rset.getString("rest_no"),
						  rset.getString("rest_name"),
						  rset.getString("rest_img_url"),
						  rset.getString("ctg_name"),
						  rset.getDouble("rest_avg"),
						  rset.getInt("review_count")));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	} 
	
	public ArrayList<Rest> bannerSearch(Connection conn, String locationName, String selectedGrade){
		
		ArrayList<Rest> list = new ArrayList<Rest>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("bannerSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(selectedGrade != null) {
				pstmt.setString(1, selectedGrade);
				pstmt.setString(2, selectedGrade);
				pstmt.setString(3, selectedGrade);
				pstmt.setString(4, selectedGrade);
				pstmt.setString(5, selectedGrade);
			}else {
				pstmt.setString(1, "");
				pstmt.setString(2, "");
				pstmt.setString(3, "");
				pstmt.setString(4, "");
				pstmt.setString(5, "");
			}
			
			if(locationName.equals("전체")) {
				pstmt.setString(6, "%");
			}else {
				pstmt.setString(6,  "%" +  locationName);
			}
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Rest(rset.getString("rest_no"),
								  rset.getString("rest_name"),
								  rset.getDouble("rest_avg"),
								  rset.getString("rest_img_url"),
								  rset.getInt("review_count"),
								  rset.getString("menu_name"),
								  rset.getString("menu_price"),
								  rset.getString("local_name")));
			}
			
		} catch (SQLException e) {
		e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
			return list;
		} 
		
	
	public int insertMenu(Connection conn, HashMap<String, String> map, int i) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMenu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("menu"));
			pstmt.setString(2, map.get("price"));
			
			if(i == 0) {
				pstmt.setString(3, "Y");
			}else {
				pstmt.setString(3, "N");
			}
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateRestAt(Connection conn, ImgFile img) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateRestAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getImgOriginName());
			pstmt.setString(2, img.getImgChangeName());
			pstmt.setString(3, img.getImgFilePath());
			pstmt.setString(4, img.getImgFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}

	public int insertUpdateRestAt(Connection conn, ImgFile img) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertUpdateRestAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getRefNo());
			pstmt.setString(2, img.getImgOriginName());
			pstmt.setString(3, img.getImgChangeName());
			pstmt.setString(4, img.getImgFilePath());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	
	public int deleteRest(Connection conn,String restNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteRest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, restNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateRestMenu(Connection conn, HashMap<String, String> map,String restNo, int i) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			if(i==0) {
			String sql = prop.getProperty("updateRepMenu");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,map.get("menu"));
				pstmt.setString(2, map.get("price"));
				pstmt.setString(3, restNo);
			
				result = pstmt.executeUpdate();	

			}else {
				String sql = prop.getProperty("updateSubMenu");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, map.get("menu"));
				pstmt.setString(2, map.get("price"));
				pstmt.setString(3, restNo);
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//관리자 보는 식당 상세패이지
	public Rest selectRestMain(Connection conn, String restNo) {
	    Rest r = null;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;

	    String sql = prop.getProperty("selectRestMain");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, restNo);
	        rset = pstmt.executeQuery();

	        if (rset.next()) {
	            r = new Rest(
	            		rset.getString("rest_no"),
						rset.getString("rest_name"),
						rset.getString("rest_address"),
						rset.getString("rest_tel"),
						rset.getString("rest_parking"),
						rset.getInt("rest_grade"),
						rset.getString("rest_time"),
						rset.getDouble("rest_avg"),
						rset.getString("rest_img_url"),
						rset.getString("local_name"),
						rset.getInt("review_count"),
						rset.getString("dt"),
						rset.getString("animal"),
						rset.getString("room"),
						rset.getString("big_room"),
						rset.getString("ctg_name"),
						rset.getInt("heart_count"),
						rset.getString("menu_name"),
						rset.getString("menu_price"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    return r;
	}

	
	public int insertAddMenu(Connection conn, String restNo, HashMap<String, String> map, int i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAddMenu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, restNo);
			pstmt.setString(2, map.get("menu"));
			pstmt.setString(3, map.get("price"));
			
			if(i == 0) {
				pstmt.setString(4, "Y");
			}else {
				pstmt.setString(4, "N");
			}
			System.out.println(i + ", " + restNo + ", " + map.get("menu") + ", " + map.get("price"));
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectMenuCount(Connection conn, String restNo) {
		int menuCnt = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMenuCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, restNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				menuCnt = rset.getInt("menu_count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return menuCnt;
	}
	
	public ArrayList<Rest> selectMenuByAdmin(Connection conn, String restNo) {
		ArrayList<Rest> list = new ArrayList<Rest>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMenuByAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, restNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Rest r = new Rest();
				
				r.setRestNo(rset.getString("rest_no"));
				r.setMenuName(rset.getString("menu_name"));
				r.setMenuPrice(rset.getString("menu_price"));
				r.setRepMenu(rset.getString("rep_menu"));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
} 



