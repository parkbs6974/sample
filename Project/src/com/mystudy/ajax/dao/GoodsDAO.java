package com.mystudy.ajax.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.ajax.vo.GoodsVO;
import com.mystudy.mybatis.DBService;

public class GoodsDAO {

	// 물품 전체 목록 조회(파라미터 없음)
	public static List<GoodsVO> getList() {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<GoodsVO> list = ss.selectList("goods.all");
		ss.close();
		
		return list;
	}
	// 최근 등록한 물품 6개 조회(파라미터 없음)
	public static List<GoodsVO> getNewList() {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<GoodsVO> list = ss.selectList("goods.new");
		ss.close();
		
		return list;
	}
	
	//물품 카테고리 별 조회(파라미터 있음)
	 public static List<GoodsVO> getMenuList(String goodsMenu) {
		 SqlSession ss = DBService.getFactory().openSession(true);
		 List<GoodsVO> list = ss.selectList("goods.menuList", goodsMenu);
		 ss.close();
		 return list;
	 }
	 
	//물품명 별 조회(파라미터 있음)
	 public static List<GoodsVO> getNameList(String goodsName) {
			 SqlSession ss = DBService.getFactory().openSession(true);
			 List<GoodsVO> list = ss.selectList("goods.nameList", goodsName);
			 ss.close();
			 return list;
	}
	 
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession(true);
		int totalCount = ss.selectOne("goods.totalCount");
		ss.close();
		return totalCount;
	}
	
	//로그인 시 닉네임 조회 기능
	public static String idName(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		String name = ss.selectOne("goods.idName", id);
		ss.close();
		return name;
	}
	//물품 상세 정보 조회 기능
	public static GoodsVO goodsDetail(int goodsNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		GoodsVO goodsVO = ss.selectOne("goods.goodsDetail", goodsNum);
		ss.close();
		return goodsVO;
	}
	
	//카테고리별 물품리스트
			public static List<GoodsVO> list(String goodsMenu){
				SqlSession ss = DBService.getFactory().openSession();
				List<GoodsVO> list = ss.selectList("project.calist",goodsMenu);
				ss.close();
				
				return list;
			}

		
		//상품 등록 처리
			public static int insert(GoodsVO gvo) {
				SqlSession ss = DBService.getFactory().openSession(true);
				int result = ss.insert("project.goodsInsert", gvo);
				ss.close();
				return result;
			}
		//모든 물품 보여주기
			public static List<GoodsVO> goodsAll(){
				SqlSession ss = DBService.getFactory().openSession();
				List<GoodsVO> list = ss.selectList("project.goodsAll");
				ss.close();
				return list;
			}
		//번호에 해당하는 물품 보여주기
			public static GoodsVO goodsOne(int goodsNum){
				SqlSession ss = DBService.getFactory().openSession();
				GoodsVO vo = ss.selectOne("project.goodsOne",goodsNum);
				ss.close();
				
				return vo;
			}
		//물품삭제하기
			public static int goodsDelete(int goodsNum) {
				SqlSession ss = DBService.getFactory().openSession(true);
				int result = ss.delete("project.goodsDelete",goodsNum);
				ss.close();
				return result;
			}
		//물품정보 수정하기
			public static int goodsUpdate (GoodsVO vo) {
				SqlSession ss = DBService.getFactory().openSession(true);
				int result = ss.update("project.goodsUpdate", vo);
				ss.close();
				return result;
			}
	
}
