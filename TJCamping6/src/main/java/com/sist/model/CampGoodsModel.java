package com.sist.model;
import java.io.PrintWriter;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class CampGoodsModel {
	private String[] tables={"","CAMP_GOODS_ALL","CAMP_GOODS_BRAND","CAMP_GOODS_BEST","CAMP_GOODS_NEW","CAMP_GOODS_SPECIAL"};
	private String[] titles= {"","전체 상품","브랜드별 상품","베스트 상품","신상품","세일 상품"}; 
	@RequestMapping("campgoods/list.do")
	public String campgoods_list(HttpServletRequest request, HttpServletResponse response) {
		String gno=request.getParameter("gno");
		if(gno==null)
			gno="1"; // 참조 NO => tables
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("table_name", tables[Integer.parseInt(gno)]);
		map.put("start", start);
		map.put("end", end);
		List<CampGoodsVO> gList=CampGoodsDAO.campGoodsListData(map);
		int totalpage=CampGoodsDAO.campGoodsTotalPage(map);
		
		// 카테고리별 리스트 준비
	    List<CampGoodsVO> amList = new ArrayList<>();
	    List<CampGoodsVO> ttList = new ArrayList<>();
	    List<CampGoodsVO> cgList = new ArrayList<>();
	    List<CampGoodsVO> crList = new ArrayList<>();
	    List<CampGoodsVO> bbList = new ArrayList<>();
	    List<CampGoodsVO> ltList = new ArrayList<>();

	    // 카테고리별 데이터 분류
	    for (CampGoodsVO item : gList) {
	        switch (item.getType1()) {
	            case 1:
	            	amList.add(item);
	                break;
	            case 2:
	            	ttList.add(item);
	                break;
	            case 3:
	            	cgList.add(item);
	                break;
	            case 4:
	            	crList.add(item);
	                break;
	            case 5:
	            	bbList.add(item);
	                break;
	            case 6:
	            	ltList.add(item);
	                break;
	        }
	    }
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("gList", gList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("gno", gno);
		request.setAttribute("title", titles[Integer.parseInt(gno)]);
		request.setAttribute("amList", amList);
	    request.setAttribute("ttList", ttList);
	    request.setAttribute("cgList", cgList);
	    request.setAttribute("crList", crList);
	    request.setAttribute("bbList", bbList);
	    request.setAttribute("ltList", ltList);
		
		request.setAttribute("main_jsp", "../campgoods/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("campgoods/detail_before.do")
	   public String food_detail_before(HttpServletRequest request,HttpServletResponse response)
	   {
		   String cno=request.getParameter("cno");
		   String gno=request.getParameter("gno");
		   String type=request.getParameter("type");
		   // 쿠키
		   Cookie cookie=new Cookie("campgoods_"+cno, cno);
		   cookie.setMaxAge(60*60*24);
		   cookie.setPath("/");
		   // 브라우저로 전송
		   response.addCookie(cookie);
		   return "redirect:../campgoods/detail.do?cno="+cno+"&gno="+gno+"&type="+type;
	   }
	@RequestMapping("campgoods/detail.do")
	public String campgoods_detail(HttpServletRequest request, HttpServletResponse response) {
		String cno1=request.getParameter("cno");
		String gno=request.getParameter("gno");
		String type=request.getParameter("type");
		Map map=new HashMap();
		map.put("cno", cno1);
		map.put("table_name", tables[Integer.parseInt(gno)]);
		List<CampGoodsVO> gList=CampGoodsDAO.campGoodsRecListData(map);
		CampGoodsVO vo=CampGoodsDAO.campGoodsDetailData(map);
		String price=vo.getPrice();
		String price2=vo.getPrice();
		price2=price2.replaceAll("[^0-9]", "");
		vo.setPrice2(Integer.parseInt(price2));
		
		boolean bCheck=false;
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		request.setAttribute("type",type);
		if(id!=null) {
			Map map2 = new HashMap();
			map2.put("cno", cno1);
			map2.put("type",type);
			map2.put("id", id);
			int count=AllJjimDAO.allJjimCheck(map2);
	        System.out.println(cno1+" "+type+" "+id+" "+count);
			if(count==1) {
				bCheck=true;
		        System.out.println(cno1+" "+type+" "+id);
			}
			else
				bCheck=false;
			
			request.setAttribute("check", bCheck);
			
		}
	    
		request.setAttribute("gList", gList);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../campgoods/detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("campgoods/list_brand.do")
	public String campgoods_brandlist(HttpServletRequest request, HttpServletResponse response) {
		String gno=request.getParameter("gno");
		if(gno==null)
			gno="1";
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("table_name", tables[Integer.parseInt(gno)]);
		map.put("start", start);
		map.put("end", end);
		List<CampGoodsVO> gList=CampGoodsDAO.campGoodsBrandListData(map);
		int totalpage=CampGoodsDAO.campGoodsBrandTotalPage(map);
		
		List<String> brandList = CampGoodsDAO.getBrandList();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("gList", gList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("gno", gno);
		request.setAttribute("title", titles[Integer.parseInt(gno)]);
		request.setAttribute("brandList", brandList);
		
		request.setAttribute("main_jsp", "../campgoods/list_brand.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("campgoods/list_find.do")
	public String campgoods_find(HttpServletRequest request, HttpServletResponse response) {
	    try 
	    {
	        request.setCharacterEncoding("UTF-8");
	    } catch (Exception ex) {}

	    String gno = request.getParameter("gno");
	    if (gno == null) 
	    	gno = "1"; 
	    String ss = request.getParameter("ss");
	    if (ss == null) 
	    	ss = "none";
	    String page = request.getParameter("page");
	    if (page == null) 
	    	page = "1";
	    int curpage = Integer.parseInt(page);
	    int rowSize = 20;
	    int start = (rowSize * curpage) - (rowSize - 1);
	    int end = (rowSize * curpage);
	    
	    Map map = new HashMap();
	    map.put("start", start);
	    map.put("end", end);
	    map.put("ss", ss);
	    
	    List<CampGoodsVO> gList = CampGoodsDAO.goodsFindListData(map);
	    int totalpage = CampGoodsDAO.goodsFindTotalPage(ss);
	    
	    final int BLOCK = 10;
	    int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
	    int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
	    if (endPage > totalpage) endPage = totalpage;
	    
	    List<String> brandList = CampGoodsDAO.getBrandList(); 
	    
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
	    request.setAttribute("gList", gList);
	    request.setAttribute("gno", gno);
	    request.setAttribute("ss", ss);
	    request.setAttribute("brandList", brandList); 

	    request.setAttribute("main_jsp", "../campgoods/list_find.jsp");
	    return "../main/main.jsp";
	}
	
}