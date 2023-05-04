package com.mystudy.ajax.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.ajax.vo.QnaVO;
import com.mystudy.ajax.vo.ReviewVO;
import com.mystudy.mybatis.DBService;

public class ReviewDAO {
	
	//리뷰 작성하기
			public static int insertReview(ReviewVO rvo) {
				SqlSession ss = DBService.getFactory().openSession(true);
				int result = ss.insert("project.reviewInsert", rvo);
				ss.close();
				return result;
			}
			//리뷰글 전체 가져오기
			public static List<ReviewVO> reviewAll(){
				SqlSession ss = DBService.getFactory().openSession();
				List<ReviewVO> list = ss.selectList("project.reviewAll");
				ss.close();
				return list;
			}
			//관리자권한 리뷰글 삭제
			public static int adminReviewDelete(int reviewNum) {
				SqlSession ss = DBService.getFactory().openSession(true);
				int result = ss.delete("project.adminreviewDelete", reviewNum);
				ss.close();
				return result;
			}
		
			
			
			 //게시글 1개 조회 
			public static ReviewVO reviewSelectOne(int reviewNum) {
				SqlSession ss = DBService.getFactory().openSession(); 
				ReviewVO vo = ss.selectOne("project.reviewOne", reviewNum); 
			  ss.close(); 
			  return vo; }
			  
			 
			 //게시글의 전체 데이터 건수 조회 
			public static int getTotalCount() { 
				SqlSession ss = DBService.getFactory().openSession(); 
				int totalCount = ss.selectOne("project.reviewTotalCount"); 
				ss.close(); 
				return totalCount; 
			}
			  
			//페이지에 해당하는 글목록(게시글) 가져오기 
			
			public static List<ReviewVO> getReviewList(Map<String, Integer> map) {
				SqlSession ss = DBService.getFactory().openSession();
				List<ReviewVO> list = ss.selectList("project.Reviewlist", map);
				ss.close();
				return list;
			}
			
			public static List<ReviewVO> getReviewList(int begin, int end) {
			  Map<String, Integer> map = new HashMap<>();
			  map.put("begin", begin);
			  map.put("end", end);
			  
			  SqlSession ss = DBService.getFactory().openSession(); 
			  List<ReviewVO> list = ss.selectList("project.Reviewlist", map); ss.close(); return list; }
			
			//pw로 찾기
	         public static ReviewVO searchReviewPw(int reviewNum) {
	            SqlSession ss = DBService.getFactory().openSession();
	            ReviewVO vo = ss.selectOne("project.reviewPw",reviewNum);
	            ss.close();
	            return vo;
	         }
	         
	       //review 게시글 삭제
	         public static int delete(int reviewNum) {
	            SqlSession ss = DBService.getFactory().openSession(true);
	            int result = ss.delete("project.reviewDelete", reviewNum);
	            ss.close();
	            return result;
	         }
	       //review 게시글 수정처리
	         public static int update(ReviewVO rvo) {
	            SqlSession ss = DBService.getFactory().openSession(true);
	            int result = ss.update("project.reviewUpdate",rvo);
	            ss.close();
	            return result;
	         }
	         
	         //상품 상세정보에서 상품번호기준 댓글보기
	         public static List<ReviewVO> reViewDetail(int goodsNum) {
	        	 SqlSession ss = DBService.getFactory().openSession();
	        	 List<ReviewVO> list = ss.selectList("project.reViewDetail", goodsNum);
	        	 ss.close();
	        	 return list;
	         }
	         
	         public static List<ReviewVO> reViewDetailPage(int goodsNum, int begin, int end) {
				  Map<String, Integer> map = new HashMap<>();
				  map.put("goodsNum", goodsNum);
				  map.put("begin", begin);
				  map.put("end", end);
				  
				  SqlSession ss = DBService.getFactory().openSession(); 
				  List<ReviewVO> list = ss.selectList("project.reViewDetailPage", map);
				  ss.close(); 
				  return list; }
		 
		
}
