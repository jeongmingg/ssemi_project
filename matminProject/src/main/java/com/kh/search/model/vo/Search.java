package com.kh.search.model.vo;

public class Search {
	
	private String restNo;
	private String restName;
	private double restAvg;
	private int heart;
	private String restImgUrl;
	private String restAddress;
	
	public Search() {}
	
	public Search(String restNo, String restName, double restAvg, int heart, String restImgUrl, String restAddress) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.restAvg = restAvg;
		this.heart = heart;
		this.restImgUrl = restImgUrl;
		this.restAddress = restAddress;
	}

	public Search(String restNo, String restName, double restAvg, int heart, String restImgUrl) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.restAvg = restAvg;
		this.heart = heart;
		this.restImgUrl = restImgUrl;
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

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	
	public String getRestImgUrl() {
		return restImgUrl;
	}

	public void setRestImgUrl(String restImgUrl) {
		this.restImgUrl = restImgUrl;
	}

	public String getRestAddress() {
		return restAddress;
	}

	public void setRestAddress(String restAddress) {
		this.restAddress = restAddress;
	}

	@Override
	public String toString() {
		return "Search [restNo=" + restNo + ", restName=" + restName + ", restAvg=" + restAvg + ", heart=" + heart
				+ ", restImgUrl=" + restImgUrl + ", restAddress=" + restAddress + "]";
	}

}
