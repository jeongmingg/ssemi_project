package com.kh.review.model.vo;

import java.sql.Date;

public class Review {
	private String reviewNo;
	private String restNo;
	private String reviewWriter;
	private String reviewCont;
	private String reviewDate;
	private Date updateDate;
	private int reviewLike;
	private int reviewDislike;
	private int alerNo;
	private int reviewRate; 
	private int ratePrice;
	private int rateService;
	private int rateAvg;
	private String reviewStatus;
	private int reviewCount;
	
	
	public Review() {}

	public Review(String reviewNo, String restNo, String reviewWriter, String reviewCont, String reviewDate,
			Date updateDate, int reviewLike, int reviewDislike, int alerNo, int reviewRate, int ratePrice,
			int rateService, String reviewStatus) {
		super();
		this.reviewNo = reviewNo;
		this.restNo = restNo;
		this.reviewWriter = reviewWriter;
		this.reviewCont = reviewCont;
		this.reviewDate = reviewDate;
		this.updateDate = updateDate;
		this.reviewLike = reviewLike;
		this.reviewDislike = reviewDislike;
		this.alerNo = alerNo;
		this.reviewRate = reviewRate;
		this.ratePrice = ratePrice;
		this.rateService = rateService;
		this.reviewStatus = reviewStatus;
	}
	
	
	public Review(String reviewNo, String restNo, String reviewWriter, String reviewCont, String reviewDate,
			int reviewLike, int reviewDislike, int reviewRate, int ratePrice, int rateService, int rateAvg) {
		super();
		this.reviewNo = reviewNo;
		this.restNo = restNo;
		this.reviewWriter = reviewWriter;
		this.reviewCont = reviewCont;
		this.reviewDate = reviewDate;
		this.reviewLike = reviewLike;
		this.reviewDislike = reviewDislike;
		this.reviewRate = reviewRate;
		this.ratePrice = ratePrice;
		this.rateService = rateService;
		this.rateAvg = rateAvg;
	}
	
	
	
	
	public Review(String reviewNo, String restNo, String reviewWriter, String reviewCont, String reviewDate,
			int reviewLike, int reviewDislike, int reviewRate) {
		super();
		this.reviewNo = reviewNo;
		this.restNo = restNo;
		this.reviewWriter = reviewWriter;
		this.reviewCont = reviewCont;
		this.reviewDate = reviewDate;
		this.reviewLike = reviewLike;
		this.reviewDislike = reviewDislike;
		this.reviewRate = reviewRate;
	}

	public Review(int reviewRate, int reviewCount) {
		super();
		this.reviewRate = reviewRate;
		this.reviewCount = reviewCount;
	}

	
	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getRestNo() {
		return restNo;
	}

	public void setRestNo(String restNo) {
		this.restNo = restNo;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewCont() {
		return reviewCont;
	}

	public void setReviewCont(String reviewCont) {
		this.reviewCont = reviewCont;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getReviewLike() {
		return reviewLike;
	}

	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}

	public int getReviewDislike() {
		return reviewDislike;
	}

	public void setReviewDislike(int reviewDislike) {
		this.reviewDislike = reviewDislike;
	}

	public int getAlerNo() {
		return alerNo;
	}

	public void setAlerNo(int alerNo) {
		this.alerNo = alerNo;
	}

	public int getReviewRate() {
		return reviewRate;
	}

	public void setReviewRate(int reviewRate) {
		this.reviewRate = reviewRate;
	}

	public double getRatePrice() {
		return ratePrice;
	}

	public void setRatePrice(int ratePrice) {
		this.ratePrice = ratePrice;
	}

	public double getRateService() {
		return rateService;
	}

	public void setRateService(int rateService) {
		this.rateService = rateService;
	}

	public int getRateAvg() {
		return rateAvg;
	}

	public void setRateAvg(int rateAvg) {
		this.rateAvg = rateAvg;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}


	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", restNo=" + restNo + ", reviewWriter=" + reviewWriter
				+ ", reviewCont=" + reviewCont + ", reviewDate=" + reviewDate + ", updateDate=" + updateDate
				+ ", reviewLike=" + reviewLike + ", reviewDislike=" + reviewDislike + ", alerNo=" + alerNo
				+ ", reviewRate=" + reviewRate + ", ratePrice=" + ratePrice + ", rateService=" + rateService
				+ ", reviewStatus=" + reviewStatus + ", reviewCount=" + reviewCount + "]";
	}
	
	
	
	
}
