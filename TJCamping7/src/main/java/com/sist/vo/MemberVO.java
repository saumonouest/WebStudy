package com.sist.vo;
/*
 *    ID                                        NOT NULL VARCHAR2(20)
 PWD                                       NOT NULL VARCHAR2(10)
 NAME                                      NOT NULL VARCHAR2(51)
 SEX                                                CHAR(6)
 BIRTHDAY                                           VARCHAR2(10)
 POST                                      NOT NULL VARCHAR2(7)
 ADDR1                                     NOT NULL VARCHAR2(150)
 ADDR2                                              VARCHAR2(150)
 PHONE                                              VARCHAR2(13)
 EMAIL                                              VARCHAR2(100)
 CONTENT                                            CLOB
 REGDATE                                            DATE
 ADMIN                                              CHAR(1)
 */
import java.util.*;

import lombok.Data;
@Data
public class MemberVO {
  private String id,pwd,name,sex,birth,post,addr1,addr2,phone,email,content,admin;
  private Date regdate;
  private String msg;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getBirth() {
	return birth;
}
public void setBirth(String birth) {
	this.birth = birth;
}
public String getPost() {
	return post;
}
public void setPost(String post) {
	this.post = post;
}
public String getAddr1() {
	return addr1;
}
public void setAddr1(String addr1) {
	this.addr1 = addr1;
}
public String getAddr2() {
	return addr2;
}
public void setAddr2(String addr2) {
	this.addr2 = addr2;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getAdmin() {
	return admin;
}
public void setAdmin(String admin) {
	this.admin = admin;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
}