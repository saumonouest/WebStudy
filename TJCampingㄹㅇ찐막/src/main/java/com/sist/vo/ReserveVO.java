package com.sist.vo;
import java.util.*;

import lombok.Data;
/*
RNO     NOT NULL NUMBER       
ID               VARCHAR2(20) 
CNO              NUMBER       
DAY     NOT NULL VARCHAR2(20) 
TIME    NOT NULL VARCHAR2(20) 
INWON   NOT NULL VARCHAR2(20) 
REGDATE          DATE         
ISOK             CHAR(1)
 */
@Data
public class ReserveVO {
	
	private int rno,cno;
	private String id,day,time,inwon,isok,dbday,buyok;
	private Date regdate;
	
	private CampVO cvo=new CampVO(); // JOIN 
}
