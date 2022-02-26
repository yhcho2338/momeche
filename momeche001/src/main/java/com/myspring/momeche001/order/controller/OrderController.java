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
	
	/*20220209 신우주  -  카트 구매 (묶음 구매) 연습 코드 작성 시작*/
	public ModelAndView addOrderAllCart(@RequestParam String[] cart_count, HttpServletRequest request, HttpServletResponse response) throws Exception; 
	/*20220209 신우주  -  카트 구매 (묶음 구매) 연습 코드 작성 끝*/
	//public ModelAndView orderForm(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	//public ModelAndView orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO,
      //      HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
