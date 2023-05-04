package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.mystudy.ajax.dao.UsersDAO;
import com.mystudy.ajax.vo.UsersVO;

public class LoginCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		UsersVO list = UsersDAO.userLogin(id, pw);
		request.setAttribute("id", id);
		request.setAttribute("pw", pw);
		
		return "loginOk.jsp";
	}

}
