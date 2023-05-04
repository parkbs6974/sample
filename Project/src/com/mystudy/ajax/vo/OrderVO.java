package com.mystudy.ajax.vo;

import java.util.Date;

public class OrderVO {
	private int orderNum;
	private String id;
	private int goodsPrice;
	private int goodsSale;
	private String address;
	private Date regdate;
	private int cnt;
	private int goodsNum;

	//----------goods 테이블 조인 전용 변수 선언
	//쿼리로 join할 vo 변수 선언
	private String goodsName;
	private String goodsCont;
	private String goodsMenu;
	private String goodsImg;
	
	
	public int getPercent() {
		double percent = (goodsPrice - goodsSale) *100 /goodsPrice;
		return (int) percent;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsSale() {
		return goodsSale;
	}
	public void setGoodsSale(int goodsSale) {
		this.goodsSale = goodsSale;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsCont() {
		return goodsCont;
	}
	public void setGoodsCont(String goodsCont) {
		this.goodsCont = goodsCont;
	}
	public String getGoodsMenu() {
		return goodsMenu;
	}
	public void setGoodsMenu(String goodsMenu) {
		this.goodsMenu = goodsMenu;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
}
