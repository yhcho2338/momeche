package com.myspring.momeche001.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String addProductInCart(@RequestParam("pd_id") String pd_id,
												@RequestParam("cart_count") int cart_count,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String modifyCartCount(@RequestParam("pd_id") int pd_id, 
												@RequestParam("cart_count") int cart_count,
												HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeCartProduct(@RequestParam("cart_num") int cart_num, HttpServletRequest request, 
																				  HttpServletResponse response) throws Exception;
}
