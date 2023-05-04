package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.UsersDAO;

public class IdSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = UsersDAO.idSearch(name, email);
		System.out.println("name:" + name + "eamail" + email + "id: " + id);
		request.setAttribute("id", id);
		
		return "idSearch.jsp";
	}

}
 