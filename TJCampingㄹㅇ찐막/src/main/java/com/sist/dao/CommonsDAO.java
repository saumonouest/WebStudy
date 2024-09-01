package com.sist.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class CommonsDAO {

	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static CampVO commonsTodayCampsite()
	{
		CampVO vo=new CampVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			 vo=session.selectOne("commonsTodayCampsite");
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return vo;
	}
	
	public static FoodVO commonsTodayFood()
	{
		FoodVO vo=new FoodVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("commonsTodayFood");
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return vo;
	}
	
	public static RecipeVO commonsTodayRecipe()
	{
		RecipeVO vo=new RecipeVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("commonsTodayRecipe");
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return vo;
	}
	
}
