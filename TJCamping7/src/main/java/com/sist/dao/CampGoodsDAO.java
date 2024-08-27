package com.sist.dao;

import java.sql.ResultSet;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class CampGoodsDAO {
	private static SqlSessionFactory ssf;
	static
	{
		try
		{
		ssf=CreateSqlSessionFactory.getSsf();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	// 캠핑용품 목록
	public static List<CampGoodsVO> campGoodsListData(Map map)
	{
		List<CampGoodsVO> list=new ArrayList<CampGoodsVO>();
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("campGoodsListData",map);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int campGoodsTotalPage(Map map)
	{
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("campGoodsTotalPage",map);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			if(session!=null)
				session.close();
		}
		return total;
	}
	// 캠핑용품 브랜드 목록
		public static List<CampGoodsVO> campGoodsBrandListData(Map map)
		{
			List<CampGoodsVO> list=new ArrayList<CampGoodsVO>();
			SqlSession session=null;
			try
			{
				session=ssf.openSession();
				list=session.selectList("campGoodsBrandListData",map);
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}finally
			{
				if(session!=null)
					session.close();
			}
			return list;
		}
	public static int campGoodsBrandTotalPage(Map map)
	{
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("campGoodsBrandTotalPage",map);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			if(session!=null)
				session.close();
		}
		return total;
	}
	// 브랜드 찾기
	public static List<CampGoodsVO> goodsFindListData(Map map)
	   {
		   List<CampGoodsVO> list=new ArrayList<CampGoodsVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("goodsFindListData",map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   public static int goodsFindTotalPage(String ss)
	   {
		   int total=0; 
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("goodsFindTotalPage",ss);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return total;
	   }
	// 브랜드 목록
	    public static List<String> getBrandList() 
	    {
	        List<String> list = new ArrayList<>();
	        SqlSession session = null;
	        try 
	        {
	            session = ssf.openSession();
	            list = session.selectList("getBrandList");
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        } finally 
	        {
	            if (session != null) 
	            	session.close();
	        }
	        return list;
	    }
	// 캠핑용품 상세페이지
	public static CampGoodsVO campGoodsDetailData(Map map)
	{
		CampGoodsVO vo=new CampGoodsVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("campGoodsHitIncrement",map); // 조회수
			session.commit();
			vo=session.selectOne("campGoodsDetailData",map);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	
	// 메인페이지 캠핑용품 출력
	public static List<CampGoodsVO> campGoodsJjimTopData(){
		List<CampGoodsVO> list = new ArrayList<CampGoodsVO>();
		SqlSession session=null;
		try
		{
			session = ssf.openSession();
			list=session.selectList("campGoodsJjimTopData");
		} catch (Exception ex)
		{
			ex.printStackTrace();
		} finally
		{
			if(session!=null) session.close();
		}
		return list;
	}
	// 캠핑용품 상세페이지 추천 상품 
	   public static List<CampGoodsVO> campGoodsRecListData(Map map)
	   {
	      List<CampGoodsVO> list = new ArrayList<CampGoodsVO>();
	      SqlSession session=null; // Connection
	      try 
	      {
	         session = ssf.openSession();
	         list=session.selectList("campGoodsRecListData" , map);
	      }catch (Exception ex) {
	         ex.printStackTrace();
	      } 
	      finally 
	      {
	         if(session!=null) session.close(); 
	      }
	      return list;
	   }
}