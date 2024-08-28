package com.sist.vo;

/*
 * CNO	NUMBER
	GNO	NUMBER
	ID	VARCHAR2(20 BYTE)
	ACCOUNT	NUMBER
	PRICE	NUMBER
	ISBUY	CHAR(1 BYTE)
	REGDATE	DATE
 * 
 */
import java.util.Date;
import lombok.Data;

@Data
public class CartVO {
	private int cno,gno,account,price,campno;
	private String id,isbuy,dbday;
	private Date regdate;
	private CampVO cvo=new CampVO();
	private CampGoodsVO cgvo=new CampGoodsVO();
}
