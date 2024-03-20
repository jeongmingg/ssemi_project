package com.kh.review.model.vo;

public class RvLike {
	
	public String reviewNo;
	public String nickName;
	
	public RvLike() {}

	public RvLike(String reviewNo, String nickName) {
		super();
		this.reviewNo = reviewNo;
		this.nickName = nickName;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "RvLike [reviewNo=" + reviewNo + ", nickName=" + nickName + "]";
	}

	

}
