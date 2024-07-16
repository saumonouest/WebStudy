package com.sist.dao;
import java.util.*;
import lombok.Data;

/*
 NO                                                 VARCHAR2(26)
 ID                                                 VARCHAR2(26)
 SUBJECT                                            VARCHAR2(1000)
 MSG                                                VARCHAR2(4000)
 YEAR                                               VARCHAR2(26)
 MONTH                                              VARCHAR2(26)
 DAY                                                VARCHAR2(26)
 REGDATE                                            VARCHAR2(26)
 */
@Data
public class DiaryVO {
	private int no, year, month, day;
	private String id, subject, msg;
	private Date regDate;
}