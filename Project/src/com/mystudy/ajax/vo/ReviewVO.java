package com.mystudy.ajax.vo;

public class ReviewVO {
	public int reviewNum;
	public String goodsMenu;
	public int goodsNum;
	public String id;
	public String reviewTitle;
	public String reviewCont;
	public String reviewPw;
	public String reviewFile;
	public String reviewDate;
	public int reviewStar;
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getGoodsMenu() {
		return goodsMenu;
	}
	public void setGoodsMenu(String goodsMenu) {
		this.goodsMenu = goodsMenu;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewCont() {
		return reviewCont;
	}
	public void setReviewCont(String reviewCont) {
		this.reviewCont = reviewCont;
	}
	public String getReviewPw() {
		return reviewPw;
	}
	public void setReviewPw(String reviewPw) {
		this.reviewPw = reviewPw;
	}
	public String getReviewFile() {
		return reviewFile;
	}
	public void setReviewFile(String reviewFile) {
		this.reviewFile = reviewFile;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	
	
	@Override
	public String toString() {
		return "ReviewVO [reviewNum=" + reviewNum + ", goodsMenu=" + goodsMenu + ", goodsNum=" + goodsNum + ", id=" + id
				+ ", reviewTitle=" + reviewTitle + ", reviewCont=" + reviewCont + ", reviewPw=" + reviewPw
				+ ", reviewFile=" + reviewFile + ", reviewDate=" + reviewDate + ", reviewStar=" + reviewStar + "]";
	}
}
