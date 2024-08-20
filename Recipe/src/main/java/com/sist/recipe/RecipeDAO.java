package com.sist.recipe;
import java.util.*;
import java.sql.*;
public class RecipeDAO {
   private Connection conn;
   private PreparedStatement ps;
   private static RecipeDAO dao; 
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   
   // 드라이버 등록 
   public RecipeDAO()
   {
      try
      {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      }catch(Exception ex) {}
   }
   
   // 연결 
   public void getConnection()
   {
      try
      {
         conn=DriverManager.getConnection(URL,"hr","happy");
      }catch(Exception ex) {}
   }
   // 해제 
   public void disConnection()
   {
      try
      {
         if(ps!=null) ps.close();
         if(conn!=null) conn.close();
      }catch(Exception ex) {}
   }
   // 싱글턴
   public static RecipeDAO newInstance()
   {
      if(dao==null)
         dao=new RecipeDAO();
      return dao;
   }
   // 기능 
   /*
   RENO           NOT NULL NUMBER         
   POSTER         NOT NULL VARCHAR2(4000) 
   TITLE          NOT NULL VARCHAR2(200)  
   SUBTITLE       NOT NULL VARCHAR2(200)  
   DETAIL_POSTER  NOT NULL VARCHAR2(260)  
   DETAIL_CONTENT NOT NULL VARCHAR2(1024) 
   INFO1          NOT NULL VARCHAR2(30)   
   INFO2          NOT NULL VARCHAR2(30)   
   INFO3          NOT NULL VARCHAR2(30)   
   INGREDIENTS    NOT NULL VARCHAR2(4000) 
    */
   public void recipeInsert(RecipeVO vo)
   {
      try
      {
         getConnection();
         String sql="INSERT INTO recipe(reno,poster, title, subtitle, detail_poster1, detail_content1,detail_poster2, detail_content2,detail_poster3, detail_content3,detail_poster4, detail_content4,detail_poster5, detail_content5, detail_poster6, detail_content6, info1, info2, info3, ingredients) "
                 +"VALUES(re_reno_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
         ps=conn.prepareStatement(sql);
         ps.setString(1, vo.getPoster());
         ps.setString(2, vo.getTitle());
         ps.setString(3, vo.getSubtitle());
         ps.setString(4, vo.getDetail_poster1());
         ps.setString(5, vo.getDetail_content1());
         ps.setString(6, vo.getDetail_poster2());
         ps.setString(7, vo.getDetail_content2());
         ps.setString(8, vo.getDetail_poster3());
         ps.setString(9, vo.getDetail_content3());
         ps.setString(10, vo.getDetail_poster4());
         ps.setString(11, vo.getDetail_content4());
         ps.setString(12, vo.getDetail_poster5());
         ps.setString(13, vo.getDetail_content5());
         ps.setString(14, vo.getDetail_poster6());
         ps.setString(15, vo.getDetail_content6());
         ps.setString(16, vo.getInfo1());
         ps.setString(17, vo.getInfo2());
         ps.setString(18, vo.getInfo3());
         ps.setString(19, vo.getIngredients());
         
         ps.executeUpdate();
      }catch(Exception ex)
      {
         ex.printStackTrace();
      }
      finally
      {
         disConnection();
      }
   }
}