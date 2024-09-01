package com.sist.dao;

import java.util.Map;
import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.CartVO;
import com.sist.vo.MemberVO;

public class AdminDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static int boycheck() {
		SqlSession session = null;
		int btotal=0;
		
		try {
			session=ssf.openSession(true);
			btotal=session.selectOne("boycheck");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return btotal;
	}
	public static int girlcheck() {
		SqlSession session = null;
		int gtotal=0;
		
		try {
			session=ssf.openSession(true);
			gtotal=session.selectOne("girlcheck");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return gtotal;
	}
	public static int totalcheck() {
		SqlSession session = null;
		int total=0;
		
		try {
			session=ssf.openSession(true);
			total=session.selectOne("totalcheck");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return total;
	}
	public static List<CartVO> buynameList(Map map) {
		SqlSession session = null;
		List<CartVO> list= new ArrayList<CartVO>();
		
		try {
			session=ssf.openSession(true);
			list=session.selectList("buynameList" , map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	///////////////////////////////// 마이페이지 카운트 ////////////////////////////////////
	/*
	 *   <select id="campcount" resultType="int" parameterType="int">
		 	select count(*) from reserve where id=#{id} and buyok='y'
		 </select>
		 <select id="goodscount" resultType="int" parameterType="int">
		 	select count(*) from cart where id=#{id} and isbuy ='y';
		 </select>
	 */
	public static int campcount(String id) {
		SqlSession session = null;
		int ccnt=0;
		try {
			session=ssf.openSession(true);
			ccnt=session.selectOne("campcount",id);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return ccnt;
	}
	public static int goodscount(String id) {
		SqlSession session = null;
		int gcnt=0;
		try {
			session=ssf.openSession(true);
			gcnt=session.selectOne("goodscount",id);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return gcnt;
	}
	
}
