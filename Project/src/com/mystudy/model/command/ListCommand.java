package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.GoodsDAO;
import com.mystudy.ajax.vo.GoodsVO;



public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("> ListCommand list 요청에 대한 처리 작업");
		//1. DB연결하고 데이터 가져오기
		List<GoodsVO> list = GoodsDAO.getList();
		
		//2. 응답페이지(list.jsp)에 전달(request 객체에 저장해서 전달)
		request.setAttribute("list", list);
		
		//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩
		//request.getRequestDispatcher("list.jsp").forward(request, response);
		
		return "list.jsp"; //응답할 페이지
	}

}
