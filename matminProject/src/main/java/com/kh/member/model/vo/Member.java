package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	
	private String memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String nickname;
	private String email;
	private int emailAuth;
	private String address;
	private int memWarning;
	private Date enrollDate;
	private String memLevel;
	private String memStatus;
	private String kakaoUser;
	
	public Member() {}

	public Member(String memNo, String memId, String memPwd, String memName, String nickname, String email,
			int emailAuth, String address, int memWarning, Date enrollDate, String memLevel, String memStatus, String kakaoUser) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickname = nickname;
		this.email = email;
		this.emailAuth = emailAuth;
		this.address = address;
		this.memWarning = memWarning;
		this.enrollDate = enrollDate;
		this.memLevel = memLevel;
		this.memStatus = memStatus;
		this.kakaoUser = kakaoUser;
	}

	public Member(String memNo, String memId, String memPwd, String memName, String nickname, String email,
			int emailAuth, String address, int memWarning, Date enrollDate, String memLevel, String memStatus) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickname = nickname;
		this.email = email;
		this.emailAuth = emailAuth;
		this.address = address;
		this.memWarning = memWarning;
		this.enrollDate = enrollDate;
		this.memLevel = memLevel;
		this.memStatus = memStatus;
	}

	public Member(String memId, String memPwd, String memName, String nickname, String email, String address) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickname = nickname;
		this.email = email;
		this.address = address;
	}

	public Member(String memId, String memPwd, String memName, String nickname, String email, int emailAuth,
			String address) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickname = nickname;
		this.email = email;
		this.emailAuth = emailAuth;
		this.address = address;
	}

	public Member(String memNo, String memId, String memName, String nickname, int memWarning, Date enrollDate) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memName = memName;
		this.nickname = nickname;
		this.memWarning = memWarning;
		this.enrollDate = enrollDate;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getEmailAuth() {
		return emailAuth;
	}

	public void setEmailAuth(int emailAuth) {
		this.emailAuth = emailAuth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getMemWarning() {
		return memWarning;
	}

	public void setMemWarning(int memWarning) {
		this.memWarning = memWarning;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(String memLevel) {
		this.memLevel = memLevel;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	public String getKakaoUser() {
		return kakaoUser;
	}

	public void setKakaoUser(String kakaoUser) {
		this.kakaoUser = kakaoUser;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", nickname=" + nickname + ", email=" + email + ", emailAuth=" + emailAuth + ", address=" + address
				+ ", memWarning=" + memWarning + ", enrollDate=" + enrollDate + ", memLevel=" + memLevel
				+ ", memStatus=" + memStatus + ", kakaoUser=" + kakaoUser + "]";
	}
	
}
