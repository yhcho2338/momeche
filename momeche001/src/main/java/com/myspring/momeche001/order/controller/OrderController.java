package com.myspring.momeche001.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.momeche001.order.vo.OrderVO;

public interface OrderController {
	
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addOrder(@RequestParam(value="pd_id", required=false) String pd_id, @RequestParam(value="pd_price", required=false) String pd_price, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addOrderList(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ModelAndView addOrderAllCart(@RequestParam String[] cart_count, HttpServletRequest request, HttpServletResponse response) throws Exception; 
	
	
}
