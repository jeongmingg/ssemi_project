package com.kh.common.model.vo;

public class Location {

	private String localId;
	private String localName;
	
	public Location() {}

	public Location(String localId, String localName) {
		super();
		this.localId = localId;
		this.localName = localName;
	}

	public String getLocalId() {
		return localId;
	}

	public void setLocalId(String localId) {
		this.localId = localId;
	}

	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

	@Override
	public String toString() {
		return "Location [localId=" + localId + ", localName=" + localName + "]";
	}
	
	
}
