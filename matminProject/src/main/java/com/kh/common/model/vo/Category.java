package com.kh.common.model.vo;

public class Category {

	private String ctgId;
	private String ctgName;
	
	public Category() {}

	public Category(String ctgId, String ctgName) {
		super();
		this.ctgId = ctgId;
		this.ctgName = ctgName;
	}

	public String getCtgId() {
		return ctgId;
	}

	public void setCtgId(String ctgId) {
		this.ctgId = ctgId;
	}

	public String getCtgName() {
		return ctgName;
	}

	public void setCtgName(String ctgName) {
		this.ctgName = ctgName;
	}

	@Override
	public String toString() {
		return "Category [ctgId=" + ctgId + ", ctgName=" + ctgName + "]";
	}

	
	
	
}
