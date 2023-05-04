package com.mystudy.model.command;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.UsersDAO;

public class CartToOrderCommand implements Command {


	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] arr = request.getParameterValues("cartNumArr[]");
		Map<String, String> map = null;
		for (int i = 0; i < arr.length ; i++) {
			System.out.println(arr[i]);
			/*
			 * String name = "name" + i; map.put(name, arr[i]);
			 */
		}
		
		
		return "ok";
	}

}
