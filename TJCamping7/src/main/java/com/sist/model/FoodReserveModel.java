package com.sist.model;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.vo.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

public class FoodReserveModel {

	@RequestMapping("food/food_reserve.do")
	public String food_reserve(HttpServletRequest request,HttpServletResponse response)
	{
		
		String fno=request.getParameter("fno");
		System.out.println(fno);
		FoodVO vo=FoodDAO.FoodReserveData(Integer.parseInt(fno));
		request.setAttribute("fno", fno);
		  String strYear=request.getParameter("year");
		  String strMonth=request.getParameter("month");
		  String strDay="";
		  
		  
		  Date date=new Date();
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		  String today=sdf.format(date);
		  StringTokenizer st=new StringTokenizer(today,"-");
		  
		  String sy=st.nextToken();
		  String sm=st.nextToken();
		  strDay=st.nextToken();
		  /////////////////// 오늘 날짜만 저장 
		  String tday=strDay;
		  String tyear=sy;
		  String tmonth=sm;
		  ///////////////////
		  if(strYear==null)
		  {
			  strYear=sy;
		  }
		  if(strMonth==null)
		  {
			  strMonth=sm;
		  }
		
		  int year=Integer.parseInt(strYear);
		  int month=Integer.parseInt(strMonth);
		  int day=Integer.parseInt(strDay);
		  
		  // 요일 구하기 / 마지막 날 
		  Calendar cal=Calendar.getInstance();
		  cal.set(Calendar.YEAR, year);
		  cal.set(Calendar.MONTH, month-1);
		  cal.set(Calendar.DATE, 1);
		  
		  int week=cal.get(Calendar.DAY_OF_WEEK);
		  week=week-1;
		  
		  int lastday=cal.getActualMaximum(Calendar.DATE);
		  
		  request.setAttribute("year", year);
		  request.setAttribute("month", month);
		  request.setAttribute("day", day);
		  request.setAttribute("week", week);
		  request.setAttribute("lastday", lastday);
		  
		  // 예약 가능한 날 => 1,2,3,19,20....
		  if(fno!=null)
		  {
		     String rdays=FoodDAO.FoodReserveDayData1(Integer.parseInt(fno));
		     int[] reserveDays=new int[32];
		     if(month==Integer.parseInt(tmonth) && year==Integer.parseInt(tyear))
		     {
			     st=new StringTokenizer(rdays,",");
			     
			     while(st.hasMoreTokens())
			     {
			    	 int d=Integer.parseInt(st.nextToken());
			    	 if(d>=day)
			    	 {
			    	    reserveDays[d]=1;
			    	 }
			     }
		     }
		     else 
		     {
			     st=new StringTokenizer(rdays,",");
			     while(st.hasMoreTokens())
			     {
			    	 int d=Integer.parseInt(st.nextToken());
			    	 reserveDays[d]=1;
			    	 
			     } 
		     }
		     
		     request.setAttribute("rday", reserveDays);
		  }
		 
		  String[] weeks={"일","월","화","수","목","금","토"};
		  request.setAttribute("weeks", weeks);
		  
		  request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../food/food_reserve.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("food/food_reserve_date.do")
	public String reserve_ok(HttpServletRequest request,HttpServletResponse response)
	{
		
		String fno=request.getParameter("fno");
		FoodVO vo=FoodDAO.FoodReserveData(Integer.parseInt(fno));
		request.setAttribute("fno", fno);
		String strYear=request.getParameter("year");
		String strMonth=request.getParameter("month");
		String strDay="";
		
		
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		String today=sdf.format(date);
		StringTokenizer st=new StringTokenizer(today,"-");
		
		String sy=st.nextToken();
		String sm=st.nextToken();
		strDay=st.nextToken();
		/////////////////// 오늘 날짜만 저장 
		String tday=strDay;
		String tyear=sy;
		String tmonth=sm;
		///////////////////
		if(strYear==null)
		{
			strYear=sy;
		}
		if(strMonth==null)
		{
			strMonth=sm;
		}
		
		int year=Integer.parseInt(strYear);
		int month=Integer.parseInt(strMonth);
		int day=Integer.parseInt(strDay);
		
		// 요일 구하기 / 마지막 날 
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE, 1);
		
		int week=cal.get(Calendar.DAY_OF_WEEK);
		week=week-1;
		
		int lastday=cal.getActualMaximum(Calendar.DATE);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday);
		
		
		// 예약 가능한 날 => 1,2,3,19,20....
		if(fno!=null)
		{
			String rdays=FoodDAO.FoodReserveDayData1(Integer.parseInt(fno));
			int[] reserveDays=new int[32];
			if(month==Integer.parseInt(tmonth) && year==Integer.parseInt(tyear))
			{
				st=new StringTokenizer(rdays,",");
				
				while(st.hasMoreTokens())
				{
					int d=Integer.parseInt(st.nextToken());
					if(d>=day)
					{
						reserveDays[d]=1;
					}
				}
			}
			else 
			{
				st=new StringTokenizer(rdays,",");
				while(st.hasMoreTokens())
				{
					int d=Integer.parseInt(st.nextToken());
					reserveDays[d]=1;
					
				} 
			}
			
			request.setAttribute("rday", reserveDays);
		}
		
