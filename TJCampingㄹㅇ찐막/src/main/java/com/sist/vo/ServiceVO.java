package com.sist.vo;

import java.util.*;

import lombok.Data;
@Data
public class ServiceVO {
	private int no , type , hit; 
	private String subject , content , name , dbday,camp_type,goods_type,recipe_type,food_type;
	private Date regdate;
	  private int group_id,group_step,isreply;
	  private String id;
}
