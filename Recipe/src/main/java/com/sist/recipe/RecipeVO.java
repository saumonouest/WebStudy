package com.sist.recipe;

import lombok.Data;

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
@Data
public class RecipeVO{
      private int reno;
      private String poster, title, subtitle, detail_poster1, detail_content1,detail_poster2, detail_content2,detail_poster3, detail_content3,detail_poster4, detail_content4,detail_poster5, detail_content5,detail_poster6, detail_content6, info1, info2, info3, ingredients;

}