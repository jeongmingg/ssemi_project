package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.ImgFile;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;

import static com.kh.common.JDBCTemplate.*;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("board_count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
	}
	
	public ArrayList<Board> selectBoardList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getString("board_no"),
								   rset.getString("board_type"),
								   rset.getString("board_title"),
								   rset.getString("nickname"),
								   rset.getInt("board_count"),
								   rset.getString("board_date")
								   ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		} return list;
		
		}
	
	
	public int insertBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getRestName());
			pstmt.setString(2, b.getRestAddress());
			pstmt.setString(3, b.getBoardWriter());
			pstmt.setString(4, b.getBoardType());
			pstmt.setString(5, b.getBoardTitle());
			pstmt.setString(6, b.getBoardContent());
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);	
		} return result;
	}
		
	
	public int insertBImgFile(Connection conn, ImgFile img) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBImgFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getImgOriginName());
			pstmt.setString(2, img.getImgChangeName());
			pstmt.setString(3, img.getImgFilePath());
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}

	public int increaseCount(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String bno = "B" + boardNo;
		
		String  sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
		
	}
	
	public Board selectBoard(Connection conn, int boardNo) {
		Board b = null;
		String bno = "B" + boardNo;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(
							  rset.getString("board_no"),
							  rset.getString("nickname"),
						      rset.getString("board_type"),
						      rset.getString("board_title"),
						      rset.getString("board_content"),
						      rset.getString("board_date"),
						      rset.getString("rest_name"),
						      rset.getString("rest_address")
						      );
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return b;
	}
	
	public ImgFile selectImgFile(Connection conn, int boardNo) {
		ImgFile img = null;
		String bno = "B" + boardNo;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new ImgFile(rset.getString("img_file_no"),
								  rset.getString("img_origin_name"),
								  rset.getString("img_change_name"),
								  rset.getString("img_file_path")
								  );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return img;

	}
		
	public int updateBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null; 
		
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getRestName());
			pstmt.setString(2, b.getRestAddress() );
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}
	
	public int updateImgFile(Connection conn, ImgFile img) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateImgFile");
		
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
	
	public int insertUpdateImgFile(Connection conn, ImgFile img) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertUpdateImgFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "B" + img.getRefNo());
			pstmt.setString(2, img.getImgOriginName());
			pstmt.setString(3, img.getImgChangeName());
			pstmt.setString(4, img.getImgFilePath());
			
			System.out.println("B" + img.getRefNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}
	
	public int deleteBoard(Connection conn, String bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bno);
			
			result = pstmt.executeUpdate();
			
			System.out.println("boardDao"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;

	}
	
	public ArrayList<Board> selectBoardListByMem(Connection conn, String memNo) {
		ArrayList<Board> list = new ArrayList<Board>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoardListByMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getString("board_no"));
				b.setBoardWriter(rset.getString("nickname"));
				b.setBoardType(rset.getString("board_type"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBoardCount(rset.getInt("board_count"));
				b.setBoardDate(rset.getString("board_date"));
				
				list.add(b);
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

