package com.sist.vo;
/*
 *   NO         NOT NULL NUMBER         
	ID                  VARCHAR2(20)   
	NAME       NOT NULL VARCHAR2(50)   
	SUBJECT    NOT NULL VARCHAR2(2000) 
	CONTENT    NOT NULL CLOB           
	REGDATE             DATE           
	GROUP_ID            NUMBER         
	GROUP_STEP          NUMBER         
	ISREPLY             NUMBER    
	HIT   NUMBER
 */
import java.util.*;

import lombok.Data;
@Data
public class ReplyBoardVO {
  private int no,group_id,group_step,isreply,hit;
  private String id,name,subject,content,dbday;
  private Date regdate;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public int getGroup_id() {
	return group_id;
}
public void setGroup_id(int group_id) {
	this.group_id = group_id;
}
public int getGroup_step() {
	return group_step;
}
public void setGroup_step(int group_step) {
	this.group_step = group_step;
}
public int getIsreply() {
	return isreply;
}
public void setIsreply(int isreply) {
	this.isreply = isreply;
}
public int getHit() {
	return hit;
}
public void setHit(int hit) {
	this.hit = hit;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
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
}