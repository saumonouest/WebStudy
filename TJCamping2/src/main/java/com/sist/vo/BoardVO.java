package com.sist.vo;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import lombok.Data;

import java.io.*;

@Data
public class BoardVO {
	private int no, hit, imgsize;
	private String name, subject, content,pwd, dbday, imgname, type;
	private Date regdate;
}
