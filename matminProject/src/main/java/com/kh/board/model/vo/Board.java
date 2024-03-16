package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	private String boardNo;	
	private String restId;	
	private String restName;
	private String restAddress;
	private String boardWriter;			
	private String boardType;			
	private String boardTitle;	
	private String boardContent;
	private int boardCount;			
	private String boardDate;			
	private String boardStatus;		
	private int rNum;
	
	public Board () {}
	

	public Board(String boardNo, String restId, String restName, String restAddress, String boardWriter,
			String boardType, String boardTitle, String boardContent, int boardCount, String boardDate,
			String boardStatus) {
		super();
		this.boardNo = boardNo;
		this.restId = restId;
		this.restName = restName;
		this.restAddress = restAddress;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardDate = boardDate;
		this.boardStatus = boardStatus;
	}


	public Board(String boardNo, String boardType, String boardTitle, String boardWriter, int boardCount,
			String boardDate) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.boardCount = boardCount;
		this.boardDate = boardDate;
	}
	
	
	public Board(String boardNo, String boardWriter, String boardType, String boardTitle, String boardContent, String boardDate, String restName, String restAddress
				) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.restName = restName;
		this.restAddress = restAddress;
	}

	

	public Board(int rNum, String boardNo, String boardWriter, String boardType, String boardTitle, int boardCount,
			String boardDate) {
		super();
		this.rNum = rNum;
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardCount = boardCount;
		this.boardDate = boardDate;
	}


	public String getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}


	public String getRestId() {
		return restId;
	}


	public void setRestId(String restId) {
		this.restId = restId;
	}


	public String getRestName() {
		return restName;
	}


	public void setRestName(String restName) {
		this.restName = restName;
	}


	public String getRestAddress() {
		return restAddress;
	}


	public void setRestAddress(String restAddress) {
		this.restAddress = restAddress;
	}


	public String getBoardWriter() {
		return boardWriter;
	}


	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}


	public String getBoardType() {
		return boardType;
	}


	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public int getBoardCount() {
		return boardCount;
	}


	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}


	public String getBoardDate() {
		return boardDate;
	}


	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}


	public String getBoardStatus() {
		return boardStatus;
	}


	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", restId=" + restId + ", restName=" + restName + ", restAddress="
				+ restAddress + ", boardWriter=" + boardWriter + ", boardType=" + boardType + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardCount=" + boardCount + ", boardDate="
				+ boardDate + ", boardStatus=" + boardStatus + "]";
	}
	
	
//	public Board(String boardType, String boardTitle, String boardWriter, String boardDate, 
//			String restName, String restAddress, String boardContent) {
//		super();
//		this.boardType = boardType;
//		this.boardTitle = boardTitle;
//		this.boardWriter = boardWriter;
//		this.boardDate = boardDate;
//		this.restName = restName;
//		this.restAddress = restAddress;
//		this.boardContent = boardContent;
//	}

	
	
	
}
