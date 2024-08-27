package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class FoodDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	// hit가 많은 맛집
	public static List<FoodVO> foodHitTopData(){
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list=session.selectList("foodHitTopData");
		} catch (Exception ex) {
			System.out.println("foodHitTopData 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	// 좋아요가 많은 맛집
	public static List<FoodVO> foodLikeTopData(){
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list=session.selectList("foodLikeTopData");
		} catch (Exception ex) {
			System.out.println("foodLikeTopData 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	// 찜이 많은 맛집
	public static List<FoodVO> foodJjimTopData(){
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list=session.selectList("foodJjimTopData");
		} catch (Exception ex) {
			System.out.println("foodJjimTopData 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	public static int foodListCount() {
		int count=0;
		SqlSession session=null;
		try {
			session = ssf.openSession();
			count=session.selectOne("foodListCount");
		} catch (Exception ex) {
			System.out.println("foodListCount 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return count;
	}
	
	public static List<FoodVO> foodListData(Map map){
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list=session.selectList("foodListData",map);
		} catch (Exception ex) {
			System.out.println("foodListData 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
	public static int foodTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			session = ssf.openSession();
			total=session.selectOne("foodTotalPage");
		} catch (Exception ex) {
			System.out.println("foodTotalPage 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return total;
	}
	
	public static FoodVO foodDetailData(int fno) {
		FoodVO vo = new FoodVO();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			session.update("foodHitIncrement",fno);
			session.commit();
			
			// 데이터 읽기
			vo = session.selectOne("foodDetailData",fno);
		} catch (Exception ex) {
			System.out.println("foodDetailData 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	
	public static List<FoodVO> foodFindListData(Map map){
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list=session.selectList("foodFindListData",map);
		} catch (Exception ex) {
			System.out.println("foodFindListData 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
	public static int foodFindTotalPage(String ss) {
		int total=0;
		SqlSession session=null;
		try {
			session = ssf.openSession();
			total=session.selectOne("foodFindTotalPage" , ss);
		} catch (Exception ex) {
			System.out.println("foodFindTotalPage 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return total;
	}
	
	// 인근 맛집 
	public static List<FoodVO> foodRearListData(String ss){
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session=null; // Connection
		try {
			session = ssf.openSession();
			list=session.selectList("foodRearListData" , ss);
		} catch (Exception ex) {
			System.out.println("foodRearListData 오류");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); 
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static FoodVO FoodReserveData(int fno){
		FoodVO vo=new FoodVO();
		SqlSession session=null;
		
		try
		{
			session=ssf.openSession();
			vo=session.selectOne("FoodReserveData",fno);
		}catch(Exception ex)
		{
			System.out.println("FoodDAO 오류 11");
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
	
	   public static String FoodReserveDayData1(int fno)
	   {
		   String rdays="";
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   rdays=session.selectOne("FoodReserveDayData1", fno);
		   }catch(Exception ex)
		   {
			   System.out.println("FoodReserveDayData1 err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return rdays;
	   }
	   
	   public static String FoodTimeSelectData1(int ftno)
	   {
		   String times="";
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   times=session.selectOne("FoodTimeSelectData", ftno);
		   }catch(Exception ex)
		   {
			   System.out.println("FoodTimeSelectData err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return times;
	   }
	   
	   
	  
	   public static void FoodReserveInsert(FoodReserveVO vo)
	   {
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.insert("FoodReserveInsert", vo);
		   }catch(Exception ex)
		   {
			   System.out.println("FoodReserveInsert err");
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
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   list=session.selectList("FoodReserveMyPageData", id);
		   }catch(Exception ex)
		   {
			   System.out.println("FoodReserveMyPageData err");
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
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   list=session.selectList("FoodReserveAdminPageData");
		   }catch(Exception ex)
		   {
			   System.out.println("FoodReserveAdminPageData err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   
	   public static void FoodreserveOk(int rno)
	   {
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("FoodreserveOk",rno);
		   }catch(Exception ex)
		   {
			   System.out.println("FoodreserveOk err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   public static void FoodreserveCancel(int rno)
	   {
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.delete("FoodreserveCancel",rno);
		   }catch(Exception ex)
		   {
			   System.out.println("FoodreserveCancel err");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   public static FoodReserveVO FoodReserveMyPageData(int rno)
	   {
		   FoodReserveVO vo=new FoodReserveVO();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   vo=session.selectOne("FoodReserveMyPageData",rno);
		   }catch(Exception ex)
		   {
			   System.out.println("FoodReserveMyPageData err");
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
