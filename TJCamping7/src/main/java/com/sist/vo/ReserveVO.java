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
	private String id,day,time,inwon,isok,dbday;
	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getInwon() {
		return inwon;
	}

	public void setInwon(String inwon) {
		this.inwon = inwon;
	}

	public String getIsok() {
		return isok;
	}

	public void setIsok(String isok) {
		this.isok = isok;
	}

	public String getDbday() {
		return dbday;
	}

	public void setDbday(String dbday) {
		this.dbday = dbday;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public CampVO getCvo() {
		return cvo;
	}

	public void setCvo(CampVO cvo) {
		this.cvo = cvo;
	}

	private Date regdate;
	
	private CampVO cvo=new CampVO(); // JOIN 
}
