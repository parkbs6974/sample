package com.mystudy.ajax.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.ajax.vo.OrderVO;
import com.mystudy.ajax.vo.UsersVO;
import com.mystudy.mybatis.DBService;


public class UsersDAO {
	
	//모든 유저 보여주기
	public static List<UsersVO> userList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<UsersVO> list = ss.selectList("project.userAll");
		ss.close();
		return list;
	}
		
	//유저 정보 삭제하기
	public static int userDelete(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("project.userDelete",id);
		ss.close();
		return result;
	}
		
	//마이페이지 잔액 충전
	public static int balance (UsersVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		UsersVO originVo = UsersDAO.userLogin(vo.getId(), vo.getPw());
		int balance = vo.getBalance();
		vo.setBalance(originVo.getBalance() + balance);
		int result = ss.update("project.balance", vo);
		ss.close();
		return result;
	}
	//결제 후 잔액 차감
	public static int balanceMinus(String id, String pw, int goodsSale) {
		SqlSession ss = DBService.getFactory().openSession(true);
		UsersVO originVo = UsersDAO.userLogin(id, pw);
		int balance = originVo.getBalance();
		originVo.setBalance(balance - goodsSale);
		int result = ss.update("project.balanceMinus", originVo);
		ss.close();
		return result;
	}
	
	//주문정보 조회하기
	public static List<OrderVO> orderList(String id){
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderVO> vo = ss.selectList("project.orderChk",id);
		ss.close();
		return vo;
	}

	public static UsersVO userLogin(String id, String pw) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		UsersVO list = ss.selectOne("goods.userLogin", map);
		ss.close();
		return list;
	}
	
	public static String idSearch(String name, String email) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		String id = ss.selectOne("goods.idSearch", map);
		ss.close();
		return id;
	}
	public static int balanceList(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int balance = ss.selectOne("project.balanceList", id);
		ss.close();
		return balance;
	}
	public static String address(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		String address = ss.selectOne("cart.address", id);
		ss.close();
		return address;
	}
	
	public static String pwSearch(String id, String name, String email) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		String pw = ss.selectOne("goods.pwSearch", map);
		ss.close();
		return pw;
	}
	
	public static int deleteMember(UsersVO uvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("goods.deleteMember", uvo);
		ss.close();
		return result;
	}
	
	public static int joinMember(UsersVO uvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("goods.joinMember", uvo);
		ss.close();
		return result;
	}
	
	public static String idChk(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		String idCheck = ss.selectOne("goods.idChk", id);
		System.out.println(idCheck);
		ss.close();
		return idCheck;
	}
	
	public static int modifyMember(String id, String pw, String name, String phone, String email, String address) {
		SqlSession ss = DBService.getFactory().openSession(true);
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		map.put("name", name);
		map.put("phone", phone);
		map.put("email", email);
		map.put("address", address);
		int modify = ss.update("goods.modifyMember", map);
		System.out.println(modify);
		ss.close();
		return modify;
	}
	
	public static int orderInsert(String id, String goodsSale, String address) {
		SqlSession ss = DBService.getFactory().openSession(true);
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("goodsSale", goodsSale);
		map.put("address", address);
		int modify = ss.update("cart.order", map);
		System.out.println(modify);
		ss.close();
		return modify;
	}
	
}
