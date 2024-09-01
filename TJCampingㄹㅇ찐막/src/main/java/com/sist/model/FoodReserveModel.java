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
import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

public class FoodReserveModel {

	  @RequestMapping("food/reserve_main.do") // if과 동일한 역할
	  public String reserve_main(HttpServletRequest request, HttpServletResponse response) {
		    String fno = request.getParameter("fno");

		    FoodReserveVO vo = FoodReserveDAO.foodReserveData(Integer.parseInt(fno));
		    request.setAttribute("vo", vo);
		    request.setAttribute("fno", fno);

		    
		    /*
		    String strYear = request.getParameter("year");
		    String strMonth = request.getParameter("month");
		    String strDay = "";

		    Date date = new Date();
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
		    String today = sdf.format(date);
		    StringTokenizer st = new StringTokenizer(today, "-");

		    String sy = st.nextToken();
		    String sm = st.nextToken();
		    strDay = st.nextToken();
		    
		    // 오늘 날짜만 저장
		    String tday = strDay;
		    String tyear = sy;
		    String tmonth = sm;

		    // null 검사 후 기본값 할당
		    if (strYear == null) {
		        strYear = sy;
		    }
		    if (strMonth == null) {
		        strMonth = sm;
		    }

		    int year = Integer.parseInt(strYear);
		    int month = Integer.parseInt(strMonth);
		    int day = Integer.parseInt(strDay);

		    // 요일 구하기 및 마지막 날
		    Calendar cal = Calendar.getInstance();
		    cal.set(Calendar.YEAR, year);
		    cal.set(Calendar.MONTH, month - 1);
		    cal.set(Calendar.DATE, 1);

		    int week = cal.get(Calendar.DAY_OF_WEEK) - 1;
		    int lastday = cal.getActualMaximum(Calendar.DATE);

		    request.setAttribute("year", year);
		    request.setAttribute("month", month);
		    request.setAttribute("day", day);
		    request.setAttribute("week", week);
		    request.setAttribute("lastday", lastday);

		    // 예약 가능한 날 계산
		    if (fno != null) {
		        String rdays = FoodReserveDAO.foodReserveDayData(Integer.parseInt(fno));
		        int[] reserveDays = new int[32];
		        if (month == Integer.parseInt(tmonth) && year == Integer.parseInt(tyear)) {
		            if (rdays != null) {
		                st = new StringTokenizer(rdays, ",");
		                while (st.hasMoreTokens()) {
		                    int d = Integer.parseInt(st.nextToken());
		                    if (d >= day) {
		                        reserveDays[d] = 1;
		                    }
		                }
		            }
		        } else {
		            if (rdays != null) {
		                st = new StringTokenizer(rdays, ",");
		                while (st.hasMoreTokens()) {
		                    int d = Integer.parseInt(st.nextToken());
		                    reserveDays[d] = 1;
		                }
		            }
		        }
		        request.setAttribute("rday", reserveDays);
		    }

		    String[] weeks = {"일", "월", "화", "수", "목", "금", "토"};
		    request.setAttribute("weeks", weeks);*/

		    CommonsModel.footerPrint(request);

		    request.setAttribute("main_jsp", "../food/reserve_main.jsp");
		    return "../main/main.jsp";
		}

