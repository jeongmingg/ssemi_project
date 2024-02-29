package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	private String boardNo;	
	private String restId;			
	private String boardWriter;			
	private String boardType;			
	private String boardTitle;	
	private String boardContent;
	private int boardCount;			
	private String boardDate;			
	private String boardStatus;			
	
	public Board () {}

	public Board(String boardNo, String restId, String boardWriter, String boardType, String boardTitle,
			String boardContent, int boardCount, String boardDate, String boardStatus) {
		super();
		this.boardNo = boardNo;
		this.restId = restId;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardDate = boardDate;
		this.boardStatus = boardStatus;
	}
	

	public Board(String boardNo, String boardWriter, String boardType, String boardTitle, int boardCount,
			String boardDate) {
		super();
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
		return "Board [boardNo=" + boardNo + ", restId=" + restId + ", boardWriter=" + boardWriter + ", boardType="
				+ boardType + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardCount="
				+ boardCount + ", boardDate=" + boardDate + ", boardStatus=" + boardStatus + "]";
	}

	
	
}