package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.GoodsDAO;
import com.mystudy.ajax.vo.GoodsVO;


public class ShowerCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("shower 요청 작업처리----");
		//1. 사용할 파라미터 값 추출(확인)
		String menu = request.getParameter("type");
		
		//2. DB 데이터 조회
		List<GoodsVO> list = GoodsDAO.getMenuList(menu);
		System.out.println("list : " + list);
		
		//3. 조회된 데이터 뷰(view)에서 사용할 수 있도록 전달하기 위해 저장
		request.setAttribute("list", list);
		
		//4. menu.jsp 페이지로 위임처리(응답)
		
		return "goods_list_menu.jsp";
	}

}
