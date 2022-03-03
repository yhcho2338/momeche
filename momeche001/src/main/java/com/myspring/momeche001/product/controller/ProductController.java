package com.myspring.momeche001.product.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.momeche001.product.vo.ProductVO;

public interface ProductController {
	
	
	public ModelAndView productDetail(@RequestParam("pd_id") String pd_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public ModelAndView productSort(ProductVO productVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	

}
