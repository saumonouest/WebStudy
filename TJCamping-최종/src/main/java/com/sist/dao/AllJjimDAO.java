package com.sist.dao;

import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class AllJjimDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static void allJjimInsert(Map map) {
		SqlSession session = null;
		
		try {
			session=ssf.openSession(true);
			session.insert("allJjimInsert",map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	public static int allJjimCheck(Map map) {
		int count = 0;
		SqlSession session = null;
		
		try {
			session=ssf.openSession(true);
			count=session.selectOne("allJjimCheck",map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return count;
	}
	public static void JjimCountIncrement(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("JjimCountIncrement",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	public static void campGoodjimCountIncrement(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("campGoodsJjimCountIncrement",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	public static void recipeJjimCountIncrement(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("recipeJjimCountIncrement",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	public static List<CampGoodsVO> cgjjimListData(String id){
		List<CampGoodsVO> cglist = new ArrayList<CampGoodsVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			cglist = session.selectList("cgjjimListData",id);
		}catch(Exception ex) {
			System.out.println("cgjjimListData err");
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return cglist;
	}
	public static List<RecipeVO> recjjimListData(String id){
		List<RecipeVO> reclist = new ArrayList<RecipeVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			reclist = session.selectList("recjjimListData",id);
		}catch(Exception ex) {
			System.out.println("recjjimListData err");
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return reclist;
	}
	public static List<FoodVO> fhjjimListData(String id){
		List<FoodVO> fhlist = new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			fhlist = session.selectList("fhjjimListData",id);
		}catch(Exception ex) {
			System.out.println("fhjjimListData err");
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return fhlist;
	}
	
	
	public static void camp_jjim_delete(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.delete("jjim_delete",map);
			session.update("camp_jjimcount_minus",map);
			session.commit();
		}catch(Exception ex) {
			System.out.println("jjim_delete err");
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
}
