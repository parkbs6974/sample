package com.mystudy.ajax.vo;

public class GoodsVO {
	private int goodsNum;
	private String goodsName;
	private int goodsPrice;
	private int goodsSale;
	private String goodsCont;
	private String goodsMenu;
	private String goodsImg;
	
	//수량, 수량별 금액(판매가 * 수량)
	private int cnt; //장바구니에 담긴 수량
	private int totalPrice; // 수량별 금액(판매가 * 수량)
	
	//할인율 조회 메소드
	public int getPercent() {
		double percent = (goodsPrice - goodsSale) *100 /goodsPrice;
		//System.out.println("percent : " + percent);
		return (int) percent;
	}
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
		//수량이 변경되면 수량별금액(totalPrice)계산 후 변경처리
		totalPrice = goodsSale * cnt;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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
	
	@Override
	public String toString() {
		return "GoodsVO [goodsNum=" + goodsNum + ", goodsName=" + goodsName + ", goodsPrice=" + goodsPrice
				+ ", goodsSale=" + goodsSale + ", goodsCont=" + goodsCont + ", goodsMenu=" + goodsMenu + ", goodsImg="
				+ goodsImg + ", cnt=" + cnt + ", totalPrice=" + totalPrice + "]";
	}
	
	
	
}
