package com.sist.commons;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class CommonsModel {

	public static void footerPrint(HttpServletRequest request)
	{
		CampVO aaa=CommonsDAO.commonsTodayCampsite();
		FoodVO bbb=CommonsDAO.commonsTodayFood();
		RecipeVO ccc=CommonsDAO.commonsTodayRecipe();
		
		request.setAttribute("aaa", aaa);
		request.setAttribute("bbb", bbb);
		request.setAttribute("ccc", ccc);
	}
}
