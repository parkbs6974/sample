package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.UsersDAO;

public class CartUpdateCommand implements Command {


	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cnt = request.getParameter("cnt");
		System.out.println("cnt : " + cnt);
		return "order.jsp";
	}

}
