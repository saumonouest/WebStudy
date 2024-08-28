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
	
	public static void FoodReserveInsert(FoodReserveVO vo)
	{
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession(true);
			session.insert("FoodReserveInsert",vo);
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
	
	public static List<FoodReserveVO> FoodReserveMyPageData(String id)
	{
		List<FoodReserveVO> list=new ArrayList<FoodReserveVO>();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("FoodReserveMyPageData",id);
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
	
	public static List<FoodReserveVO> FoodReserveAdminPageData()
	{
		List<FoodReserveVO> list=new ArrayList<FoodReserveVO>();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("FoodReserveAdminPageData");
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
	
	
	
	public static String FoodReserveTimeData(int dno)
	{
		String times="";
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			times=session.selectOne("FoodReserveTimeData",dno);
		}catch(Exception ex)
		{
			System.out.println("FoodReserveDAO 오류 5");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return times;
	}

	public static String FoodTimeSelectData(int ftno)
	{
		String times="";
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			times=session.selectOne("FoodTimeSelectData",ftno);
		}catch(Exception ex)
		{
			System.out.println("FoodReserveDAO 오류 6");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return times;
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
	public static void FoodreserveCancel(int frno) {
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			session.delete("FoodreserveCancel",frno);
			session.commit();
		}catch(Exception ex)
		{
			System.out.println("FoodreserveCancel 오류 6");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	public static void FoodreserveOk(int frno) {
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			session.update("FoodreserveOk",frno);
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