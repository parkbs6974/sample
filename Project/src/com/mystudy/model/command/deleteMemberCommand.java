package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.UsersDAO;
import com.mystudy.ajax.vo.UsersVO;

public class deleteMemberCommand implements Command { 

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pw = request.getParameter("pw");
		String id = request.getParameter("id");
		
		
		return "deleteMemberOk.jsp";
	}

}
