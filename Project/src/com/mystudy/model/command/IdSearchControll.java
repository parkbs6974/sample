package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.QnaDAO;
import com.mystudy.ajax.vo.QnaVO;

@WebServlet("/qnaSearch")
public class IdSearchControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("IdSearchControll.doGet() 실행");
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		
		//2. DB 연동 작업 : 해당부서 id와 일치하는 게시글 사용(DAO 사용)
		List<QnaVO> list = QnaDAO.getIdList(id); 
		System.out.println("DeptListController list : " + list); 
		
		//3. 조회된 데이터를 응답페이지(qnaSearch.jsp)에서 사용토록 scope에 저장
		request.setAttribute("list", list);
		
		//4. 응답페이지(deptList.jsp)로 이동(응답 위임 처리)
		request.getRequestDispatcher("qnaSearch.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("IdSearchControll.doPost() 실행");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
