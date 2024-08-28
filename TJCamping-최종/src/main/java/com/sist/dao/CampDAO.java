package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import java.sql.ResultSet;

import com.sist.vo.*;
import lombok.Locked.Read;

public class CampDAO {

	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<CampVO> campListData(Map map)
	{
		List<CampVO> list=new ArrayList<CampVO>();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("campListData",map);
		}catch(Exception ex)
		{
			System.out.println("CampDAO 오류 1");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	
	public static int campTotalPage()
	{
		int total=0;
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			total=session.selectOne("campTotalPage");
		}catch(Exception ex)
		{
			System.out.println("CampDAO 오류 2");
			ex.printStackTrace();
		}
		finally
		{
			// connection 반환 (DBCP) => 재사용(반환 시 가능)
			if(session!=null)
				session.close();
		}
		
		return total;
	}
	
	public static CampVO campDetailData(int camp_no)
	{
		
		CampVO vo=new CampVO();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			vo=session.selectOne("campDetailData", camp_no);
		}catch(Exception ex)
		{
			System.out.println("CampDAO 오류 3");
			ex.printStackTrace();
		}
		finally
		{
			// connection 반환 (DBCP) => 재사용(반환 시 가능)
			if(session!=null)
				session.close();
		}
		
		return vo;
	}
	
	public static List<CampVO> campNoTopData()
	{
		List<CampVO> list=new ArrayList<CampVO>();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("campNoTopData");
		}catch(Exception ex)
		{
			System.out.println("CampDAO 오류 4");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	
	public static List<CampVO> campNearListData(String ss)
	{
		List<CampVO> list=new ArrayList<CampVO>();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("campNearListData",ss);
		}catch(Exception ex)
		{
			System.out.println("CampDAO 오류 5");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return list;
		
	}
	
	public static List<CampVO> campFindData(Map map)
	{
		List<CampVO> list=new ArrayList<CampVO>();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("campFindData",map);
		}catch(Exception ex)
		{
			System.out.println("CampDAO 오류 6");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	/*
	public static int campFindTotalPage(String camp_addr)
	{
		int total=0;
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			total=session.selectOne("campFindTotalPage",camp_addr);
		}catch(Exception ex)
		{
			System.out.println("CampDAO 오류 7");
			ex.printStackTrace();
		}
		finally
		{
			// connection 반환 (DBCP) => 재사용(반환 시 가능)
			if(session!=null)
				session.close();
		}
		
		return total;
	}
	*/

	/*
	<select id="campPetData" resultType="CampVO" parameterType="hashmap">
		SELECT camp_no,camp_name,image1,num
		FROM (SELECT camp_no,camp_name,image1,rownum as num
		FROM (SELECT camp_no,camp_name,image1
		FROM camp
		ORDER BY camp_no ASC))
		WHERE num BETWEEN #{start} AND #{end}
		AND camp_animal='y'
	</select>
	 */
	public static List<CampVO> campPetData(Map map)
	{
		List<CampVO> list=new ArrayList<CampVO>();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("campPetData",map);
		}catch(Exception ex)
		{
			System.out.println("CampDAO 오류 9");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	
	public static int campPetTotalPage()
	{
		int total=0;
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			total=session.selectOne("campPetTotalPage");
		}catch(Exception ex)
		{
			System.out.println("CampDAO 오류 10");
			ex.printStackTrace();
		}
		finally
		{
			// connection 반환 (DBCP) => 재사용(반환 시 가능)
			if(session!=null)
				session.close();
		}
		
		return total;
	}
	
	/*
	<select id="campReserveData" resultType="CampVO" parameterType="int">
		SELECT camp_name,image1,camp_name,camp_phone,camp_price
		FROM camp
		WHERE camp_no=#{camp_no}
	</select>
	 */
	public static CampVO campReserveData(int camp_no)
	{
		CampVO vo=new CampVO();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			vo=session.selectOne("campReserveData",camp_no);
		}catch(Exception ex)
		{
			System.out.println("CampDAO 오류 11");
			ex.printStackTrace();
		}
		finally
		{
			// connection 반환 (DBCP) => 재사용(반환 시 가능)
			if(session!=null)
				session.close();
		}
		
		return vo;
	}
	
	   public static String campReserveDayData1(int camp_no)
	   {
		   String rdays="";
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   rdays=session.selectOne("campReserveDayData1", camp_no);
		   }catch(Exception ex)
		   {
			   System.out.println("campReserveDayData1 err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return rdays;
	   }
	   
	   public static String campTimeSelectData(int tno)
	   {
		   String times="";
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   times=session.selectOne("campTimeSelectData", tno);
		   }catch(Exception ex)
		   {
			   System.out.println("campTimeSelectData err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return times;
	   }
	   
	   
	  
	   public static void campReserveInsert(ReserveVO vo)
	   {
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.insert("campReserveInsert", vo);
		   }catch(Exception ex)
		   {
			   System.out.println("campReserveInsert err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   public static List<ReserveVO> campReserveMyPageData(String id)
	   {
		   List<ReserveVO> list=new ArrayList<ReserveVO>();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   list=session.selectList("campReserveMyPageData", id);
		   }catch(Exception ex)
		   {
			   System.out.println("campReserveMyPageData err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   
	   public static List<ReserveVO> campReserveAdminPageData()
	   {
		   List<ReserveVO> list=new ArrayList<ReserveVO>();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   list=session.selectList("campReserveAdminPageData");
		   }catch(Exception ex)
		   {
			   System.out.println("campReserveAdminPageData err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   
	   public static void reserveOk(int rno)
	   {
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("reserveOk",rno);
		   }catch(Exception ex)
		   {
			   System.out.println("reserveOk err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   public static void reserveCancel(int rno)
	   {
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.delete("reserveCancel",rno);
		   }catch(Exception ex)
		   {
			   System.out.println("reserveCancel err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   public static ReserveVO campReserveMyPageData(int rno)
	   {
		   ReserveVO vo=new ReserveVO();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   vo=session.selectOne("campReserveMyPageData",rno);
		   }catch(Exception ex)
		   {
			   System.out.println("campReserveMyPageData err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return vo;
	   }
	
}