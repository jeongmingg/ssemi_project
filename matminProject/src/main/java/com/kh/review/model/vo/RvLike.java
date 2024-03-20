package com.kh.review.model.vo;

public class RvLike {
	
	public String reviewNo;
	public String nickName;
	public int likeCount;
	
	public RvLike() {}

	public RvLike(String reviewNo, String nickName) {
		super();
		this.reviewNo = reviewNo;
		this.nickName = nickName;
	}
	
	
	public RvLike(int likeCount, String reviewNo) {
		super();
		this.likeCount = likeCount;
		this.reviewNo = reviewNo;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public RvLike(int likeCount) {
		super();
		this.likeCount = likeCount;
	}

	public RvLike(String reviewNo) {
		super();
		this.reviewNo = reviewNo;
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
		return "RvLike [reviewNo=" + reviewNo + ", nickName=" + nickName + ", likeCount=" + likeCount + "]";
	}

	
	

}
