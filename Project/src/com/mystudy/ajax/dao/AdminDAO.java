package com.mystudy.ajax.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.ajax.vo.AdminVO;
import com.mystudy.ajax.vo.OrderVO;
import com.mystudy.ajax.vo.TotalVO;
import com.mystudy.mybatis.DBService;

public class AdminDAO {
	
	public static AdminVO adminOne(String pass) {
		SqlSession ss = DBService.getFactory().openSession();
		AdminVO vo = ss.selectOne("project.goodsPw",pass);
		ss.close();
		
		return vo;
	}
	public static AdminVO adname(){
		SqlSession ss = DBService.getFactory().openSession();
		AdminVO vo = ss.selectOne("project.goodsName");
		ss.close();
		
		return vo;
	}
	public static List<OrderVO> goodsTotal(int goodsNum){
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderVO> list = ss.selectList("project.adminorderChk",goodsNum);
		ss.close();
		
		return list;
	}
}
