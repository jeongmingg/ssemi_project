package com.kh.common.model.vo;

public class Menu {

	private String menuNo;
	private String restNo;
	private String manuName;
	private String menuPrice;
	private String repMenu;
	
	public Menu() {}

	public Menu(String menuNo, String restNo, String manuName, String menuPrice, String repMenu) {
		super();
		this.menuNo = menuNo;
		this.restNo = restNo;
		this.manuName = manuName;
		this.menuPrice = menuPrice;
		this.repMenu = repMenu;
	}

	public Menu(String manuName, String menuPrice, String repMenu) {
		super();
		this.manuName = manuName;
		this.menuPrice = menuPrice;
		this.repMenu = repMenu;
	}

	public String getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
	}

	public String getRestNo() {
		return restNo;
	}

	public void setRestNo(String restNo) {
		this.restNo = restNo;
	}

	public String getManuName() {
		return manuName;
	}

	public void setManuName(String manuName) {
		this.manuName = manuName;
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

	@Override
	public String toString() {
		return "Menu [menuNo=" + menuNo + ", restNo=" + restNo + ", manuName=" + manuName + ", menuPrice=" + menuPrice
				+ ", repMenu=" + repMenu + "]";
	}
	
	
}
