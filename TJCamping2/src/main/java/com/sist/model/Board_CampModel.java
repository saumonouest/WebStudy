package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class Board_CampModel {
	@RequestMapping("boardcamp/list.do")
	public String boardcamp_list(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../boardcamp/list.jsp");
		return "../main/main.jsp";
	}
	
	/* @RequestMapping("boardcamp/") */ 
	
	/*
	 * insert, update, detail }
	 */
}