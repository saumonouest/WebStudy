package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class ServiceCenterModel {
	
	@RequestMapping("servicecenter/servicecenter_main.do")
	   public String servicecenter_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   
		   request.setAttribute("main_jsp", "../servicecenter/servicecenter_main.jsp");
		   return "../main/main.jsp";
	   }
	
	
	

private String[] types= {"","일반공지","이벤트공지"};
	
	@RequestMapping("servicecenter/camp_list.do")
	public String camp_list(HttpServletRequest request , HttpServletResponse response) {
		String page = request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=15;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<ServiceVO> list = ServiceDAO.campBoardListData(map);
		for (ServiceVO vo : list) {
			vo.setCamp_type(types[vo.getType()]);
		}
		int count = ServiceDAO.campRowCount();
		int totalpage=(int)(Math.ceil(count/15.0));
		count = count-((curpage*rowSize)-rowSize);
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("campBList", list);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("main_jsp", "../servicecenter/camp_list.jsp");
		return"../main/main.jsp";
	}
	// 상세보기
	@RequestMapping("servicecenter/camp_detail.do")
	public String notice_detail(HttpServletRequest request , HttpServletResponse response) {
		
		String no = request.getParameter("no");
		ServiceVO vo = ServiceDAO.campDetailData(Integer.parseInt(no));
		vo.setCamp_type(types[vo.getType()]);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../servicecenter/camp_detail.jsp");
		return "../main/main.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("servicecenter/goods_list.do")
	public String goods_list(HttpServletRequest request , HttpServletResponse response) {
		String page = request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=15;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<ServiceVO> list = ServiceDAO.goodsBoardListData(map);
		for (ServiceVO vo : list) {
			vo.setGoods_type(types[vo.getType()]);
		}
		int count = ServiceDAO.goodsRowCount();
		int totalpage=(int)(Math.ceil(count/15.0));
		count = count-((curpage*rowSize)-rowSize);
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("goodsList", list);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("main_jsp", "../servicecenter/goods_list.jsp");
		return"../main/main.jsp";
	}
	// 상세보기
	@RequestMapping("servicecenter/goods_detail.do")
	public String goods_detail(HttpServletRequest request , HttpServletResponse response) {
		
		String no = request.getParameter("no");
		ServiceVO vo = ServiceDAO.goodsDetailData(Integer.parseInt(no));
		vo.setGoods_type(types[vo.getType()]);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../servicecenter/goods_detail.jsp");
		return "../main/main.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("servicecenter/recipe_list.do")
	public String recipe_list(HttpServletRequest request , HttpServletResponse response) {
		String page = request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=15;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<ServiceVO> list = ServiceDAO.recipeBoardListData(map);
		for (ServiceVO vo : list) {
			vo.setRecipe_type(types[vo.getType()]);
		}
		int count = ServiceDAO.recipeRowCount();
		int totalpage=(int)(Math.ceil(count/15.0));
		count = count-((curpage*rowSize)-rowSize);
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("recipeList", list);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("main_jsp", "../servicecenter/recipe_list.jsp");
		return"../main/main.jsp";
	}
	// 상세보기
	@RequestMapping("servicecenter/recipe_detail.do")
	public String recipe_detail(HttpServletRequest request , HttpServletResponse response) {
		
		String no = request.getParameter("no");
		ServiceVO vo = ServiceDAO.recipeDetailData(Integer.parseInt(no));
		vo.setRecipe_type(types[vo.getType()]);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../servicecenter/recipe_detail.jsp");
		return "../main/main.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("servicecenter/food_list.do")
	public String food_list(HttpServletRequest request , HttpServletResponse response) {
		String page = request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=15;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<ServiceVO> list = ServiceDAO.foodBoardListData(map);
		for (ServiceVO vo : list) {
			vo.setFood_type(types[vo.getType()]);
		}
		int count = ServiceDAO.foodRowCount();
		int totalpage=(int)(Math.ceil(count/15.0));
		count = count-((curpage*rowSize)-rowSize);
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("foodList", list);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("main_jsp", "../servicecenter/food_list.jsp");
		return"../main/main.jsp";
	}
	// 상세보기
	@RequestMapping("servicecenter/food_detail.do")
	public String food_detail(HttpServletRequest request , HttpServletResponse response) {
		
		String no = request.getParameter("no");
		ServiceVO vo = ServiceDAO.foodDetailData(Integer.parseInt(no));
		vo.setFood_type(types[vo.getType()]);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../servicecenter/food_detail.jsp");
		return "../main/main.jsp";
	}
	
	
	
	
	
	
}
