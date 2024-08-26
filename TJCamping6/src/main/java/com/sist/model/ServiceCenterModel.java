package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class ServiceCenterModel {

	private String[] types= {"","일반공지","이벤트공지","맛집공지","여행공지"};

	@RequestMapping("servicecenter/servicecenter_main.do")
	public String adminpage_main(HttpServletRequest request, HttpServletResponse response) {
		// 공지사항
		String page = request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=15;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeVO> list = NoticeDAO.noticeListData(map);
		for (NoticeVO vo : list) {
			vo.setNotice_type(types[vo.getType()]);
		}
		int count = NoticeDAO.noticeRowCount();
		int totalpage=(int)(Math.ceil(count/15.0));
		count = count-((curpage*rowSize)-rowSize);
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("noticeList", list);
		
		////////////////////////////////////////////////////////////////////////////////////
		
		
		
		
		request.setAttribute("notice_jsp", "../notice/list.jsp");
		request.setAttribute("main_jsp", "../servicecenter/servicecenter_main.jsp");
		return "../main/main.jsp";
	}
}
