package com.kh.heart.model.vo;

import java.sql.Date;

public class Heart {
	
	private String restNo;
    private String restName;
    private String localName;
    private String menuName;
    private double restAvg;
    private int countLike;
    private String restImgUrl;
    private Date likeDate;
    private int reviewCount;
    
    public Heart() {}

	public Heart(String restNo, String restName, String localName, String menuName, double restAvg, int countLike,
			String restImgUrl, Date likeDate, int reviewCount) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.localName = localName;
		this.menuName = menuName;
		this.restAvg = restAvg;
		this.countLike = countLike;
		this.restImgUrl = restImgUrl;
		this.likeDate = likeDate;
		this.reviewCount = reviewCount;
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

	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
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

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "Heart [restNo=" + restNo + ", restName=" + restName + ", localName=" + localName + ", menuName="
				+ menuName + ", restAvg=" + restAvg + ", countLike=" + countLike + ", restImgUrl=" + restImgUrl
				+ ", likeDate=" + likeDate + ", reviewCount=" + reviewCount + "]";
	}
    
}
