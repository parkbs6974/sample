package com.mystudy.ajax.vo;

import java.sql.Date;

import oracle.sql.DATE;

public class TotalVO {
	private int orderNum;
	private String id;
	private int goodsPrice;
	private int goodsSale;
	private String address;
	private DATE regdate;
	private int cnt;
	private int goods_num;
	
	//수량, 수량별 금액(판매가 * 수량
	private int totalPrice; // 수량별 금액(판매가 * 수량)
	
	//할인율 조회 메소드
	public int getPercent() {
		double percent = (goodsPrice - goodsSale) *100 /goodsPrice;
		//System.out.println("percent : " + percent);
		return (int) percent;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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
	public DATE getRegdate() {
		return regdate;
	}
	public void setRegdate(DATE regdate) {
		this.regdate = regdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
		totalPrice = goodsSale * cnt;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	@Override
	public String toString() {
		return "TotalVO [orderNum=" + orderNum + ", id=" + id + ", goodsPrice=" + goodsPrice + ", goodsSale="
				+ goodsSale + ", address=" + address + ", regdate=" + regdate + ", cnt=" + cnt + ", goods_num="
				+ goods_num +  ", totalPrice=" + totalPrice + "]";
	}
	
	
	
	
}