		String[] weeks={"일","월","화","수","목","금","토"};
		request.setAttribute("vo", vo);
		request.setAttribute("fno", fno);
		return "../food/food_reserve_date.jsp";
	}
	
	@RequestMapping("food/food_reserve_time.do")
	public String food_reserve_time(HttpServletRequest request,HttpServletResponse response){
		String day=request.getParameter("day");
		
		// 데이터베이스 연동
		String times=FoodReserveDAO.FoodReserveTimeData(Integer.parseInt(day));
		List<String> ftList=new ArrayList<String>();
		StringTokenizer st=new StringTokenizer(times,",");
		while(st.hasMoreTokens())
		{
			String time=FoodReserveDAO.FoodTimeSelectData(Integer.parseInt(st.nextToken()));
			ftList.add(time);
		}
		
		request.setAttribute("ftList", ftList);
		
		return "../food/food_reserve_time.jsp";
	}
	
	@RequestMapping("food/food_reserve_inwon.do")
	public String food_reserve_inwon(HttpServletRequest request,HttpServletResponse response)
	{
		return "../food/food_reserve_inwon.jsp";
	}
	
	
	 @RequestMapping("mypage/mypage_food_reserve.do")
	  public String mypage_reserve(HttpServletRequest request,HttpServletResponse response)
	  {
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  List<FoodReserveVO> list=FoodDAO.FoodReserveMyPageData(id);
		  request.setAttribute("title", "예약관리");
		  request.setAttribute("frecvList", list);
		  request.setAttribute("mypage_jsp", "../mypage/mypage_food_reserve.jsp");
		  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("reserve/food_reserve_ok.do")
	  public String food_reserve_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 예약정보 
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String fno=request.getParameter("fno");
		  String date=request.getParameter("date");
		  String time=request.getParameter("time");
		  String inwon=request.getParameter("inwon");
		  
		  System.out.println("캠핑장 번호:"+fno);
		  System.out.println("예약일:"+date);
		  System.out.println("예약시간:"+time);
		  System.out.println("인원:"+inwon);
		  
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  FoodReserveVO vo=new FoodReserveVO();
		  vo.setFno(Integer.parseInt(fno));
		  vo.setId(id);
		  vo.setInwon(inwon);
		  vo.setTime(time);
		  vo.setDay(date);
		  
		  FoodDAO.FoodReserveInsert(vo);
		  return "redirect:../mypage/mypage_food_reserve.do";
	  }

		/*
		 * @RequestMapping("adminpage/adminpage_reserve.do") public String
		 * adminpage_reserve(HttpServletRequest request,HttpServletResponse response) {
		 * List<ReserveVO> recvList=FoodDAO.reserveAdminPageData();
		 * request.setAttribute("recvList", recvList); request.setAttribute("admin_jsp",
		 * "../adminpage/adminpage_reserve.jsp"); request.setAttribute("main_jsp",
		 * "../adminpage/adminpage_main.jsp"); return "../main/main.jsp"; }
		 */
		/*
		 * @RequestMapping("adminpage/adminpage_reserve_ok.do") public String
		 * adminpage_reserve_ok(HttpServletRequest request,HttpServletResponse response)
		 * { String rno=request.getParameter("rno"); // 데이터베이스 연동 => 모든 데이터가 오라클에 존재 =>
		 * 80% FoodDAO.reserveOk(Integer.parseInt(rno)); return
		 * "redirect:../adminpage/adminpage_reserve.do"; }
		 */
	  @RequestMapping("mypage/mypage_food_reserve_cancel.do")
	  public String mypage_food_reserve_cancel(HttpServletRequest request,HttpServletResponse response)
	  {
		  String frno=request.getParameter("frno");
		  // 데이터베이스 연동 => 삭제 
		  FoodDAO.FoodreserveCancel(Integer.parseInt(frno));
		  return "redirect:../mypage/mypage_food_reserve.do";
	  }
	  @RequestMapping("mypage/mypage_food_reserve_info.do")
	  public void mypage_food_reserve_info(HttpServletRequest request,HttpServletResponse response)
	  {
		  String frno=request.getParameter("frno");
		  FoodReserveVO vo = FoodReserveDAO.myFoodReserveData(Integer.parseInt(frno));
		  
		  JSONObject obj = new JSONObject();
		    obj.put("frno", vo.getFrno());
		    obj.put("day", vo.getDay());
		    obj.put("time", vo.getTime());
		    obj.put("inwon", vo.getInwon());
		    obj.put("name", vo.getFvo().getName());
		    obj.put("poster", vo.getFvo().getPoster());
		    obj.put("address", vo.getFvo().getAddress());
		    obj.put("phone", vo.getFvo().getPhone());
		    obj.put("regdate", vo.getDbday());
		    
		    try {
		        // 응답 타입 설정 (JSON으로 전송)
		        response.setContentType("application/json;charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        
		        // JSON 객체를 문자열로 변환 후 전송
		        out.write(obj.toJSONString());
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    }
	  }
}
