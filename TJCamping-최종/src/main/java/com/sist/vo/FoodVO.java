package com.sist.vo;
import java.util.*;

import lombok.Data;

@Data
public class FoodVO {
	private int fno, score, jjimcount, likecount, hit;
	private String name, tag, phone, menu, address, theme, poster, images, time, parking, review, rdays;
}