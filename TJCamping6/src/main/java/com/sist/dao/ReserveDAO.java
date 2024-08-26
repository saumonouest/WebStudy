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

public class ReserveDAO {

	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static void campReserveInsert(ReserveVO vo)
	{
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession(true);
			session.insert("campReserveInsert",vo);
		}catch(Exception ex)
		{
			System.out.println("ReserveDAO 오류 1");
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
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("campReserveMyPageData",id);
		}catch(Exception ex)
		{
			System.out.println("ReserveDAO 오류 2");
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
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			list=session.selectList("campReserveAdminPageData");
		}catch(Exception ex)
		{
			System.out.println("ReserveDAO 오류 3");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	
	
	
	public static String campReserveTimeData(int dno)
	{
		String times="";
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			times=session.selectOne("campReserveTimeData",dno);
		}catch(Exception ex)
		{
			System.out.println("ReserveDAO 오류 5");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return times;
	}

	public static String campTimeSelectData(int tno)
	{
		String times="";
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			times=session.selectOne("campTimeSelectData",tno);
		}catch(Exception ex)
		{
			System.out.println("ReserveDAO 오류 6");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return times;
	}
}
