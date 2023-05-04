package com.mystudy.ajax.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.ajax.vo.CartVO;
import com.mystudy.ajax.vo.OrderGoodsVO;
import com.mystudy.mybatis.DBService;

public class CartDAO {
	
	public static List<CartVO> cartList(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<CartVO> list = ss.selectList("cart.cartList", id);
		ss.close();
		return list;
	}
	public static CartVO order(int cartNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		CartVO vo = ss.selectOne("cart.cartToOrder", cartNum);
		ss.close();
		return vo;
	}
	public static int updateCnt(String id, int cnt, int cartNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		CartVO cartVO = new CartVO();
		cartVO.setId(id);
		cartVO.setCnt(cnt);
		cartVO.setCartNum(cartNum);
		int result = ss.update("cart.cartCntUpdate", cartVO);
		ss.close();
		return result;
		
	}
	
	public static int deleteGoods(String id, int cartNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		CartVO cartVO = new CartVO();
		cartVO.setId(id);
		cartVO.setCartNum(cartNum);
		int result = ss.update("cart.cartGoodsDelete", cartVO);
		ss.close();
		return result;
		
	}
	public static int insertGoods(String id, CartVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("cart.cartInsert", vo);
		ss.close();
		return result;
	}
	public static int orderNumSelect(String id, String goodsSale) {
		SqlSession ss = DBService.getFactory().openSession(true);
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("goodsSale", goodsSale);
		int orderNum = ss.selectOne("cart.orderNumSelect", map);
		ss.close();
		return orderNum;
	}
	
	public static int insertOrderGoods(OrderGoodsVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("cart.orderGoods", vo);
		ss.close();
		return result;
	}

	
}
