package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sist.vo.NoticeVO;
import com.sist.vo.ServiceVO;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ServiceDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static List<ServiceVO> campBoardListData(Map map) {
		List<ServiceVO> list = new ArrayList<ServiceVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("campBoardListData", map);
		} catch (Exception ex) {
			System.out.println("campBoardListData err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static List<ServiceVO> ServiceListData(Map map) {
		List<ServiceVO> list = new ArrayList<ServiceVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("ServiceListData", map);
		} catch (Exception ex) {
			System.out.println("ServiceListData err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static List<ServiceVO> goodsBoardListData(Map map) {
		List<ServiceVO> list = new ArrayList<ServiceVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("goodsBoardListData", map);
		} catch (Exception ex) {
			System.out.println("goodsBoardListData err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static List<ServiceVO> recipeBoardListData(Map map) {
		List<ServiceVO> list = new ArrayList<ServiceVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("recipeBoardListData", map);
		} catch (Exception ex) {
			System.out.println("recipeListData err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static List<ServiceVO> foodBoardListData(Map map) {
		List<ServiceVO> list = new ArrayList<ServiceVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("foodBoardListData", map);
		} catch (Exception ex) {
			System.out.println("foodBoardListData err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static void campInsert(ServiceVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("campBoardInsert", vo);
		} catch (Exception ex) {
			System.out.println("campBoardInsert err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static void goodsInsert(ServiceVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("goodsBoardInsert", vo);
		} catch (Exception ex) {
			System.out.println("goodsBoardInsert err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static void recipeInsert(ServiceVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("recipeBoardInsert", vo);
		} catch (Exception ex) {
			System.out.println("recipeBoardInsert err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static void foodInsert(ServiceVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("foodBoardInsert", vo);
		} catch (Exception ex) {
			System.out.println("foodBoardInsert err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static int campRowCount() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("campRowCount");
		} catch (Exception ex) {
			System.out.println("campRowCount err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static int goodsRowCount() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("goodsRowCount");
		} catch (Exception ex) {
			System.out.println("goodsRowCount err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static int recipeRowCount() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("recipeRowCount");
		} catch (Exception ex) {
			System.out.println("recipeRowCount err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static int foodRowCount() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("foodRowCount");
		} catch (Exception ex) {
			System.out.println("foodRowCount err");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	
	
	public static ServiceVO campDetailData(int no) {
		ServiceVO vo = new ServiceVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("campHitIncrement",no);
			session.commit();
			vo=session.selectOne("campUpdateData",no);
		} catch (Exception ex) {
			System.out.println("campDetailData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return vo;
	}
	
	public static ServiceVO foodDetailData(int no) {
		ServiceVO vo = new ServiceVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("foodHitIncrement",no);
			session.commit();
			vo=session.selectOne("foodUpdateData",no);
		} catch (Exception ex) {
			System.out.println("foodDetailData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return vo;
	}
	
	public static ServiceVO goodsDetailData(int no) {
		ServiceVO vo = new ServiceVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("goodsHitIncrement",no);
			session.commit();
			vo=session.selectOne("goodsUpdateData",no);
		} catch (Exception ex) {
			System.out.println("goodsDetailData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return vo;
	}
	
	public static ServiceVO recipeDetailData(int no) {
		ServiceVO vo = new ServiceVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("recipeHitIncrement",no);
			session.commit();
			vo=session.selectOne("recipeUpdateData",no);
		} catch (Exception ex) {
			System.out.println("recipeDetailData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return vo;
	}

	/*
	 * public static List<ServiceVO> adminReplyBoardListData(Map map) {
	 * List<ServiceVO> list=new ArrayList<ServiceVO>(); SqlSession session=null; try
	 * { session=ssf.openSession();
	 * list=session.selectList("adminReplyBoardListData", map); }catch(Exception ex)
	 * { System.out.println("adminReplyBoardListData err"); ex.printStackTrace(); }
	 * finally { if(session!=null) session.close(); } return list; } public static
	 * void adminReplyBoardInsert(int no,ServiceVO vo) { SqlSession session=null;
	 * try { session=ssf.openSession(); session.insert("adminReplyBoardInsert",vo);
	 * session.update("adminReplyUpdate",no); session.commit(); }catch(Exception ex)
	 * { System.out.println("adminReplyBoardInsert err"); session.rollback();// 트랜잭션
	 * ex.printStackTrace(); } finally { if(session!=null) session.close(); } }
	 * 
	 * <select id="adminReplyInfoData" resultType="ServiceVO" parameterType="int">
	 * SELECT group_id,group_step FROM project_replyboard WHERE no=#{no} </select>
	 * <update id="adminReplyUpdate" parameterType="int"> UPDATE project_replyboard
	 * SET isreply=1 WHERE no=#{no} </update>
	 * 
	 * public static ServiceVO adminReplyInfoData(int no) { ServiceVO vo=new
	 * ServiceVO(); SqlSession session=null; try { session=ssf.openSession(true);
	 * vo=session.selectOne("adminReplyInfoData",no); }catch(Exception ex) {
	 * System.out.println("adminReplyInfoData err"); ex.printStackTrace(); } finally
	 * { if(session!=null) session.close(); } return vo; }
	 */
}