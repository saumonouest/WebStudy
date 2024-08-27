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
public class FoodReserveVO {
	
	private int frno,fno;
	private String id,day,time,inwon,isok,dbday;
	private Date regdate;
	
	public int getFrno() {
		return frno;
	}

	public void setFrno(int frno) {
		this.frno = frno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
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

	public FoodVO getFvo() {
		return fvo;
	}

	public void setFvo(FoodVO fvo) {
		this.fvo = fvo;
	}

	private FoodVO fvo=new FoodVO(); // JOIN 
}
