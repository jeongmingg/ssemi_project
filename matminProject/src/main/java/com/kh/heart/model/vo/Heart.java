package com.kh.heart.model.vo;

import java.sql.Date;

public class Heart {
	
	private String restNo;
    private String restName;
    private double restAvg;
    private int countLike;
    private String restImgUrl;
    private Date likeDate;
    
    public Heart() {}

	public Heart(String restNo, String restName, double restAvg, int countLike, String restImgUrl, Date likeDate) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.restAvg = restAvg;
		this.countLike = countLike;
		this.restImgUrl = restImgUrl;
		this.likeDate = likeDate;
	}

	public String getRestNo() {
		return restNo;
	}

	public void setRestNo(String restNo) {
		this.restNo = restNo;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public double getRestAvg() {
		return restAvg;
	}

	public void setRestAvg(double restAvg) {
		this.restAvg = restAvg;
	}

	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}

	public String getRestImgUrl() {
		return restImgUrl;
	}

	public void setRestImgUrl(String restImgUrl) {
		this.restImgUrl = restImgUrl;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	@Override
	public String toString() {
		return "Heart [restNo=" + restNo + ", restName=" + restName + ", restAvg=" + restAvg + ", countLike="
				+ countLike + ", restImgUrl=" + restImgUrl + ", likeDate=" + likeDate + "]";
	}
    
}
