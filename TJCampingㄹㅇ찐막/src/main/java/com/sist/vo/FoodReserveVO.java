package com.sist.vo;
/*
		RNO    NOT NULL NUMBER       
		ID              VARCHAR2(20) 
		FNO             NUMBER       
		DAY    NOT NULL VARCHAR2(20) 
		TIME   NOT NULL VARCHAR2(20) 
		INWON  NOT NULL VARCHAR2(20) 
		REDATE          DATE         
		ISOK            CHAR(1)      
 */
import java.util.*;

import lombok.Data;
@Data
public class FoodReserveVO {
   private int frno,fno,score, jjimcount, likecount, hit;
   private String id,day,time,inwon,isok,dbday,name, tag, phone, menu, address, theme, poster, images, parking, review, rdays;
   private Date regdate;
   private FoodVO fvo=new FoodVO();
}