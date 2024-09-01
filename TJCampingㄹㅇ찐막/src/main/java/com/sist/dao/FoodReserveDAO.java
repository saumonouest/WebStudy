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

import org.apache.ibatis.session.SqlSessionFactory;

public class FoodReserveDAO {

	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	  public static String foodReserveDayData(int fno)
	   {
		   String rdays="";
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   rdays=session.selectOne("foodReserveDayData", fno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return rdays;
	   }
	   /*
	    *   <select id="foodReserveTimeData" resultType="String" parameterType="int">
			    SELECT time FROM reserve_date
			    WHERE dno=#{dno}
			  </select>
			  <select id="foodTimeSelectData" resultType="String" parameterType="int">
			    SELECT time FROM reserve_time
			    WHERE tno=#{tno}
			  </select>
	    */
	   public static String foodTimeSelectData(int ftno)
	   {
		   String times="";
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   times=session.selectOne("foodTimeSelectData", ftno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return times;
	   }
	   
	   public static String foodReserveTimeData(int fdno)
	   {
		   String times="";
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   times=session.selectOne("foodReserveTimeData", fdno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return times;
	   }
	

		/*
			얘는 리저브 매퍼에 없음
		*/
	   public static FoodReserveVO mypageFoodReserveInfoData(int frno)
	   {
		   FoodReserveVO vo=new FoodReserveVO();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   vo=session.selectOne("mypageFoodReserveInfoData",frno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return vo;
	   }
	
	
	
	

	
	public static void foodReserveInsert(FoodReserveVO vo)
	{
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession(true);
			session.insert("foodReserveInsert",vo);
		}catch(Exception ex)
		{
			System.out.println("FoodReserveDAO 오류 1");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	
	public static List<FoodReserveVO> foodReserveMyPageData(String id)
	{
		List<FoodReserveVO> list=new ArrayList<FoodReserveVO>();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("foodReserveMyPageData",id);
		}catch(Exception ex)
		{
			System.out.println("FoodReserveDAO 오류 2");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	
	public static List<FoodReserveVO> foodReserveAdminPageData()
	{
		List<FoodReserveVO> list=new ArrayList<FoodReserveVO>();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("foodReserveAdminPageData");
		}catch(Exception ex)
		{
			System.out.println("FoodReserveDAO 오류 3");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	
	
	public static FoodReserveVO foodReserveData(int fno)
	{
		FoodReserveVO vo=new FoodReserveVO();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			vo=session.selectOne("foodReserveData",fno);
		}catch(Exception ex)
		{
			System.out.println("FoodReserveDAO 오류 11");
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
	

	
	public static FoodReserveVO myFoodReserveData(int frno)
	{
		FoodReserveVO vo = new FoodReserveVO();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			vo=session.selectOne("myFoodReserveData",frno);
		}catch(Exception ex)
		{
			System.out.println("myFoodReserveData 오류 3");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return vo;
	}
	public static void foodReserveCancel(int frno) {
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			session.delete("foodReserveCancel",frno);
			session.commit();
		}catch(Exception ex)
		{
			System.out.println("foodReserveCancel 오류 6");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	public static void foodReserveOk(int frno) {
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			session.update("foodReserveOk",frno);
			session.commit();
		}catch(Exception ex)
		{
			System.out.println("FoodreserveOk 오류 6");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
}