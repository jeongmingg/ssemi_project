package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	private String boardNo;	
	private String restId;			
	private String boardWriter;			
	private char boardType;			
	private String boardTitle;			
	private String boardCont;			
	private Date date;			
	private char boardStatus;			
	
	public Board () {}

	public Board(String boardNo, String restId, String boardWriter, char boardType, String boardTitle, String boardCont,
			Date date, char boardStatus) {
		super();
		this.boardNo = boardNo;
		this.restId = restId;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardCont = boardCont;
		this.date = date;
		this.boardStatus = boardStatus;
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

	public char getBoardType() {
		return boardType;
	}

	public void setBoardType(char boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardCont() {
		return boardCont;
	}

	public void setBoardCont(String boardCont) {
		this.boardCont = boardCont;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public char getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(char boardStatus) {
		this.boardStatus = boardStatus;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", restId=" + restId + ", boardWriter=" + boardWriter + ", boardType="
				+ boardType + ", boardTitle=" + boardTitle + ", boardCont=" + boardCont + ", date=" + date
				+ ", boardStatus=" + boardStatus + "]";
	}
	
	
}
