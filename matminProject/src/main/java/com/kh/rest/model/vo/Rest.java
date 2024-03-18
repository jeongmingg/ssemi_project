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
	private String restParking;
	private int restGrade;
	private String restTime;
	private double restAvg;
	private String restStatus;
	private String restImgUrl;
	private int heart;
	private String localName;
	private int reviewCount;
	private String menuName;
	private String menuPrice;
	private String repMenu;
	private String dt;
	private String anmial;
	private String room;
	private String bigRoom;
	private String ctgName;
	
	public Rest() {}

	public Rest(String restNo, String restLocalId, String restName, String ctgId, String restAddress, String restTel,
			double restX, double restY, String restParking, int restGrade, String restTime, double restAvg,
			String restStatus, String restImgUrl) {
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
	
	
	public Rest(String restNo, String restName, double restAvg, String restImgUrl, int reviewCount, String menuPrice,
			String repMenu) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.restAvg = restAvg;
		this.restImgUrl = restImgUrl;
		this.reviewCount = reviewCount;
		this.menuPrice = menuPrice;
		this.repMenu = repMenu;
	}

	
	
	public Rest(String restNo, String restName, String restAddress, String restTel,
			String restParking, int restGrade, String restTime, double restAvg, String restImgUrl, String localName, int reviewCount,
			String dt, String anmial, String room, String bigRoom, String ctgName) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.restAddress = restAddress;
		this.restTel = restTel;
		this.restParking = restParking;
		this.restGrade = restGrade;
		this.restTime = restTime;
		this.restAvg = restAvg;
		this.restImgUrl = restImgUrl;
		this.localName = localName;
		this.reviewCount = reviewCount;
		this.dt = dt;
		this.anmial = anmial;
		this.room = room;
		this.bigRoom = bigRoom;
		this.ctgName = ctgName;
	}

	public Rest(String restNo, String restName, String restImgUrl, String ctgId, String ctgName) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.restImgUrl = restImgUrl;
		this.ctgId = ctgId;
		this.ctgName = ctgName;
	}

	public Rest(String restNo, String restName, double restAvg, int heart, String restImgUrl, String restAddress,  
			String localName, String menuName, int reviewCount, String repMenu, String ctgName) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.restAvg = restAvg;
		this.heart = heart;
		this.restImgUrl = restImgUrl;
		this.restAddress = restAddress;
		this.localName = localName;
		this.menuName = menuName;
		this.reviewCount = reviewCount;
		this.repMenu = repMenu;
		this.ctgName = ctgName;
	}

	public Rest(String menuName, String menuPrice, String repMenu) {
		super();
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.repMenu = repMenu;
	}
	
	public Rest(String restLocalId, String restName, String ctgId, String restAddress, String restTel,
			String restParking, String restTime, String dt, String anmial, String room, String bigRoom) {
		super();
		this.restLocalId = restLocalId;
		this.restName = restName;
		this.ctgId = ctgId;
		this.restAddress = restAddress;
		this.restTel = restTel;
		this.restParking = restParking;
		this.restTime = restTime;
		this.dt = dt;
		this.anmial = anmial;
		this.room = room;
		this.bigRoom = bigRoom;

	}

	public Rest(String restNo, String restLocalId, String restName, String ctgId, String restAddress, String restTel,
			String restParking, String restTime, String dt, String anmial, String room, String bigRoom) {
		super();
		this.restNo = restNo;
		this.restLocalId = restLocalId;
		this.restName = restName;
		this.ctgId = ctgId;
		this.restAddress = restAddress;
		this.restTel = restTel;
		this.restParking = restParking;
		this.restTime = restTime;
		this.dt = dt;
		this.anmial = anmial;
		this.room = room;
		this.bigRoom = bigRoom;
	}

	

	public Rest(String restNo, String restName, String restImgUrl, String ctgName, double restAvg,  int reviewCount ) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.restImgUrl = restImgUrl;
		this.ctgName = ctgName;
		this.restAvg = restAvg;
		this.reviewCount = reviewCount;
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

	public String getRestParking() {
		return restParking;
	}

	public void setRestParking(String restParking) {
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

	public String getRestStatus() {
		return restStatus;
	}

	public void setRestStatus(String restStatus) {
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

	public String getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}

	public String getRepMenu() {
		return repMenu;
	}

	public void setRepMenu(String repMenu) {
		this.repMenu = repMenu;
	}

	
	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public String getAnmial() {
		return anmial;
	}

	public void setAnmial(String anmial) {
		this.anmial = anmial;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getBigRoom() {
		return bigRoom;
	}

	public void setBigRoom(String bigRoom) {
		this.bigRoom = bigRoom;
	}
	
	public String getCtgName() {
		return ctgName;
	}

	public void setCtgName(String ctgName) {
		this.ctgName = ctgName;
	}

	
	@Override
	public String toString() {
		return "Rest [restNo=" + restNo + ", restLocalId=" + restLocalId + ", restName=" + restName + ", ctgId=" + ctgId
				+ ", restAddress=" + restAddress + ", restTel=" + restTel + ", restX=" + restX + ", restY=" + restY
				+ ", restParking=" + restParking + ", restGrade=" + restGrade + ", restTime=" + restTime + ", restAvg="
				+ restAvg + ", restStatus=" + restStatus + ", restImgUrl=" + restImgUrl + ", heart=" + heart
				+ ", localName=" + localName + ", reviewCount=" + reviewCount + ", menuName=" + menuName
				+ ", menuPrice=" + menuPrice + ", repMenu=" + repMenu + ", dt=" + dt + ", anmial=" + anmial + ", room="
				+ room + ", bigRoom=" + bigRoom + ", ctgName=" + ctgName + "]";
	}

}