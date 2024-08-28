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
	   public static String foodTimeSelectData(int tno)
	   {
		   String times="";
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   times=session.selectOne("foodTimeSelectData", tno);
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
	   
	   public static String foodReserveTimeData(int dno)
	   {
		   String times="";
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   times=session.selectOne("foodReserveTimeData", dno);
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
	    *   <insert id="reserveInsert" parameterType="FoodReserveVO">
			   INSERT INTO project_reserve(frno,id,fno,day,time,inwon)
			   VALUES(pre_frno_seq.nextval,#{id},#{fno},#{day},#{time},#{inwon})
			  </insert>
	    */
	   public static void reserveInsert(FoodReserveVO vo)
	   {
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.insert("reserveInsert", vo);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   /*
	    * <select id="reserveMyPageData" resultType="FoodReserveVO" parameterType="string">
		   SELECT frno,pr.fno,day,time,inwon,isok,pf.name,pf.poster,pf.address,pf.phone,
		          TO_CHAR(regdate,'YYYY-MM-DD') as dbday
		   FROM project_reserve pr,project_food_house pf
		   WHERE pr.fno=pf.fno
		   AND id=#{id}
		  </select>
	    */
	   public static List<FoodReserveVO> reserveMyPageData(String id)
	   {
		   List<FoodReserveVO> list=new ArrayList<FoodReserveVO>();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   list=session.selectList("reserveMyPageData", id);
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
	   /*
	    *   <select id="reserveAdminPageData" resultMap="reserveMap">
			   SELECT frno,pr.fno,id,day,pr.time,inwon,isok,pf.name,pf.poster,pf.address,pf.phone,
			          TO_CHAR(redate,'YYYY-MM-DD') as dbday
			   FROM project_reserve pr,project_food_house pf
			   WHERE pr.fno=pf.fno
			   ORDER BY frno DESC
			  </select>
	    */
	   public static List<FoodReserveVO> reserveAdminPageData()
	   {
		   List<FoodReserveVO> list=new ArrayList<FoodReserveVO>();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   list=session.selectList("reserveAdminPageData");
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
	   /*
	    *   <update id="reserveOk" parameterType="int">
			   UPDATE project_reserve SET
			   isok='y'
			   WHERE frno=#{frno}
			  </update>
	    */
	   public static void reserveOk(int frno)
	   {
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("reserveOk",frno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   /*
	    *   <delete id="reserveCancel" parameterType="int">
			   DELETE FROM project_reserve
			   WHERE frno=#{frno}
			  </delete>
	    */
	   public static void reserveCancel(int frno)
	   {
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.delete("reserveCancel",frno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   /*
	    *   <select id="mypageReserveInfoData" resultMap="reserveMap" parameterType="int">
			    SELECT frno,day,pr.time,inwon,pf.name,pf.poster,pf.address,phone,theme,score,content,
			           TO_CHAR(redate,'YYYY-MM-DD HH24:MI:SS') as dbday
			    FROM project_reserve pr , project_food_house pf
			    WHERE pr.fno=pf.fno
			    AND frno=#{frno}
			  </select>
	    */
	   public static FoodReserveVO mypageReserveInfoData(int frno)
	   {
		   FoodReserveVO vo=new FoodReserveVO();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   vo=session.selectOne("mypageReserveInfoData",frno);
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
	}
	
