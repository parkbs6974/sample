package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.UsersDAO;

public class PwSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pw = UsersDAO.pwSearch(id, name, email);
		request.setAttribute("pw", pw);
		System.out.println("name:" + name + "eamail" + email + "id: " + id + "pw" + pw);
		return "pwSearch.jsp";
	}

}
