package com.kh.rest.model.vo;

/**
 * @author user1
 *
 */
/**
 * @author user1
 *
 */
public class Rest {
	
	private String restNo;
	private String restLocalId;
	private String restName;
	private String ctgId;
	private String restAddress;
	private String restTel;
	private double restX;
	private double restY;
	private char restParking;
	private int restGrade;
	private String restTime;
	private double restAvg;
	private char restStatus;
	private String restImgUrl;
	private int heart;
	private String localName;
	private int reviewCount;
	private int menuPrice;
	private char repMenu;
	
	
	public Rest() {}

	public Rest(String restNo, String restLocalId, String restName, String ctgId, String restAddress, String restTel,
			double restX, double restY, char restParking, int restGrade, String restTime, double restAvg,
			char restStatus, String restImgUrl) {
		super();
		this.restNo = restNo;
		this.restLocalId = restLocalId;
		this.restName = restName;
		this.ctgId = ctgId;
		this.restAddress = restAddress;
		this.restTel = restTel;
		this.restX = restX;
		this.restY = restY;
		this.restParking = restParking;
		this.restGrade = restGrade;
		this.restTime = restTime;
		this.restAvg = restAvg;
		this.restStatus = restStatus;
		this.restImgUrl = restImgUrl;
	}

	public Rest(String restNo, String restName, double restAvg, String restImgUrl, String localName, int reviewCount) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.restAvg = restAvg;
		this.restImgUrl = restImgUrl;
		this.localName = localName;
		this.reviewCount = reviewCount;
	}

	public Rest(String restNo, String restLocalId, String restName, String ctgId, String restAddress, String restTel,
			int restGrade) {
		super();
		this.restNo = restNo;
		this.restLocalId = restLocalId;
		this.restName = restName;
		this.ctgId = ctgId;
		this.restAddress = restAddress;
		this.restTel = restTel;
		this.restGrade = restGrade;
	}
	
	public Rest(String restNo, String restName, double restAvg, String restImgUrl, int reviewCount, int menuPrice,
			char repMenu) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.restAvg = restAvg;
		this.restImgUrl = restImgUrl;
		this.reviewCount = reviewCount;
		this.menuPrice = menuPrice;
		this.repMenu = repMenu;
	}

	public String getRestNo() {
		return restNo;
	}

	public void setRestNo(String restNo) {
		this.restNo = restNo;
	}

	public String getRestLocalId() {
		return restLocalId;
	}

	public void setRestLocalId(String restLocalId) {
		this.restLocalId = restLocalId;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public String getCtgId() {
		return ctgId;
	}

	public void setCtgId(String ctgId) {
		this.ctgId = ctgId;
	}

	public String getRestAddress() {
		return restAddress;
	}

	public void setRestAddress(String restAddress) {
		this.restAddress = restAddress;
	}

	public String getRestTel() {
		return restTel;
	}

	public void setRestTel(String restTel) {
		this.restTel = restTel;
	}

	public double getRestX() {
		return restX;
	}

	public void setRestX(double restX) {
		this.restX = restX;
	}

	public double getRestY() {
		return restY;
	}

	public void setRestY(double restY) {
		this.restY = restY;
	}

	public char getRestParking() {
		return restParking;
	}

	public void setRestParking(char restParking) {
		this.restParking = restParking;
	}

	public int getRestGrade() {
		return restGrade;
	}

	public void setRestGrade(int restGrade) {
		this.restGrade = restGrade;
	}

	public String getRestTime() {
		return restTime;
	}

	public void setRestTime(String restTime) {
		this.restTime = restTime;
	}

	public double getRestAvg() {
		return restAvg;
	}

	public void setRestAvg(double restAvg) {
		this.restAvg = restAvg;
	}

	public char getRestStatus() {
		return restStatus;
	}

	public void setRestStatus(char restStatus) {
		this.restStatus = restStatus;
	}

	public String getRestImgUrl() {
		return restImgUrl;
	}

	public void setRestImgUrl(String restImgUrl) {
		this.restImgUrl = restImgUrl;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}

	public char getRepMenu() {
		return repMenu;
	}

	public void setRepMenu(char repMenu) {
		this.repMenu = repMenu;
	}

	@Override
	public String toString() {
		return "Rest [restNo=" + restNo + ", restLocalId=" + restLocalId + ", restName=" + restName + ", ctgId=" + ctgId
				+ ", restAddress=" + restAddress + ", restTel=" + restTel + ", restX=" + restX + ", restY=" + restY
				+ ", restParking=" + restParking + ", restGrade=" + restGrade + ", restTime=" + restTime + ", restAvg="
				+ restAvg + ", restStatus=" + restStatus + ", restImgUrl=" + restImgUrl + ", heart=" + heart
				+ ", localName=" + localName + ", reviewCount=" + reviewCount + "]";
	}
	
}
