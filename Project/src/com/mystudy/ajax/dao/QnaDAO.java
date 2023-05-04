package com.mystudy.ajax.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.ajax.vo.CommentsVO;
import com.mystudy.ajax.vo.QnaVO;
import com.mystudy.ajax.vo.ReviewVO;
import com.mystudy.mybatis.DBService;

public class QnaDAO {
	
	
	//글 작성하기
	public static int insertBoard(QnaVO qvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("project.qnaInsert", qvo);
		ss.close();
		return result;
	}
	
	//게시글 1개 조회
	public static QnaVO selectOne(int quesNum) {
		SqlSession ss = DBService.getFactory().openSession();
		QnaVO vo = ss.selectOne("project.one", quesNum);
		ss.close();
		return vo;
	}
	
	
	//게시글의 전체 데이터 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("project.totalCount");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기
	public static List<QnaVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<QnaVO> list = ss.selectList("project.list", map);
		ss.close();
		return list;
	}
	//게시글 수정처리
	public static int update(QnaVO qvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("project.update", qvo);
		ss.close();
		return result;
	}
	
	
	//게시글 삭제처리
	public static int delete(int quesNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("project.delete", quesNum);
		ss.close();
		return result;
	}
	//pw로 비교하기
	   public static QnaVO searchQnaPw(int quesNum) {
	      SqlSession ss = DBService.getFactory().openSession();
	      QnaVO vo = ss.selectOne("project.QnaPw",quesNum);
	      ss.close();
	      return vo;
	   }
	
	public static QnaVO searchPw(int quesNum) {
		SqlSession ss = DBService.getFactory().openSession();
		QnaVO vo = ss.selectOne("project.pw",quesNum);
		ss.close();
		return vo;
	}
	
	//문의글 전체 가져오기
	public static List<QnaVO> qnaAll(){
		SqlSession ss = DBService.getFactory().openSession();
		List<QnaVO> list = ss.selectList("project.qnaAll");
		ss.close();
		return list;
	}
	//관리자권한 문의글 삭제
	public static int adminQnaDelete(int quesNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("project.adminqnaDelete", quesNum);
		ss.close();
		return result;
	}
	 //id로 list가져오기 
    public static List<QnaVO> getIdList(String id) { 
    SqlSession ss= DBService.getFactory().openSession(); 
    List<QnaVO> list = ss.selectList("project.idList",id); 
    ss.close(); return list; }
    
    public static List<QnaVO> getCommList(int quesNum) {
        SqlSession ss = DBService.getFactory().openSession();
        List<QnaVO> list = ss.selectList("project.commList", quesNum);
        ss.close();
        return list;
     }
     
     
     //댓글 1개 조회
     public static CommentsVO getCommentOne(int commNum) {
        SqlSession ss = DBService.getFactory().openSession();
        CommentsVO vo = ss.selectOne("project.commOne", commNum);
        ss.close();
        return vo;
     }
     
     //댓글 삭제
     public static int deleteComment(int commNum) {
        SqlSession ss = DBService.getFactory().openSession(true);
        int result = ss.delete("project.commDelete", commNum);
        ss.close();
        return result;
     }
   //댓글 입력처리 insertComment()
     public static int insertComment(CommentsVO cvo) {
        SqlSession ss = DBService.getFactory().openSession(true);
        int result = ss.insert("project.commInsert", cvo);
        ss.close();
        return result;
     }
	
		
}









