package com.mystudy.ajax.vo;

import java.util.List;

public class CartVO {
	
	private int cartNum;
	private int goodsNum;
	private String goodsName;
	private String id;
	private int cnt;
	private int goodsSale;
	
	
	//----------goods 테이블 조인 전용 변수 선언
	//쿼리로 join할 vo 변수 선언
	private GoodsVO goodsVO;
	private int goodsPrice;
	private String goodsCont;
	private String goodsImg;
	private int percent;
	
	
	public int getGoodsPrice() {
		return goodsPrice;
	}
	
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	
	public String getGoodsCont() {
		return goodsCont;
	}
	
	public void setGoodsCont(String goodsCont) {
		this.goodsCont = goodsCont;
	}
	
	public String getGoodsImg() {
		return goodsImg;
	}
	
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	
	public void setGoodsVO(GoodsVO goodsVO) {
		this.goodsVO = goodsVO;
	}
	
	public GoodsVO getGoodsVO() {
		return goodsVO;
	}
	
	
	
	//--------------------goods 테이블 조인 영역 끝--------------------------
	

	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getGoodsSale() {
		return goodsSale;
	}
	public void setGoodsSale(int goodsSale) {
		this.goodsSale = goodsSale;
	}


	

}