	  @RequestMapping("food/date_info.do")
	  public String date_info(HttpServletRequest request,HttpServletResponse response)
	  {
		  String strYear=request.getParameter("year");
		  String strMonth=request.getParameter("month");
		  String strDay="";
		  
		  String strFno=request.getParameter("fno");
		  
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
		  request.setAttribute("fno", strFno);
		  
		  // 예약 가능한 날 => 1,2,3,19,20....
		  if(strFno!=null)
		  {
		     String rdays=FoodReserveDAO.foodReserveDayData(Integer.parseInt(strFno));
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
		  return "../reserve/date_info.jsp";
	  }
	  /*
	  @RequestMapping("food/food_info.do")
	  public String reserve_food_type(HttpServletRequest request,HttpServletResponse response)
	  {
		  String type=request.getParameter("type");
		  if(type==null)
			  type="한식";
		  List<FoodVO> list=FoodDAO.foodTypeAllData(type);
		  request.setAttribute("fList", list);
		  return "../food/food_info.jsp";
	  }*/
	  @RequestMapping("food/time_info.do")
	  public String reserve_time_info(HttpServletRequest request,HttpServletResponse response)
	  {
		  String day=request.getParameter("day");
		  // 데이터베이스 연동 
		  String times=FoodReserveDAO.foodReserveTimeData(Integer.parseInt(day));
		  List<String> tList=new ArrayList<String>();
		  StringTokenizer st=new StringTokenizer(times,",");
		  while(st.hasMoreTokens())
		  {
			  String time=FoodReserveDAO.foodTimeSelectData(Integer.parseInt(st.nextToken()));
			  tList.add(time);
		  }
		  request.setAttribute("tList", tList);
		  return "../food/time_info.jsp";
	  }
	  @RequestMapping("food/inwon_info.do")
	  public String reserve_inwon_info(HttpServletRequest request,HttpServletResponse response)
	  {
		  return "../food/inwon_info.jsp";
	  }
	  
	  @RequestMapping("mypage/mypage_food_reserve.do")
	  public String mypage_food_reserve(HttpServletRequest request,HttpServletResponse response)
	  {
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  List<FoodReserveVO> list=FoodReserveDAO.foodReserveMyPageData(id);
		  request.setAttribute("title", "예약관리");
		  request.setAttribute("recvList", list);
		  request.setAttribute("mypage_jsp", "../mypage/mypage_food_reserve.jsp");
		  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("food/food_reserve_ok.do")
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
		  
		  System.out.println("맛집 번호:"+fno);
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
		  
		  FoodReserveDAO.foodReserveInsert(vo);
		  
		  //request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		  return "redirect:../mypage/mypage_food_reserve.do";
	  }
	  @RequestMapping("adminpage/adminpage_food_reserve.do")
	  public String adminpage_reserve(HttpServletRequest request,HttpServletResponse response)
	  {
		  List<FoodReserveVO> recvList=FoodReserveDAO.foodReserveAdminPageData();
		  request.setAttribute("recvList", recvList);
		  request.setAttribute("admin_jsp", "../adminpage/adminpage_food_reserve.jsp");
		  request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("adminpage/adminpage_food_reserve_ok.do")
	  public String adminpage_food_reserve_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  String frno=request.getParameter("frno");
		  // 데이터베이스 연동 => 모든 데이터가 오라클에 존재 => 80%
		  FoodReserveDAO.foodReserveOk(Integer.parseInt(frno));
		  return "redirect:../adminpage/adminpage_food_reserve.do";
	  }
	  @RequestMapping("mypage/mypage_food_reserve_cancel.do")
	  public String mypage_food_reserve_cancel(HttpServletRequest request,HttpServletResponse response)
	  {
		  String frno=request.getParameter("frno");
		  // 데이터베이스 연동 => 삭제 
		  FoodReserveDAO.foodReserveCancel(Integer.parseInt(frno));
		  return "redirect:../mypage/mypage_food_reserve.do";
	  }
	  @RequestMapping("mypage/mypage_food_reserve_info.do")
	  public void mypage_food_reserve_info(HttpServletRequest request,HttpServletResponse response)
	  {
		  String frno=request.getParameter("frno");
		  // 데이터베이스 연동 
		  /*
		   *   frno,day,pr.time,inwon,pf.name,pf.poster,pf.address,phone,theme,score,content,
			           TO_CHAR(redate,'YYYY-MM-DD HH24:MI:SS') as dbday
		   */
		  FoodReserveVO vo=FoodReserveDAO.mypageFoodReserveInfoData(Integer.parseInt(frno));
		  // {frno:1....} => JSON:JavaScript Object Notation
		  // 자바 = 자바스크립트 호환 => RestFul 
		  JSONObject obj=new JSONObject();
		  obj.put("frno", vo.getFrno());
		  obj.put("day", vo.getDay());
		  obj.put("time", vo.getTime());
		  obj.put("inwon", vo.getInwon());
		  obj.put("name",vo.getFvo().getName());
		  obj.put("poster","http://www.bluer.co.kr"+vo.getFvo().getPoster());
		  obj.put("theme",vo.getFvo().getTheme());
		  obj.put("regdate",vo.getDbday());
		  // Ajax 값을 전송 
		  try
		  {
			  response.setContentType("text/plain;charset=UTF-8");
			  // => text/html(HTML) , text/xml(XML) , text/plain(JSON)
			  PrintWriter out=response.getWriter();
			  out.write(obj.toJSONString());
		  }catch(Exception ex) {}
	  }
}