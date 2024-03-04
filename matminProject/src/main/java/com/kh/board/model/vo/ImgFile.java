package com.kh.board.model.vo;

import java.util.Date;

public class ImgFile {
	
	private String imgFileNo;		
	private String refNo;		
	private String imgOriginName;		
	private String imgChangeName;		
	private String imgFilePath;		
	private Date uploadDate;		
	private String imgStatus;


	public ImgFile() {}


	public ImgFile(String imgFileNo, String refNo, String imgOriginName, String imgChangeName, String imgFilePath,
			Date uploadDate, String imgStatus) {
		super();
		this.imgFileNo = imgFileNo;
		this.refNo = refNo;
		this.imgOriginName = imgOriginName;
		this.imgChangeName = imgChangeName;
		this.imgFilePath = imgFilePath;
		this.uploadDate = uploadDate;
		this.imgStatus = imgStatus;
	}

	
	
	public ImgFile(String imgFileNo, String imgOriginName, String imgChangeName, String imgFilePath) {
		super();
		this.imgFileNo = imgFileNo;
		this.imgOriginName = imgOriginName;
		this.imgChangeName = imgChangeName;
		this.imgFilePath = imgFilePath;
	}


	public String getImgFileNo() {
		return imgFileNo;
	}


	public void setImgFileNo(String imgFileNo) {
		this.imgFileNo = imgFileNo;
	}


	public String getRefNo() {
		return refNo;
	}


	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}


	public String getImgOriginName() {
		return imgOriginName;
	}


	public void setImgOriginName(String imgOriginName) {
		this.imgOriginName = imgOriginName;
	}


	public String getImgChangeName() {
		return imgChangeName;
	}


	public void setImgChangeName(String imgChangeName) {
		this.imgChangeName = imgChangeName;
	}


	public String getImgFilePath() {
		return imgFilePath;
	}


	public void setImgFilePath(String imgFilePath) {
		this.imgFilePath = imgFilePath;
	}


	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	public String getImgStatus() {
		return imgStatus;
	}


	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}


	@Override
	public String toString() {
		return "ImgFile [imgFileNo=" + imgFileNo + ", refNo=" + refNo + ", imgOriginName=" + imgOriginName
				+ ", imgChangeName=" + imgChangeName + ", imgFilePath=" + imgFilePath + ", uploadDate=" + uploadDate
				+ ", imgStatus=" + imgStatus + "]";
	}
	
	
	
}