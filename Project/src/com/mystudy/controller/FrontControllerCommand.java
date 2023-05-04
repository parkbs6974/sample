package com.mystudy.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.command.CartToOrderCommand;
import com.mystudy.model.command.CartUpdateCommand;
import com.mystudy.model.command.Command;
import com.mystudy.model.command.FoodCommand;
import com.mystudy.model.command.IdSearchCommand;
import com.mystudy.model.command.WalkCommand;
import com.mystudy.model.command.deleteMemberCommand;
import com.mystudy.model.command.ListCommand;
import com.mystudy.model.command.LoginCommand;
import com.mystudy.model.command.PwCheckCommand;
import com.mystudy.model.command.PwSearchCommand;
import com.mystudy.model.command.ShowerCommand;
import com.mystudy.model.command.ToyCommand;
import com.mystudy.ajax.dao.GoodsDAO;
import com.mystudy.ajax.vo.GoodsVO;

@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Map<String, Command> commands = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		//commands에 Map 객체 생성해서 저장하고
		//commands에 요청작업명-요청처리객체 저장
		//예) commands.put("list", new ListCommand());
		commands = new HashMap<String, Command>();
		commands.put("list", new ListCommand());
		commands.put("walk", new WalkCommand());
		commands.put("food", new FoodCommand());
		commands.put("shower", new ShowerCommand());
		commands.put("toy", new ToyCommand());
		commands.put("login", new LoginCommand());
		commands.put("idSearch", new IdSearchCommand());
		commands.put("pwSearch", new PwSearchCommand());
		commands.put("deleteMember", new deleteMemberCommand());
		commands.put("cartToOrder", new CartToOrderCommand());
		commands.put("cartUpdate", new CartUpdateCommand());
		commands.put("pwCheck", new PwCheckCommand());
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doGet() 실행-----------");
		String type = request.getParameter("type");
		System.out.println(":: type : " + type);

		Command command = commands.get(type);
		String answer = command.exec(request, response);
		request.getRequestDispatcher(answer).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행-----------");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}







