package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.vo.*;
import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

public class CampModel {
	
	private String[] aList=
	{"","전체","의정부","안양","평택","동두천","안산","고양","남양주","오산","용인","파주","안성","김포","화성",
	"광주","양주","포천","여주","연천","가평","양평","청주","충주","제천","보은","옥천","영동","진천","음성",
	"괴산","단양","증평","천안","아산","서산","당진","공주","보령","논산","홍성","예산","부여","서천","청양",
	"태안","금산"}; // 총 46개 => [1]~[46] 

	@RequestMapping("camp/list.do")
	public String camp_list(HttpServletRequest request,HttpServletResponse response)
	{		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		
		List<CampVO> list=CampDAO.campListData(map);
		int totalpage=CampDAO.campTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		Cookie[] cookies=request.getCookies();
		List<CampVO> cookieList=new ArrayList<CampVO>();
		if(cookies!=null)
		{
			for(int i=cookies.length-1;i>=0;i--) // 최신일수록 가장 앞으로
			{
				if(cookies[i].getName().startsWith("camp_"))
				{
					String camp_no=cookies[i].getValue();
					CampVO vo=CampDAO.campDetailData(Integer.parseInt(camp_no));
					cookieList.add(vo);
				}
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("cookieList", cookieList);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("main_jsp", "../camp/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("camp/detail_before.do")
	public String camp_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		String camp_no=request.getParameter("camp_no");
		
		// Cookie 저장
		Cookie cookie=new Cookie("camp_"+camp_no,camp_no);
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		
		response.addCookie(cookie); // 브라우저로 전송
		
		return "redirect:../camp/detail.do?camp_no="+camp_no;
	}
	
	@RequestMapping("camp/detail.do")
	public String camp_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String camp_no=request.getParameter("camp_no");
			
		CampVO vo=CampDAO.campDetailData(Integer.parseInt(camp_no));
		
		String addr=vo.getCamp_addr(); // 충남 서천군 서면 춘장대길8번길 7-7
		String addr1=addr.substring(0,addr.indexOf(" "));
		
		List<CampVO> nList=CampDAO.campNearListData(addr1);
				
		request.setAttribute("vo", vo);
		request.setAttribute("nList", nList);
		
		CommonsModel.footerPrint(request);
				
		request.setAttribute("main_jsp", "../camp/detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("camp/map.do")
	public String camp_map(HttpServletRequest request,HttpServletResponse response)
	{
		String a=request.getParameter("a");
		if(a==null)
			a="1";
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		map.put("a", a);
		
		List<CampVO> list=CampDAO.campFindData(map);
		int totalpage=CampDAO.campTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		Cookie[] cookies=request.getCookies();
		List<CampVO> cookieList=new ArrayList<CampVO>();
		if(cookies!=null)
		{
			for(int i=cookies.length-1;i>=0;i--) // 최신일수록 가장 앞으로
			{
				if(cookies[i].getName().startsWith("camp_"))
				{
					String camp_no=cookies[i].getValue();
					CampVO vo=CampDAO.campDetailData(Integer.parseInt(camp_no));
					cookieList.add(vo);
				}
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("cookieList", cookieList);
		
		request.setAttribute("a", a);
		request.setAttribute("abc", aList[Integer.parseInt(a)]);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("main_jsp", "../camp/map.jsp");
		return "../main/main.jsp";
	} 
	
	@RequestMapping("camp/pet.do")
	public String camp_pet(HttpServletRequest request,HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		
		List<CampVO> list=CampDAO.campPetData(map);
		int totalpage=CampDAO.campPetTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		Cookie[] cookies=request.getCookies();
		List<CampVO> cookieList=new ArrayList<CampVO>();
		if(cookies!=null)
		{
			for(int i=cookies.length-1;i>=0;i--) // 최신일수록 가장 앞으로
			{
				if(cookies[i].getName().startsWith("camp_"))
				{
					String camp_no=cookies[i].getValue();
					CampVO vo=CampDAO.campDetailData(Integer.parseInt(camp_no));
					cookieList.add(vo);
				}
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("cookieList", cookieList);
		
		CommonsModel.footerPrint(request);
		
		request.setAttribute("main_jsp", "../camp/pet.jsp");
		return "../main/main.jsp";
	}
	
    @RequestMapping("camp/sub_menu.do")
    public String camp_sub_menu(HttpServletRequest request,HttpServletResponse response)
    {
    	String[] menu1={"전체","의정부","안양","평택","동두천","안산","고양","남양주","오산","용인","파주","안성","김포","화성",
        		"광주","양주","포천","여주","연천","가평","양평"
    	};
    	String[] menu2={"청주","충주","제천","보은","옥천","영동","진천","음성",
        		"괴산","단양","증평"
    	};
    	String[] menu3={"천안","아산","서산","당진","공주","보령","논산","홍성","예산","부여","서천","청양",
        		"태안","금산"
    	};
    	
        String no=request.getParameter("no");
        List<String> sList=new ArrayList<String>();
        
        if(no.equals("1"))
        {
        	sList.clear();
        	for(String m:menu1)
        	{
        		sList.add(m);
        	}
        }
        else if(no.equals("2"))
        {
        	sList.clear();
        	for(String m:menu2)
        	{
        		sList.add(m);
        	}
        }
        else if(no.equals("3"))
        {
        	sList.clear();
        	for(String m:menu3)
        	{
        		sList.add(m);
        	}
        }
        
        request.setAttribute("sList", sList);
        
    	return "../camp/sub_menu.jsp";
    }
    @RequestMapping("camp/find_result.do")
    public String camp_find_result(HttpServletRequest request,HttpServletResponse response)
    {
    	String menu=request.getParameter("menu");
    	request.setAttribute("menu", menu);
    	return "../camp/find_result.jsp";
    }
    
    @RequestMapping("camp/nearfood.do")
    public String camp_nearfood(HttpServletRequest request,HttpServletResponse response)
    {
 	   // 사용자 요청값 받기 
 	   String page=request.getParameter("page");
 	   if(page==null)
 		   page="1";
 	   int curpage=Integer.parseInt(page);
 	   Map map=new HashMap();
 	   int rowSize=20;
 	   int start=(rowSize*curpage)-(rowSize-1);
 	   int end=rowSize*curpage;
 	   
 	   map.put("start", start);
 	   map.put("end", end);
 	   List<FoodVO> fList=FoodDAO.foodListData(map);
 	   int totalpage=FoodDAO.foodTotalPage();
 	   
 	   final int BLOCK=10;
 	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
 	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
 	   
 	   if(endPage>totalpage)
 		   endPage=totalpage;
 	   
 	   request.setAttribute("fList", fList);
 	   request.setAttribute("curpage", curpage);
 	   request.setAttribute("totalpage", totalpage);
 	   request.setAttribute("startPage", startPage);
 	   request.setAttribute("endPage", endPage);
 	   // DB연동 => 출력할 데이터 전송 
 	   int count=FoodDAO.foodListCount();
 	   request.setAttribute("count", count);
 	   
 	  CommonsModel.footerPrint(request);
 	   
 	   request.setAttribute("main_jsp", "../camp/nearfood.jsp");
 	   return "../main/main.jsp";
    }
}